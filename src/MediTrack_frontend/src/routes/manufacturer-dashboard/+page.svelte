<script>
    import Sidebar from './Sidebar.svelte';
    import { Bar, Line, Pie } from 'svelte-chartjs';
    import { Chart, registerables } from 'chart.js';
    import './dashboard.scss';
    import image from '../assets/icons8-human-100.png';
  
    Chart.register(...registerables);
  
    let selectedView = 'production';
    let isProfileMenuOpen = false;
  
    function changeView(event) {
      selectedView = event.detail;
    }
  
    function toggleProfileMenu() {
      isProfileMenuOpen = !isProfileMenuOpen;
    }
    
    // Demo data for visualizations
    const barData = {
      labels: ['Product A', 'Product B', 'Product C', 'Product D'],
      datasets: [{
        label: 'Units Produced',
        backgroundColor: '#4c51bf',
        borderColor: '#4c51bf',
        data: [500, 1000, 750, 1250]
      }]
    };
  
    const lineData = {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [{
        label: 'Production Over Time',
        backgroundColor: '#f56565',
        borderColor: '#f56565',
        data: [300, 500, 700, 600, 800, 900, 1000]
      }]
    };
  
    const pieData = {
      labels: ['Defective', 'Non-defective'],
      datasets: [{
        label: 'Quality Control',
        backgroundColor: ['#48bb78', '#ed8936'],
        data: [10, 90]
      }]
    };
  </script>
  
  <div class="flex min-h-screen bg-gray-200">
    <Sidebar on:linkClick={changeView} />
  
    <main class="flex-1 p-6">
      <header class="flex items-center justify-between mb-6">
        <h2 class="text-xl mb-4">Manufacturers Dashboard</h2>
        <div class="relative">
          <button class="flex items-center space-x-2" on:click={toggleProfileMenu}>
            <img src={image} alt="User Avatar" class="w-10 h-10 rounded-full border border-gray-300" />
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
  
      {#if selectedView === 'production'}
        {#if selectedView === 'production'}
  <section>
    <h2 class="text-xl mb-4">Production Overview</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <!-- Units Produced -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">Units Produced</h3>
        <Bar data={barData} />
      </div>
      <!-- Production Over Time -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">Production Over Time</h3>
        <Line data={lineData} />
      </div>
      <!-- Production Efficiency -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">Production Efficiency</h3>
        <p class="mb-4">Overall Efficiency: 85%</p>
        <p>Downtime: 12 hours this month</p>
        <div class="w-full h-64">
          <Pie data={pieData} />
        </div>
      </div>
      <!-- Production Forecast -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">Production Forecast</h3>
        <p class="mb-4">Projected production for the next quarter based on current trends.</p>
        <div class="w-full h-64">
          <!-- Insert a forecast chart here, e.g., a Line chart for projections -->
          <Line data={{
            labels: ['August', 'September', 'October', 'November'],
            datasets: [{
              label: 'Forecasted Production',
              backgroundColor: '#f6ad55',
              borderColor: '#f6ad55',
              data: [1100, 1200, 1300, 1400]
            }]
          }} />
        </div>
      </div>
      <!-- Production Bottlenecks -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">Production Bottlenecks</h3>
        <p class="mb-4">Identify and address issues affecting production efficiency.</p>
        <ul class="list-disc list-inside text-gray-600">
          <li>Machine Downtime</li>
          <li>Supply Chain Delays</li>
          <li>Labor Shortages</li>
        </ul>
      </div>
      <!-- Production Costs -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">Production Costs</h3>
        <p class="mb-4">Breakdown of production costs by category.</p>
        <div class="w-full h-64">
          <!-- Insert a pie chart or bar chart here for cost breakdown -->
          <Pie data={{
            labels: ['Raw Materials', 'Labor', 'Maintenance', 'Overheads'],
            datasets: [{
              label: 'Cost Breakdown',
              backgroundColor: ['#68d391', '#63b3ed', '#f6ad55', '#f56565'],
              data: [40, 25, 20, 15]
            }]
          }} />
        </div>
      </div>
    </div>
  </section>
{/if}



{:else if selectedView === 'inventory'}
  <section>
    <h2 class="text-2xl mb-4">Inventory Management</h2>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Current Inventory Levels -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Current Inventory Levels</h3>
          <p class="mb-4">Overview of current inventory levels for key items.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Reorder Level</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Widget A</td>
                  <td class="px-6 py-4 whitespace-nowrap">150</td>
                  <td class="px-6 py-4 whitespace-nowrap">100</td>
                  <td class="px-6 py-4 whitespace-nowrap text-green-500">In Stock</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Widget B</td>
                  <td class="px-6 py-4 whitespace-nowrap">50</td>
                  <td class="px-6 py-4 whitespace-nowrap">75</td>
                  <td class="px-6 py-4 whitespace-nowrap text-red-500">Low Stock</td>
                </tr>
                <!-- Add more rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Stock Alerts -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Stock Alerts</h3>
          <p class="mb-4">Notifications for low or excess stock levels.</p>
          <ul class="list-disc list-inside text-gray-600">
            <li><span class="font-semibold text-red-600">Low Stock:</span> Widget B is below the reorder level.</li>
            <li><span class="font-semibold text-green-600">Normal Stock:</span> Widget A is sufficiently stocked.</li>
          </ul>
        </div>
        <!-- Inventory Trends -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Inventory Trends</h3>
          <p class="mb-4">Trends in inventory levels over time.</p>
          <div class="w-full h-64">
            <Line data={{
              labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
              datasets: [{
                label: 'Inventory Levels',
                backgroundColor: '#63b3ed',
                borderColor: '#63b3ed',
                data: [200, 180, 160, 140, 120, 100, 80]
              }]
            }} />
          </div>
        </div>
        <!-- Recent Inventory Adjustments -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Recent Inventory Adjustments</h3>
          <p class="mb-4">Summary of recent adjustments made to the inventory.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Adjustment</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Reason</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-31</td>
                  <td class="px-6 py-4 whitespace-nowrap">Widget A</td>
                  <td class="px-6 py-4 whitespace-nowrap">+50</td>
                  <td class="px-6 py-4 whitespace-nowrap">Restock</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-30</td>
                  <td class="px-6 py-4 whitespace-nowrap">Widget B</td>
                  <td class="px-6 py-4 whitespace-nowrap">-20</td>
                  <td class="px-6 py-4 whitespace-nowrap">Sales</td>
                </tr>
                <!-- Add more rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Inventory Value -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Inventory Value</h3>
          <p class="mb-4">Current value of inventory based on item prices.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['Widget A', 'Widget B'],
              datasets: [{
                label: 'Inventory Value',
                backgroundColor: '#4c51bf',
                borderColor: '#4c51bf',
                data: [15000, 5000] // Example values
              }]
            }} />
          </div>
        </div>
      </div>
    </div>
  </section>






  {:else if selectedView === 'quality'}
  <section>
    <h2 class="text-2xl mb-4">Quality Control</h2>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Defective vs Non-defective -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Defective vs Non-defective</h3>
          <p class="mb-4">Visual representation of defective vs non-defective products.</p>
          <div class="w-full h-64">
            <Pie data={pieData} />
          </div>
        </div>
        <!-- Quality Trends -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Quality Trends</h3>
          <p class="mb-4">Trends in product quality over the past six months.</p>
          <div class="w-full h-64">
            <Line data={{
              labels: ['January', 'February', 'March', 'April', 'May', 'June'],
              datasets: [{
                label: 'Defective Rate',
                backgroundColor: '#f56565',
                borderColor: '#f56565',
                data: [5, 6, 4, 7, 5, 6] // Example defective rates in percentage
              }]
            }} />
          </div>
        </div>
        <!-- Quality Issues Summary -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Quality Issues Summary</h3>
          <p class="mb-4">Summary of recent quality issues and their impact.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Issue ID</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Description</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Severity</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Q001</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-31</td>
                  <td class="px-6 py-4 whitespace-nowrap">Minor defects in Widget A</td>
                  <td class="px-6 py-4 whitespace-nowrap text-yellow-500">Minor</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Q002</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-30</td>
                  <td class="px-6 py-4 whitespace-nowrap">Significant defects in Widget B</td>
                  <td class="px-6 py-4 whitespace-nowrap text-red-500">Critical</td>
                </tr>
                <!-- Add more rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Quality Improvement Initiatives -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Quality Improvement Initiatives</h3>
          <p class="mb-4">Ongoing initiatives to improve product quality.</p>
          <ul class="list-disc list-inside text-gray-600">
            <li><span class="font-semibold">Training Sessions:</span> Regular training for quality control teams.</li>
            <li><span class="font-semibold">Process Optimization:</span> Streamlining production processes to reduce defects.</li>
            <li><span class="font-semibold">Supplier Quality Checks:</span> Enhanced quality checks for raw materials.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>




  {:else if selectedView === 'supply-chain'}
  <section>
    <h2 class="text-2xl mb-4">Supply Chain</h2>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Supplier Performance -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Supplier Performance</h3>
          <p class="mb-4">Overview of supplier performance metrics, including delivery times and quality ratings.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['Supplier A', 'Supplier B', 'Supplier C'],
              datasets: [{
                label: 'Performance Rating',
                backgroundColor: '#4c51bf',
                borderColor: '#4c51bf',
                data: [80, 90, 70] // Example performance ratings
              }]
            }} />
          </div>
        </div>
        <!-- Logistics Tracking -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Logistics Tracking</h3>
          <p class="mb-4">Track shipments and delivery timelines with the latest updates.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Shipment ID</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Destination</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">S001</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-31</td>
                  <td class="px-6 py-4 whitespace-nowrap">Warehouse A</td>
                  <td class="px-6 py-4 whitespace-nowrap">In Transit</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">S002</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-30</td>
                  <td class="px-6 py-4 whitespace-nowrap">Warehouse B</td>
                  <td class="px-6 py-4 whitespace-nowrap">Delivered</td>
                </tr>
                <!-- Add more shipment rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Supply Chain Efficiency -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Supply Chain Efficiency</h3>
          <p class="mb-4">Metrics showing the efficiency of the supply chain, including lead times and cost analysis.</p>
          <div class="w-full h-64">
            <Line data={{
              labels: ['January', 'February', 'March', 'April', 'May', 'June'],
              datasets: [{
                label: 'Lead Time (Days)',
                backgroundColor: '#f56565',
                borderColor: '#f56565',
                data: [5, 4, 6, 5, 4, 5] // Example lead times in days
              }]
            }} />
          </div>
        </div>
        <!-- Inventory Turnover -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Inventory Turnover</h3>
          <p class="mb-4">Analysis of how quickly inventory is being used and replenished.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['Q1', 'Q2', 'Q3', 'Q4'],
              datasets: [{
                label: 'Turnover Ratio',
                backgroundColor: '#68d391',
                borderColor: '#68d391',
                data: [3.5, 4.0, 3.8, 4.2] // Example turnover ratios
              }]
            }} />
          </div>
        </div>
      </div>
    </div>
  </section>




  {:else if selectedView === 'orders'}
  <section>
    <h2 class="text-2xl mb-4">Order Management</h2>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Order Processing -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Order Processing</h3>
          <p class="mb-4">Monitor the status of orders from placement to delivery.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Order ID</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Customer</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">O001</td>
                  <td class="px-6 py-4 whitespace-nowrap">John Doe</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-31</td>
                  <td class="px-6 py-4 whitespace-nowrap">Processing</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">O002</td>
                  <td class="px-6 py-4 whitespace-nowrap">Jane Smith</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-30</td>
                  <td class="px-6 py-4 whitespace-nowrap">Shipped</td>
                </tr>
                <!-- Add more order rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Order Fulfillment -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Order Fulfillment</h3>
          <p class="mb-4">Track order fulfillment metrics such as fulfillment rate and average fulfillment time.</p>
          <div class="w-full h-64">
            <Line data={{
              labels: ['January', 'February', 'March', 'April', 'May', 'June'],
              datasets: [{
                label: 'Fulfillment Rate (%)',
                backgroundColor: '#68d391',
                borderColor: '#68d391',
                data: [95, 92, 93, 94, 96, 97] // Example fulfillment rates
              }]
            }} />
          </div>
        </div>
        <!-- Order Returns -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Order Returns</h3>
          <p class="mb-4">Analyze return rates and reasons for returns to improve customer satisfaction.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['January', 'February', 'March', 'April', 'May', 'June'],
              datasets: [{
                label: 'Return Rate (%)',
                backgroundColor: '#f56565',
                borderColor: '#f56565',
                data: [2, 3, 1, 2.5, 1.8, 1.5] // Example return rates
              }]
            }} />
          </div>
        </div>
        <!-- Order Analytics -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Order Analytics</h3>
          <p class="mb-4">Comprehensive insights into order trends, volumes, and customer preferences.</p>
          <div class="w-full h-64">
            <Pie data={{
              labels: ['Product A', 'Product B', 'Product C'],
              datasets: [{
                label: 'Order Volume',
                backgroundColor: ['#4c51bf', '#68d391', '#f56565'],
                data: [120, 150, 100] // Example order volumes
              }]
            }} />
          </div>
        </div>
      </div>
    </div>
  </section>


  {:else if selectedView === 'reports'}
  <section>
    <h2 class="text-2xl mb-4">Report</h2>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Sales Report -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Sales Report</h3>
          <p class="mb-4">Summary of sales performance, including total sales, revenue, and growth rate.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['January', 'February', 'March', 'April', 'May', 'June'],
              datasets: [{
                label: 'Total Sales',
                backgroundColor: '#4c51bf',
                borderColor: '#4c51bf',
                data: [500, 600, 750, 800, 850, 900] // Example total sales data
              }]
            }} />
          </div>
        </div>
        <!-- Financial Report -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Financial Report</h3>
          <p class="mb-4">Overview of financial metrics, including profit margins, expenses, and net income.</p>
          <div class="w-full h-64">
            <Line data={{
              labels: ['Q1', 'Q2', 'Q3', 'Q4'],
              datasets: [{
                label: 'Net Income',
                backgroundColor: '#68d391',
                borderColor: '#68d391',
                data: [12000, 15000, 13000, 16000] // Example net income data
              }]
            }} />
          </div>
        </div>
        <!-- Inventory Report -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Inventory Report</h3>
          <p class="mb-4">Detailed report on inventory levels, turnover rates, and stockouts.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['Product A', 'Product B', 'Product C'],
              datasets: [{
                label: 'Inventory Levels',
                backgroundColor: '#f56565',
                borderColor: '#f56565',
                data: [200, 150, 100] // Example inventory levels data
              }]
            }} />
          </div>
        </div>
        <!-- Customer Report -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Customer Report</h3>
          <p class="mb-4">Insights into customer behavior, satisfaction, and demographics.</p>
          <div class="w-full h-64">
            <Pie data={{
              labels: ['New Customers', 'Returning Customers'],
              datasets: [{
                label: 'Customer Type',
                backgroundColor: ['#4c51bf', '#68d391'],
                data: [60, 40] // Example customer type data
              }]
            }} />
          </div>
        </div>
        <!-- Operational Report -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Operational Report</h3>
          <p class="mb-4">Metrics on operational efficiency, including production output and downtime.</p>
          <div class="w-full h-64">
            <Line data={{
              labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
              datasets: [{
                label: 'Production Output',
                backgroundColor: '#4c51bf',
                borderColor: '#4c51bf',
                data: [1500, 1600, 1550, 1650] // Example production output data
              }]
            }} />
          </div>
        </div>
      </div>
    </div>
  </section>

  {:else if selectedView === 'maintenance'}
  <section>
    <h2 class="text-2xl mb-4">Maintenance</h2>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Equipment Status -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Equipment Status</h3>
          <p class="mb-4">Real-time status of all critical equipment, including operational status and alerts for maintenance needs.</p>
          <div class="w-full h-64">
            <Pie data={{
              labels: ['Operational', 'Under Maintenance', 'Needs Attention'],
              datasets: [{
                label: 'Equipment Status',
                backgroundColor: ['#68d391', '#f56565', '#ecc94b'],
                data: [70, 20, 10] // Example status data
              }]
            }} />
          </div>
        </div>
        <!-- Maintenance Schedule -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Maintenance Schedule</h3>
          <p class="mb-4">Upcoming scheduled maintenance activities and their respective dates.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Equipment</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Maintenance Date</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Technician</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Conveyor Belt A</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-08-10</td>
                  <td class="px-6 py-4 whitespace-nowrap">John Doe</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Packaging Machine B</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-08-15</td>
                  <td class="px-6 py-4 whitespace-nowrap">Jane Smith</td>
                </tr>
                <!-- Add more maintenance schedule rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Maintenance History -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Maintenance History</h3>
          <p class="mb-4">Historical records of all maintenance activities performed, including dates and outcomes.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Equipment</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Outcome</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Conveyor Belt A</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-20</td>
                  <td class="px-6 py-4 whitespace-nowrap">Repaired</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">Packaging Machine B</td>
                  <td class="px-6 py-4 whitespace-nowrap">2024-07-15</td>
                  <td class="px-6 py-4 whitespace-nowrap">Routine Check</td>
                </tr>
                <!-- Add more maintenance history rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Spare Parts Inventory -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Spare Parts Inventory</h3>
          <p class="mb-4">Current inventory of spare parts, including quantities and reorder levels.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['Part A', 'Part B', 'Part C'],
              datasets: [{
                label: 'Quantity',
                backgroundColor: '#4c51bf',
                borderColor: '#4c51bf',
                data: [50, 30, 20] // Example inventory levels
              }]
            }} />
          </div>
        </div>
      </div>
    </div>
  </section>


  {:else if selectedView === 'financials'}
  <section>
    <h2 class="text-2xl mb-4">Financial</h2>
    <div class="bg-white p-6 rounded-lg shadow-md">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Revenue Overview -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Revenue Overview</h3>
          <p class="mb-4">Summary of the company's revenue streams and performance over the past few months.</p>
          <div class="w-full h-64">
            <Line data={{
              labels: ['January', 'February', 'March', 'April', 'May', 'June'],
              datasets: [{
                label: 'Revenue',
                backgroundColor: '#68d391',
                borderColor: '#68d391',
                data: [15000, 20000, 18000, 22000, 24000, 26000] // Example revenue data
              }]
            }} />
          </div>
        </div>
        <!-- Expenses Breakdown -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Expenses Breakdown</h3>
          <p class="mb-4">Detailed breakdown of the company's expenses by category.</p>
          <div class="w-full h-64">
            <Pie data={{
              labels: ['Salaries', 'Rent', 'Utilities', 'Supplies', 'Miscellaneous'],
              datasets: [{
                label: 'Expenses',
                backgroundColor: ['#4c51bf', '#f56565', '#ecc94b', '#48bb78', '#ed8936'],
                data: [5000, 3000, 2000, 1500, 1000] // Example expense data
              }]
            }} />
          </div>
        </div>
        <!-- Profit and Loss -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Profit and Loss</h3>
          <p class="mb-4">Overview of the company's profit and loss statements over the past year.</p>
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Month</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Revenue</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Expenses</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Profit/Loss</th>
                </tr>
              </thead>
              <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">January</td>
                  <td class="px-6 py-4 whitespace-nowrap">$15,000</td>
                  <td class="px-6 py-4 whitespace-nowrap">$10,000</td>
                  <td class="px-6 py-4 whitespace-nowrap">$5,000</td>
                </tr>
                <tr>
                  <td class="px-6 py-4 whitespace-nowrap">February</td>
                  <td class="px-6 py-4 whitespace-nowrap">$20,000</td>
                  <td class="px-6 py-4 whitespace-nowrap">$12,000</td>
                  <td class="px-6 py-4 whitespace-nowrap">$8,000</td>
                </tr>
                <!-- Add more profit and loss rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- Financial Ratios -->
        <div class="p-6 bg-white rounded-lg shadow-md">
          <h3 class="text-xl font-semibold mb-2">Financial Ratios</h3>
          <p class="mb-4">Key financial ratios to assess the company's financial health and performance.</p>
          <div class="w-full h-64">
            <Bar data={{
              labels: ['Current Ratio', 'Quick Ratio', 'Debt-to-Equity', 'Return on Equity'],
              datasets: [{
                label: 'Ratio',
                backgroundColor: '#4c51bf',
                borderColor: '#4c51bf',
                data: [1.5, 1.2, 0.8, 0.15] // Example financial ratios
              }]
            }} />
          </div>
        </div>
      </div>
    </div>
  </section>





          {/if}
        </main>
      </div>
      
      <style>
        .container {
          max-width: 1280px;
          margin: 0 auto;
          padding: 2rem;
        }
      </style>
      