#!/bin/bash

# YC365 MkDocs Material Build & Deploy Script (auto compose compatible)
# Usage: ./build_and_deploy_auto.sh

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# 自动检测 docker compose 命令
detect_compose() {
    if command -v docker &> /dev/null && docker compose version &> /dev/null; then
        COMPOSE="docker compose"
        log_info "Using: docker compose"
    elif command -v docker-compose &> /dev/null; then
        COMPOSE="docker-compose"
        log_info "Using: docker-compose"
    else
        log_error "Neither docker compose nor docker-compose is installed."
        exit 1
    fi
}

cleanup() {
    log_info "Cleaning up old containers and images..."
    $COMPOSE down --remove-orphans 2>/dev/null || true
    if docker images | grep -q "mkdocs-material-template"; then
        docker rmi mkdocs-material-template 2>/dev/null || true
    fi
    log_success "Cleanup complete."
}

build_image() {
    log_info "Building Docker image..."
    if docker build -t mkdocs-material-template .; then
        log_success "Docker image built successfully."
    else
        log_error "Docker image build failed."
        exit 1
    fi
}

build_site() {
    log_info "Building MkDocs static site..."
    if $COMPOSE --profile build run --rm mkdocs-build; then
        log_success "Static site built successfully."
    else
        log_error "Static site build failed."
        exit 1
    fi
    if [ ! -d "site" ]; then
        log_error "site directory not found. Build may have failed."
        exit 1
    fi
    log_success "Static files generated in site/ directory."
}

deploy() {
    log_info "Starting Nginx service..."
    if $COMPOSE up -d nginx; then
        log_success "Nginx service started successfully."
    else
        log_error "Nginx service failed to start."
        exit 1
    fi
    sleep 3
    if $COMPOSE ps nginx | grep -q "Up"; then
        log_success "Nginx service is running."
    else
        log_error "Nginx service is not running. Check logs."
        $COMPOSE logs nginx
        exit 1
    fi
}

show_info() {
    log_success "Deployment complete!"
    echo ""
    echo "📖 Site URL: http://localhost:8000"
    echo ""
    echo "🔧 Common commands:"
    echo "   View logs: $COMPOSE logs -f nginx"
    echo "   Stop service: $COMPOSE down"
    echo "   Restart service: $COMPOSE restart nginx"
    echo "   Health check: curl http://localhost:8000/health"
    echo ""
}

main() {
    echo "🚀 YC365 MkDocs Material Build & Deploy Script (auto compose compatible)"
    echo "==============================================================="
    echo ""
    detect_compose
    cleanup
    build_image
    build_site
    deploy
    show_info
}

trap 'log_error "Script failed. Check error messages."; exit 1' ERR

main "$@" 