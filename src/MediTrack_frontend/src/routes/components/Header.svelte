<!-- src/components/Header.svelte -->
<script>
    export let title = "MediTrack+";
    export let subtitle = "An Integrated Solution to Combat Pharmaceutical Corruption";
  </script>
  
  <header class="bg-gray-100  shadow">
    <div class="container mx-auto px-4 py-6">
      <h1 class="text-3xl font-bold text-gray-800">{title}</h1>
      <p class="text-lg text-gray-600">{subtitle}</p>
    </div>
  </header>
  
  <style>
    .container {
      max-width: 1200px;
    }
  </style>
  