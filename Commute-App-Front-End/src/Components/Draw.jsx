import React from 'react'
import {EditControl} from "react-leaflet-draw"
import "leaflet-draw/dist/leaflet.draw.css"
import { FeatureGroup } from 'react-leaflet'

export const Draw = () => {
    const _onCreated = e => {
        console.log(e)
    }

    const _onEdited = e => {
        console.log(e)
    }

    const _onDeleted= e => {
        console.log(e)
    }


  return (
    <FeatureGroup>
        <EditControl 
        position="topright" 
        onCreated={_onCreated} 
        onEdited={_onEdited} 
        onDeleted={_onDeleted}
        draw={{
            rectangle: false,
            circle: false,
            polygon: false,
            circlemarker: false,
        }}/>
    </FeatureGroup>
  )
}
