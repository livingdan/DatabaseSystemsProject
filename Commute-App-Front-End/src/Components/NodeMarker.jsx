import { useState, useEffect } from "react";
import axios from "axios";
import { LayerGroup, Marker } from "react-leaflet";

export const NodeMarker = () => {
  const [poiMarker, SetPoiMarker] = useState([])


  useEffect(() => {
    axios.get('http://localhost:8080/pointnode')
    .then(res => SetPoiMarker(res.data));
  },[]);

  return (
    <LayerGroup>
    {poiMarker.map(pos => (
      <Marker position ={[pos.latitude,pos.longitude]} />
    ))}
    </LayerGroup>
  )
}
