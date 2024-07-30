<script>
    let inventory = [];
    
    function addDrug(name, quantity, price) {
      inventory = [...inventory, { name, quantity, price }];
    }
  </script>
  
  <div class="p-4">
    <h1 class="text-2xl font-bold mb-4">Inventory Manager</h1>
    
    <div class="mb-4">
      <h2 class="text-xl font-semibold">Add New Drug</h2>
      <!-- Form to add new drugs -->
      <form on:submit|preventDefault={() => addDrug('Drug A', 100, 20)}>
        <input type="text" placeholder="Drug Name" class="border p-2 mb-2 w-full" />
        <input type="number" placeholder="Quantity" class="border p-2 mb-2 w-full" />
        <input type="number" placeholder="Price" class="border p-2 mb-2 w-full" />
        <button type="submit" class="bg-blue-500 text-white p-2 rounded">Add Drug</button>
      </form>
    </div>
    
    <div>
      <h2 class="text-xl font-semibold">Inventory List</h2>
      <ul>
        {#each inventory as item}
          <li class="mb-2">
            <span class="font-medium">{item.name}:</span> {item.quantity} units at ${item.price}
          </li>
        {/each}
      </ul>
    </div>
  </div>
  