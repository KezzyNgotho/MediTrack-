<script lang="ts">
  let isMenuOpen = false;

  function toggleMenu() {
      isMenuOpen = !isMenuOpen;
  }
</script>

<header class="bg-[#0f535c] text-white py-4 px-6 flex flex-col md:flex-row items-center justify-between relative">
  <!-- Left Section: Icon and Title -->
  <div class="flex items-center space-x-4 w-full md:w-auto">
      <!-- Circle Icon with Outline -->
      <div class="relative flex items-center justify-center">
          <a href="/">
              <img 
                  src="/logo.png" 
                  alt="Icon" 
                  class="w-12 h-12 sm:w-14 sm:h-14 md:w-16 md:h-16 lg:w-20 lg:h-20 rounded-full border-4 border-blue-200 object-cover max-w-full"
              />
          </a>
      </div>
      <h1 class="text-xl sm:text-2xl md:text-3xl font-bold ml-2">MediTrack+</h1>
  </div>

  <!-- Center Section: Navigation Links for Desktop -->
  <nav class="hidden md:flex flex-grow justify-center space-x-6 mt-4 md:mt-0">
      {#each ['Newsletter', 'Forum', 'Gateway', 'Agency'] as link}
          <a href="#" class="text-white hover:text-[#0f535c] border border-blue-200 hover:border-blue-200 px-4 py-2 rounded transition-all duration-300">{link}</a>
      {/each}
  </nav>

  <!-- Right Section: Buttons -->
  <div class="flex flex-wrap space-x-4 mt-4 md:mt-0">
      <button class="bg-gray-800 text-white px-4 py-2 rounded-full shadow-md hover:bg-gray-700 transition-all duration-300 flex items-center space-x-2">
          <span class="text-sm md:text-base">Get Started</span>
          <span role="img" aria-label="Get Involved">🚀</span>
      </button>
      <button class="bg-transparent border border-blue-200 text-white px-4 py-2 rounded-full shadow-md hover:border-blue-200 hover:bg-blue-300 transition-all duration-300 flex items-center space-x-2">
          <span class="text-sm md:text-base">Partner with Us</span>
          <span role="img" aria-label="Partner with Us">🤝</span>
      </button>
  </div>

  <!-- Mobile Menu Toggle Button -->
  <button class="md:hidden absolute top-4 right-4 text-white focus:outline-none" on:click={toggleMenu}>
      <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
      </svg>
  </button>

  <!-- Mobile Navigation Menu -->
  {#if isMenuOpen}
      <div class="fixed inset-0 bg-blue-200 text-white flex flex-col items-center justify-center space-y-6 md:hidden">
          <!-- Close Button -->
          <button class="text-white bg-emerald-700 hover:bg-blue-200 rounded-full p-3 border-2 border-emerald-500 shadow-glow hover:shadow-lg transition-all duration-300 mb-6" on:click={toggleMenu}>
              <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
              </svg>
          </button>
          <!-- Navigation Links -->
          <div class="flex flex-col items-center space-y-6">
              {#each ['Newsletter', 'Forum', 'Gateway', 'Agency'] as link}
                  <a href="#" class="text-white hover:text-blue-200 border border-blue-200 hover:border--100 px-6 py-2 rounded transition-all duration-300">{link}</a>
              {/each}
          </div>
      </div>
  {/if}
</header>
