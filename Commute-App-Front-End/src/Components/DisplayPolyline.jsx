import {useState, useEffect} from 'react';
import { Polyline, LayerGroup, FeatureGroup } from 'react-leaflet';
import polyline from '../data/polyline.json';
import axios from 'axios';

export const DisplayPolyline = ({id}) => {

const [plines, setPlines] = useState([])

/*polyline.line_points.map(ln => {
    console.log(ln.latitude + " " + ln.longitude)

}) 
*/

useEffect(() => {
  axios.get(`http://localhost:8080/lineseegment/${id}`)
  .then(res => setPlines(res.data));
},[]);


console.log(polyline.line_points)

polyline.line_points.map(ln => {
    plines.push([ln.latitude,ln.longitude])

}) 

console.log(plines)

  return (
    <FeatureGroup>
    
      <Polyline positions={plines}/>
    
    </FeatureGroup>
  )
}
 