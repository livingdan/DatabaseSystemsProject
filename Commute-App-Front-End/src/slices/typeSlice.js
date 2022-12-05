import { createSlice } from "@reduxjs/toolkit";

// redux slice to help pass values from the leaflet component 

const typeSlice = createSlice({
    name: 'typeSelect', 
    initialState: {
        poiType: '',
        poiLatlong: {},
        lineType: '',
        lineText: '',
        lineLatlong: {}

        
    },
    reducers: {
        setPoiType: (state, action) => {
            state.poiType = action.payload;
        },
        setLineType: (state, action) => {
            state.lineType = action.payload;
        },
        setLineText: (state, action) => {
            state.lineText = action.payload;
        },
        setPoiLatlong: (state, action) => {
            state.poiLatlong = action.payload;
        },
        setLineLatlong: (state, action) => {
            state.lineLatlong = action.payload;
        },
    }
});

export const { setPoiType, setLineType, setLineText, setPoiLatlong, setLineLatlong } = typeSlice.actions;
export default typeSlice.reducer;