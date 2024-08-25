// src/Services/auth.js
import { AuthClient } from '@dfinity/auth-client';
import { writable } from 'svelte/store';

export const selectedRole = writable('');

export async function authenticate() {
  try {
    const authClient = await AuthClient.create();
    await authClient.login({
      identityProvider: import.meta.env.VITE_II_URL,
      onSuccess: async () => {
        console.log("Logged in!");
        await navigateToDashboard();
      },
      onError: (error) => {
        console.error("Login failed:", error);
      }
    });
  } catch (error) {
    console.error("AuthClient creation failed:", error);
  }
}

async function getUserRole() {
  return new Promise((resolve) => {
    const unsubscribe = selectedRole.subscribe((role) => {
      resolve(role);
      unsubscribe();
    });
  });
}

async function navigateToDashboard() {
  const role = await getUserRole();
  switch (role) {
    case 'regulator':
      window.location.href = '/regulators-dashboard';
      break;
    
    case 'patient':
      window.location.href = '/consumers-dashboard';
      break;
      case 'pharmacy':
      window.location.href = '/pharmacies-dashboard';
      break;
    
    default:
      alert('Unknown role selected. Please choose a valid role.');
  }
}

// Export the function if it is used in your Svelte component
export async function handleSignUp() {
  console.log("handleSignUp called");
  try {
    await authenticate();
    signedIn = true;
    showRoleSelectionPopup = true;
  } catch (error) {
    console.error("Authentication failed:", error);
  }
}
