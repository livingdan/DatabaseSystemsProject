import {useState, useEffect} from 'react';
import { Polyline, LayerGroup, Popup } from 'react-leaflet';
import axios from 'axios';
import { Button } from '@mui/material';

export const DisplayPolyline = ({id}) => {

const [plines, setPlines] = useState([])


useEffect(() => {
  axios.get(`http://localhost:8080/linesegment/${id}`)
  .then(res => setPlines(res.data));
},[id]);

const handleClick = async(e,id) => {
  try {
    e.preventDefault();
    console.log(id)
    await axios.delete(`http://localhost:8080/linesegment/${id}`);
    } catch(err) {
        console.error(err);
    }
}

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
                Text: {ln.textField}
                <br/>
                <Button onClick={(e) => handleClick(e,ln.id)}>Delete</Button>
              </Popup>
              </Polyline>
              )
      })

    }
    

    
    </LayerGroup>
  )
}
 