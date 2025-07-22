FROM python:3.9-alpine

# 安装依赖
RUN apt-get update && apt-get install -y gcc libffi-dev libssl-dev && rm -rf /var/lib/apt/lists/*

# 安装 mkdocs 及 material 主题
RUN pip install --no-cache-dir mkdocs mkdocs-material mkdocs-material-extensions

WORKDIR /docs
COPY . /docs

RUN mkdocs --version
