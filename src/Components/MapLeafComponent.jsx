import React from "react";
import { MapContainer, TileLayer, Marker, Popup} from "react-leaflet";


export const MapLeafComponent = () => {
  return (

<MapContainer center={[29.304137076323396, -98.52471565095904]} zoom={13} scrollWheelZoom={true}>
  <TileLayer
    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
  />
  <Marker position={[29.304137076323396, -98.52471565095904]}>
    <Popup>
      TAMUSA. <br /> Easily customizable.
    </Popup>
  </Marker>
</MapContainer>

  );
};
