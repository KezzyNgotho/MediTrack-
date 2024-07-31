import React, { useState, useEffect } from 'react';

const RegulatoryCompliance = () => {
    const [compliance, setCompliance] = useState([]);

    useEffect(() => {
        fetch('/api/regulatory-compliance')
            .then(response => response.json())
            .then(data => setCompliance(data));
    }, []);

    return (
        <div className="card">
            <h2>Regulatory Compliance</h2>
            <ul>
                {compliance.map((item, index) => (
                    <li key={index}>{item.description}</li>
                ))}
            </ul>
        </div>
    );
};

export default RegulatoryCompliance;
