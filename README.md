# Transcribe

Real-time speech to text that runs entirely in your browser. No server, no data leaves your device.

**[Try it live](https://melvincarvalho.github.io/transcribe/)**

## Features

- **Private** — all processing happens locally, audio never leaves your browser
- **Real-time** — progressive streaming with sentence-aware windowing
- **WebGPU accelerated** — uses GPU for fast inference when available, falls back to WASM
- **Single file** — one `index.html`, no build step required
- **Multilingual** — supports 25 European languages

## How It Works

Uses a 0.6B parameter speech recognition model running client-side via ONNX Runtime Web. The model (~2.5 GB) downloads once and is cached in IndexedDB.

The progressive streaming algorithm uses a growing window (0–15s) that transitions to a sliding window with sentence-boundary detection for longer recordings.

## Run Locally

For full WebGPU performance, serve with COEP/COOP headers:

```bash
./serve.sh
# Open http://localhost:8080
```

Or simply open `index.html` — it will fall back to single-threaded WASM (slower but works).

## Browser Support

| Browser | WebGPU | WASM Fallback |
|---------|--------|---------------|
| Chrome 113+ | Yes | Yes |
| Edge 113+ | Yes | Yes |
| Firefox | No | Yes |
| Safari | No | Yes |

## License

[AGPL-3.0](LICENSE)
