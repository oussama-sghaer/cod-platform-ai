from fastapi import FastAPI
from datetime import datetime, timezone

app = FastAPI(title="COD Platform AI", version="0.0.1")


@app.get("/health")
def health():
    return {
        "status": "ok",
        "service": "cod-platform-ai",
        "version": "0.0.1",
        "timestamp": datetime.now(timezone.utc).isoformat(),
    }
