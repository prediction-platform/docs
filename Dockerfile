FROM python:3.9-alpine

# 安装系统依赖
RUN apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    && rm -rf /var/cache/apk/*

# 安装 mkdocs 和 material 主题
RUN pip install --no-cache-dir \
    mkdocs \
    mkdocs-material \
    mkdocs-material-extensions

WORKDIR /docs
COPY . /docs

RUN mkdocs --version
