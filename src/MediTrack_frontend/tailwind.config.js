
// tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.{html,js,svelte,ts}',
    './src/routes/**/*.{html,js,svelte,ts}',
    './src/components/**/*.{html,js,svelte,ts}',
  ],
  theme: {
    extend: {
      colors: {
        primary: '#4A90E2',  // Cool blue
        secondary: '#50E3C2',  // Aqua green
        accent: '#D0021B',  // Bright red for accents
        background: '#F2F2F2',  // Light gray
        textPrimary: '#333333',  // Dark gray for text
        textSecondary: '#7F8C8D',  // Medium gray for secondary text
      },
    },
  },
  plugins: [],
};
