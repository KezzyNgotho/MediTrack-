import adapter from '@sveltejs/adapter-static';
import sveltePreprocess from 'svelte-preprocess';
import tailwindcss from 'tailwindcss';
import autoprefixer from 'autoprefixer';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    // Specify the static adapter configuration
    adapter: adapter({
      pages: 'dist',
      assets: 'dist',
      fallback: null, // Use 'index.html' if using SPA fallback, otherwise null
      precompress: false,
      strict: true,
    }),
  },
  preprocess: sveltePreprocess({
    postcss: {
      plugins: [tailwindcss(), autoprefixer()],
    },
  }),
};

export default config;
