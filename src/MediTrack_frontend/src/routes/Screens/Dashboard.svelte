<script>
    let trends = [];
    let alerts = [];
    
    // Mock data
    trends = [{ name: "Drug Distribution", value: 70 }, { name: "Corruption Cases", value: 30 }];
    alerts = ["Suspicious activity detected in Region X"];
  </script>
  
  <div class="p-4">
    <h1 class="text-2xl font-bold mb-4">Dashboard</h1>
    
    <div class="mb-6">
      <h2 class="text-xl font-semibold">Trends</h2>
      <!-- Example trend visualization -->
      <ul>
        {#each trends as trend}
          <li class="mb-2">
            <span class="font-medium">{trend.name}:</span> {trend.value}%
          </li>
        {/each}
      </ul>
    </div>
    
    <div>
      <h2 class="text-xl font-semibold">Alerts</h2>
      <ul>
        {#each alerts as alert}
          <li class="mb-2 text-red-600">{alert}</li>
        {/each}
      </ul>
    </div>
  </div>
  