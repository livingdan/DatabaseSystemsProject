import { useState, useEffect } from "react";
import axios from "axios";
import { LayerGroup, Marker, Popup } from "react-leaflet";
import { Button } from "@mui/material";

// functionality to display POI from database

export const NodeMarker = ({id}) => {
  const [poiMarker, SetPoiMarker] = useState([])

  // gets poi locations from database
  useEffect(() => {
    axios.get(`http://localhost:8080/pointnode/${id}`)
    .then(res => SetPoiMarker(res.data));
  },[id]);

  // handles deletion of poi from popup display
  const handleClick = async(e,id) => {
    try {
      e.preventDefault();
      console.log(id)
      await axios.delete(`http://localhost:8080/pointnode/${id}`);
      } catch(err) {
          console.error(err);
      }
  }

  return (
    <LayerGroup>
    {poiMarker.map(pos => (
      <Marker key={pos.id} position ={[pos.latitude,pos.longitude]} >
        <Popup>
          {pos.amenity.type}
          <br/>
          <Button onClick={(e) => handleClick(e,pos.id)}>Delete</Button>
        </Popup>
      </Marker>
    ))}
    </LayerGroup>
  )
}
