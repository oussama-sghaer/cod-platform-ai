FROM python:3.12-slim AS base
WORKDIR /app
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
RUN pip install uv && apt-get update && apt-get install -y --no-install-recommends wget && rm -rf /var/lib/apt/lists/*
RUN useradd --no-create-home --shell /bin/false appuser

FROM base AS builder
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev

FROM base AS runner
ENV PYTHONPATH=/app/src
COPY --from=builder /app/.venv /app/.venv
COPY src/ ./src/
USER appuser
EXPOSE 8000
CMD ["/app/.venv/bin/uvicorn", "cod_platform_ai.main:app", "--host", "0.0.0.0", "--port", "8000"]
