import { configureStore } from '@reduxjs/toolkit'
import typeSliceReducer from './slices/typeSlice'

export default configureStore({
  reducer: {
    typeSelect: typeSliceReducer
  },
})