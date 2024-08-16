<script>
  import logo from '../assets/logo.png';
  import '../styles/app.scss';
  let menuOpen = false;

  function toggleMenu() {
    menuOpen = !menuOpen;
  }

  async function handleGetStarted() {
    const role = get(selectedRole);
    if (role) {
      showRoleSelectionPopup = false; // Close the popup
      await navigateToDashboard(); // Navigate based on role
    } else {
      alert('Please select your role.');
    }
  }
</script>

<nav class="bg-white p-4">
  <div class="max-w-7xl mx-auto flex justify-between items-center">
    <div class="flex items-center text-black">
      <!-- Replace the src with the path to your logo image -->
      <img src={logo} alt="Logo" class="w-19 h-20 mr-2" />
      <span class="text-lg font-extrabold tracking-wide">MediTrack+</span>
    </div>
    <div class="hidden md:flex items-center space-x-6">
      <a href="/" class="text-black text-bold hover:text-blue-600 flex items-center">
        <span class="mr-2 tracking-tight">Home</span>
        <span class="text-black">•</span>
      </a>
      <a href="#about" class="text-black font-bold hover:text-blue-600 flex items-center">
        <span class="mr-2 tracking-tight">About</span>
        <span class="text-black">•</span>
      </a>
      <a href="#features" class="text-black font-bold hover:text-blue-600 flex items-center">
        <span class="mr-2 tracking-tight">Features</span>
        <span class="text-black">•</span>
      </a>
      <a href="#contact" class="text-black font-bold hover:text-blue-600 flex items-center">
        <span class="mr-2 tracking-tight">Contact</span>
      </a>
    </div>
    <button class="bg-blue-200 text-black font-semibold py-2 px-4 rounded-lg shadow-md hover:bg-pink-200 transition-colors flex items-center space-x-2" on:click={handleGetStarted}>
      <span class="flex items-center space-x-2 font-extrabold">
        <span class="tracking-tight">Get Started</span>
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h14m-7-7l7 7-7 7"></path>
        </svg>
      </span>
    </button>
    <button class="md:hidden text-black font-bold" on:click={toggleMenu}>
      ☰
    </button>
  </div>
  {#if menuOpen}
    <div class="md:hidden mt-4 space-y-2">
      <a href="/" class="block text-black hover:text-blue-600 flex items-center font-extrabold">
        <span class="mr-2 tracking-tight">Home</span>
        <span class="text-black">•</span>
      </a>
      <a href="#about" class="block text-black hover:text-blue-600 flex items-center font-extrabold">
        <span class="mr-2 tracking-tight">About</span>
        <span class="text-black">•</span>
      </a>
      <a href="#features" class="block text-black hover:text-blue-600 flex items-center font-extrabold">
        <span class="mr-2 tracking-tight">Features</span>
        <span class="text-black">•</span>
      </a>
      <a href="#contact" class="block text-black hover:text-blue-600 text-bold text-2xl flex items-center font-extrabold">
        <span class="mr-2 tracking-tight">Contact</span>
      </a>
    </div>
  {/if}
</nav>

<style>
  /* Additional styles for the navbar */
  .navbar-link {
    transition: color 0.3s ease;
  }

  .navbar-link:hover {
    color: hsl(211, 70%, 6%); /* Light blue color for hover effect */
  }

  .navbar-button {
    transition: background-color 0.3s ease;
  }

  .navbar-button:hover {
    background-color: #030e1b; /* Slightly darker blue for hover effect */
  }

  /* Font and styles to make the text bold and sharp */
  nav .font-extrabold {
    font-weight: 800;
  }

  nav a.text-bold {
    font-weight: 700;
  }

  nav span.tracking-tight {
    letter-spacing: -0.015em;
  }

  nav .text-lg {
    font-size: 1.25rem; /* Large font for logo text */
  }

  nav a span {
    font-size: 1rem; /* Standard size for links */
  }

  nav button {
    font-size: 1rem; /* Standard size for buttons */
  }

  nav .flex span {
    font-size: 1.125rem; /* Slightly larger size for Get Started button */
  }
</style>
