import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';

export default defineConfig({
  // For a custom domain (zugarek.com), keep site/base unset.
  // If you ever deploy under a subpath, set: base: '/subpath'
  integrations: [mdx()],
  markdown: {
    shikiConfig: { wrap: true },
  },
});
