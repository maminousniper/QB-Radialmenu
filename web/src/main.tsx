import ReactDOM from "react-dom/client";
import App from "./containers/App";
import "./RadialMenu.scss";
import 'react-tooltip/dist/react-tooltip.css'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
library.add(fas)

const root = document.getElementById('root');

ReactDOM.createRoot(root!).render(
  <App />,
);
