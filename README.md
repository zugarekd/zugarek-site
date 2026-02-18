# zugarek.com — projects site

You **only** do one thing: create projects in `src/content/projects/**` and push to `main`.

## Local dev
```bash
npm install
npm run dev
```

## Create a new project
```bash
./tools/new-project.sh "ESP32 HUB75 LED Sign" embedded esp32 hub75 led
```

## Deploy
Push to `main`. GitHub Actions builds + deploys to GitHub Pages.

## Custom domain
Set your Pages custom domain to `zugarek.com` in GitHub repo Settings → Pages.
Then configure DNS records at your registrar/DNS provider.

(See the instructions I included in the chat response.)
