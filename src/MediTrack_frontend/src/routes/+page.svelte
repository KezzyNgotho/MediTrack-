<script>
  import Navbar from '../routes/components/Navbar.svelte';
  import { authenticate } from '../Services/auth';
  import { writable, get } from 'svelte/store';
  import '../index.scss';
  import image1 from './../../static/download.jpeg';
  import image2 from './../../static/downloadhh.jpeg'
  

  let signedIn = false;
  let showRoleSelectionPopup = false;
  let selectedRole = writable('');

  async function handleSignUp() {
    try {
      await authenticate();
      signedIn = true;
      showRoleSelectionPopup = true;
    } catch (error) {
      console.error("Authentication failed:", error);
    }
  }

  function handleClosePopup() {
    showRoleSelectionPopup = false;
  }

  function handleRoleChange(event) {
    selectedRole.set(event.target.value);
  }

  async function handleGetStarted() {
    const role = get(selectedRole);
    if (role) {
      showRoleSelectionPopup = false;
      await navigateToDashboard();
    } else {
      alert('Please select your role.');
    }
  }

  async function navigateToDashboard() {
    const role = get(selectedRole);
    switch (role) {
      case 'patient':
        window.location.href = '/consumers-dashboard';
        break;
      case 'regulator':
        window.location.href = '/regulators-dashboard';
        break;
      case 'manufacturer':
        window.location.href = '/manufacturer-dashboard';
        break;
      case 'governmentAgency':
        window.location.href = '/government-agencies-dashboard';
        break;
      default:
        alert('Unknown role selected. Please choose a valid role.');
    }
  }
</script>

<Navbar />

<section class="hero color-[#DFF5FF]">
  <div class="hero-content">
    <h2 class=" text-4xl md:text-4xl font-bold hero-text mb-4 text-[#0f535c]" >Welcome to MediTrack+</h2>
    
    <p>An Integrated Solution to Combat Pharmaceutical Corruption</p>

    {#if !signedIn}
      <button class="btn-primary" on:click={handleSignUp}>
        Sign Up with Internet Identity
      </button>
    {/if}
  </div>
</section>

{#if showRoleSelectionPopup}
  <div class="popup-overlay">
    <div class="popup-content">
      <h3>Select Your Role</h3>
      <select on:change={handleRoleChange} class="role-select">
        <option value="">Select your role</option>
        <option value="patient">Patient</option>
        <option value="patient">Patient</option>
        <option value="regulator">Regulator</option>
        <option value="manufacturer">Manufacturer</option>
        <option value="governmentAgency">Government Agency</option>
      </select>
      <div class="popup-buttons">
        <button class="btn-primary" on:click={handleGetStarted}>
          Get Started
        </button>
        <button class="btn-secondary" on:click={handleClosePopup}>
          Cancel
        </button>
      </div>
    </div>
  </div>
{/if}

<section id="about" class="section-about">
  <div class="section-container">
    <div class="intro-text">
      <h2 class="section-title">About MediTrack+</h2>
      <p class="section-description">
        MediTrack+ is a comprehensive platform that uses AI and blockchain to monitor and manage drug distribution, ensuring integrity and transparency.
      </p>
    </div>

    <div class="cards-container">
      <!-- Mission Card -->
      <div class="card card-mission">
        <div class="icon-container">
          <img src={image1} alt="Mission Icon" class="card-icon" />
        </div>
        <h3 class="card-title">Our Mission</h3>
        <p class="card-description">
          To provide a transparent and reliable pharmaceutical supply chain that combats corruption and ensures drug quality for all.
        </p>
      </div>

      <!-- Benefits Card -->
      <div class="card card-benefits">
        <div class="icon-container">
          <img src={image2} alt="Benefits Icon" class="card-icon" />
        </div>
        <h3 class="card-title">Benefits</h3>
        <ul class="benefits-list">
          <li>Enhanced transparency in the drug supply chain</li>
          <li>Real-time tracking of pharmaceuticals</li>
          <li>Secure and anonymous whistleblower platform</li>
          <li>Global drug price regulation and monitoring</li>
        </ul>
      </div>

      <!-- AI & Blockchain Card -->
      <div class="card card-ai-blockchain">
        <div class="icon-container">
          <img src={image1} alt="AI & Blockchain Icon" class="card-icon" />
        </div>
        <h3 class="card-title">AI & Blockchain Integration</h3>
        <p class="card-description">
          Utilizing cutting-edge AI algorithms and blockchain technology to create a secure, transparent, and efficient drug distribution network.
        </p>
      </div>
    </div>

    <!-- Animated Connector -->
    <div class="connector-container">
      <svg class="connector" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <circle cx="50" cy="50" r="5" fill="#00bfa6">
          <animate attributeName="r" from="5" to="15" dur="0.6s" begin="0s" repeatCount="indefinite" />
        </circle>
        <circle cx="50" cy="50" r="5" fill="#3f51b5">
          <animate attributeName="r" from="5" to="15" dur="0.6s" begin="0.3s" repeatCount="indefinite" />
        </circle>
      </svg>
    </div>
  </div>
</section>

<section id="features" class="section-features">
  <div class="section-content">
    <h2 class="section-title">Features</h2>
    <div class="feature-grid">
      <!-- Existing Features -->
      <div class="feature-item">
        <h3>Drug Integrity and Tracking System</h3>
        <p>Ensure the integrity of pharmaceuticals through our robust tracking system that leverages blockchain technology.</p>
      </div>
      <div class="feature-item">
        <h3>Decentralized Reporting and Whistleblower Platform</h3>
        <p>Provide a secure and anonymous platform for reporting corruption and ensuring accountability.</p>
      </div>
      <div class="feature-item">
        <h3>Global Drug Price Regulation Platform</h3>
        <p>Monitor and regulate drug prices globally to prevent exploitation and ensure affordability.</p>
      </div>

      <!-- New Blockchain Card -->
      <div class="feature-item feature-blockchain">
        <h3>Blockchain Integration</h3>
        <p>Utilize blockchain technology to create a transparent and immutable ledger of pharmaceutical transactions, ensuring the highest level of security and trust.</p>
      </div>

      <!-- New AI Card -->
      <div class="feature-item feature-ai">
        <h3>AI-Driven Insights</h3>
        <p>Leverage advanced AI algorithms to analyze data, predict trends, and optimize drug distribution processes for greater efficiency and accuracy.</p>
      </div>
    </div>
  </div>
</section>

<section id="contact" class="py-16 bg-white">
  <div class="container mx-auto px-6">
    <div class="section-row grid grid-cols-1 lg:grid-cols-2 gap-12">
      <!-- Contact Information -->
      <div class="contact-info space-y-8">
        <h2 class="text-4xl font-bold text-[#90CAF9]">Contact Us</h2>
        <p class="text-lg text-gray-700">If you have any questions, feel free to reach out. We’re here to help and answer any inquiries you might have. Our team is available to provide you with any assistance you need.</p>
        <ul class="info-list space-y-4">
          <li><strong class="text-lg font-semibold text-[#90CAF9]">Phone:</strong> <span class="text-gray-500">+123 456 789</span></li>
          <li><strong class="text-lg font-semibold text-[#90CAF9]">Email:</strong> <span class="text-gray-500">info@example.com</span></li>
          <li><strong class="text-lg font-semibold text-[#90CAF9]">Address:</strong> <span class="text-gray-500">123 Main St, City, Country</span></li>
          <li><strong class="text-lg font-semibold text-[#90CAF9]">Location:</strong>
            <div class="mt-4">
              <iframe class="w-full h-64 border-0 rounded-lg shadow-lg"
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.068439131539!2d-122.08424948468168!3d37.42199997982517!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb8a0a0e6c23b%3A0x7f4f9e5b6a2d6fd0!2sGoogleplex!5e0!3m2!1sen!2sus!4v1675094829345!5m2!1sen!2sus"
                allowfullscreen="" loading="lazy"></iframe>
            </div>
          </li>
        </ul>
      </div>

      <!-- Contact Form -->
      <div class="section-content bg-white shadow-lg rounded-lg p-8">
        <form class="space-y-6">
          <div class="form-group">
            <label for="name" class="block text-lg font-medium text-black">Name</label>
            <input type="text" id="name" class="w-full p-4 border border-black rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" placeholder="Your Name">
          </div>
          <div class="form-group">
            <label for="email" class="block text-lg font-medium text-black">Email</label>
            <input type="email" id="email" class="w-full p-4 border border-black rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" placeholder="Your Email">
          </div>
          <div class="form-group">
            <label for="message" class="block text-lg font-medium text-black">Message</label>
            <textarea id="message" class="w-full p-4 border border-black rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none" rows="5" placeholder="Your Message"></textarea>
          </div>
          <button type="submit" class="w-full py-4 bg-blue-200 text-white font-bold rounded-lg hover:bg-blue-700 transition ease-in-out duration-300">Send Message</button>
        </form>
      </div>
    </div>
  </div>
</section>


<footer class="bg-white text-black py-8">
  <div class="container mx-auto px-6 flex flex-col items-center justify-center">
    <p class="text-sm mb-4">&copy; 2024 MediTrack+. All rights reserved.</p>
    <div class="flex space-x-6">
      <a href="https://facebook.com" target="_blank" rel="noopener noreferrer" class="text-blue-500 hover:text-blue-400 transition duration-300">Facebook</a>
      <a href="https://twitter.com" target="_blank" rel="noopener noreferrer" class="text-blue-400 hover:text-blue-300 transition duration-300">Twitter</a>
      <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer" class="text-blue-600 hover:text-blue-500 transition duration-300">LinkedIn</a>
    </div>
  </div>
  <div class="fixed bottom-4 right-4">
    <button
      on:click={() => window.scrollTo({ top: 0, behavior: 'smooth' })}
      class="bg-blue-600 text-white p-3 rounded-full shadow-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300"
      aria-label="Back to Top"
    >
      &uarr;
    </button>
  </div>
</footer>


<style>
  /* Global styles */
  body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    color: #333;
    
  }
  @keyframes pulse {
   0% { r: 5; opacity: 1; }
   50% { r: 10; opacity: 0.5; }
   100% { r: 5; opacity: 1; }
}

circle {
   animation: pulse 1.5s infinite;
}

  /* Hero section styles */
  .hero {
    
  background-image: url('../routes/assets/back.jpg');
  background-size: cover; /* Ensures the image covers the entire section while maintaining aspect ratio */
  background-position: right center; /* Positions the image on the right center */
  background-repeat: no-repeat;
  color: black;
  padding: 6rem 2rem;
  display: flex;
  justify-content: flex-start;
  min-height: 60vh;
  max-width: 100%;
  overflow: hidden;
  position: relative; /* Allows positioning of the gradient overlay */
}

.hero::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.4); /* Semi-transparent white overlay */
  z-index: 1; /* Ensures overlay is below content */
}

.hero-content {
  max-width: 50%;
  text-align: left;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
  position: relative; /* Ensures content is above the overlay */
  z-index: 2; /* Ensures content is above the overlay */
}


  .hero-content h2 {
    font-size: 3rem;
    margin-bottom: 1rem;
    font-weight: bold;
  }

  .hero-content p {
    font-size: 1.25rem;
    margin-bottom: 2rem;
  }

  .btn-primary {
    background-color: #0f535c;
    color: white;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 0.5rem;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
  }

  .btn-primary:hover {
    background-color: #0f535c;
    transform: scale(1.05);
  }

  .btn-secondary {
    background-color: #0f535c;
    color: #fff;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 0.5rem;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
  }

  .btn-secondary:hover {
    background-color: #f0f0f0;
    transform: scale(1.05);
  }

  /* Popup styles */
  .popup-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: #0f535c;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
  }

  .popup-content {
    background: white;
    border-radius: 0.5rem;
    padding: 2rem;
    width: 90%;
    max-width: 400px;
    box-shadow: 0 0 10px #0f535c;
    text-align: center;
    position: relative;
  }

  .popup-buttons {
    margin-top: 1rem;
  }

  .role-select {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #000;
    border-radius: 0.5rem;
    font-size: 1rem;
  }

  /* Section styles */
  .section-about, .section-features, .section-contact {
    padding: 4rem 2rem;
    margin-top: 23px;
  }

  .section-title {
    font-size: 2rem;
    margin-bottom: 1rem;
    color: #000;
    text-align: center;
    font-weight: 700;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  }

  .section-description {
    font-size: 1.25rem;
    margin-bottom: 2rem;
    text-align: center;
  }

  .cards-container, .feature-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 2rem;
  }

  .card, .feature-item {
    background: white;
    border-radius: 0.5rem;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 1.5rem;
    text-align: center;
    width: 300px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  .card:hover, .feature-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
  }

  .card-icon {
    width: 40px;
    height: 40px;
    margin-bottom: 1rem;
  }

  .card-title {
    font-size: 1.5rem;
    margin-bottom: 1rem;
  }

  .card-description, .feature-item p {
    font-size: 1rem;
    line-height: 1.5;
  }

  .connector-container {
    text-align: center;
    margin-top: 2rem;
  }

  .connector {
    width: 100px;
    height: 100px;
    margin: 0 auto;
  }

  .footer {
    background-color: #333;
    color: white;
    padding: 2rem;
    text-align: center;
  }

  .footer-content {
    max-width: 1200px;
    margin: 0 auto;
  }

  .social-links a {
    color: #0f535c;
    margin: 0 0.5rem;
    text-decoration: none;
  }

  .social-links a:hover {
    text-decoration: underline;
  }

  @media (max-width: 768px) {
    .hero-content {
      max-width: 90%;
    }
  }
  
  



</style>
