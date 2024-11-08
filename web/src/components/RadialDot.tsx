import { useRadial } from "../store/RadialMenuProvider";
import { fetchNui } from "../utils/fetchNui";
import bubbleclick from "../assets/bubble-click.ogg";


export default function RadialDot() {
    const { radialMenu, selectedButton } = useRadial();
    const audios = new Audio(bubbleclick);

    return (
        <div className="radialDot" onClick={() => {
            audios.volume = 0.2;
            audios.play();
            fetchNui("closeRadial", { index: selectedButton })
        }}>

            <svg width="2.24vw" height="2.24vw" viewBox="0 0 43 44" fill="none" xmlns="http://www.w3.org/2000/svg">
                <foreignObject width="100%" height="100%">
                    <div style={{
                        width: "100%",
                        height: "75%",
                        display: "flex",
                        justifyContent: "center",
                        alignItems: "center",
                        fontSize: "1.1vw",
                        color: "white",

                    }}>
                        {radialMenu[selectedButton || 0]?.back ? <svg width="20" height="23" viewBox="0 0 20 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g filter="url(#filter0_d_121_2)">
                                <path d="M13.2042 18.9479C13.0458 18.9479 12.8875 18.8896 12.7625 18.7646L7.32917 13.3313C6.44584 12.4479 6.44584 10.9979 7.32917 10.1146L12.7625 4.68125C13.0042 4.43958 13.4042 4.43958 13.6458 4.68125C13.8875 4.92292 13.8875 5.32292 13.6458 5.56458L8.21251 10.9979C7.81251 11.3979 7.81251 12.0479 8.21251 12.4479L13.6458 17.8812C13.8875 18.1229 13.8875 18.5229 13.6458 18.7646C13.5208 18.8813 13.3625 18.9479 13.2042 18.9479Z" fill="black" />
                            </g>
                            <defs>
                                <filter id="filter0_d_121_2" x="2.66667" y="0.5" width="15.1604" height="22.4479" filterUnits="userSpaceOnUse" colorInterpolationFilters="sRGB">
                                    <feFlood floodOpacity="0" result="BackgroundImageFix" />
                                    <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha" />
                                    <feOffset />

                                    <feComposite in2="hardAlpha" operator="out" />
                                    <feColorMatrix type="matrix" values="0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0" />
                                    <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_121_2" />
                                    <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_121_2" result="shape" />
                                </filter>
                            </defs>
                        </svg>
                            : <svg width="43" height="44" viewBox="0 0 43 44" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g filter="url(#filter0_d_1_654)">
                                    <path d="M15.9092 27.3033L26.5158 16.6967" stroke="black" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M26.5158 27.3031L15.9092 16.6965" stroke="black" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                </g>
                                <defs>
                                    <filter id="filter0_d_1_654" x="11.1592" y="11.9465" width="20.1066" height="20.1068" filterUnits="userSpaceOnUse" colorInterpolationFilters="sRGB">
                                        <feFlood floodOpacity="0" result="BackgroundImageFix" />
                                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha" />
                                        <feOffset />

                                        <feComposite in2="hardAlpha" operator="out" />
                                        <feColorMatrix type="matrix" values="0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0" />
                                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_1_654" />
                                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_1_654" result="shape" />
                                    </filter>
                                </defs>
                            </svg>
                        }
                    </div>
                </foreignObject>

                <defs>
                    <filter id="filter0_d_1936_578" x="11.1592" y="11.9465" width="20.1064" height="20.1068" filterUnits="userSpaceOnUse" colorInterpolationFilters="sRGB">
                        <feFlood floodOpacity="0" result="BackgroundImageFix" />
                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha" />
                        <feOffset />
                        <feComposite in2="hardAlpha" operator="out" />
                        <feColorMatrix type="matrix" values="0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0" />
                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_1936_578" />
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_1936_578" result="shape" />
                    </filter>
                    <filter id="filter0_d_1936_577" x="20" y="20.9465" width="20" height="20" filterUnits="userSpaceOnUse" colorInterpolationFilters="sRGB">
                        <feFlood floodOpacity="0" result="BackgroundImageFix" />
                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha" />
                        <feOffset />
                        <feComposite in2="hardAlpha" operator="out" />
                        <feColorMatrix type="matrix" values="0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0" />
                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_1936_578" />
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_1936_578" result="shape" />
                    </filter>
                </defs>
            </svg>

            {/* <div className={`icon ${selectedButton && radialMenu[selectedButton]?.back && "back"}`} /> */}
        </div>
    )
}