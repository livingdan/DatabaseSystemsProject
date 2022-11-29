import './App.css';
import { MapLeafComponent } from './Components/MapLeafComponent';
import { Button, Grid, TextField, FormControl, InputLabel, Select, MenuItem } from '@mui/material';
import { useState } from 'react';
import { useSelector, useDispatch } from 'react-redux'
import { setPoiType, setLineType, setLineText} from './slices/typeSlice'
import axios from 'axios';

function App() {
  const [isDisplayed, setIsDisplayed] = useState(false)
  const poiType = useSelector((state) => state.typeSelect.poiType);
  const poiLatlong = useSelector((state) => state.typeSelect.poiLatlong);
  const lineType = useSelector((state) => state.typeSelect.lineType);
  const lineText = useSelector((state) => state.typeSelect.lineText);
  const lineLatlong = useSelector((state) => state.typeSelect.lineLatlong);
  const dispatch = useDispatch();

  // on click renders form and buttons to add POI and Line
  const handleClick = async() => {
    setIsDisplayed(!isDisplayed)
  }

  // saves the most recent marker created to database
  const handleSaveMarker = async(e) => {
    try {
      e.preventDefault();
      await axios.post('http://localhost:8080/pointnode',
      {
        latitude: poiLatlong.latitude,
        longitude: poiLatlong.longitude,
        amenity: {
            id: poiType
        }
      }
      );

      setIsDisplayed(false)
      } catch(err) {
          console.error(err);
      }
  }

//saves the most recent polyline created to database
  const handleSaveLine = async(e) => {
    console.log(lineLatlong)
    try {
      e.preventDefault();
      await axios.post('http://localhost:8080/linesegment',
        {
          textField: lineText,
          lineType: {
              typeId: lineType,
          },
          polylines: lineLatlong
          
        }
      );

      setIsDisplayed(false)
      } catch(err) {
          console.error(err);
      }
  }

  return (
    <Grid container>
      <Grid item xs={2}>
        <Button onClick={handleClick} variant="contained"> Add to Map </Button>
        {
        isDisplayed && <>
        
        <FormControl fullWidth>
          <InputLabel id="select-poi-type">POI</InputLabel>
          <Select
          labelId="select-poi-type"
          value={poiType}
          onChange={(e) => dispatch(setPoiType(e.target.value))}
          >
            <MenuItem value={1}>Parking</MenuItem>
            <MenuItem value={2}>Repair Station</MenuItem>
            <MenuItem value={3}>Water</MenuItem>
            <MenuItem value={4}>Shelter</MenuItem>
            <MenuItem value={5}>Hazard</MenuItem>
            <MenuItem value={6}>Need Help</MenuItem>
          </Select>
        </FormControl>  
        <Button onClick={handleSaveMarker} variant="contained" color="success"> Save Marker </Button>

        <FormControl fullWidth>
          <InputLabel id="select-line-type">Line</InputLabel>
          <Select
          labelId="select-line-type"
          value={lineType}
          onChange={(e) => dispatch(setLineType(e.target.value))}
          >
            <MenuItem value={1}>Avoid Segment</MenuItem>
            <MenuItem value={2}>Caution Segment</MenuItem>
            <MenuItem value={3}>Prefered Segment</MenuItem>
            <MenuItem value={4}>Existing Route</MenuItem>
            
          </Select>
        </FormControl> 
        <TextField id="text-basic" 
        label="Text" 
        variant="outlined"
        multiline 
        defaultValue={lineText}
        onChange={(e) => dispatch(setLineText(e.target.value))} /> 
        <Button onClick={handleSaveLine} variant="contained" color="success"> Save Line Segment </Button>       
        </>
      }
      </Grid>
     <Grid item xs={10}>
      <MapLeafComponent/>
        </Grid>
    </Grid>

  );
}

export default App;
