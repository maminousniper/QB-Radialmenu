Config = {}
Config.Keybind = 'F1' -- FiveM Keyboard, this is registered keymapping, so needs changed in keybindings if player already has this mapped.
Config.Toggle = false -- use toggle mode. False requires hold of key
Config.EnableExtraMenu = false
Config.Fliptime = 15000

Config.MenuItems = {
    [1] = {
        id = 'citizen',
        title = 'Citizen',
        icon = 'user',
        items = {
            {
                id = 'resethunting',
                title = 'Reset Hunting',
                icon = 'toggle-on', -- change the icon to your liking
                type = 'client',
                event = 'qb-hunting:client:Reset',
                shouldClose = true
            }, {
                id = 'givekeys',
                title = 'Give Keys',
                icon = 'key', -- change the icon to your liking
                type = 'client',
                event = 'qb-vehiclekeys:client:GiveKeys',
                shouldClose = true
            }, {
                id = 'stealshoe',
                title = 'Steal Shoes',
                icon = 'shoe-prints',
                type = 'client',
                event = 'summit_stealshoes:client:TheftShoe',
                shouldClose = true
            }, {
                id = 'getintrunk',
                title = 'Get In Trunk',
                icon = 'car',
                type = 'client',
                event = 'qb-trunk:client:GetIn',
                shouldClose = true
            }, {
                id = 'togglehotdogsell',
                title = 'Hotdog Selling',
                icon = 'hotdog',
                type = 'client',
                event = 'qb-hotdogjob:client:ToggleSell',
                shouldClose = true
            }, {
                id = 'interactions',
                title = 'Interaction',
                icon = 'triangle-exclamation',
                items = {
                    {
                        id = 'handcuff',
                        title = 'Cuff',
                        icon = 'user-lock',
                        type = 'client',
						event = 'police:client:radial:CuffPlayer', ---@TODO REMOVE THIS EVENT AFTER RADIAL MENU DESIGN BY @VECTOR ---- this method is broken and needs to be fixed in new radialmenu
                        shouldClose = true
                    },
                    {
                        id = 'unhandcuff',
                        title = 'Un Cuff',
                        icon = 'unlock-keyhole',
                        type = 'client',
						event = 'police:client:radial:UnCuffPlayer', ---@TODO REMOVE THIS EVENT AFTER RADIAL MENU DESIGN BY @VECTOR ---- this method is broken and needs to be fixed in new radialmenu
                        shouldClose = true
                    },{
                        id = 'playerinvehicle',
                        title = 'Put In Vehicle',
                        icon = 'car-side',
                        type = 'client',
						event = 'police:client:PutPlayerInVehicle',
                        shouldClose = true
                    }, {
                        id = 'playeroutvehicle',
                        title = 'Take Out Of Vehicle',
                        icon = 'car-side',
                        type = 'client',
						event = 'police:client:SetPlayerOutVehicle',
                        shouldClose = true
                    }, {
                        id = 'stealplayer',
                        title = 'Rob',
                        icon = 'mask',
                        type = 'client',
                        event = 'police:client:RobPlayer',
                        shouldClose = true
                    }, {
                        id = 'escortPlayer',
                        title = 'Escort',
                        icon = 'user-group',
                        type = 'client',
						event = 'police:client:EscortPlayer',
                        shouldClose = true
                    },
					-- {
                    --     id = 'takeHostage',
                    --     title = 'Take Hostage',
                    --     icon = 'child',
                    --     type = 'client',
                    --     event = 'police:client:TakeHostage',
                    --     shouldClose = true
                    -- },
					{
                        id = 'takeHostage_hostage',
                        title = 'Hostage',
                        icon = 'child',
                        type = 'client',
                        event = 'TakeHostage:client:takehostage',
                        shouldClose = true
                    }
                }
            }
        }
    },
    [2] = {
        id = 'general',
        title = 'General',
        icon = 'rectangle-list',
        items = {
            {
                id = 'clothesmenu',
                title = 'Clothing',
                icon = 'shirt',
                items = {
                    {
                        id = 'Hair',
                        title = 'Hair',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Ear',
                        title = 'Ear Piece',
                        icon = 'ear-deaf',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleProps',
                        shouldClose = true
                    }, {
                        id = 'Neck',
                        title = 'Neck',
                        icon = 'user-tie',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Top',
                        title = 'Top',
                        icon = 'shirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shirt',
                        title = 'Shirt',
                        icon = 'shirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Pants',
                        title = 'Pants',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shoes',
                        title = 'Shoes',
                        icon = 'shoe-prints',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'meer',
                        title = 'Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'Hat',
                                title = 'Hat',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Glasses',
                                title = 'Glasses',
                                icon = 'glasses',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Visor',
                                title = 'Visor',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Mask',
                                title = 'Mask',
                                icon = 'masks-theater',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Vest',
                                title = 'Vest',
                                icon = 'vest',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bag',
                                title = 'Bag',
                                icon = 'bag-shopping',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bracelet',
                                title = 'Bracelet',
                                icon = 'user',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Watch',
                                title = 'Watch',
                                icon = 'stopwatch',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Gloves',
                                title = 'Gloves',
                                icon = 'mitten',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }
                        }
                    }
                }
            }
        }
    },
}

Config.VehicleDoors = {}
Config.VehicleExtras = {}
Config.VehicleSeats = {}

Config.JobInteractions = {
    ["ambulance"] = {
    {
            id = 'emergencybutton2',
            title = 'Emergency Button EMS',
            icon = 'bell',
            type = 'client',
            event = 'ps-dispatch:client:emsdown',
            shouldClose = true
        }, {
            id = 'escort',
            title = 'Escort',
            icon = 'user-group',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        }, {
            id = 'fineplayer',
            title = 'Bill',
            icon = 'user-group',
            type = 'client',
            event = 'hospital:client:BillPlayer',
            shouldClose = true
        }
    },
    ["taxi"] = {
        {
            id = 'togglemeter',
            title = 'Show/Hide Meter',
            icon = 'eye-slash',
            type = 'client',
            event = 'qb-taxi:client:toggleMeter',
            shouldClose = false
        }, {
            id = 'togglemouse',
            title = 'Start/Stop Meter',
            icon = 'hourglass-start',
            type = 'client',
            event = 'qb-taxi:client:enableMeter',
            shouldClose = true
        }, {
            id = 'npc_mission',
            title = 'NPC Mission',
            icon = 'taxi',
            type = 'client',
            event = 'qb-taxi:client:DoTaxiNpc',
            shouldClose = true
        }
    },
    ["tow"] = {
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'car',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }, {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'summit_tow:client:TakeOutVehicle',
            shouldClose = true
        }
    },
    ["towcompany"] = {
        {
            id = 'impound',
            title = 'Impound Vehicle',
            icon = 'toggle-on',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'summit_tow:client:TowVehicle',
            shouldClose = true
        },
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'car',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        },
    },
    ["mechanic"] = {
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'summit_tow:client:TakeOutVehicle',
            shouldClose = true
        }
    },
    ["trucker"] = {
        {
            id = 'resettrucks',
            title = 'Reset Trucking',
            icon = 'truck-pickup',
            type = 'client',
            event = 'summit_trucking:client:ResetTrucking',
            shouldClose = true
        }
    },
    ["police"] = {
        {
            id = 'emergencybutton',
            title = 'Panic Button Police',
            icon = 'bell',
            type = 'client',
            event = 'ps-dispatch:client:officerpanicbutton',
            shouldClose = true
        }, {
            id = 'checkvehstatus',
            title = 'Check Tune Status',
            icon = 'circle-info',
            type = 'client',
            event = 'qb-tunerchip:client:TuneStatus',
            shouldClose = true
        }, {
            id = 'resethouse',
            title = 'Reset house lock',
            icon = 'key',
            type = 'client',
            event = 'qb-houses:client:ResetHouse',
            shouldClose = true
        }, {
            id = 'takedriverlicense',
            title = 'Revoke Drivers License',
            icon = 'id-card',
            type = 'client',
            event = 'police:client:SeizeDriverLicense',
            shouldClose = true
        }, {
            id = 'policeinteraction',
            title = 'Police Actions',
            icon = 'list-check',
            items = {
                {
                    id = 'statuscheck',
                    title = 'Check Health Status',
                    icon = 'heart-pulse',
                    type = 'client',
                    event = 'hospital:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'checkstatus',
                    title = 'Check status',
                    icon = 'question',
                    type = 'client',
                    event = 'police:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Escort',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                }, {
                    id = 'searchplayer',
                    title = 'Search',
                    icon = 'magnifying-glass',
                    type = 'client',
                    event = 'police:client:SearchPlayer',
                    shouldClose = true
                }, {
                    id = 'jailplayer',
                    title = 'Jail',
                    icon = 'user-lock',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true
                },{
                    id = 'trafficStop',
                    title = 'Traffic Stop',
                    icon = 'road-circle-xmark',
                    type = 'client',
                    event = 'ps-mdt:client:trafficStop',
                    shouldClose = true
                },
            }
        },
    },
    ["bus"] = {
        {
            id = 'vehicleextras',
            title = 'Vehicle Extras',
            icon = 'plus',
            items = {
                {
                    id = 'extra1',
                    title = 'Extra 1',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra2',
                    title = 'Extra 2',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra3',
                    title = 'Extra 3',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra4',
                    title = 'Extra 4',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra5',
                    title = 'Extra 5',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra6',
                    title = 'Extra 6',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra7',
                    title = 'Extra 7',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra8',
                    title = 'Extra 8',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra9',
                    title = 'Extra 9',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra10',
                    title = 'Extra 10',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra11',
                    title = 'Extra 11',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    houldClose = false
                }, {
                    id = 'extra12',
                    title = 'Extra 12',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }, {
                    id = 'extra13',
                    title = 'Extra 13',
                    icon = 'box-open',
                    type = 'client',
                    event = 'qb-radialmenu:client:setExtra',
                    shouldClose = false
                }
            }
        },
    },
        -- {
        --     id = 'policeobjects',
        --     title = 'Objects',
        --     icon = 'road',
        --     items = {
        --         {
        --             id = 'spawnpion',
        --             title = 'Cone',
        --             icon = 'triangle-exclamation',
        --             type = 'client',
        --             event = 'police:client:spawnCone',
        --             shouldClose = false
        --         }, {
        --             id = 'spawnhek',
        --             title = 'Gate',
        --             icon = 'torii-gate',
        --             type = 'client',
        --             event = 'police:client:spawnBarrier',
        --             shouldClose = false
        --         }, {
        --             id = 'spawnschotten',
        --             title = 'Speed Limit Sign',
        --             icon = 'sign-hanging',
        --             type = 'client',
        --             event = 'police:client:spawnRoadSign',
        --             shouldClose = false
        --         }, {
        --             id = 'spawntent',
        --             title = 'Tent',
        --             icon = 'campground',
        --             type = 'client',
        --             event = 'police:client:spawnTent',
        --             shouldClose = false
        --         }, {
        --             id = 'spawnverlichting',
        --             title = 'Lighting',
        --             icon = 'lightbulb',
        --             type = 'client',
        --             event = 'police:client:spawnLight',
        --             shouldClose = false
        --         }, {
        --             id = 'deleteobject',
        --             title = 'Remove object',
        --             icon = 'trash',
        --             type = 'client',
        --             event = 'police:client:deleteObject',
        --             shouldClose = false
        --         }
        --     }
        -- }
}

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Take your shirt off/on",
        Button = 1,
        Name = "Torso"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("gloves") end,
        Sprite = "gloves",
        Desc = "Take your gloves off/on",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("visor") end,
        Sprite = "visor",
        Desc = "Toggle hat variation",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Opens or closes your bag",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Take your shoes off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Take your vest off/on",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("hair") end,
        Sprite = "hair",
        Desc = "Put your hair up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Take your hat off/on",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Take your glasses off/on",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Take your ear accessory off/on",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Take your neck accessory off/on",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Take your watch off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Take your bracelet off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
}

local bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ["pants"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Take your pants off/on",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["shirt"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Take your shirt off/on",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["reset"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Nothing To Reset', 'error')
            end
        end,
        Sprite = "reset",
        Desc = "Revert everything back to normal",
        Name = "reset",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["bagoff"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Take your bag off/on",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}
