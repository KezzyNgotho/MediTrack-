/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.{html,js,svelte,ts}',
    // Add other paths to your content here if needed
  ],
  theme: {
    extend: {
      colors: {
        'primary': '#c6e2ff', // Brighter primary color
        'primary-hover': '#d0e5ff', // Brighter hover color
        'card-background': '#ffffff', // Brighter card background
        'sidebar-background': '#f1f5f9', // Brighter sidebar background
        'text-primary': '#333333', // Darker text for better readability
      },
      boxShadow: {
        'card': '0 4px 8px rgba(0,0,0,0.2)', // Brighter shadow for cards
      },
      fontFamily: {
        sans: ['Arial', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
