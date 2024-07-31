import React, { useState, useEffect } from 'react';
import { Bar } from 'react-chartjs-2';
import 'chart.js/auto';

const GlobalDrugPriceTrends = () => {
    const [data, setData] = useState({ labels: [], values: [] });

    useEffect(() => {
        fetch('/api/global-price-trends')
            .then(response => response.json())
            .then(data => setData(data));
    }, []);

    const chartData = {
        labels: data.labels,
        datasets: [
            {
                label: 'Drug Prices',
                data: data.values,
                backgroundColor: 'rgba(153,102,255,0.2)',
                borderColor: 'rgba(153,102,255,1)',
            },
        ],
    };

    return (
        <div className="card">
            <h2>Global Drug Price Trends</h2>
            <Bar data={chartData} />
        </div>
    );
};

export default GlobalDrugPriceTrends;
