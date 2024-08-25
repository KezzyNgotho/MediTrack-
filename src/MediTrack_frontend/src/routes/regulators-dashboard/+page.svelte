<script>
  import Sidebar from './components/Sidebar.svelte';
  import { Bar, Line, Pie } from 'svelte-chartjs';
  import { Chart, registerables } from 'chart.js';
  import './styles/Dashboard.scss';
  import image from './../../../static/icons8-human-100.png';
  import { onMount } from 'svelte';

  Chart.register(...registerables);

  let selectedCategory = ""; // Declare the selectedCategory variable
  let categories = ["Category 1", "Category 2", "Category 3"]; // Example categories
  export let view;

  
  import { writable } from 'svelte/store';

let orders = [];
let categorizedOrders = {};
let filteredOrders = writable([]);
let loading = true;
let error = null;
let searchQuery = "";
let selectedOrder = null;

// Function to categorize orders based on their location
function categorizeOrders() {
  categorizedOrders = orders.reduce((categories, order) => {
    if (!categories[order.location]) {
      categories[order.location] = [];
    }
    categories[order.location].push(order);
    return categories;
  }, {});
}

// Filter orders based on search query
function filterOrders(query) {
  if (!query) {
    filteredOrders.set(orders);
  } else {
    const lowerQuery = query.toLowerCase();
    filteredOrders.set(
      orders.filter(
        (order) =>
          order.id.toLowerCase().includes(lowerQuery) ||
          order.pharmacy.toLowerCase().includes(lowerQuery) ||
          order.location.toLowerCase().includes(lowerQuery)
      )
    );
  }
}

// Simulated fetch function (replace with actual API call)
async function fetchOrders() {
  try {
    await new Promise((resolve) => setTimeout(resolve, 1000)); // Simulate loading
    orders = [
      {
        id: '1234',
        pharmacy: 'Pharmacy A',
        status: 'In Transit',
        location: 'New York',
        date: '2024-08-15',
        details: 'Order for prescription drugs.',
      },
      {
        id: '5678',
        pharmacy: 'Pharmacy B',
        status: 'Pending',
        location: 'California',
        date: '2024-08-10',
        details: 'Order for over-the-counter medication.',
      },
      {
        id: '9101',
        pharmacy: 'Pharmacy C',
        status: 'Delivered',
        location: 'New York',
        date: '2024-08-08',
        details: 'Order for medical equipment.',
      },
      {
        id: '1121',
        pharmacy: 'Pharmacy D',
        status: 'Cancelled',
        location: 'Texas',
        date: '2024-08-07',
        details: 'Order for various pharmaceutical supplies.',
      },
    ];
    categorizeOrders();
    filteredOrders.set(orders);
  } catch (err) {
    error = 'Failed to fetch orders';
  } finally {
    loading = false;
  }
}

// Fetch orders on component mount
onMount(() => {
  fetchOrders();
});





















// Function to open the modal
function openModal() {
  showModal = true;
}

// Function to close the modal
function closeModal() {
  showModal = false;
}
  let editingIndex = null;
  let isEditing = false;

  function addItem() {
    if (newItem.name && newItem.quantity >= 0) {
      newItem.status = getStatus(newItem.quantity);
      inventoryItems.push({ ...newItem });
      resetNewItem();
    }
  }

  function editItem(index) {
    editingIndex = index;
    newItem = { ...inventoryItems[index] };
    isEditing = true;
  }

/*   function saveProduct() {
    if (editingIndex !== null) {
      inventoryItems[editingIndex] = { ...newItem, status: getStatus(newItem.quantity) };
      resetNewItem();
      isEditing = false;
      editingIndex = null;
    }
  } */

  function deleteItem(index) {
    inventoryItems.splice(index, 1);
  }

  function getStatus(quantity) {
    if (quantity === 0) return 'Out of Stock';
    if (quantity <= 10) return 'Low Stock';
    return 'In Stock';
  }

  function resetNewItem() {
    newItem = {
      name: '',
      quantity: 0,
      status: 'In Stock',
      price: { min: 0, max: 0 },
      description: '',
      dates: {
        manufacture: '',
       // expiry: ''
      }
    };
  }

  function filterItems() {
    if (!searchQuery) return inventoryItems;
    return inventoryItems.filter(item =>
      item.name.toLowerCase().includes(searchQuery.toLowerCase())
    );
  }
  let selectedView = 'dashboard';
  let isProfileMenuOpen = false;

  function changeView(event) {
    selectedView = event.detail;
  }

  function toggleProfileMenu() {
    isProfileMenuOpen = !isProfileMenuOpen;
  }

  // Demo data for visualizations
  const barData = {
    labels: ['Region A', 'Region B', 'Region C', 'Region D'],
    datasets: [{
      label: 'Distributed Drugs',
      backgroundColor: '#4c51bf',
      borderColor: '#4c51bf',
      data: [500, 1000, 750, 1250]
    }]
  };

  const lineData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [{
      label: 'Corruption Cases Over Time',
      backgroundColor: '#f56565',
      borderColor: '#f56565',
      data: [3, 5, 2, 8, 6, 4, 7]
    }]
  };

  const pieData = {
    labels: ['Suspicious', 'Normal', 'Under Investigation'],
    datasets: [{
      label: 'Alert Types',
      backgroundColor: ['#48bb78', '#4299e1', '#ed8936'],
      data: [30, 50, 20]
    }]
  };

  // Sample reports data
  const reports = [
    { id: '12345', date: '2024-07-31', details: 'Report details go here', status: 'Pending' },
    { id: '12346', date: '2024-07-30', details: 'Report details go here', status: 'Reviewed' },
    { id: '12347', date: '2024-07-29', details: 'Report details go here', status: 'Resolved' },
  ];

  // Inventory data
  /* const inventoryItems = [
    { name: 'Drug A', quantity: 150, status: 'Available' },
    { name: 'Drug B', quantity: 75, status: 'Running Low' },
    { name: 'Drug C', quantity: 0, status: 'Out of Stock' },
  ]; */



 // Import necessary modules
import { HttpAgent, Actor } from '@dfinity/agent';
import { idlFactory as MeditrackIDL } from '../../declarations/MediTrack_backend'; // Use the IDL factory



let newProduct = writable({
    name: '',
    category: '',
    quantity: '',
    price: { min: '', max: '' },
    description: '',
    expiryDate: ''
  });

  let showModal = writable(false);
  let errorMessage = writable('');
  let products = writable([]);
  let inventoryItems = []; // Initialize inventoryItems array
  let meditrackBackend;

  // Initialize the backend
  async function initializeBackend() {
    try {
      const agent = new HttpAgent();
      if (process.env.NODE_ENV !== 'production') {
        await agent.fetchRootKey();
      }

      meditrackBackend = Actor.createActor(MeditrackIDL, {
        agent,
        canisterId: 'bkyz2-fmaaa-aaaaa-qaaaq-cai'
      });
    } catch (error) {
      console.error('Error initializing backend:', error);
      errorMessage.set('Error initializing backend: ' + error.message);
    }
  }

  // Function to toggle the modal's visibility
  function toggleModal() {
    showModal.update(v => !v);
  }

  // Function to save product to backend
  async function saveProductToBackend(product) {
    try {
      if (!meditrackBackend) {
        throw new Error('Backend not initialized');
      }

      await meditrackBackend.addProduct(
        product.name,
        product.description,
        product.category,
        product.quantity,
        product.price.min,
        product.price.max,
        product.expiryDate
      );
      console.log('Product saved successfully');
    } catch (error) {
      console.error('Error saving product:', error);
      errorMessage.set(`Error saving product: ${error.message}. Full error: ${JSON.stringify(error)}`);
    }
  }

  // Save Product function
  async function saveProduct() {
    let productData;
    newProduct.subscribe(value => productData = value)();

    if (!productData || !productData.price) {
      console.error('Invalid product data');
      errorMessage.set('Invalid product data');
      return;
    }

    const product = {
      name: productData.name || '',
      category: productData.category || '',
      quantity: parseInt(productData.quantity, 10) || 0,
      price: {
        min: parseInt(productData.price.min, 10) || 0,
        max: parseInt(productData.price.max, 10) || 0
      },
      description: productData.description || '',
      expiryDate: productData.expiryDate || ''
    };

    try {
      await saveProductToBackend(product);
      newProduct.set({
        name: '',
        category: '',
        quantity: '',
        price: { min: '', max: '' },
        description: '',
        expiryDate: ''
      });
      showModal.set(false);
    } catch (error) {
      console.error('Failed to save product:', error);
      errorMessage.set('Error saving product: ' + error.message);
    }
  }

  // Fetch products from the backend
  async function fetchProducts() {
    try {
      if (!meditrackBackend) {
        throw new Error('Backend not initialized');
      }

      const productList = await meditrackBackend.getAllProducts();
      products.set(productList);
      inventoryItems = productList; // Set inventoryItems to fetched products
      console.log(productList);
    } catch (error) {
      console.error('Error fetching products:', error);
      errorMessage.set('Error fetching products: ' + error.message);
    }
  }

  onMount(async () => {
    await initializeBackend();
    await fetchProducts();  // Fetch products after backend initialization
  });
// Array to keep track of hidden products
let hiddenProducts = [];

// Function to hide a product
function hideProduct(index) {
  let product = products.splice(index, 1)[0];
  product.hidden = true;
  hiddenProducts.push(product);
}

// Function to unhide a product
function unhideProduct(index) {
  let product = hiddenProducts.splice(index, 1)[0];
  product.hidden = false;
  products.push(product);
}

// Function to filter items, excluding hidden ones



</script>
{#if $errorMessage}
  <div class="error-message">{$errorMessage}</div>
{/if}
<div class="flex min-h-screen bg-white">
  <Sidebar on:linkClick={changeView} />

  <main class="flex-1 p-6 bg-[#FFF]">
    <header class="flex items-center justify-between mb-6">
      <h2 class="text-2xl mb-4">Distributors</h2>
      <div class="relative">
        <button class="flex items-center space-x-2" on:click={toggleProfileMenu}>
          <img src={image} alt="User Avatar" class="w-10 h-10 rounded-full border border-gray-300" />
          <span class="font-semibold">John Doe</span>
        </button>
        {#if isProfileMenuOpen}
          <div class="absolute right-0 mt-2 bg-white border border-gray-300 rounded-lg shadow-lg w-48">
            <ul class="py-2">
              <li><a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">View Profile</a></li>
              <li><a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Edit Profile</a></li>
              <li><a href="/logout" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Logout</a></li>
            </ul>
          </div>
        {/if}
      </div>
    </header>

    <!-- Dashboard Content -->
    {#if selectedView === 'dashboard'}
      <section>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div class="p-6 bg-white rounded-lg shadow-md">
            <h3 class="text-xl font-semibold mb-2">Drug Distribution Overview</h3>
            <Bar data={barData} />
          </div>
          <div class="p-6 bg-white rounded-lg shadow-md">
            <h3 class="text-xl font-semibold mb-2">Corruption Cases Over Time</h3>
            <Line data={lineData} />
          </div>
          <div class="p-6 bg-white rounded-lg shadow-md">
            <h3 class="text-xl font-semibold mb-2">Alert Types</h3>
            <Pie data={pieData} />
          </div>
        </div>
      </section>

    <!-- Reports Section -->
    {:else if selectedView === 'reports'}
    <section class="p-8 bg-white shadow-lg rounded-lg">
      <h1 class="text-3xl font-bold mb-6 text-gray-800">Reports</h1>
      <p class="text-lg text-gray-600 mb-8">
        View, generate, and export detailed reports about inventory, sales, supply chain, and more.
      </p>
    
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- Monthly Sales Report -->
        <div class="report-item bg-blue-50 p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">Monthly Sales Report</h3>
          <p class="text-gray-600 mb-4">
            Overview of sales performance for the current month, with a breakdown of revenue.
          </p>
          <div class="flex justify-between">
            <button class="btn-generate bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Generate</button>
            <button class="btn-export bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Export to PDF</button>
          </div>
        </div>
    
        <!-- Inventory Report -->
        <div class="report-item bg-green-50 p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">Inventory Report</h3>
          <p class="text-gray-600 mb-4">
            Detailed analysis of stock levels, shortages, and reorder requirements.
          </p>
          <div class="flex justify-between">
            <button class="btn-generate bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Generate</button>
            <button class="btn-export bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Export to CSV</button>
          </div>
        </div>
    
        <!-- Supply Chain Report -->
        <div class="report-item bg-yellow-50 p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">Supply Chain Report</h3>
          <p class="text-gray-600 mb-4">
            Analyze supply chain performance, including lead times and order statuses.
          </p>
          <div class="flex justify-between">
            <button class="btn-generate bg-yellow-600 text-white px-4 py-2 rounded hover:bg-yellow-700">Generate</button>
            <button class="btn-export bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Export to Excel</button>
          </div>
        </div>
    
        <!-- Procurement Report -->
        <div class="report-item bg-purple-50 p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">Procurement Report</h3>
          <p class="text-gray-600 mb-4">
            Overview of procurement orders, vendor performance, and total costs.
          </p>
          <div class="flex justify-between">
            <button class="btn-generate bg-purple-600 text-white px-4 py-2 rounded hover:bg-purple-700">Generate</button>
            <button class="btn-export bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Export to PDF</button>
          </div>
        </div>
    
        <!-- Financial Report -->
        <div class="report-item bg-red-50 p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">Financial Report</h3>
          <p class="text-gray-600 mb-4">
            Comprehensive financial overview, including revenue, expenses, and profits.
          </p>
          <div class="flex justify-between">
            <button class="btn-generate bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">Generate</button>
            <button class="btn-export bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Export to PDF</button>
          </div>
        </div>
    
        <!-- Employee Performance Report -->
        <div class="report-item bg-teal-50 p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">Employee Performance Report</h3>
          <p class="text-gray-600 mb-4">
            Evaluation of staff performance metrics and key deliverables.
          </p>
          <div class="flex justify-between">
            <button class="btn-generate bg-teal-600 text-white px-4 py-2 rounded hover:bg-teal-700">Generate</button>
            <button class="btn-export bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Export to Excel</button>
          </div>
        </div>
    
        <!-- Custom Report -->
        <div class="report-item bg-pink-50 p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">Custom Report</h3>
          <p class="text-gray-600 mb-4">
            Build a custom report based on your selected filters and data points.
          </p>
          <div class="flex justify-between">
            <button class="btn-generate bg-pink-600 text-white px-4 py-2 rounded hover:bg-pink-700">Generate</button>
            <button class="btn-export bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Export to CSV</button>
          </div>
        </div>
      </div>
    </section>
    
    {:else if selectedView === 'inventory'}
    <section class="max-w-7xl mx-auto p-8 bg-white rounded-lg shadow-lg">
      <h1 class="text-3xl font-bold text-gray-800 mb-6">Inventory Management</h1>
      <p class="text-lg text-gray-600 mb-8">Manage and track your inventory, add new items, and keep everything organized.</p>
    
      <!-- Search and Category Filter -->
      <div class="mb-6 flex items-center space-x-4">
        <input
          type="text"
          placeholder="Search by item name"
          bind:value={searchQuery}
          class="w-full p-3 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <select
          bind:value={selectedCategory}
          class="p-3 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">All Categories</option>
          <option value="electronics">Electronics</option>
          <option value="apparel">Apparel</option>
          <option value="healthcare">Healthcare</option>
          <!-- Add more categories here -->
        </select>
        <button
          on:click={toggleModal}
          class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700"
        >
          Add New Product
        </button>
      </div>
    
      <!-- Product Table -->
      <div class="inventory-table overflow-x-auto">
        <table class="min-w-full table-auto border-collapse">
          <thead class="bg-gray-100 border-b-2 border-gray-200">
            <tr>
              <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Product Name</th>
              <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Category</th>
              <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Quantity</th>
              <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Price Range</th>
              <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Actions</th>
            </tr>
          </thead>
          <tbody>
            {#each filterItems() as product, index}
              <tr class="border-t border-gray-200 hover:bg-gray-50">
                <td class="px-6 py-4 text-gray-900">{product.name}</td>
                <td class="px-6 py-4 text-gray-900">{product.category}</td>
                <td class="px-6 py-4 text-gray-900">{product.quantity}</td>
                <td class="px-6 py-4 text-gray-900">${product.price.min} - ${product.price.max}</td>
                <td class="px-6 py-4 flex space-x-4">
                  <button on:click={() => editProduct(index)} class="text-blue-600 hover:text-blue-800">Edit</button>
                  <button on:click={() => deleteProduct(index)} class="text-red-600 hover:text-red-800">Delete</button>
                </td>
              </tr>
            {:else}
              <tr>
                <td colspan="5" class="text-center py-6 text-gray-500">No products match your search.</td>
              </tr>
            {/each}
          </tbody>
        </table>
      </div>
    
      <!-- Add Product Modal -->
      {#if $showModal}
      <div class="fixed inset-0 bg-gray-800 bg-opacity-75 flex items-center justify-center z-50">
        <div class="bg-white rounded-lg overflow-hidden shadow-lg max-w-lg w-full p-6">
          <h2 class="text-2xl font-bold mb-4">Add New Product</h2>
          <div class="space-y-4">
            <input
              type="text"
              placeholder="Product Name"
              bind:value={$newProduct.name}
              class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <select
              bind:value={$newProduct.category}
              class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="" disabled>Select Category</option>
              <option value="electronics">Electronics</option>
              <option value="apparel">Apparel</option>
              <option value="healthcare">Healthcare</option>
              <!-- Add more categories here -->
            </select>
            <input
              type="number"
              placeholder="Quantity"
              bind:value={$newProduct.quantity}
              min="0"
              class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <input
              type="number"
              placeholder="Min Price"
              bind:value={$newProduct.price.min}
              min="0"
              class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <input
              type="number"
              placeholder="Max Price"
              bind:value={$newProduct.price.max}
              min="0"
              class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <textarea
              placeholder="Description"
              bind:value={$newProduct.description}
              class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            ></textarea>
            <label>
              Expiry Date:
              <input type="date" bind:value={$newProduct.expiryDate} class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </label>
          </div>
          <div class="mt-6 flex justify-end space-x-4">
            <button on:click={saveProduct} class="bg-green-600 text-white px-4 py-2 rounded-md hover:bg-green-700">Save</button>
            <button on:click={toggleModal} class="bg-gray-600 text-white px-4 py-2 rounded-md hover:bg-gray-700">Cancel</button>
          </div>
        </div>
      </div>
    {/if}
    </section>
    
    <!-- Recent Activities Section -->
    {:else if selectedView === 'activities'}
      <section>
        <h2 class="text-4xl font-bold mb-4">Recent Activities</h2>
        <div class="bg-white p-6 rounded-lg shadow-md">
          <ul>
            <li class="py-3 border-b border-gray-200">Activity: Drug batch 45678 received and inspected.</li>
            <!-- Add more activity items here -->
          </ul>
        </div>
      </section>
    
    <!-- Inventory Section -->
    {:else if selectedView === 'inventory'}
      <section>
        <h2 class="text-2xl font-semibold mb-4">Inventory Management</h2>
        <h1>Inventory Management</h1>
        <p>Manage and track your inventory, add new items, and keep everything organized.</p>
        <div class="inventory-table">
          <!-- Example inventory table -->
          <table class="min-w-full table-auto border-collapse">
            <thead class="bg-gray-100 border-b-2 border-gray-200">
              <tr>
                <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Item Name</th>
                <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Quantity</th>
                <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Status</th>
              </tr>
            </thead>
            <tbody>
              <tr class="border-t border-gray-200">
                <td class="px-6 py-4 text-gray-900">Product A</td>
                <td class="px-6 py-4 text-gray-900">50</td>
                <td class="px-6 py-4 text-gray-900">In Stock</td>
              </tr>
              <tr class="border-t border-gray-200">
                <td class="px-6 py-4 text-gray-900">Product B</td>
                <td class="px-6 py-4 text-gray-900">10</td>
                <td class="px-6 py-4 text-gray-900">Low Stock</td>
              </tr>
              <!-- Add more items -->
            </tbody>
          </table>
        </div>
      </section>
       
    {:else if selectedView === 'supply-chain'}

    <section>
     
        <h1 class="text-3xl font-bold text-gray-800 mb-6">Supply Chain</h1>
        <p class="text-lg text-gray-600 mb-8">Monitor your supply chain process, track orders by pharmacies, and categorize them by location.</p>
      
        <!-- Search Bar -->
        <div class="mb-6">
          <input
            type="text"
            placeholder="Search by Order ID, Pharmacy, or Location"
            bind:value={searchQuery}
            on:input={() => filterOrders(searchQuery)}
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
      
        {#if loading}
          <div class="text-center text-gray-500">Loading orders...</div>
        {:else if error}
          <div class="text-center text-red-500">{error}</div>
        {:else}
          <!-- Display filtered orders -->
          {#each Object.keys(categorizedOrders) as location}
            <div class="mb-12">
              <h2 class="text-2xl font-semibold text-gray-800 mb-4">{location}</h2>
              <div class="orders-table overflow-x-auto">
                <table class="min-w-full table-auto border-collapse">
                  <thead class="bg-gray-100 border-b-2 border-gray-200">
                    <tr>
                      <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Order ID</th>
                      <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Pharmacy</th>
                      <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Date</th>
                      <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Status</th>
                      <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Details</th>
                      <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    {#each $filteredOrders as order}
                      <tr class="border-t border-gray-200 hover:bg-gray-50">
                        <td class="px-6 py-4 text-gray-900">{order.id}</td>
                        <td class="px-6 py-4 text-gray-900">{order.pharmacy}</td>
                        <td class="px-6 py-4 text-gray-900">{order.date}</td>
                        <td class="px-6 py-4">
                          <span
                            class="inline-block px-2 py-1 text-xs font-semibold text-white rounded-full"
                            class:order-status={order.status === 'In Transit' ? 'bg-yellow-500' : order.status === 'Delivered' ? 'bg-green-500' : order.status === 'Cancelled' ? 'bg-red-500' : 'bg-gray-500'}
                          >
                            {order.status}
                          </span>
                        </td>
                        <td class="px-6 py-4 text-gray-900">{order.details}</td>
                        <td class="px-6 py-4">
                          <button
                            class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-1 px-3 rounded"
                            on:click={() => selectedOrder = order}
                          >
                            View
                          </button>
                        </td>
                      </tr>
                    {/each}
                  </tbody>
                </table>
              </div>
            </div>
          {/each}
        {/if}
      
      
      <!-- Order Details Modal -->
      {#if selectedOrder}
        <div class="fixed inset-0 bg-gray-800 bg-opacity-75 flex justify-center items-center z-50">
          <div class="bg-white p-8 rounded-lg shadow-lg max-w-md w-full relative">
            <h2 class="text-2xl font-bold text-gray-800 mb-4">Order Details</h2>
            <p><strong>Order ID:</strong> {selectedOrder.id}</p>
            <p><strong>Pharmacy:</strong> {selectedOrder.pharmacy}</p>
            <p><strong>Date:</strong> {selectedOrder.date}</p>
            <p><strong>Status:</strong> {selectedOrder.status}</p>
            <p><strong>Location:</strong> {selectedOrder.location}</p>
            <p><strong>Details:</strong> {selectedOrder.details}</p>
            <button
              class="absolute top-4 right-4 bg-red-500 hover:bg-red-600 text-white font-bold py-1 px-3 rounded"
              on:click={() => selectedOrder = null}
            >
              Close
            </button>
          </div>
       </div>
      {/if} 




      
      </section>
    {/if}
  </main>
</div>

<style>
  /* Add custom styles here if needed */
</style>