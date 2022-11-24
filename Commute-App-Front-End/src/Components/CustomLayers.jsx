import { useState, useEffect } from 'react'
import { LayersControl } from 'react-leaflet'
import { NodeMarker } from './NodeMarker'
import axios from 'axios'
import { DisplayPolyline } from './DisplayPolyline'
import { lineHeight } from '@mui/system'

export const CustomLayers = () => {
  const [nodeAmenity, setNodeAmentiy] = useState([]);


  useEffect(() => {
    axios.get(`http://localhost:8080/amenity`)
        .then(res => {
            setNodeAmentiy(res.data)
        });
}, []);


  return (
    <LayersControl>
      {nodeAmenity.map(amenity => (
      <LayersControl.Overlay name = {amenity.type} >
        <NodeMarker id={amenity.id}/>
      </LayersControl.Overlay>
    ))}

      <LayersControl.Overlay name={'polyline'}   >
          <DisplayPolyline id={lineHeight.id}/>
        </LayersControl.Overlay>     
    </LayersControl>
  )
}
