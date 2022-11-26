import './App.css';
import { MapLeafComponent } from './Components/MapLeafComponent';
import { Grid } from '@mui/material';


function App() {
  return (
    <Grid container>
     <Grid item xs={12}>
      <MapLeafComponent />
        </Grid>
    </Grid>

  );
}

export default App;
