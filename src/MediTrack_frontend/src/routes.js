// src/routes.js
import Home from './routes/+page.svelte';
import RegulatorsDashboard from './routes/regulators-dashboard/RegulatorDashboard';
import PharmaceuticalDashboard from './routescomponents/PharmaceuticalDashboard.svelte';
import PharmacyDashboard from './routes/components/PharmacyDashboard.svelte';
import ConsumerDashboard from './routes/components/ConsumerDashboard.svelte';
import WhistleblowerDashboard from './routes/components/WhistleblowerDashboard.svelte';


export default {
  '/': Home,
  '/regulators-dashboard': RegulatorsDashboard,
  '/pharmaceutical-dashboard': PharmaceuticalDashboard,
  '/pharmacy-dashboard': PharmacyDashboard,
  '/consumer-dashboard': ConsumerDashboard,
  '/whistleblower-dashboard': WhistleblowerDashboard,
};
