import React from 'react';
import { Line } from 'react-chartjs-2';
import 'chart.js/auto';

const DataVisualization = ({ data }) => {
    const chartData = {
        labels: data.labels,
        datasets: [
            {
                label: 'Data Visualization',
                data: data.values,
                fill: false,
                borderColor: 'rgba(75,192,192,1)',
            },
        ],
    };

    return (
        <div className="card">
            <h2>Data Visualization</h2>
            <Line data={chartData} />
        </div>
    );
};

export default DataVisualization;
