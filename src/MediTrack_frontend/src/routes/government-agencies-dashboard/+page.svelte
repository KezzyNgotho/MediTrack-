<script>
  import Sidebar from './Sidebar.svelte';
  import { onMount } from 'svelte';
  import { Line, Bar } from 'svelte-chartjs';
  import { Chart, registerables } from 'chart.js';
  import './Dashboard.scss';

  Chart.register(...registerables);

  let selectedView = 'home';
  let isProfileMenuOpen = false;

  function handleLinkClick(event) {
    selectedView = event.detail;
  }

  function toggleProfileMenu() {
    isProfileMenuOpen = !isProfileMenuOpen;
  }

  onMount(() => {
    // Initialize or load data here if needed
  });

  const lineChartData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [
      {
        label: 'Drug Distribution',
        backgroundColor: 'rgba(75,192,192,0.2)',
        borderColor: 'rgba(75,192,192,1)',
        data: [1000, 1200, 900, 1400, 1300, 1500, 1600]
      }
    ]
  };

  const barChartData = {
    labels: ['Case 1', 'Case 2', 'Case 3'],
    datasets: [
      {
        label: 'Corruption Cases',
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56'],
        data: [7, 5, 3]
      }
    ]
  };

  const lineChartOptions = {
    responsive: true,
    maintainAspectRatio: false
  };

  const barChartOptions = {
    responsive: true,
    maintainAspectRatio: false
  };
</script>

<div class="flex h-screen">
  <Sidebar on:linkClick={handleLinkClick} />
  <main class="flex-1 p-6">
    <header class="flex items-center justify-between mb-6">
      <h2 class="text-xl mb-4">Gov't Dashboard</h2>
      <div class="relative">
        <button class="flex items-center space-x-2" on:click={toggleProfileMenu}>
          <div class="w-10 h-10 rounded-full border border-gray-300 bg-gray-200 flex items-center justify-center">
            <span class="font-semibold text-gray-700">AD</span>
          </div>
          <span class="font-semibold">Amshel Doe</span>
        </button>
        {#if isProfileMenuOpen}
          <div class="absolute right-0 mt-2 bg-white border border-gray-300 rounded-lg shadow-lg w-48">
            <ul class="py-2">
              <li><a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">View Profile</a></li>
              <li><a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Edit Profile</a></li>
              <li><a href="/logout" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Logout</a></li>
            </ul>
          </div>
        {/if}
      </div>
    </header>
    {#if selectedView === 'home'}
    <section class="p-6 bg-gray-100">
      <!-- Overview Section -->
      <div class="overview grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
        <div class="overview-item bg-white p-6 rounded-lg shadow-lg flex flex-col">
          <h3 class="text-xl font-bold text-gray-800 mb-3">Drug Integrity Overview</h3>
          <p class="text-gray-600 mb-4">Get an overview of the integrity of drugs circulating in the market. This section includes metrics related to drug authenticity, compliance, and safety.</p>
          <ul class="list-disc pl-5 text-gray-700">
            <li>Authenticity Rate: <span class="font-semibold">98%</span></li>
            <li>Compliance Issues: <span class="font-semibold">5</span></li>
            <li>Safety Incidents: <span class="font-semibold">2</span></li>
          </ul>
        </div>
        <div class="overview-item bg-white p-6 rounded-lg shadow-lg flex flex-col">
          <h3 class="text-xl font-bold text-gray-800 mb-3">Report Summary</h3>
          <p class="text-gray-600 mb-4">Review a summary of recent reports on drug distribution, regulatory actions, and market trends.</p>
          <ul class="list-disc pl-5 text-gray-700">
            <li>Reports Generated: <span class="font-semibold">15</span></li>
            <li>Pending Reviews: <span class="font-semibold">3</span></li>
            <li>Market Trends: <span class="font-semibold">Stable</span></li>
          </ul>
        </div>
        <div class="overview-item bg-white p-6 rounded-lg shadow-lg flex flex-col">
          <h3 class="text-xl font-bold text-gray-800 mb-3">Price Monitoring</h3>
          <p class="text-gray-600 mb-4">Track price trends of drugs and monitor for any unusual fluctuations that could indicate potential issues.</p>
          <ul class="list-disc pl-5 text-gray-700">
            <li>Price Increase: <span class="font-semibold">2%</span></li>
            <li>Price Decrease: <span class="font-semibold">1%</span></li>
            <li>Average Price: <span class="font-semibold">$50</span></li>
          </ul>
        </div>
      </div>
  
      <!-- Details Section -->
      <div class="details space-y-8">
        <div class="detail-section bg-white p-6 rounded-lg shadow-lg">
          <h3 class="text-xl font-bold text-gray-800 mb-3">Drug Distribution Data</h3>
          <p class="text-gray-600 mb-4">Visualize data related to drug distribution across different regions, including quantities and delivery channels.</p>
          <div class="chart-container mb-4" style="height: 300px;">
            <Line data={lineChartData} options={lineChartOptions} />
          </div>
          <table class="w-full border-collapse bg-gray-50">
            <thead class="bg-gray-200 text-gray-700">
              <tr>
                <th class="px-4 py-2">Region</th>
                <th class="px-4 py-2">Quantity</th>
                <th class="px-4 py-2">Delivery Channel</th>
              </tr>
            </thead>
            <tbody class="text-gray-600">
              <tr>
                <td class="px-4 py-2">North</td>
                <td class="px-4 py-2">1000 units</td>
                <td class="px-4 py-2">Pharmacy</td>
              </tr>
              <tr>
                <td class="px-4 py-2">South</td>
                <td class="px-4 py-2">800 units</td>
                <td class="px-4 py-2">Hospital</td>
              </tr>
              <tr>
                <td class="px-4 py-2">East</td>
                <td class="px-4 py-2">600 units</td>
                <td class="px-4 py-2">Clinic</td>
              </tr>
            </tbody>
          </table>
        </div>
        
        <div class="detail-section bg-white p-6 rounded-lg shadow-lg">
          <h3 class="text-xl font-bold text-gray-800 mb-3">Corruption Reports</h3>
          <p class="text-gray-600 mb-4">Access detailed reports on cases of corruption within the pharmaceutical sector, including investigations and outcomes.</p>
          <div class="chart-container mb-4" style="height: 300px;">
            <Bar data={barChartData} options={barChartOptions} />
          </div>
          <ul class="list-disc pl-5 text-gray-700 mb-4">
            <li>Case 1: Investigation ongoing</li>
            <li>Case 2: Resolved</li>
            <li>Case 3: Pending action</li>
          </ul>
          <a href="/detailed-reports" class="text-blue-600 hover:underline">View detailed reports</a>
        </div>
        
        <div class="detail-section bg-white p-6 rounded-lg shadow-lg">
          <h3 class="text-xl font-bold text-gray-800 mb-3">Regulatory Insights</h3>
          <p class="text-gray-600 mb-4">Gain insights into regulatory changes, compliance requirements, and industry standards affecting drug manufacturing and distribution.</p>
          <ul class="list-disc pl-5 text-gray-700 mb-4">
            <li>New Compliance Standards: Effective from Jan 2024</li>
            <li>Industry Best Practices: Updated guidelines available</li>
            <li>Regulatory Changes: Upcoming changes in 2024</li>
          </ul>
          <a href="/regulatory-insights" class="text-blue-600 hover:underline">Learn more</a>
        </div>
      </div>
    </section>
  {/if}
  
    {#if selectedView === 'analytics'}
      <section>
        <h2 class="text-xl font-semibold mb-4">Analytics</h2>
        <p>Explore various analytical tools and reports to gain deeper insights into data trends, performance metrics, and key indicators.</p>
        <div class="chart-container" style="height: 400px;">
          <Line data={lineChartData} options={lineChartOptions} />
        </div>
      </section>
    {/if}
    {#if selectedView === 'tools'}
    <section class="p-6 bg-gray-50">
      <h2 class="text-2xl font-bold text-gray-800 mb-6">Tools</h2>
      <p class="text-gray-600 mb-6">Utilize a variety of tools for data analysis, report generation, and operational management to enhance efficiency and effectiveness. Explore the tools below to gain actionable insights and improve your operations.</p>
  
      <div class="flex flex-wrap gap-6">
        <!-- Data Analysis Tool -->
        <div class="tool-card bg-white p-6 rounded-lg shadow-lg flex flex-col items-start">
          <div class="tool-icon mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 9V5H6v4H2v6h4v4h4v-4h4v-6h-4z" />
            </svg>
          </div>
          <h3 class="text-xl font-semibold text-gray-800 mb-2">Data Analysis Tool</h3>
          <p class="text-gray-600 mb-4">Analyze and visualize complex data sets with advanced features, including interactive charts and real-time updates.</p>
          <ul class="list-disc pl-5 mb-4">
            <li>Interactive Visualizations</li>
            <li>Real-Time Data Updates</li>
            <li>Customizable Dashboards</li>
          </ul>
          <a href="/data-analysis" class="text-blue-600 hover:underline">Try it now</a>
        </div>
  
        <!-- Report Generator -->
        <div class="tool-card bg-white p-6 rounded-lg shadow-lg flex flex-col items-start">
          <div class="tool-icon mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
          </div>
          <h3 class="text-xl font-semibold text-gray-800 mb-2">Report Generator</h3>
          <p class="text-gray-600 mb-4">Generate comprehensive reports quickly with customizable templates and seamless integration with your data sources.</p>
          <ul class="list-disc pl-5 mb-4">
            <li>Customizable Templates</li>
            <li>Automated Report Scheduling</li>
            <li>Data Integration</li>
          </ul>
          <a href="/report-generator" class="text-blue-600 hover:underline">Explore features</a>
        </div>
  
        <!-- Operational Management Tool -->
        <div class="tool-card bg-white p-6 rounded-lg shadow-lg flex flex-col items-start">
          <div class="tool-icon mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7l10 10m0-10L7 17" />
            </svg>
          </div>
          <h3 class="text-xl font-semibold text-gray-800 mb-2">Operational Management Tool</h3>
          <p class="text-gray-600 mb-4">Manage operational workflows and track key performance indicators with this comprehensive management tool.</p>
          <ul class="list-disc pl-5 mb-4">
            <li>Workflow Automation</li>
            <li>Performance Tracking</li>
            <li>Task Management</li>
          </ul>
          <a href="/operational-management" class="text-blue-600 hover:underline">Get started</a>
        </div>
      </div>
  
      <!-- Additional Tools Section -->
      <div class="mt-8">
        <h3 class="text-lg font-semibold text-gray-800 mb-4">Additional Tools and Resources</h3>
        <p class="text-gray-600 mb-4">Explore other tools and resources that might be useful for your needs.</p>
        <ul class="list-disc pl-5">
          <li><a href="/data-visualization" class="text-blue-600 hover:underline">Advanced Data Visualization Tools</a></li>
          <li><a href="/workflow-tools" class="text-blue-600 hover:underline">Workflow Optimization Tools</a></li>
          <li><a href="/analytics-tools" class="text-blue-600 hover:underline">Analytics and Insights Tools</a></li>
        </ul>
      </div>
    </section>
  {/if}
  
  {#if selectedView === 'reports'}
  <section class="p-6 bg-white rounded-lg shadow-md">
    <h2 class="text-2xl font-semibold mb-4 text-gray-800">Reports</h2>
    <p class="mb-6 text-gray-600">Access and filter through various reports related to drug manufacturing, distribution, compliance, and market trends. Use the options below to view different types of reports.</p>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
      <div class="report-card bg-blue-50 p-4 rounded-lg shadow-md">
        <h3 class="text-lg font-semibold mb-2 text-blue-600">Monthly Report</h3>
        <p class="text-gray-600">Detailed monthly analysis of drug manufacturing, distribution, and compliance. Review performance metrics and operational insights.</p>
        <a href="/monthly-report" class="mt-4 inline-block text-blue-500 hover:underline">View Report</a>
      </div>
      <div class="report-card bg-green-50 p-4 rounded-lg shadow-md">
        <h3 class="text-lg font-semibold mb-2 text-green-600">Quarterly Report</h3>
        <p class="text-gray-600">Comprehensive quarterly overview of industry trends, regulatory updates, and market dynamics. Essential for strategic planning and assessment.</p>
        <a href="/quarterly-report" class="mt-4 inline-block text-green-500 hover:underline">View Report</a>
      </div>
      <div class="report-card bg-yellow-50 p-4 rounded-lg shadow-md">
        <h3 class="text-lg font-semibold mb-2 text-yellow-600">Annual Report</h3>
        <p class="text-gray-600">In-depth annual review of drug industry performance, regulatory changes, and market forecasts. Ideal for long-term evaluation and decision-making.</p>
        <a href="/annual-report" class="mt-4 inline-block text-yellow-500 hover:underline">View Report</a>
      </div>
    </div>
  </section>
{/if}


   
  </main>
</div>

<style>
  .chart-container {
    position: relative;
    width: 100%;
  }
</style>

