import { create } from 'zustand';
import { immer } from 'zustand/middleware/immer';
import { RadialMenuData } from '../types/RadialMenu';

type State = {
    visible: boolean,
    radialMenu: RadialMenuData[],
    hover: number | null,
    selectedButton: number | null,
    incrementer: number,
};

type Actions = {
    setVisible: (visible: boolean) => void,
    setRadialMenu: (radialMenu: RadialMenuData[]) => void,
    setHover: (hover: number | null) => void,
    setSelectedButton: (hover: number | null) => void,
    setIncrementer: (incrementer: number) => void,
};

export const useRadial = create<State & Actions>()(
    immer((set) => ({
        visible: false,
        radialMenu: [],
        hover: null,
        selectedButton: null,
        incrementer: 0,
        setVisible: (visible: boolean) => set((state) => {
            state.visible = visible;
        }),
        setRadialMenu: (radialMenu: RadialMenuData[]) => set((state) => {
            state.radialMenu = radialMenu;
        }),
        setHover: (hover: number | null) => set((state) => {
            state.hover = hover;
        }),
        setSelectedButton: (selectedButton: number | null) => set((state) => {
            state.selectedButton = selectedButton;
        }),
        setIncrementer: (incrementer: number) => set((state) => {
            state.incrementer = incrementer;
        }),
    }))
);
