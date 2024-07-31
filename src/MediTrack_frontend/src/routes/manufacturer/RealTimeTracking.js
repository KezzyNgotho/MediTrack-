import React, { useState, useEffect } from 'react';

const RealTimeTracking = () => {
    const [trackingData, setTrackingData] = useState([]);

    useEffect(() => {
        fetch('/api/realtime-tracking')
            .then(response => response.json())
            .then(data => setTrackingData(data));
    }, []);

    return (
        <div className="card">
            <h2>Real-Time Tracking</h2>
            <ul>
                {trackingData.map((data, index) => (
                    <li key={index}>{data.details}</li>
                ))}
            </ul>
        </div>
    );
};

export default RealTimeTracking;
