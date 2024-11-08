import { useRef } from 'react';
import { CSSTransition } from 'react-transition-group';
import { useRadial } from '../store/RadialMenuProvider';
import { fetchNui } from '../utils/fetchNui';
import bubbleclick from "../assets/bubble-click.ogg";
import { findIconDefinition } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import 'react-tooltip/dist/react-tooltip.css'

const RadialButton: React.FC<any> = ({ index, icon, rotation, label }) => {
    const { setHover, setSelectedButton, incrementer, visible, hover } = useRadial();
    const nodeRef = useRef(null);
    const audios = new Audio(bubbleclick);

    return (
        <div className="radialButton" style={{
            transform: `rotate(${rotation + incrementer}deg)`,
            transition: 'all 0.5s ease',
            // transform: `rotate(${rotation + 0}deg)`,
        }}>

            <div className="radialButtonIcon"
                style={{ transform: `rotate(${90}deg)` }}
            >
                <CSSTransition nodeRef={nodeRef} in={visible} timeout={600} classNames="my-node">
                    {index % 3 === 0 ?
                        <svg ref={nodeRef} style={{
                            width: "8.177vw",
                            height: "5.104vw",
                            overflow: "visible",
                            display: "flex",
                            alignItems: "center",
                            justifyContent: "center",
                            strokeWidth: "0.5vh",
                            zIndex: 10,
                        }} viewBox="0 0 157 98" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M155 96L115.589 96C102.105 96 89.1923 90.5538 79.7812 80.8972L37 37" stroke="white" strokeOpacity="0.5" strokeWidth="4" strokeLinecap="round" strokeDasharray="8 8" />
                            <circle cx="20" cy="20" r={index === hover ? 32 : 20} fill={`url(#paint0_radial_0_1${index})`} fillOpacity="0.5" />
                            <foreignObject x="0" y="0" width="25.5%" height="40%" style={{ zIndex: 10 }}
                                onMouseEnter={() => {
                                    setHover(index)
                                }}
                                onMouseLeave={() => {
                                    setHover(null)
                                }}
                                onClick={() => {
                                    audios.volume = 0.2;
                                    audios.play();
                                    setSelectedButton(index);
                                    fetchNui("selectItem", { index: index });
                                }}
                            >
                                <div
                                    data-tooltip-id="my-tooltip"
                                    data-tooltip-content={label?.toUpperCase()}
                                    data-tooltip-place="bottom"
                                    style={{
                                        width: "100%",
                                        height: "40px",
                                        backgroundColor: 'rgba(0,0,0,0.0)',
                                        display: "flex",
                                        alignItems: "center",
                                        justifyContent: "center",
                                        color: `${index === hover ? '#92FFA2' : 'white'}`,
                                        fontSize: "20px",
                                        fontFamily: 'Gilroy',
                                        transform: `rotate(${index === 6 ? 90 - (incrementer + 0) : rotation * -index - incrementer}deg)`,
                                        pointerEvents: 'all',
                                    }}
                                >
                                    <FontAwesomeIcon icon={findIconDefinition({ prefix: 'fas', iconName: icon })} />
                                    
                                </div>
                            </foreignObject>
                            <defs>
                                <radialGradient id={`paint0_radial_0_1${index}`} cx="0" cy="0" r={index === hover ? 1.5 : 1} gradientUnits="userSpaceOnUse" gradientTransform="translate(20 20) rotate(90) scale(20 20)">
                                    <stop stopColor={index === hover ? '#92FFA2' : '#222530'} stopOpacity="0" />
                                    <stop offset="1" stopColor={index === hover ? '#92FFA2' : '#222530'} />
                                </radialGradient>
                            </defs>
                        </svg> : index === 7 ? <svg ref={nodeRef} style={{
                            width: "8.177vw",
                            height: "5.104vw",
                            overflow: "visible",
                            display: "flex",
                            alignItems: "center",
                            justifyContent: "center",
                            strokeWidth: "0.5vh",
                            zIndex: 10
                        }} viewBox="0 0 157 98" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M155 96L115.589 96C102.105 96 89.1923 90.5538 79.7812 80.8972L37 37" stroke="white" strokeOpacity="0.5" strokeWidth="4" strokeLinecap="round" strokeDasharray="8 8" />
                            <circle cx="20" cy="20" r={index === hover ? 32 : 20} fill={`url(#paint0_radial_0_1${index})`} fillOpacity="0.5" />
                            <foreignObject x="0" y="0" width="25.5%" height="40%" style={{ zIndex: 10 }}
                                onMouseEnter={() => {
                                    setHover(index)
                                }}
                                onMouseLeave={() => {
                                    setHover(null)
                                }}
                                onClick={() => {
                                    audios.volume = 0.2;
                                    audios.play();
                                    setSelectedButton(index);
                                    fetchNui("selectItem", { index: index });
                                }}
                            >
                                <div
                                    data-tooltip-id="my-tooltip"
                                    data-tooltip-content={label?.toUpperCase()}
                                    data-tooltip-place="bottom"
                                    style={{
                                        width: "100%",
                                        height: "40px",
                                        backgroundColor: 'rgba(0,0,0,0.0)',
                                        display: "flex",
                                        alignItems: "center",
                                        justifyContent: "center",
                                        color: `${index === hover ? '#92FFA2' : 'white'}`,
                                        fontSize: "20px",
                                        fontFamily: 'Gilroy',
                                        transform: `rotate(${45 - incrementer}deg)`,
                                        pointerEvents: 'all',
                                    }}>
                                    <FontAwesomeIcon icon={findIconDefinition({ prefix: 'fas', iconName: icon })} />
                                </div>
                            </foreignObject>
                            <defs>
                                <radialGradient id={`paint0_radial_0_1${index}`} cx="0" cy="0" r={index === hover ? 1.5 : 1} gradientUnits="userSpaceOnUse" gradientTransform="translate(20 20) rotate(90) scale(20 20)">
                                    <stop stopColor={index === hover ? '#92FFA2' : '#222530'} stopOpacity="0" />
                                    <stop offset="1" stopColor={index === hover ? '#92FFA2' : '#222530'} />
                                </radialGradient>
                            </defs>
                        </svg> : index % 3 === 1 ? <div ref={nodeRef}>
                            <svg style={{
                                width: "10.177vw",
                                height: "10.177vw",
                                transform: `rotate(${-46}deg)`,
                                marginLeft: "3.3vw",
                                marginBottom: "3.7vw",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                backgroundColor: 'rgba(0,0,0,0.0)',
                                strokeWidth: "0.5vh",
                                overflow: "visible",
                            }} viewBox="0 0 181 157" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M85 155V94.5M85  94.5L36 45" stroke="white" strokeOpacity="0.5" strokeWidth="4" strokeLinecap="round" strokeDasharray="8 8" />
                                <circle cx="20" cy="29" r={index === hover ? 32 : 20} fill={`url(#paint0_radial_0_1${index})`} fillOpacity="0.5" />
                                <foreignObject x="0" y="0" width="22%" height="5.5vh"
                                    onMouseEnter={() => {
                                        setHover(index)
                                    }}
                                    onMouseLeave={() => {
                                        setHover(null)
                                    }}
                                    onClick={() => {
                                        audios.volume = 0.2;
                                        audios.play();
                                        setSelectedButton(index);
                                        fetchNui("selectItem", { index: index });
                                    }}
                                >
                                    <div
                                        data-tooltip-id="my-tooltip"
                                        data-tooltip-content={label?.toUpperCase()}
                                        data-tooltip-place="bottom"
                                        style={{
                                            width: "100%",
                                            height: "56px",
                                            display: "flex",
                                            alignItems: "center",
                                            justifyContent: "center",
                                            color: `${index === hover ? '#92FFA2' : 'white'}`,
                                            fontSize: "20px",
                                            fontFamily: 'Gilroy',
                                            transform: `rotate(${index === 1 ? 0 - incrementer : -135 - incrementer}deg)`,
                                            pointerEvents: 'all',
                                        }}>
                                        <FontAwesomeIcon icon={findIconDefinition({ prefix: 'fas', iconName: icon })} />
                                    </div>
                                </foreignObject>
                                <defs>
                                    <radialGradient id={`paint0_radial_0_1${index}`} cx="0" cy="0" r={index === hover ? 1.5 : 1} gradientUnits="userSpaceOnUse" gradientTransform="translate(20 29) rotate(90) scale(20 20)">
                                        <stop stopColor={index === hover ? '#92FFA2' : '#222530'} stopOpacity="0" />
                                        <stop offset="1" stopColor={index === hover ? '#92FFA2' : '#222530'} />
                                    </radialGradient>
                                </defs>
                            </svg>
                        </div> : <div ref={nodeRef}>
                            <svg style={{
                                width: "10.177vw",
                                height: "10.104vw",
                                transform: `rotate(${-90}deg)`,
                                marginLeft: "-0.5vw",
                                marginBottom: "-4.2vw",
                                overflow: "visible",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                strokeWidth: "0.5vh",
                            }} viewBox="0 0 181 157" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M85 94.5L145 36M85" stroke="white" strokeOpacity="0.5" strokeWidth="4" strokeLinecap="round" strokeDasharray="8 8" />
                                <circle cx="161" cy="20" r={index === hover ? 32 : 20} fill={`url(#paint1_radial_0_1${index})`} fillOpacity="0.5" />
                                <foreignObject x="78%" y="0" width="22%" height="5.5vh"
                                    onMouseEnter={() => {
                                        setHover(index)
                                    }}
                                    onMouseLeave={() => {
                                        setHover(null)
                                    }}
                                    onClick={() => {
                                        audios.volume = 0.2;
                                        audios.play();
                                        setSelectedButton(index);
                                        fetchNui("selectItem", { index: index });
                                    }}
                                >
                                    <div
                                        data-tooltip-id="my-tooltip"
                                        data-tooltip-content={label?.toUpperCase()}
                                        data-tooltip-place="bottom"
                                        style={{
                                            width: "100%",
                                            height: "41px",
                                            display: "flex",
                                            alignItems: "center",
                                            justifyContent: "center",
                                            color: `${index === hover ? '#92FFA2' : 'white'}`,
                                            fontSize: "20px",
                                            fontFamily: 'Gilroy',
                                            transform: `rotate(${rotation * -1 - incrementer}deg)`,
                                            pointerEvents: 'all',
                                        }}>
                                        <FontAwesomeIcon icon={findIconDefinition({ prefix: 'fas', iconName: icon })} />
                                    </div>
                                </foreignObject>
                                <defs>
                                    <radialGradient id={`paint1_radial_0_1${index}`} cx="0" cy="0" r={index === hover ? 1.5 : 1} gradientUnits="userSpaceOnUse" gradientTransform="translate(161 20) rotate(90) scale(20 20)">
                                        <stop stopColor={index === hover ? '#92FFA2' : '#222530'} stopOpacity="0" />
                                        <stop offset="1" stopColor={index === hover ? '#92FFA2' : '#222530'} />
                                    </radialGradient>
                                </defs>
                            </svg>
                        </div>
                    }
                </CSSTransition>

            </div>
        </div>
    )
}

export default RadialButton