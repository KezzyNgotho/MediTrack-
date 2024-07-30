<script>
  import Navbar from '../routes/components/Navbar.svelte';
  import heroImage from '../routes/assets/med.jpeg';
  import '../index.scss';
</script>

<Navbar />

<section class="bg-gray-100 py-12">
  <!-- Hero Section -->
  <div class="relative bg-gray-200 text-black py-24">
    <div class="relative container mx-auto px-4 text-center">
      <h2 class="text-5xl font-bold mb-4">Welcome to MediTrack+</h2>
      <p class="text-2xl mb-8">An Integrated Solution to Combat Pharmaceutical Corruption</p>
      <div class="flex flex-col md:flex-row justify-center space-y-4 md:space-y-0 md:space-x-4">
        <button class="bg-gray-600 text-white font-bold py-2 px-4 rounded-lg">Get Started</button>
        <button class="bg-red-400 border border-white text-black font-bold py-2 px-4 rounded-lg">Report Crime</button>
      </div>
    </div>
  </div>
</section>

<section id="about" class="bg-gray-100  py-12">
  <div class="container mx-auto px-4 text-gray-800">
    <h2 class="text-4xl font-bold mb-4">About MediTrack+</h2>
    <p class="text-lg mb-4">MediTrack+ is a comprehensive platform that uses AI and blockchain to monitor and manage drug distribution, ensuring integrity and transparency. It provides a secure system for reporting corruption and ensures the quality of drugs in the supply chain.</p>
    <h3 class="text-2xl font-semibold mb-2">Our Mission</h3>
    <p class="text-lg mb-4">To provide a transparent and reliable pharmaceutical supply chain that combats corruption and ensures drug quality for all.</p>
    <h3 class="text-2xl font-semibold mb-2">Benefits</h3>
    <ul class="list-disc pl-5 text-lg mb-4">
      <li>Enhanced transparency in the drug supply chain</li>
      <li>Real-time tracking of pharmaceuticals</li>
      <li>Secure and anonymous whistleblower platform</li>
      <li>Global drug price regulation and monitoring</li>
    </ul>
  </div>
</section>

<section id="features" class="bg-gray-100 py-12">
  <div class="container mx-auto px-4 text-gray-800">
    <h2 class="text-4xl font-bold mb-4">Features</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-2xl font-semibold mb-2">Drug Integrity and Tracking System</h3>
        <p class="text-lg">Ensure the integrity of pharmaceuticals through our robust tracking system that leverages blockchain technology.</p>
      </div>
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-2xl font-semibold mb-2">Decentralized Reporting and Whistleblower Platform</h3>
        <p class="text-lg">Provide a secure and anonymous platform for reporting corruption and ensuring accountability.</p>
      </div>
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h3 class="text-2xl font-semibold mb-2">Global Drug Price Regulation Platform</h3>
        <p class="text-lg">Monitor and regulate drug prices globally to prevent exploitation and ensure affordability.</p>
      </div>
    </div>
  </div>
</section>

<section id="contact" class="bg-white py-12">
  <div class="container mx-auto px-4 text-gray-800">
    <h2 class="text-4xl font-bold mb-4">Contact Us</h2>
    <form class="space-y-4">
      <div class="flex flex-col">
        <label for="name" class="text-lg font-semibold">Name</label>
        <input type="text" id="name" class="p-2 border border-gray-300 rounded-lg" placeholder="Your Name">
      </div>
      <div class="flex flex-col">
        <label for="email" class="text-lg font-semibold">Email</label>
        <input type="email" id="email" class="p-2 border border-gray-300 rounded-lg" placeholder="Your Email">
      </div>
      <div class="flex flex-col">
        <label for="message" class="text-lg font-semibold">Message</label>
        <textarea id="message" class="p-2 border border-gray-300 rounded-lg" rows="4" placeholder="Your Message"></textarea>
      </div>
      <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded-lg">Send Message</button>
    </form>
  </div>
</section>

<footer class="py-6 bg-gray-200 text-gray-800">
  <div class="max-w-7xl mx-auto px-4 flex flex-col md:flex-row justify-between items-center">
    <p>&copy; 2024 MediTrack+. All rights reserved.</p>
    <div class="flex space-x-4 mt-4 md:mt-0">
      <a href="#" class="text-gray-800 hover:text-gray-600">Facebook</a>
      <a href="#" class="text-gray-800 hover:text-gray-600">Twitter</a>
      <a href="#" class="text-gray-800 hover:text-gray-600">LinkedIn</a>
    </div>
  </div>
</footer>

<style>
  .max-w-7xl {
    max-width: 1200px;
  }
</style>
