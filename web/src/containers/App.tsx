import React from "react";
import { debugData } from "../utils/debugData";
import Main from "./Main";
import backgroundDev from "../assets/backgroundDev.png"

// This will set the NUI to visible if we are
// developing in browser
debugData([
	{
		action: "setVisible",
		data: true,
	},
]);

const App: React.FC = () => {
	return <div className="flex flex-col min-h-screen" style={{
		/* backgroundImage: `url(${backgroundDev})`,
		backgroundSize: "contain",
		backgroundRepeat: "no-repeat",
		backgroundPosition: "center", */

		// backgroundColor: "rgba(0, 0, 0, 0.5)",
	}}><Main /></div>;
};

export default App;
