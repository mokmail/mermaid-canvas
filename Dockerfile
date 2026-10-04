# Mermaid Canvas — self-hostable diagram studio
# Serves the static app via nginx. Mermaid is bundled locally (no CDN),
# so the container works fully offline.
FROM nginx:1.27-alpine

# Copy the app into the nginx web root
COPY mermaid-canvas.html /usr/share/nginx/html/index.html
COPY mermaid-canvas.css /usr/share/nginx/html/mermaid-canvas.css
# The kmail.at theme layer. The app's own bundle is a compiled Tailwind build with
# hardcoded green/cyan accents; this file (loaded AFTER it) re-points those at the
# design tokens and drives light/dark from the same `kmail-theme` key the site
# uses. WITHOUT THIS FILE the app renders in the old palette.
COPY kmail-theme.css /usr/share/nginx/html/kmail-theme.css
# Favicon. The header logomark is inlined in the HTML so it can inherit
# `currentColor`; only the icon needs this file.
COPY logo-mark.svg /usr/share/nginx/html/logo-mark.svg
COPY mermaid.min.js /usr/share/nginx/html/mermaid.min.js
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
