import {useState, useEffect, useRef } from "react";
import { MapContainer, TileLayer, useMap, useMapEvents} from "react-leaflet";
import { Draw } from "../Draw";
import { CustomLayers } from "./CustomLayers";
import { LocationButton } from "./LocationButton";


export const MapLeafComponent = () => {

  const [centerInit, setCenterInit] = useState([29.304137076323396, -98.52471565095904]);
  const currentLocation = useRef;



  useEffect(() => {
  },[])
  //const position = [pk[0].lat,pk[0].long];

  /*
  function MyComponent() {
    //const map = useMap()
    //console.log('map bounds:', map.getBounds())
    //return null
    const map = useMapEvents({
      click: () => {
        map.locate()
      },
      locationfound: (location) => {
        console.log('location found:', location)
        map.flyTo(location.latlng)
      },
    })
    return null
  }
*/

  return ( 

  <MapContainer center={centerInit} zoom={13} scrollWheelZoom={true}>
    <TileLayer
      attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    />
    <CustomLayers/>
    {/*<MyComponent/>*/}
    <LocationButton/>
    <Draw/>
  </MapContainer>

  );
};
