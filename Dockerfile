FROM python:3.12-alpine AS builder
WORKDIR /build
COPY pyproject.toml setup.py ./
RUN pip install --no-cache-dir .

FROM python:3.12-alpine
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY vision_mcp/ ./vision_mcp/
COPY sse_server.py ./
EXPOSE 8000
CMD ["python", "-m", "uvicorn", "sse_server:app", "--host", "0.0.0.0", "--port", "8000"]
