import React, { useState, useEffect } from 'react';

const AnomalyDetectionRegulator = () => {
    const [anomalies, setAnomalies] = useState([]);

    useEffect(() => {
        fetch('/api/anomaly-detection')
            .then(response => response.json())
            .then(data => setAnomalies(data));
    }, []);

    return (
        <div className="card">
            <h2>Anomaly Detection</h2>
            <ul>
                {anomalies.map((anomaly, index) => (
                    <li key={index}>{anomaly.description}</li>
                ))}
            </ul>
        </div>
    );
};

export default AnomalyDetectionRegulator;
