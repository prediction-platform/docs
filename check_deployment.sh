#!/bin/bash

# 检查 GitHub Pages 部署状态脚本

set -e

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

echo "🔍 GitHub Pages 部署状态检查"
echo "================================"

# 检查本地构建
check_local_build() {
    log_info "检查本地构建状态..."
    
    if [ ! -d "site" ]; then
        log_warning "site 目录不存在，尝试构建..."
        if command -v mkdocs &> /dev/null; then
            mkdocs build
            log_success "本地构建完成"
        else
            log_error "MkDocs 未安装，无法构建"
            return 1
        fi
    else
        log_success "site 目录存在"
    fi
    
    # 检查构建文件
    if [ -f "site/index.html" ]; then
        log_success "index.html 存在"
    else
        log_error "index.html 不存在，构建可能失败"
        return 1
    fi
}

# 检查 GitHub 仓库状态
check_github_repo() {
    log_info "检查 GitHub 仓库状态..."
    
    # 检查远程仓库
    if git remote get-url origin &> /dev/null; then
        local repo_url=$(git remote get-url origin)
        log_info "远程仓库: $repo_url"
        
        # 检查当前分支
        local current_branch=$(git branch --show-current)
        log_info "当前分支: $current_branch"
        
        # 检查是否有未提交的更改
        if [ -n "$(git status --porcelain)" ]; then
            log_warning "有未提交的更改"
            git status --short
        else
            log_success "工作目录干净"
        fi
    else
        log_error "未配置远程仓库"
        return 1
    fi
}

# 检查 GitHub Pages 配置
check_github_pages() {
    log_info "检查 GitHub Pages 配置..."
    
    echo ""
    echo "📋 GitHub Pages 配置检查清单:"
    echo "1. 进入仓库设置: https://github.com/prediction-platform/settings"
    echo "2. 找到 'Pages' 选项"
    echo "3. Source 应设置为 'GitHub Actions'"
    echo "4. 确保仓库已启用 Pages 功能"
    echo ""
    
    log_info "访问地址: https://prediction-platform.github.io"
}

# 检查工作流文件
check_workflows() {
    log_info "检查 GitHub Actions 工作流..."
    
    if [ -f ".github/workflows/deploy.yml" ]; then
        log_success "主部署工作流存在"
    else
        log_error "主部署工作流不存在"
    fi
    
    if [ -f ".github/workflows/quick-deploy.yml" ]; then
        log_success "快速部署工作流存在"
    else
        log_warning "快速部署工作流不存在"
    fi
}

# 检查依赖文件
check_dependencies() {
    log_info "检查项目依赖..."
    
    if [ -f "mkdocs.yml" ]; then
        log_success "mkdocs.yml 配置存在"
    else
        log_error "mkdocs.yml 配置不存在"
    fi
    
    if [ -f "requirements.txt" ]; then
        log_success "requirements.txt 存在"
    else
        log_warning "requirements.txt 不存在"
    fi
    
    if [ -d "docs" ]; then
        log_success "docs 目录存在"
        local doc_count=$(find docs -name "*.md" | wc -l)
        log_info "文档文件数量: $doc_count"
    else
        log_error "docs 目录不存在"
    fi
}

# 显示部署信息
show_deployment_info() {
    echo ""
    echo "🚀 部署信息:"
    echo "=============="
    echo "仓库: https://github.com/prediction-platform"
    echo "Pages URL: https://prediction-platform.github.io"
    echo "Actions: https://github.com/prediction-platform/actions"
    echo ""
    echo "📝 下一步操作:"
    echo "1. 推送代码到 main 分支触发自动部署"
    echo "2. 在 Actions 标签页查看部署进度"
    echo "3. 等待几分钟后访问 Pages URL"
    echo ""
}

# 主函数
main() {
    check_dependencies
    check_local_build
    check_github_repo
    check_workflows
    check_github_pages
    show_deployment_info
    
    log_success "检查完成！"
}

# 执行主函数
main "$@" 