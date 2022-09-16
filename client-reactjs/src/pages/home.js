import React from 'react';
import ApiService from '../services/apiService';
export default function Home() {
  const [belegungen, setBelegungen] = React.useState([]);
  React.useEffect(() => {
    ApiService.getAllBelegungen().then((res) => {
      console.log(res);
      setBelegungen(res.data);
    });
  }, []);

  if (!belegungen) {
    return <div>Loading...</div>;
  }

  return (
    <div className='home'>
      <h1> HOME</h1>
      <div>
        {belegungen.map((belegung) => (
          <div key={belegung.id}>
            <h2>{belegung.number}</h2>
            <p>{belegung.info}</p>
          </div>
        ))}
      </div>
    </div>
  );
}
