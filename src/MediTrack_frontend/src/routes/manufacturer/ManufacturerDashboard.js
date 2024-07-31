import React from 'react';
import RealTimeTracking from '../components/RealTimeTracking';
import QualityAssuranceMetrics from '../components/QualityAssuranceMetrics';
import AnomalyReporting from '../components/AnomalyReporting';
import RegulatoryCompliance from '../components/RegulatoryCompliance';
import DataExport from '../components/DataExport';
import '../styles/Dashboard.css';

const ManufacturerDashboard = () => {
    return (
        <div className="dashboard">
            <h1>Manufacturer Dashboard</h1>
            <div className="grid">
                <RealTimeTracking />
                <QualityAssuranceMetrics />
                <AnomalyReporting />
                <RegulatoryCompliance />
                <DataExport />
            </div>
        </div>
    );
};

export default ManufacturerDashboard;
