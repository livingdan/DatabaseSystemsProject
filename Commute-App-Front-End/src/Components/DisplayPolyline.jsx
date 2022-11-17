import React from 'react'
import { Polyline } from 'react-leaflet'
import polyline from '../data/polyline.json'

export const DisplayPolyline = () => {

/*polyline.line_points.map(ln => {
    console.log(ln.latitude + " " + ln.longitude)

}) 
*/
console.log(polyline.line_points)
const latlongs = []

polyline.line_points.map(ln => {
    latlongs.push([ln.latitude,ln.longitude])

}) 

console.log(latlongs)

  return (
    <Polyline positions={latlongs}/>
  )
}
 