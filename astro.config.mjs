// @ts-check

import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';
import { defineConfig, fontProviders } from 'astro/config';

import react from '@astrojs/react';

// https://astro.build/config
export default defineConfig({
    site: 'https://adm-j.github.io',
    base: '/adm-j.github.io',
    integrations: [mdx(), sitemap(), react()],
    fonts: [
        {
            provider: fontProviders.local(),
            name: 'OpenSans',
            cssVariable: '--font-opensans',
            fallbacks: ['sans-serif'],
            options: {
                variants: [
                    {
                        src: ['./src/assets/fonts/OpenSans-Regular.ttf'],
                        weight: 400,
                        style: 'normal',
                        display: 'swap',
                    },
                    {
                        src: ['./src/assets/fonts/OpenSans-Bold.ttf'],
                        weight: 700,
                        style: 'normal',
                        display: 'swap',
                    },
                ],
            },
        },
    ],
});