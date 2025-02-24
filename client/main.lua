QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData() -- Setting this for when you restart the resource in game
local inRadialMenu = false

local jobIndex = nil
local vehicleIndex = nil

local DynamicMenuItems = {}
local FinalMenuItems = {}
local newMenuItems = {}
local inNewMenu = false

-- Functions
local function newMenu(data)
    newMenuItems = {}
    SendNUIMessage({
        action = "setRadialMenu",
        data = data
    })
    newMenuItems = data
    inNewMenu = true
end

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if not orig.canOpen or orig.canOpen() then
            local toRemove = {}
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                if type(orig_value) == 'table' then
                    if not orig_value.canOpen or orig_value.canOpen() then
                        copy[deepcopy(orig_key)] = deepcopy(orig_value)
                    else
                        toRemove[orig_key] = true
                    end
                else
                    copy[deepcopy(orig_key)] = orig_value -- Keep functions as they are
                end
            end
            for i = 1, #toRemove do
                table.remove(copy, i) -- Re-indexes the table to remove empty spaces
            end
            if copy and next(copy) then
                setmetatable(copy, deepcopy(getmetatable(orig)))
            end
        end
    else
        copy = orig -- For other types, including functions, return as is
    end
    return copy
end


local function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10,
        PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

local function AddOption(data, id)
    local menuID = id ~= nil and id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

local function RemoveOption(id)
    DynamicMenuItems[id] = nil
end

local function SetupJobMenu()
    local JobMenu = {
        id = 'jobinteractions',
        title = 'Work',
        icon = 'briefcase',
        items = {}
    }
    if Config.JobInteractions[PlayerData.job.name] and next(Config.JobInteractions[PlayerData.job.name]) and PlayerData.job.onduty then
        JobMenu.items = Config.JobInteractions[PlayerData.job.name]
    end

    if #JobMenu.items == 0 then
        if jobIndex then
            RemoveOption(jobIndex)
            jobIndex = nil
        end
    else
        jobIndex = AddOption(JobMenu, jobIndex)
    end
end

local function SetupVehicleMenu()
    local VehicleMenu = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {}
    }

    local ped = PlayerPedId()
    local Vehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if Vehicle ~= 0 then
        if not IsVehicleOnAllWheels(Vehicle) then
            VehicleMenu.items[#VehicleMenu.items + 1] = {
                id = 'vehicle-flip',
                title = 'Flip Vehicle',
                icon = 'car-burst',
                type = 'client',
                event = 'qb-radialmenu:flipVehicle',
                shouldClose = true
            }
        end

        if IsPedInAnyVehicle(ped) then
            VehicleMenu.items[#VehicleMenu.items + 1] = {
                id = 'car_control',
                title = 'Vehicle Control',
                icon = 'car',
                type = 'command',
                event = 'carcontrol',
                shouldClose = true,
            }
        end
    end

    if #VehicleMenu.items == 0 then
        if vehicleIndex then
            RemoveOption(vehicleIndex)
            vehicleIndex = nil
        end
    else
        vehicleIndex = AddOption(VehicleMenu, vehicleIndex)
    end
end

local function SetupSubItems()
    SetupJobMenu()
    SetupVehicleMenu()
end

local function selectOption(t, t2)
    for _, v in pairs(t) do
        if v.items then
            local found, hasAction, val = selectOption(v.items, t2)
            if found then return true, hasAction, val end
        else
            if v.id == t2.id and ((v.event and v.event == t2.event) or v.action) and (not v.canOpen or v.canOpen()) then
                return true, v.action, v
            end
        end
    end
    return false
end

local function IsPoliceOrEMS()
    return (PlayerData.job.name == "police" or PlayerData.job.name == "ambulance")
end

local function IsDowned()
    return (PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"])
end

local function SetupRadialMenu()
    FinalMenuItems = {}
    if (IsDowned() and IsPoliceOrEMS()) then
        FinalMenuItems = {
            [1] = {
                id = 'emergencybutton',
                title = 'Police Down A',
                icon = 'bell',
                type = 'client',
                event = 'ps-dispatch:client:officerdown',
                shouldClose = true
            },
            [2] = {
                id = 'emergencybutton',
                title = 'Police Down B',
                icon = 'bell',
                type = 'client',
                event = 'ps-dispatch:client:officerdownb',
                shouldClose = true
            },
            [3] = {
                id = 'emergencybutton2',
                title = 'Panic Button EMS',
                icon = 'bell',
                type = 'client',
                event = 'ps-dispatch:client:emsdown',
                shouldClose = true
            }
        }
    else
        SetupSubItems()
        FinalMenuItems = deepcopy(Config.MenuItems)
        for _, v in pairs(DynamicMenuItems) do
            FinalMenuItems[#FinalMenuItems + 1] = v
        end
    end
end
local function prepareForNUI(data)
    local newData = {}
    for key, value in pairs(data) do
        if type(value) == "table" then
            newData[key] = prepareForNUI(value) -- Recursively clean nested tables
        elseif type(value) ~= "function" then
            newData[key] = value                -- Only add non-function values
        end
    end
    return newData
end
local function setRadialState(bool, sendMessage, delay)
    -- Menuitems have to be added only once

    if bool then
        TriggerEvent('qb-radialmenu:client:onRadialmenuOpen')
        SetupRadialMenu()
    else
        TriggerEvent('qb-radialmenu:client:onRadialmenuClose')
    end
    SetNuiFocus(bool, bool)
    if not inRadialMenu and bool then
        SendNUIMessage({
            action = "setVisible",
            data = true
        })
    else
        TriggerEvent('qb-radialmenu:client:onRadialmenuClose')
        SendNUIMessage({
            action = "setVisible",
            data = false
        })
        inNewMenu = false
    end
    if sendMessage then
        -- print(bool, "bool", json.encode(FinalMenuItems))
        -- SendNUIMessage({
        --     action = "ui",
        --     radial = bool,
        --     items = FinalMenuItems,
        --     toggle = Config.Toggle,
        --     keybind = Config.Keybind
        -- })
        local cleanedMenuItems = prepareForNUI(FinalMenuItems)
        SendNUIMessage({
            action = "setRadialMenu",
            data = cleanedMenuItems
        })
    end
    if delay then Wait(500) end
    inRadialMenu = bool
end

-- Command

RegisterCommand('radialmenu', function()
    if ((IsDowned() and IsPoliceOrEMS()) or not IsDowned()) and not LocalPlayer.state.isCuffed and not IsPauseMenuActive() and not inRadialMenu then
        setRadialState(true, true)
        SetCursorLocation(0.5, 0.5)
    end
end)

RegisterKeyMapping('radialmenu', Lang:t("general.command_description"), 'keyboard', Config.Keybind)

-- Events

-- Sets the metadata when the player spawns
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

-- Sets the playerdata to an empty table when the player has quit or did /logout
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

-- This will update all the PlayerData that doesn't get updated with a specific event other than this like the metadata
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterNetEvent('qb-radialmenu:client:noPlayers', function()
    QBCore.Functions.Notify(Lang:t("error.no_people_nearby"), 'error', 2500)
end)

RegisterNetEvent('qb-radialmenu:client:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = PlayerPedId()
    local closestVehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = QBCore.Functions.GetPlate(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        QBCore.Functions.Notify(Lang:t("error.no_vehicle_found"), 'error', 2500)
    end
end)

RegisterNetEvent('qb-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh ~= nil then
        if GetPedInVehicleSeat(veh, -1) == ped then
            SetVehicleAutoRepairDisabled(veh, true) -- Forces Auto Repair off when Toggling Extra [GTA 5 Niche Issue]
            if DoesExtraExist(veh, extra) then
                if IsVehicleExtraTurnedOn(veh, extra) then
                    SetVehicleExtra(veh, extra, 1)
                    QBCore.Functions.Notify(Lang:t("error.extra_deactivated", { extra = extra }), 'error', 2500)
                else
                    SetVehicleExtra(veh, extra, 0)
                    QBCore.Functions.Notify(Lang:t("success.extra_activated", { extra = extra }), 'success', 2500)
                end
            else
                QBCore.Functions.Notify(Lang:t("error.extra_not_present", { extra = extra }), 'error', 2500)
            end
        else
            QBCore.Functions.Notify(Lang:t("error.not_driver"), 'error', 2500)
        end
    end
end)

RegisterNetEvent('qb-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(PlayerPedId())
    if veh ~= 0 then
        local pl = QBCore.Functions.GetPlate(veh)
        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

RegisterNetEvent('qb-radialmenu:flipVehicle', function()
    TriggerEvent('animations:client:EmoteCommandStart', { "mechanic" })
    QBCore.Functions.Progressbar("pick_grape", Lang:t("progress.flipping_car"), Config.Fliptime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local vehicle = getNearestVeh()
        SetVehicleOnGroundProperly(vehicle)
        TriggerEvent('animations:client:EmoteCommandStart', { "c" })
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t("task.cancel_task"), "error")
        TriggerEvent('animations:client:EmoteCommandStart', { "c" })
    end)
end)

-- NUI Callbacks

RegisterNUICallback('closeRadial', function(data, cb)
    setRadialState(false, false)
    cb('ok')
end)

RegisterNUICallback('selectItem', function(inData, cb)
    local index = inData.index
    local selectedButton = inData.selectedButton
    local itemData

    if selectedButton then
        if not inNewMenu then
            itemData = FinalMenuItems[index + 1].items[selectedButton + 1]
        else
            itemData = newMenuItems[index + 1].items[selectedButton + 1]
        end
    else
        if not inNewMenu then
            itemData = FinalMenuItems[index + 1]
        else
            itemData = newMenuItems[index + 1]
        end
    end

    if itemData.items then
        newMenu(itemData.items)
        return
    end

    CreateThread(function()
        if itemData.action then
            itemData.action(itemData) -- Call the action function
        elseif itemData.type == 'client' then
            TriggerEvent(itemData.event, itemData)
        elseif itemData.type == 'server' then
            TriggerServerEvent(itemData.event, itemData)
        elseif itemData.type == 'command' then
            ExecuteCommand(itemData.event)
        elseif itemData.type == 'qbcommand' then
            TriggerServerEvent('QBCore:CallCommand', itemData.event, itemData)
        end
    end)

    if itemData.shouldClose then
        setRadialState(false, false)
    end
    cb('ok')
end)

exports('AddOption', AddOption)
exports('RemoveOption', RemoveOption)
