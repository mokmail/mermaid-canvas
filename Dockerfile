# Mermaid Canvas — self-hostable diagram studio
# Serves the static app via nginx. Mermaid is bundled locally (no CDN),
# so the container works fully offline.
FROM nginx:1.27-alpine

# Copy the app into the nginx web root
COPY mermaid-canvas.html /usr/share/nginx/html/index.html
COPY mermaid-canvas.css /usr/share/nginx/html/mermaid-canvas.css
COPY mermaid.min.js /usr/share/nginx/html/mermaid.min.js
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
