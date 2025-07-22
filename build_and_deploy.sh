#!/bin/bash

# MkDocs Material 构建和部署脚本
# 使用方法: ./build_and_deploy.sh

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查依赖
check_dependencies() {
    log_info "检查依赖..."
    
    if ! command -v docker &> /dev/null; then
        log_error "Docker 未安装，请先安装 Docker"
        exit 1
    fi
    
    if ! command -v docker-compose &> /dev/null; then
        log_error "Docker Compose 未安装，请先安装 Docker Compose"
        exit 1
    fi
    
    log_success "依赖检查通过"
}

# 清理旧容器和镜像
cleanup() {
    log_info "清理旧容器和镜像..."
    
    # 停止并删除旧容器
    docker-compose down --remove-orphans 2>/dev/null || true
    
    # 删除旧镜像（可选）
    if docker images | grep -q "mkdocs-material-template"; then
        docker rmi mkdocs-material-template 2>/dev/null || true
    fi
    
    log_success "清理完成"
}

# 构建 Docker 镜像
build_image() {
    log_info "构建 Docker 镜像..."
    
    if docker build -t mkdocs-material-template .; then
        log_success "Docker 镜像构建成功"
    else
        log_error "Docker 镜像构建失败"
        exit 1
    fi
}

# 构建 MkDocs 静态站点
build_site() {
    log_info "构建 MkDocs 静态站点..."
    
    # 使用 docker-compose 构建静态站点
    if docker-compose --profile build run --rm mkdocs-build; then
        log_success "静态站点构建成功"
    else
        log_error "静态站点构建失败"
        exit 1
    fi
    
    # 检查 site 目录是否存在
    if [ ! -d "site" ]; then
        log_error "site 目录未生成，构建可能失败"
        exit 1
    fi
    
    log_success "静态文件已生成在 site/ 目录"
}

# 启动服务
deploy() {
    log_info "启动服务..."
    
    if docker-compose up -d; then
        log_success "服务启动成功"
    else
        log_error "服务启动失败"
        exit 1
    fi
    
    # 等待服务启动
    sleep 3
    
    # 检查服务状态
    if docker-compose ps | grep -q "Up"; then
        log_success "所有服务运行正常"
    else
        log_error "服务启动异常，请检查日志"
        docker-compose logs
        exit 1
    fi
}

# 显示访问信息
show_info() {
    log_success "部署完成！"
    echo ""
    echo "📖 文档站点访问地址:"
    echo "   http://localhost:8000"
    echo ""
    echo "🔧 常用命令:"
    echo "   查看日志: docker-compose logs -f"
    echo "   停止服务: docker-compose down"
    echo "   重启服务: docker-compose restart"
    echo ""
}

# 主函数
main() {
    echo "🚀 MkDocs Material 构建和部署脚本"
    echo "=================================="
    echo ""
    
    check_dependencies
    cleanup
    build_image
    build_site
    deploy
    show_info
}

# 错误处理
trap 'log_error "脚本执行失败，请检查错误信息"; exit 1' ERR

# 执行主函数
main "$@" 