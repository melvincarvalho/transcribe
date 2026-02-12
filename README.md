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

Uses the [Parakeet TDT 0.6B v3](https://huggingface.co/istupakov/parakeet-tdt-0.6b-v3-onnx) model via [parakeet.js](https://github.com/ysdede/parakeet.js) and ONNX Runtime Web. The model (~2.5 GB) downloads once and is cached in IndexedDB.

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

## Credits

- [parakeet.js](https://github.com/ysdede/parakeet.js) — ONNX model wrapper
- [ONNX Runtime Web](https://onnxruntime.ai/) — inference engine
- [Parakeet TDT 0.6B v3](https://huggingface.co/nvidia/parakeet-tdt-0.6b-v2) — NVIDIA speech recognition model
- [andito/parakeet-v3-streaming](https://huggingface.co/spaces/andito/parakeet-v3-streaming) — original HF Space (MIT)

## License

[AGPL-3.0](LICENSE)
