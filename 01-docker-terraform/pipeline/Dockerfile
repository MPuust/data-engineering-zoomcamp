FROM python:3.13.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin

WORKDIR /code

# Adding .venv/bin to PATH so in entrypoint we can skip "uv run" and just run "python"
ENV PATH="/code/.venv/bin:$PATH"  

# As Docker is not allowed to see in parent folders, to run this dockerfile we actually need to be in the data-engineering-zoomcamp folder as that is where pyproject.toml is located
COPY pyproject.toml .python-version uv.lock ./
RUN uv sync --locked 

COPY 01-docker-terraform/pipeline/ingest_data.py .

ENTRYPOINT ["python","ingest_data.py"]

# To build this dockerfile from project root:
# -f specifies the dockerfile name
# -t specifies the image name and tag
# . specifies the build context - where docker should start looking for files
# docker build -f 01-docker-terraform/pipeline/Dockerfile -t taxi_ingest:v001 .


