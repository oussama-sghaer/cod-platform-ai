FROM python:3.13-slim AS builder
WORKDIR /app
RUN pip install uv
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev

FROM python:3.13-slim AS runner
WORKDIR /app
ENV PYTHONUNBUFFERED=1
COPY --from=builder /app/.venv /app/.venv
COPY src/ ./src/
EXPOSE 8000
CMD ["/app/.venv/bin/uvicorn", "src.app.main:app", "--host", "0.0.0.0", "--port", "8000"]
