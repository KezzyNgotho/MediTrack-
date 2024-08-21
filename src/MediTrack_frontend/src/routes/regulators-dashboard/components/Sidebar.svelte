<script>
  import { createEventDispatcher } from 'svelte';
  import '../styles/Dashboard.scss';
  import { goto } from '$app/navigation'; // For programmatic navigation
  
  const dispatch = createEventDispatcher();

  function handleLinkClick(view) {
    dispatch('linkClick', view);
  }

  // Font Awesome Icons
  import { faHome, faFileAlt, faBell, faHistory, faCog, faSignOutAlt } from '@fortawesome/free-solid-svg-icons';
  import { FontAwesomeIcon } from '@fortawesome/svelte-fontawesome';

function logout() {
  // Clear session data (e.g., from local storage or authentication state)
  localStorage.removeItem('user'); // Example: removing the user session
  goto('home'); // Redirect to the login page after logout
}
</script>

<aside class="sidebar">
  <div class="sidebar-header">
    <h2>MediTrack+</h2>
  </div>
  <nav class="sidebar-nav">
    <ul class="nav-list">
      <li>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <!-- svelte-ignore a11y-no-static-element-interactions -->
        <!-- svelte-ignore a11y-missing-attribute -->
        <a class="nav-item" on:click={() => handleLinkClick('dashboard')}>
          <FontAwesomeIcon icon={faHome} class="icon" />
          <span>Dashboard</span>
        </a>
      </li>
      <li>
        <!-- svelte-ignore a11y-no-static-element-interactions -->
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <!-- svelte-ignore a11y-missing-attribute -->
        <a  class="nav-item" on:click={() => handleLinkClick('reports')}>
          <FontAwesomeIcon icon={faFileAlt} class="icon" />
          <span>Reports</span>
        </a>
      </li>
      <li>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <!-- svelte-ignore a11y-missing-attribute -->
        <!-- svelte-ignore a11y-no-static-element-interactions -->
        <a  class="nav-item" on:click={() => handleLinkClick('alerts')}>
          <FontAwesomeIcon icon={faBell} class="icon" />
          <span>Alerts</span>
        </a>
      </li>
      <li>
        <!-- svelte-ignore a11y-missing-attribute -->
        <!-- svelte-ignore a11y-no-static-element-interactions -->
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <a class="nav-item" on:click={() => handleLinkClick('activities')}>
          <FontAwesomeIcon icon={faHistory} class="icon" />
          <span>Recent Activities</span>
        </a>
      </li>
      
    </ul>
  </nav>
  <div class="sidebar-footer">
    <button on:click={logout} class="nav-item flex items-center text-gray-600 hover:text-black">
      <FontAwesomeIcon icon={faSignOutAlt} class="icon mr-2" />
      <span>Logout</span>
    </button>
  </div>
</aside>
