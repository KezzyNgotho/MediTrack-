<script>
  import { onMount } from 'svelte';
  import { goto } from '$app/navigation';
  import { getUserRole } from '../Services/auth.js'
  import Navbar from '../routes/components/Navbar.svelte';

  onMount(async () => {
    const userRole = await getUserRole();
    if (userRole === 'regulator') {
      goto('/regulators-dashboard');
    } else if (userRole === 'pharmaceuticalCompany') {
      goto('/companies-dashboard');
    } else if (userRole === 'pharmacy') {
      goto('/pharmacies-dashboard');
    } else if (userRole === 'consumer') {
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
