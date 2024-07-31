import { AuthClient } from '@dfinity/auth-client';
import { writable } from 'svelte/store';

export const selectedRole = writable('');

export async function authenticate() {
  try {
    const authClient = await AuthClient.create();
    await authClient.login({
      identityProvider: process.env.II_URL,
      onSuccess: () => {
        console.log("Logged in!");
        navigateToDashboard();
      },
    }).catch((error) => {
      console.error("Login failed:", error);
    });
  } catch (error) {
    console.error("AuthClient creation failed:", error);
  }
}

async function getUserRole() {
  // Get the role from the selectedRole store
  return new Promise((resolve) => {
    selectedRole.subscribe((role) => {
      resolve(role);
    });
  });
}

async function navigateToDashboard() {
  const role = await getUserRole();
  if (role === 'regulator') {
    window.location.href = '/regulators-dashboard';
  } else if (role === 'pharmaceuticalCompany') {
    window.location.href = '/companies-dashboard';
  } else if (role === 'pharmacy') {
    window.location.href = '/pharmacies-dashboard';
  } else if (role === 'consumer') {
    window.location.href = '/consumers-dashboard';
  } else if (role === 'governmentAgency') {
    window.location.href = '/government-agencies-dashboard';
  } else {
    alert('Unknown role');
  }
}

export async function handleSignIn() {
  await authenticate();
}
