<script>
  import { createEventDispatcher } from 'svelte';
  import { FontAwesomeIcon } from '@fortawesome/svelte-fontawesome';
  import { faHome, faChartBar, faTools, faFileAlt, faCogs, faUser, faSignOutAlt } from '@fortawesome/free-solid-svg-icons';
import './Dashboard.scss'
  const dispatch = createEventDispatcher();

  function navigate(view) {
    dispatch('linkClick', view);
  }
</script>

<aside class="sidebar">
  <div class="sidebar-header">
    <h2>MediTrack+</h2>
  </div>
  <nav class="sidebar-nav">
    <ul class="nav-list">
      <li>
        <a href="#" class="nav-item" on:click={() => navigate('home')}>
          <FontAwesomeIcon icon={faHome} class="icon" />
          <span>Home</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item" on:click={() => navigate('analytics')}>
          <FontAwesomeIcon icon={faChartBar} class="icon" />
          <span>Analytics</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item" on:click={() => navigate('tools')}>
          <FontAwesomeIcon icon={faTools} class="icon" />
          <span>Tools</span>
        </a>
      </li>
      <li>
        <a href="#" class="nav-item" on:click={() => navigate('reports')}>
          <FontAwesomeIcon icon={faFileAlt} class="icon" />
          <span>Reports</span>
        </a>
      </li>
      
      <!-- Add more items relevant to government agencies -->
    </ul>
  </nav>
  <div class="sidebar-footer">
    <a href="#" class="nav-item">
      <FontAwesomeIcon icon={faUser} class="icon" />
      <span>Profile</span>
    </a>
    <a href="/logout" class="nav-item">
      <FontAwesomeIcon icon={faSignOutAlt} class="icon" />
      <span>Logout</span>
    </a>
  </div>
</aside>

<style>
  
</style>
