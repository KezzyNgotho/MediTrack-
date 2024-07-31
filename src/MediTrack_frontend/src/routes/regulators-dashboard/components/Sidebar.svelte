<script>
  import { createEventDispatcher } from 'svelte';

  const dispatch = createEventDispatcher();

  function handleLinkClick(view) {
    dispatch('linkClick', view);
  }
</script>

<aside class="bg-gray-800 text-white w-64 min-h-screen">
  <div class="flex flex-col h-full">
    <div class="p-6 bg-gray-900">
      <h2 class="text-2xl font-bold">MediTrack+</h2>
    </div>
    <nav class="flex-1 overflow-y-auto">
      <ul class="p-6 space-y-2">
        <li>
          <a href="#" class="block py-2 px-4 rounded-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-600" on:click={() => handleLinkClick('dashboard')}>Dashboard</a>
        </li>
        <li>
          <a href="#" class="block py-2 px-4 rounded-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-600" on:click={() => handleLinkClick('reports')}>Reports</a>
        </li>
        <li>
          <a href="#" class="block py-2 px-4 rounded-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-600" on:click={() => handleLinkClick('alerts')}>Alerts</a>
        </li>
        <li>
          <a href="#" class="block py-2 px-4 rounded-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-600" on:click={() => handleLinkClick('activities')}>Recent Activities</a>
        </li>
        <li>
          <a href="#" class="block py-2 px-4 rounded-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-600" on:click={() => handleLinkClick('settings')}>Settings</a>
        </li>
      </ul>
    </nav>
    <div class="p-6 bg-gray-900">
      <a href="/logout" class="block py-2 px-4 rounded-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-600">Logout</a>
    </div>
  </div>
</aside>

<style>
  a {
    transition: background-color 0.2s ease;
  }
</style>
