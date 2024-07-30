<script>
    let drugCode = '';
    let verificationResult = '';
  
    async function verifyDrug() {
      // Simulate API call to verify drug
      verificationResult = `Drug ${drugCode} is genuine.`;
    }
  </script>
  
  <div class="p-4">
    <h1 class="text-2xl font-bold mb-4">Drug Verifier</h1>
    
    <input 
      type="text" 
      bind:value={drugCode} 
      placeholder="Enter Drug Code" 
      class="border p-2 mb-2 w-full"
    />
    <button 
      on:click={verifyDrug} 
      class="bg-blue-500 text-white p-2 rounded"
    >
      Verify
    </button>
    
    {#if verificationResult}
      <p class="mt-4">{verificationResult}</p>
    {/if}
  </div>
  