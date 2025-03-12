FROM python:3.12-slim

# Install uv
# ref: https://docs.astral.sh/uv/guides/integration/docker/#installing-uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    gcc python3-dev rsync git-lfs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# workdir must be the same as the one specified in devcontainer.json
ARG workdir
WORKDIR ${workdir}
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy
ENV VIRTUAL_ENV=${workdir}/.venv

# Install the project's dependencies using the lockfile and settings
# ref: https://github.com/astral-sh/uv-docker-example/blob/main/Dockerfile
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev

# Installing separately from its dependencies allows optimal layer caching
ADD . ${workdir}
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev
