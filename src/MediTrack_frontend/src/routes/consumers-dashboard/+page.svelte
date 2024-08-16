<script>
  import Sidebar from './sidebar.svelte';
  import { createEventDispatcher, onMount } from 'svelte';
  import '../government-agencies-dashboard/Dashboard.scss'

  const dispatch = createEventDispatcher();
  let selectedView = 'dependants';

  let dependants = [];
  let selectedDependant = null;

  // Demo data for dependants
  onMount(() => {
    dependants = [
      { id: 1, name: 'Jane Doe', age: 34, relationship: 'Spouse', lastCheckup: '12th August 2024', healthStatus: 'Stable' },
      { id: 2, name: 'John Doe Jr.', age: 10, relationship: 'Son', lastCheckup: '2nd August 2024', healthStatus: 'Good' },
      { id: 3, name: 'Emily Doe', age: 8, relationship: 'Daughter', lastCheckup: '5th July 2024', healthStatus: 'Healthy' }
    ];
  });

  function navigate(view) {
    selectedView = view;
    dispatch('linkClick', view);
  }

  function selectDependant(dependant) {
    selectedDependant = dependant;
  }

  function clearSelection() {
    selectedDependant = null;
  }
</script>

<div class="flex h-screen">
  <!-- Sidebar -->
  <Sidebar on:linkClick={(e) => navigate(e.detail)} />

  <!-- Main Content -->
  <main class="flex-1 p-6 bg-gray-50 overflow-y-auto">
    <!-- Dependants Dashboard -->
    {#if selectedView === 'dependants'}
      <section class="dependants-dashboard">
        <h2 class="text-2xl font-semibold mb-4">Dependants Dashboard</h2>
        <p class="mb-6 text-gray-700">Manage your dependants. Click on a dependant to view and manage their details.</p>

        <!-- Dependants List -->
        <div class="dependants-list grid grid-cols-1 md:grid-cols-3 gap-6">
          {#each dependants as dependant (dependant.id)}
            <div class="dependant-item bg-white p-4 rounded-lg shadow hover:shadow-lg cursor-pointer" on:click={() => selectDependant(dependant)}>
              <h3 class="text-xl font-bold mb-2">{dependant.name}</h3>
              <p class="text-gray-600"><span class="font-bold">Age:</span> {dependant.age} years</p>
              <p class="text-gray-600"><span class="font-bold">Relationship:</span> {dependant.relationship}</p>
              <p class="text-gray-600"><span class="font-bold">Health Status:</span> {dependant.healthStatus}</p>
            </div>
          {/each}
        </div>

        <!-- Selected Dependant Details -->
        {#if selectedDependant}
          <div class="selected-dependant bg-white p-6 rounded-lg shadow-lg mt-6">
            <h3 class="text-2xl font-bold mb-4">Managing: {selectedDependant.name}</h3>
            <ul class="text-gray-700">
              <li class="mb-2"><span class="font-bold">Name:</span> {selectedDependant.name}</li>
              <li class="mb-2"><span class="font-bold">Age:</span> {selectedDependant.age} years</li>
              <li class="mb-2"><span class="font-bold">Relationship:</span> {selectedDependant.relationship}</li>
              <li class="mb-2"><span class="font-bold">Last Health Check:</span> {selectedDependant.lastCheckup}</li>
              <li><span class="font-bold">Health Status:</span> {selectedDependant.healthStatus}</li>
            </ul>
            <div class="mt-4">
              <button class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600 transition">View Full Profile</button>
              <button class="ml-4 bg-green-500 text-white py-2 px-4 rounded-lg hover:bg-green-600 transition">Schedule Appointment</button>
              <button class="ml-4 bg-yellow-500 text-white py-2 px-4 rounded-lg hover:bg-yellow-600 transition">View Health Records</button>
              <button class="ml-4 bg-gray-500 text-white py-2 px-4 rounded-lg hover:bg-gray-600 transition" on:click={clearSelection}>Go Back to List</button>
            </div>
          </div>
        {/if}
      </section>
    {/if}

    <!-- Other Sections -->
    {#if selectedView === 'appointments'}
      <section>
        <h2 class="text-2xl font-semibold mb-4">Appointments Dashboard</h2>
        <p>View and manage your appointments. Schedule new appointments, check upcoming ones, and review past appointments.</p>
      </section>
    {/if}

    {#if selectedView === 'records'}
      <section>
        <h2 class="text-2xl font-semibold mb-4">Medical Records Dashboard</h2>
        <p>Access and manage medical records. Review health history, track medications, and view lab results.</p>
      </section>
    {/if}

    {#if selectedView === 'insurance'}
      <section>
        <h2 class="text-2xl font-semibold mb-4">Insurance Dashboard</h2>
        <p>Manage your insurance details here. View your coverage, update policy information, and access claims.</p>
      </section>
    {/if}

    {#if selectedView === 'wallet'}
      <section>
        <h2 class="text-2xl font-semibold mb-4">Wallet Dashboard</h2>
        <p>Manage your financial transactions related to healthcare. View balances, make payments, and track expenses.</p>
      </section>
    {/if}

    {#if selectedView === 'communication'}
      <section>
        <h2 class="text-2xl font-semibold mb-4">Communication Dashboard</h2>
        <p>Send and receive messages, notifications, and updates related to your healthcare management.</p>
      </section>
    {/if}
  </main>
</div>
