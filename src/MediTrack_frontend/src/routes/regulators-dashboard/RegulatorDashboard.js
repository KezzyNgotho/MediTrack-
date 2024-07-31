import React from 'react';
import GlobalDrugPriceTrends from './GlobalDrugPriceTrends';
import RegulatoryComplianceMonitoring from '../regulatorRegulatoryComplianceMonitoring';
import AnomalyDetectionRegulator from './AnomalyDetectionRegulator';
import ReportingInterface from './ReportingInterface';
import DataVisualization from './DataVisualization';
import '../styles/Dashboard.css';

const RegulatorDashboard = () => {
    const [data, setData] = React.useState({ labels: [], values: [] });

    React.useEffect(() => {
        fetch('/api/data-visualization')
            .then(response => response.json())
            .then(data => setData(data));
    }, []);

    return (
        <div className="dashboard">
            <h1>Regulator Dashboard</h1>
            <div className="grid">
                <GlobalDrugPriceTrends />
                <RegulatoryComplianceMonitoring />
                <AnomalyDetectionRegulator />
                <ReportingInterface />
                <DataVisualization data={data} />
            </div>
        </div>
    );
};

export default RegulatorDashboard;
