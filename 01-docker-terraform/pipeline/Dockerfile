FROM python:3.13.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin

WORKDIR /code

# Adding .venv/bin to PATH so in entrypoint we can skip "uv run" and just run "python"
ENV PATH="/code/.venv/bin:$PATH"  

COPY pyproject.toml .python-version uv.lock ./
RUN uv sync --locked 

COPY 01-docker-terraform/pipeline/pipeline.py .

ENTRYPOINT ["python","pipeline.py"]

