import {useState, useRef } from "react";
import { MapContainer, TileLayer, useMap, useMapEvents} from "react-leaflet";
import { Draw } from "./Draw";
import { CustomLayers } from "./CustomLayers";
import { LocationButton } from "./LocationButton";



export const MapLeafComponent = () => {

  const [centerInit, setCenterInit] = useState([29.304137076323396, -98.52471565095904]);


  return ( 
  <>
  <MapContainer center={centerInit} zoom={13} scrollWheelZoom={true}>
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
