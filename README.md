# Mermaid Canvas

A two-pane Mermaid diagram studio: write Mermaid code in an IDE-style editor on the left, watch the graph render live on the right. Covers **18 diagram types**, full theming, and export to SVG / PNG / Markdown.

Runs 100% in the browser — Mermaid is bundled locally, nothing is uploaded, and the Docker image works fully offline.

## Features

- **Two-pane layout** — IDE-style editor (line/col, tab support, live render) + live graph viewer. Toggle horizontal/vertical split.
- **18 diagram types** — flowchart, sequence, class, state, ER, gantt, pie, journey, git, C4, mindmap, timeline, quadrant, sankey, xychart, block, packet, architecture.
- **19 built-in snippets** — one click inserts a working example for every diagram type.
- **Full theming** — default / dark / forest / neutral themes, plus a custom `base` theme with your own accent + background colors. Override any Mermaid theme variable with a `%%{init}%%` block.
- **Export** — SVG, PNG (2×), Markdown code block, copy source, save/load `.mmd` files.
- **Zoom & fit** — zoom in/out, reset, fit-to-view.
- **Error surfacing** — parse errors show inline with the exact message and line.
- **Self-hostable** — ships as a Docker image; no CDN, no external services.

## Run with Docker

```bash
docker run -d -p 8080:80 mokmail/mermaid-canvas
# open http://localhost:8080
```

Or with Docker Compose:

```bash
docker compose up -d --build
```

## Build locally

```bash
docker build -t mermaid-canvas .
docker run -d -p 8080:80 mermaid-canvas
```

## Run without Docker

Open `mermaid-canvas.html` directly in a browser, or serve the folder with any static server:

```bash
python3 -m http.server 8080
```

## Keyboard shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+Enter` | Render now |
| `Ctrl+S` | Download `.mmd` |
| `Ctrl+O` | Open `.mmd` file |
| `Ctrl+/` | Toggle snippets |
| `Tab` | Indent |

## Project layout

```
mermaid-canvas.html   # the entire app (single file)
mermaid.min.js        # Mermaid 11.4.1, bundled locally
Dockerfile            # nginx-alpine image
nginx.conf            # static server + security headers
docker-compose.yml    # one-command self-host
```

## License

MIT. Mermaid is MIT-licensed (© Knut Sveidqvist and contributors).
