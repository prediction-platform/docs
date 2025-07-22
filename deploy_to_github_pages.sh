#!/bin/bash

# YC365 MkDocs Material GitHub Pages 自动部署脚本
# 固定部署到: https://github.com/prediction-platform
# Usage: ./deploy_to_github_pages.sh [branch_name]
# Example: ./deploy_to_github_pages.sh main

set -e

# 固定仓库 URL
REPO_URL="https://github.com/prediction-platform"
BRANCH=${1:-"main"}

# 颜色定义
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }

# 检查依赖
check_dependencies() {
    log_info "检查依赖..."
    
    if ! command -v git &> /dev/null; then
        log_error "Git 未安装"
        exit 1
    fi
    
    if ! command -v mkdocs &> /dev/null; then
        log_info "MkDocs 未安装，尝试使用 Docker 构建..."
        if ! command -v docker &> /dev/null; then
            log_error "Docker 未安装，无法构建文档"
            exit 1
        fi
        USE_DOCKER=true
    else
        USE_DOCKER=false
    fi
    
    log_success "依赖检查通过"
}

# 构建静态站点
build_site() {
    log_info "构建 MkDocs 静态站点..."
    
    if [ "$USE_DOCKER" = true ]; then
        # 使用 Docker 构建
        if docker run --rm -v $(pwd):/docs mkdocs-material-template mkdocs build; then
            log_success "Docker 构建成功"
        else
            log_error "Docker 构建失败"
            exit 1
        fi
    else
        # 使用本地 MkDocs 构建
        if mkdocs build; then
            log_success "本地构建成功"
        else
            log_error "本地构建失败"
            exit 1
        fi
    fi
    
    if [ ! -d "site" ]; then
        log_error "site 目录未生成，构建可能失败"
        exit 1
    fi
    
    log_success "静态文件已生成在 site/ 目录"
}

# 准备部署
prepare_deploy() {
    # 创建临时目录
    TEMP_DIR=$(mktemp -d)
    
    # 复制静态文件到临时目录
    cp -r site/* "$TEMP_DIR/"
    
    # 添加 .nojekyll 文件（避免 GitHub Pages 的 Jekyll 处理）
    touch "$TEMP_DIR/.nojekyll"
    
    # 输出日志信息到 stderr，避免污染返回值
    log_info "准备部署到 GitHub Pages..." >&2
    log_info "使用临时目录: $TEMP_DIR" >&2
    
    # 返回临时目录路径
    echo "$TEMP_DIR"
}

# 部署到 GitHub Pages
deploy_to_github() {
    local temp_dir=$1
    
    log_info "部署到 GitHub Pages..."
    log_info "目标仓库: $REPO_URL"
    log_info "目标分支: gh-pages"
    
    # 保存当前目录
    local current_dir=$(pwd)
    
    # 进入临时目录
    cd "$temp_dir" || {
        log_error "无法进入临时目录: $temp_dir"
        exit 1
    }
    
    # 初始化 Git 仓库
    git init
    git config user.name "GitHub Actions"
    git config user.email "actions@github.com"
    
    # 添加所有文件
    git add .
    
    # 提交
    git commit -m "Deploy YC365 docs to GitHub Pages - $(date)"
    
    # 检查是否有 GitHub 个人访问令牌
    local github_token=""
    if [ -n "$GITHUB_TOKEN" ]; then
        github_token="$GITHUB_TOKEN"
    elif [ -f "$HOME/.github_token" ]; then
        github_token=$(cat "$HOME/.github_token")
    fi
    
    # 推送到 gh-pages 分支
    if [ -n "$github_token" ]; then
        log_info "使用 GitHub 个人访问令牌进行身份验证"
        if git push --force "https://${github_token}@github.com/prediction-platform.git" HEAD:gh-pages; then
            log_success "部署成功！"
        else
            log_error "推送失败，请检查："
            log_error "1. GitHub 个人访问令牌是否有效"
            log_error "2. 是否有推送权限到 prediction-platform 仓库"
            log_error "3. 仓库是否已启用 GitHub Pages"
            exit 1
        fi
    else
        log_info "尝试使用默认身份验证推送..."
        if git push --force "$REPO_URL" HEAD:gh-pages; then
            log_success "部署成功！"
        else
            log_error "推送失败，请检查："
            log_error "1. 是否有推送权限到 prediction-platform 仓库"
            log_error "2. 仓库是否已启用 GitHub Pages"
            log_error "3. 建议设置 GitHub 个人访问令牌："
            log_error "   - 访问 https://github.com/settings/tokens"
            log_error "   - 创建新的个人访问令牌（需要 repo 权限）"
            log_error "   - 设置环境变量: export GITHUB_TOKEN=your_token"
            log_error "   - 或创建文件: echo your_token > ~/.github_token"
            exit 1
        fi
    fi
    
    # 返回原目录
    cd "$current_dir" || {
        log_error "无法返回原目录: $current_dir"
        exit 1
    }
}

# 清理
cleanup() {
    local temp_dir=$1
    
    log_info "清理临时文件..."
    rm -rf "$temp_dir"
    log_success "清理完成"
}

# 显示部署信息
show_info() {
    log_success "GitHub Pages 部署完成！"
    echo ""
    echo "📖 部署信息:"
    echo "   仓库: $REPO_URL"
    echo "   分支: gh-pages"
    echo ""
    echo "🌐 访问地址:"
    echo "   https://prediction-platform.github.io"
    echo ""
    echo "⚠️  注意事项:"
    echo "   1. 确保仓库已启用 GitHub Pages"
    echo "   2. 在仓库设置中选择 gh-pages 分支作为源"
    echo "   3. 首次部署可能需要几分钟才能生效"
    echo "   4. 确保有推送权限到 prediction-platform 仓库"
    echo ""
}

# 主函数
main() {
    echo "🚀 YC365 MkDocs Material GitHub Pages 自动部署脚本"
    echo "================================================"
    echo ""
    echo "📦 目标仓库: $REPO_URL"
    echo "🌿 源分支: $BRANCH"
    echo ""
    
    check_dependencies
    build_site
    
    local temp_dir=$(prepare_deploy)
    
    # 设置错误处理
    trap 'cleanup "$temp_dir"; exit 1' ERR
    
    deploy_to_github "$temp_dir"
    cleanup "$temp_dir"
    show_info
}

# 执行主函数
main "$@" 