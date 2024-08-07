<script>
  import Sidebar from './components/Sidebar.svelte';
  import { Bar, Line, Pie } from 'svelte-chartjs';
  import { Chart, registerables } from 'chart.js';
  import './styles/Dashboard.scss';
  import image from '../assets/icons8-human-100.png'
  Chart.register(...registerables);

  let selectedView = 'dashboard';
  let isProfileMenuOpen = false;

  function changeView(event) {
    selectedView = event.detail;
  }

  function toggleProfileMenu() {
    isProfileMenuOpen = !isProfileMenuOpen;
  }

  // Demo data for visualizations
  const barData = {
    labels: ['Region A', 'Region B', 'Region C', 'Region D'],
    datasets: [{
      label: 'Distributed Drugs',
      backgroundColor: '#4c51bf',
      borderColor: '#4c51bf',
      data: [500, 1000, 750, 1250]
    }]
  };

  const lineData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [{
      label: 'Corruption Cases Over Time',
      backgroundColor: '#f56565',
      borderColor: '#f56565',
      data: [3, 5, 2, 8, 6, 4, 7]
    }]
  };

  const pieData = {
    labels: ['Suspicious', 'Normal', 'Under Investigation'],
    datasets: [{
      label: 'Alert Types',
      backgroundColor: ['#48bb78', '#4299e1', '#ed8936'],
      data: [30, 50, 20]
    }]
  };

  // Sample reports data
  const reports = [
    { id: '12345', date: '2024-07-31', details: 'Report details go here', status: 'Pending' },
    { id: '12346', date: '2024-07-30', details: 'Report details go here', status: 'Reviewed' },
    { id: '12347', date: '2024-07-29', details: 'Report details go here', status: 'Resolved' },
  ];
</script>

<div class="flex min-h-screen bg-white">
  <Sidebar on:linkClick={changeView} />

  <main class="flex-1 p-6 bg-[#FFF]">
    <header class="flex items-center justify-between mb-6">
      <h2 class="text-2xl mb-4">Regulators Dashboard</h2>
      <div class="relative">
        <button class="flex items-center space-x-2" on:click={toggleProfileMenu}>
          <img src={image} alt="User Avatar" class="w-10 h-10 rounded-full border border-gray-300" />
          <span class="font-semibold">John Doe</span>
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
    
    {#if selectedView === 'dashboard'}
      <section>
        <!-- Your dashboard content here -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div class="p-6 bg-white rounded-lg shadow-md">
            <h3 class="text-xl font-semibold mb-2">Drug Distribution Overview</h3>
            <Bar data={barData} />
          </div>
          <div class="p-6 bg-white rounded-lg shadow-md">
            <h3 class="text-xl font-semibold mb-2">Corruption Cases Over Time</h3>
            <Line data={lineData} />
          </div>
          <div class="p-6 bg-white rounded-lg shadow-md">
            <h3 class="text-xl font-semibold mb-2">Alert Types</h3>
            <Pie data={pieData} />
          </div>
        </div>
      </section>
    {:else if selectedView === 'reports'}
    <section>
      <h2 class="text-2xl  mb-4">Manage Reports</h2>
     
      <div class="overflow-x-auto bg-white p-6 rounded-lg shadow-md">
        <table class="min-w-full bg-white divide-y divide-gray-200">
          <thead>
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Report ID</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Details</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            {#each reports as report}
              <tr>
                <td class="px-6 py-4 whitespace-nowrap">{report.id}</td>
                <td class="px-6 py-4 whitespace-nowrap">{report.date}</td>
                <td class="px-6 py-4 whitespace-nowrap">{report.details}</td>
                <td class="px-6 py-4 whitespace-nowrap">{report.status}</td>
              </tr>
            {/each}
          </tbody>
        </table>
      </div>
    </section>
    {:else if selectedView === 'alerts'}
      <section>
        <h2 class="text-4xl font-bold mb-4">Alerts</h2>
        <div class="bg-white p-6 rounded-lg shadow-md">
          <ul>
            <li class="py-3 border-b border-gray-200">Alert: Suspicious activity detected in Region A.</li>
            <!-- Add more alert items here -->
          </ul>
        </div>
      </section>
    {:else if selectedView === 'activities'}
      <section>
        <h2 class="text-4xl font-bold mb-4">Recent Activities</h2>
        <div class="bg-white p-6 rounded-lg shadow-md">
          <ul>
            <li class="py-3 border-b border-gray-200">Activity: Drug batch 45678 received and inspected.</li>
            <!-- Add more activity items here -->
          </ul>
        </div>
      </section>
    {:else if selectedView === 'settings'}
      <section>
        <h2 class="text-4xl font-bold mb-4">Settings</h2>
        <div class="bg-white p-6 rounded-lg shadow-md">
          <form>
            <div class="mb-4">
              <label for="email" class="block text-lg font-semibold mb-2">Email Notifications</label>
              <input type="email" id="email" class="p-2 border border-gray-300 rounded-lg w-full" placeholder="Your email for notifications">
            </div>
            <div class="mb-4">
              <label for="theme" class="block text-lg font-semibold mb-2">Theme</label>
              <select id="theme" class="p-2 border border-gray-300 rounded-lg w-full">
                <option value="light">Light</option>
                <option value="dark">Dark</option>
              </select>
            </div>
            <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded-lg">Save Changes</button>
          </form>
        </div>
      </section>
    {/if}
  </main>
</div>

<style>
 
</style>
