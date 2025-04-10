# Golang MCP CLI Tool

A project cloned from [mcp-go](https://github.com/mark3labs/mcp-go) to learn about model context protocol (MCP),
the code is updated to support running tool on docker environment.

All credit goes to [mark3lab](https://github.com/mark3labs) for his great codebase and clear instruction.

## Setup

> Ollama is optional, if you didn't use Ollama you can remove it from `docker-compose.yml`

1. Start up program
```
docker-compose up --build
```

2. Run Go tool
```
docker exec -it mcp-go-cli ./mcp-cli
```

3. Pull ollama model
```
docker exec -it ollama ollama pull <model>
```
> You can find all supported models at [Ollama Models](https://ollama.com/search?c=tools)
