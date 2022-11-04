import {useState, useEffect } from "react";
import { MapContainer, TileLayer, Marker} from "react-leaflet";
import { NodeMarker } from "./NodeMarker";


export const MapLeafComponent = () => {
  
  const [center, setCenter] = useState([29.304137076323396, -98.52471565095904]);
  //const position = [pk[0].lat,pk[0].long];

  return ( 

  <MapContainer center={center} zoom={13} scrollWheelZoom={true}>
    <TileLayer
      attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    />
    <NodeMarker/>
  </MapContainer>

  );
};
