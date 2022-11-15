import { useState, useEffect } from "react";
import { MapContainer, TileLayer, useMap, useMapEvents } from "react-leaflet";
import L from "leaflet";

export const LocationButton = () => {

  function GetCurrentLocation () {
   /* const map = useMapEvents({
      click: () => {
        map.locate()
      },
      locationfound: (location) => {
        console.log('location found:', location)
        map.flyTo(location.latlng)
      },
    })
    return null
*/
  }

  return (
    <>
    <GetCurrentLocation/>
    </>
  )
}
