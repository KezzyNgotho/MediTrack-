<script>
    import { createEventDispatcher } from 'svelte';
    import { FontAwesomeIcon } from '@fortawesome/svelte-fontawesome';
    import { faIndustry, faBoxes, faCheckCircle, faTruck, faReceipt, faChartBar, faTools, faDollarSign, faCog, faSignOutAlt } from '@fortawesome/free-solid-svg-icons';
    import './dashboard.scss';
  
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
          <a href="#" class="nav-item" on:click={() => navigate('production')}>
            <FontAwesomeIcon icon={faIndustry} class="icon" />
            <span>Production Overview</span>
          </a>
        </li>
        <li>
          <a href="#" class="nav-item" on:click={() => navigate('inventory')}>
            <FontAwesomeIcon icon={faBoxes} class="icon" />
            <span>Inventory Management</span>
          </a>
        </li>
        <li>
          <a href="#" class="nav-item" on:click={() => navigate('quality')}>
            <FontAwesomeIcon icon={faCheckCircle} class="icon" />
            <span>Quality Control</span>
          </a>
        </li>
        <li>
          <a href="#" class="nav-item" on:click={() => navigate('supply-chain')}>
            <FontAwesomeIcon icon={faTruck} class="icon" />
            <span>Supply Chain</span>
          </a>
        </li>
        <li>
          <a href="#" class="nav-item" on:click={() => navigate('orders')}>
            <FontAwesomeIcon icon={faReceipt} class="icon" />
            <span>Order Management</span>
          </a>
        </li>
        <li>
          <a href="#" class="nav-item" on:click={() => navigate('reports')}>
            <FontAwesomeIcon icon={faChartBar} class="icon" />
            <span>Reports</span>
          </a>
        </li>
        <li>
          <a href="#" class="nav-item" on:click={() => navigate('maintenance')}>
            <FontAwesomeIcon icon={faTools} class="icon" />
            <span>Maintenance</span>
          </a>
        </li>
        <li>
          <a href="#" class="nav-item" on:click={() => navigate('financials')}>
            <FontAwesomeIcon icon={faDollarSign} class="icon" />
            <span>Financial Insights</span>
          </a>
        </li>
       
      </ul>
    </nav>
    <div class="sidebar-footer">
      <a href="/logout" class="nav-item">
        <FontAwesomeIcon icon={faSignOutAlt} class="icon" />
        <span>Logout</span>
      </a>
    </div>
  </aside>
  