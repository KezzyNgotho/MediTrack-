<script>
  import { createEventDispatcher } from 'svelte';
  import { FontAwesomeIcon } from '@fortawesome/svelte-fontawesome';
  import { faHome, faUserInjured, faCalendarAlt, faFileMedical, faComments, faSignOutAlt, faShieldAlt, faWallet } from '@fortawesome/free-solid-svg-icons';
  import '../government-agencies-dashboard/Dashboard.scss';
  const dispatch = createEventDispatcher();

  function navigate(view) {
    dispatch('linkClick', view);
  }
</script>

<aside class="sidebar bg-gray-100 p-4 shadow-lg">
  <div class="sidebar-header mb-6">
    <h2 class="text-2xl font-bold text-gray-800">MediTrack+</h2>
  </div>
  <nav class="sidebar-nav flex-1">
    <ul class="nav-list space-y-2">
      <li>
        <a href="#" class="nav-item flex items-center p-3 rounded-lg hover:bg-gray-200 transition-colors" on:click={() => navigate('dependants')}>
          <FontAwesomeIcon icon={faUserInjured} class="icon w-6 h-6 text-gray-600" />
          <span class="ml-3 text-gray-700">Dependants</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item flex items-center p-3 rounded-lg hover:bg-gray-200 transition-colors" on:click={() => navigate('appointments')}>
          <FontAwesomeIcon icon={faCalendarAlt} class="icon w-6 h-6 text-gray-600" />
          <span class="ml-3 text-gray-700">Appointments</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item flex items-center p-3 rounded-lg hover:bg-gray-200 transition-colors" on:click={() => navigate('records')}>
          <FontAwesomeIcon icon={faFileMedical} class="icon w-6 h-6 text-gray-600" />
          <span class="ml-3 text-gray-700">Medical Records</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item flex items-center p-3 rounded-lg hover:bg-gray-200 transition-colors" on:click={() => navigate('insurance')}>
          <FontAwesomeIcon icon={faShieldAlt} class="icon w-6 h-6 text-gray-600" />
          <span class="ml-3 text-gray-700">Insurance</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item flex items-center p-3 rounded-lg hover:bg-gray-200 transition-colors" on:click={() => navigate('wallet')}>
          <FontAwesomeIcon icon={faWallet} class="icon w-6 h-6 text-gray-600" />
          <span class="ml-3 text-gray-700">Wallet</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item flex items-center p-3 rounded-lg hover:bg-gray-200 transition-colors" on:click={() => navigate('communication')}>
          <FontAwesomeIcon icon={faComments} class="icon w-6 h-6 text-gray-600" />
          <span class="ml-3 text-gray-700">Communication</span>
        </a>
      </li>
    </ul>
  </nav>
  <div class="sidebar-footer mt-6">
    <a href="#" class="nav-item flex items-center p-3 rounded-lg hover:bg-gray-200 transition-colors">
      <FontAwesomeIcon icon={faSignOutAlt} class="icon w-6 h-6 text-gray-600" />
      <span class="ml-3 text-gray-700">Logout</span>
    </a>
  </div>
</aside>
