import React, { useState, useEffect } from 'react';

const QualityAssuranceMetrics = () => {
    const [metrics, setMetrics] = useState([]);

    useEffect(() => {
        fetch('/api/quality-assurance-metrics')
            .then(response => response.json())
            .then(data => setMetrics(data));
    }, []);

    return (
        <div className="card">
            <h2>Quality Assurance Metrics</h2>
            <ul>
                {metrics.map((metric, index) => (
                    <li key={index}>{metric.description}</li>
                ))}
            </ul>
        </div>
    );
};

export default QualityAssuranceMetrics;
