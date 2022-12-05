import {useState } from "react";
import { MapContainer, TileLayer} from "react-leaflet";
import { Draw } from "./Draw";
import { CustomLayers } from "./CustomLayers";
import { LocationButton } from "./LocationButton";

// main display of open street map using react-leaflet

export const MapLeafComponent = () => {

  const [centerInit] = useState([29.430325, -98.495168]);


  return ( 
  <>
  <MapContainer center={centerInit} zoom={12} scrollWheelZoom={true}>
    <TileLayer
      attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    />
    <CustomLayers/>
    <LocationButton/>
    <Draw/>
  </MapContainer>

  </>
  );
};
