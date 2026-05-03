# cod-platform-ai

FastAPI AI service — insight engine and MCP server for the COD Platform.

## Purpose

Python AI layer. Receives structured data from `cod-platform-api`, runs analysis, generates proactive insights, and exposes MCP tools for natural language interaction. Phase 3 scope — currently a health-check stub.

## Setup

```bash
uv sync
```

## Run

```bash
# development
uv run uvicorn cod_platform_ai.main:app --reload

# production
uvicorn cod_platform_ai.main:app --host 0.0.0.0 --port 8000
```

## Test

```bash
uv run pytest
```

## Stack

- FastAPI (Python 3.12)
- Uvicorn
- Claude API (Phase 3)
