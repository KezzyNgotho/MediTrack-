import React, { useState, useEffect } from 'react';

const ReportingInterface = () => {
    const [reports, setReports] = useState([]);

    useEffect(() => {
        fetch('/api/reports')
            .then(response => response.json())
            .then(data => setReports(data));
    }, []);

    return (
        <div className="card">
            <h2>Reporting Interface</h2>
            <ul>
                {reports.map((report, index) => (
                    <li key={index}>{report.title}</li>
                ))}
            </ul>
        </div>
    );
};

export default ReportingInterface;
