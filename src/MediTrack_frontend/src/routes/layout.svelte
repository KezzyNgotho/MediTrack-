<script>
  import { onMount } from 'svelte';
  import { goto } from '$app/navigation';
  import { getUserRole } from '../Services/auth.js'
  import Navbar from './components/Navbar.svelte';

  onMount(async () => {
    const userRole = await getUserRole();
    if (userRole === 'regulator') {
      goto('/regulators-dashboard');
    } else if (userRole === 'pharmaceuticalCompany') {
      goto('/manufacture-dashboard');
    } else if (userRole === 'pharmacy') {
      goto('/pharmacies-dashboard');
    } else if (userRole === 'patient') {
      goto('/consumers-dashboard');
    } else if (userRole === 'governmentAgency') {
      goto('/government-agencies-dashboard');
    } else {
      alert('Unknown role');
    }
  });
</script>

<Navbar />
<slot />
