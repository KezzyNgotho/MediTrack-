<script>
    let reportDetails = '';
    let status = '';
  
    async function submitReport() {
      // Simulate API call to submit report
      status = 'Report submitted successfully.';
    }
  </script>
  
  <div class="p-4">
    <h1 class="text-2xl font-bold mb-4">Whistleblower Portal</h1>
    
    <textarea 
      bind:value={reportDetails} 
      placeholder="Describe the corruption" 
      class="border p-2 mb-2 w-full h-40"
    ></textarea>
    <button 
      on:click={submitReport} 
      class="bg-blue-500 text-white p-2 rounded"
    >
      Submit Report
    </button>
    
    {#if status}
      <p class="mt-4">{status}</p>
    {/if}
  </div>
  