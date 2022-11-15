import React from 'react'
import { LayersControl } from 'react-leaflet'
import { NodeMarker } from './NodeMarker'

export const CustomLayers = () => {
  return (
    <LayersControl>
        <LayersControl.Overlay name = "Parking" >
            <NodeMarker/>
        </LayersControl.Overlay>


    </LayersControl>
  )
}
