# YC365 Documentation Site

基于 MkDocs Material 的 YC365 文档站点，支持自动部署到 GitHub Pages。

## 🚀 自动部署

本项目配置了 GitHub Actions 工作流，实现自动构建和部署：

### 触发条件
- 推送到 `main` 或 `master` 分支
- 创建 Pull Request
- 手动触发（workflow_dispatch）

### 部署流程
1. **构建阶段**：
   - 检出代码
   - 设置 Python 3.9 环境
   - 安装 MkDocs 依赖
   - 构建静态站点
   - 上传构建产物

2. **部署阶段**：
   - 部署到 GitHub Pages
   - 自动配置 HTTPS
   - 提供部署 URL

## 📁 项目结构

```
mkdocs-material-template/
├── .github/workflows/     # GitHub Actions 工作流
├── docs/                  # 文档源文件
│   ├── index.md          # 首页
│   ├── terms-of-use.md   # 使用条款
│   ├── get-started/      # 入门指南
│   └── ...               # 其他文档
├── site/                  # 构建输出（自动生成）
├── mkdocs.yml            # MkDocs 配置
├── requirements.txt       # Python 依赖
└── README.md             # 项目说明
```

## 🛠️ 本地开发

### 环境要求
- Python 3.9+
- Git

### 安装依赖
```bash
pip install -r requirements.txt
```

### 本地构建
```bash
# 构建静态站点
mkdocs build

# 本地预览
mkdocs serve
```

### 使用 Docker
```bash
# 构建镜像
docker build -t mkdocs-material-template .

# 构建站点
docker run --rm -v $(pwd):/docs mkdocs-material-template mkdocs build

# 本地预览
docker run --rm -p 8000:8000 -v $(pwd):/docs mkdocs-material-template mkdocs serve -a 0.0.0.0:8000
```

## 📝 添加新页面

1. **创建 Markdown 文件**：
   ```bash
   # 在 docs/ 目录下创建新文件
   touch docs/new-page.md
   ```

2. **编辑内容**：
   ```markdown
   # 新页面标题
   
   这里是页面内容...
   ```

3. **添加到导航**：
   编辑 `mkdocs.yml` 文件：
   ```yaml
   nav:
     - 首页: index.md
     - 新页面: new-page.md
   ```

4. **多级导航**：
   ```yaml
   nav:
     - 首页: index.md
     - 入门指南:
       - 概述: get-started/index.md
       - 什么是 YC365: what-is-yc365.md
       - 如何注册: how-to-sign-up.md
   ```

## 🎨 美化页面

### 使用 MkDocs Material 功能

1. **警告框**：
   ```markdown
   !!! note "提示"
       这是一个提示信息。

   !!! warning "警告"
       这是一个警告信息。

   !!! danger "危险"
       这是一个危险信息。
   ```

2. **代码块**：
   ```markdown
   ```python
   def hello_world():
       print("Hello, World!")
   ```
   ```

3. **表格**：
   ```markdown
   | 功能 | 描述 | 状态 |
   |------|------|------|
   | 预测市场 | 用户可创建和参与预测 | ✅ |
   | 流动性挖矿 | 提供流动性获得奖励 | ✅ |
   ```

## 🔧 配置说明

### mkdocs.yml 主要配置
- `site_name`: 站点名称
- `theme`: 使用 Material 主题
- `nav`: 导航结构
- `plugins`: 启用的插件
- `markdown_extensions`: Markdown 扩展

### GitHub Pages 配置
1. 进入仓库设置 (Settings)
2. 找到 Pages 选项
3. Source 选择 "GitHub Actions"
4. 保存设置

## 🌐 访问地址

部署完成后，文档将在以下地址可用：
- **GitHub Pages**: [https://prediction-platform.github.io/docs](https://prediction-platform.github.io/docs/)
- **自定义域名**: 可在仓库设置中配置

## 📊 部署状态

查看部署状态：
1. 进入仓库的 Actions 标签页
2. 查看 "Deploy to GitHub Pages" 工作流
3. 查看构建和部署日志

## 🔍 故障排除

### 常见问题

1. **构建失败**：
   - 检查 Python 版本 (需要 3.9+)
   - 验证依赖安装
   - 查看构建日志

2. **部署失败**：
   - 确认仓库权限设置
   - 检查 GitHub Pages 配置
   - 验证工作流权限

3. **页面不显示**：
   - 等待几分钟（首次部署需要时间）
   - 检查 GitHub Pages 设置
   - 验证分支名称

### 手动部署

如果需要手动部署，可以使用提供的脚本：
```bash
./deploy_to_github_pages.sh
```

## 🤝 贡献

1. Fork 项目
2. 创建功能分支
3. 提交更改
4. 推送到分支
5. 创建 Pull Request

## 📄 许可证

本项目采用 MIT 许可证。
