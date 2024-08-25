import { fileURLToPath, URL } from 'url';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import environment from 'vite-plugin-environment';
import dotenv from 'dotenv';
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

// Load environment variables
dotenv.config({ path: '../../.env' });

export default defineConfig({
  build: {
    emptyOutDir: true,
    rollupOptions: {
      plugins: [
        {
          name: 'copy-files',
          writeBundle() {
            const fs = require('fs');
            const path = require('path');
            const sourcePath = path.resolve(__dirname, 'src/declarations');
            const destPath = path.resolve(__dirname, 'dist/declarations');
            
            if (!fs.existsSync(destPath)){
              fs.mkdirSync(destPath, { recursive: true });
            }
            
            fs.readdirSync(sourcePath).forEach(file => {
              if (file.endsWith('.did')) {
                fs.copyFileSync(
                  path.join(sourcePath, file),
                  path.join(destPath, file)
                );
              }
            });
          }
        }
      ]
    }
  },
  optimizeDeps: {
    esbuildOptions: {
      define: {
        global: 'globalThis',
      },
    },
  },
  server: {
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:4943',
        changeOrigin: true,
      },
    },
  },
  plugins: [
    sveltekit(),
    environment('all', { prefix: 'CANISTER_' }),
    environment('all', { prefix: 'DFX_' }),
  ],
  resolve: {
    alias: [
      {
        find: 'declarations',
        replacement: fileURLToPath(
          new URL('../declarations', import.meta.url)
        ),
      },
    ],
  },
});
