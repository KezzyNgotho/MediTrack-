import React, { useState, useEffect } from 'react';

const AnomalyReporting = () => {
    const [anomalies, setAnomalies] = useState([]);

    useEffect(() => {
        fetch('/api/anomalies-reporting')
            .then(response => response.json())
            .then(data => setAnomalies(data));
    }, []);

    return (
        <div className="card">
            <h2>Anomaly Reporting</h2>
            <ul>
                {anomalies.map((anomaly, index) => (
                    <li key={index}>{anomaly.description}</li>
                ))}
            </ul>
        </div>
    );
};

export default AnomalyReporting;
