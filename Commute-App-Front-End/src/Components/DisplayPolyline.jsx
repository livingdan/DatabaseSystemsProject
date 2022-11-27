import {useState, useEffect} from 'react';
import { Polyline, LayerGroup, FeatureGroup, Popup } from 'react-leaflet';
import axios from 'axios';

export const DisplayPolyline = ({id}) => {

const [plines, setPlines] = useState([])


useEffect(() => {
  axios.get(`http://localhost:8080/linesegment/${id}`)
  .then(res => setPlines(res.data));
},[id]);

  return (
    <LayerGroup>
    
    {
      plines.map(ln => {
        const latlng = [];
        ln.polylines.map(l => {
          latlng.push([l.latitude, l.longitude])
          return null
        });
       return(
              <Polyline key={ln.lineId} positions={latlng} >
              <Popup >
                line id: {ln.lineId}
                <br/>
                Text: {ln.textField}

              </Popup>
              </Polyline>
              )
      })

    }
    

    
    </LayerGroup>
  )
}
 