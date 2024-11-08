import React, { useEffect } from "react";
import RadialButton from "../components/RadialButton";
import RadialDot from "../components/RadialDot";
import { useRadial } from "../store/RadialMenuProvider";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { debugData } from "../utils/debugData";
import { useLocalStorage } from "@mantine/hooks";
import { Tooltip } from 'react-tooltip';
import { fetchNui } from "../utils/fetchNui";

debugData([
    {
        action: "setRadialMenu",
        data: [
            {
                icon: "fa-regular fa-capsules",
                label: "Drug",
            },
            {
                icon: "fa-duotone fa-solid fa-house",
                label: "Trunk",
            },
            /* {
                icon: "house",
                label: "Vehicle Door",
            },
            {
                icon: "house",
                label: "Housing",
            },
            {
                icon: "house",
                label: "Vehicle Door",
            },
            {
                icon: "house",
                label: "Housing",
            },
            {
                icon: "house",
                label: "Housing",
            },
            {
                icon: "house",
                label: "Housing",
            }, */
        ]
    }
])
debugData([
    {
        action: "setVisible",
        data: true
    }
])

const Main: React.FC = () => {
    const [rotangle, setRotangle] = useLocalStorage({
        key: "rotangle",
        defaultValue: 0,
    })

    const { radialMenu, visible, setVisible, setRadialMenu, setHover, hover, setSelectedButton, setIncrementer } = useRadial();

    useNuiEvent("setVisible", (data: boolean) => {
        setVisible(data);
        setRotangle((prev: any) => prev >= 360 ? 0 : prev + 20);
        setIncrementer(0);
    });

    useEffect(() => {
        if (!visible) return;
        const handleKeyDown = async (e: KeyboardEvent) => {
            if (e.key === "Escape") {
                await fetchNui('closeRadial');
            }
        }
        window.addEventListener("keydown", handleKeyDown);
        return () => window.removeEventListener("keydown", handleKeyDown);
    }, [visible]);

    useNuiEvent("setRadialMenu", (data: any[]) => {
        setRadialMenu([]);
        setRadialMenu([...data]);

        setHover(null);
        setSelectedButton(data.length - 1);
    });

    return (
        <div className="containerRadial" style={{
            opacity: `${visible ? '1' : '0'}`,
            transition: `transform 0.5s ease`,
        }}>
            <div className="radialmenucon">
                <RadialDot />
                {
                    radialMenu.map((button, index) => {
                        console.log(JSON.stringify(button));
                        return (
                            <RadialButton
                                key={index}
                                index={index}
                                rotation={(index * 45) - 90}
                                icon={button.icon}
                                label={button.title}
                                onHover={() => setHover(index)} // Pass the hover handler
                            />
                        );
                    })
                }
                {hover !== null && (
                    <Tooltip
                        id="my-tooltip"
                        place="bottom"
                        style={{
                            background: `${hover + 1 ? 'radial-gradient(50% 50% at 50% 50%, rgba(146, 255, 162, 0) 0%, rgba(146, 255, 162, 0.5) 100%)' : 'radial-gradient(50% 50% at 50% 50%, rgba(34, 37, 48, 0) 0%, rgba(34, 37, 48, 0.5) 100%)'}`,
                            borderRadius: '0.3vw',
                            marginTop: `${hover % 3 !== 1 || hover === 7 ? '0.8vh' : ''}`,
                        }}
                    />
                )}
            </div>
        </div>

    )
}

export default Main;