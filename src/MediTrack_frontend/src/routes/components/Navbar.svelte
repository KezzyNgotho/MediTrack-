<script>
  let menuOpen = false;

  function toggleMenu() {
    menuOpen = !menuOpen;
  }
</script>

<nav class="bg-gray-200 p-4 shadow-lg">
  <div class="max-w-7xl mx-auto flex justify-between items-center">
    <div class="text-gray-800 text-lg font-bold">MediTrack+</div>
    <div class="hidden md:flex space-x-4">
      <a href="/" class="text-gray-800 hover:underline">Home</a>
      <a href="#about" class="text-gray-800 hover:underline">About</a>
      <a href="#features" class="text-gray-800 hover:underline">Features</a>
      <a href="#contact" class="text-gray-800 hover:underline">Contact</a>
    </div>
    <button class="md:hidden text-gray-800" on:click={toggleMenu}>
      ☰
    </button>
  </div>
  {#if menuOpen}
    <div class="md:hidden mt-4 space-y-2">
      <a href="/" class="block text-gray-800 hover:underline">Home</a>
      <a href="#about" class="block text-gray-800 hover:underline">About</a>
      <a href="#features" class="block text-gray-800 hover:underline">Features</a>
      <a href="#contact" class="block text-gray-800 hover:underline">Contact</a>
    </div>
  {/if}
</nav>
