import React from 'react'
import {EditControl} from "react-leaflet-draw"
import "leaflet-draw/dist/leaflet.draw.css"
import { FeatureGroup } from 'react-leaflet'
import { useDispatch } from 'react-redux'
import { setPoiLatlong, setLineLatlong} from '../slices/typeSlice'

export const Draw = () => {

    const dispatch = useDispatch();

  // stores most recently created latlng/s to redux store
    const _onCreated = e => {
        console.log(e);
        if(e.layerType === "marker"){
            dispatch(setPoiLatlong({latitude: e.layer._latlng.lat,
                                longitude: e.layer._latlng.lng
                                })); // marker
        } else if(e.layerType === "polyline"){
            const polylineJson = [];
            var orderCount = 1;
            e.layer._latlngs.map((latlng) => {
                polylineJson.push({ id: {order: orderCount},
                                    latitude: latlng.lat,
                                    longitude: latlng.lng

                });
                orderCount += 1;
                return null;
            })
            dispatch(setLineLatlong(polylineJson));
        }

    }

    const _onEdited = e => {
        console.log(e);
    }

    const _onDeleted= e => {
        console.log(e);
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
