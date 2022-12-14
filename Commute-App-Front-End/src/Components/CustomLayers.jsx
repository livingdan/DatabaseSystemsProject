import { useState, useEffect } from 'react'
import { LayersControl } from 'react-leaflet'
import { NodeMarker } from './NodeMarker'
import axios from 'axios'
import { DisplayPolyline } from './DisplayPolyline'

// Custom layers drives the display of points and polylines from database

export const CustomLayers = () => {
  const [nodeAmenity, setNodeAmentiy] = useState([]);
  const [lineType, setLineType] = useState([]);

// gets names of amenities and linetypes in database
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
        <LayersControl.Overlay key={ln.typeId} name={ln.typeDescription + ' lineSegment'}   >
          <DisplayPolyline id={ln.typeId}/>
        </LayersControl.Overlay>  

      ))}
         
    </LayersControl>
  )
}
