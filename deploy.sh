#!/bin/bash

# MkDocs Material 部署脚本
# 使用方法: ./deploy.sh

set -e

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查 site 目录
check_site() {
    if [ ! -d "site" ]; then
        log_error "site 目录不存在，请先运行构建脚本"
        exit 1
    fi
    
    if [ ! -f "site/index.html" ]; then
        log_error "site/index.html 不存在，构建可能失败"
        exit 1
    fi
    
    log_success "site 目录检查通过"
}

# 启动服务
start_services() {
    log_info "启动 Nginx 服务..."
    
    if docker-compose up -d nginx; then
        log_success "Nginx 服务启动成功"
    else
        log_error "Nginx 服务启动失败"
        exit 1
    fi
    
    # 等待服务启动
    sleep 2
    
    # 检查服务状态
    if docker-compose ps nginx | grep -q "Up"; then
        log_success "Nginx 服务运行正常"
    else
        log_error "Nginx 服务启动异常，请检查日志"
        docker-compose logs nginx
        exit 1
    fi
}

# 显示信息
show_info() {
    log_success "部署完成！"
    echo ""
    echo "📖 文档站点访问地址:"
    echo "   http://localhost:8000"
    echo ""
    echo "🔧 常用命令:"
    echo "   查看日志: docker-compose logs -f nginx"
    echo "   停止服务: docker-compose down"
    echo "   重启服务: docker-compose restart nginx"
    echo "   健康检查: curl http://localhost:8000/health"
    echo ""
}

# 主函数
main() {
    echo "🚀 MkDocs Material 部署脚本"
    echo "=========================="
    echo ""
    
    check_site
    start_services
    show_info
}

# 错误处理
trap 'log_error "脚本执行失败，请检查错误信息"; exit 1' ERR

# 执行主函数
main "$@" 