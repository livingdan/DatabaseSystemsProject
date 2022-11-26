import { useState, useEffect } from 'react'
import { LayersControl } from 'react-leaflet'
import { NodeMarker } from './NodeMarker'
import axios from 'axios'
import { DisplayPolyline } from './DisplayPolyline'

export const CustomLayers = () => {
  const [nodeAmenity, setNodeAmentiy] = useState([]);
  const [lineType, setLineType] = useState([]);


  useEffect(() => {
    axios.get(`http://localhost:8080/amenity`)
        .then(res => {
            setNodeAmentiy(res.data)
        });
        axios.get(`http://localhost:8080/linetype`)
        .then(res => {
            setLineType(res.data)
        });
}, []);


  return (
    <LayersControl>
      {nodeAmenity.map(amenity => (
      <LayersControl.Overlay key={amenity.id} name = {amenity.type} >
        <NodeMarker id={amenity.id}/>
      </LayersControl.Overlay>
    ))}
      {lineType.map(ln => (
        <LayersControl.Overlay key={ln.typeId} name={ln.typeDescription}   >
          <DisplayPolyline id={ln.typeId}/>
        </LayersControl.Overlay>  

      ))}
         
    </LayersControl>
  )
}
