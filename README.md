# YC365 Documentation Site

YC365 documentation site built with MkDocs Material, with automatic deployment to GitHub Pages.

## 🚀 Automatic Deployment

This project is configured with GitHub Actions workflow for automatic build and deployment:

### Trigger Conditions
- Push to `main` or `master` branch
- Pull Request creation
- Manual trigger (workflow_dispatch)

### Deployment Process
1. **Build Stage**:
   - Checkout code
   - Set up Python 3.9 environment
   - Install MkDocs dependencies
   - Build static site
   - Upload build artifacts

2. **Deploy Stage**:
   - Deploy to GitHub Pages
   - Automatically configure HTTPS
   - Provide deployment URL

## 📁 Project Structure

```
mkdocs-material-template/
├── .github/workflows/     # GitHub Actions workflows
├── docs/                  # Documentation source files
│   ├── index.md          # Home page
│   ├── terms-of-use.md   # Terms of Use
│   ├── get-started/      # Getting Started guide
│   └── ...               # Other documentation
├── site/                  # Build output (auto-generated)
├── mkdocs.yml            # MkDocs configuration
├── requirements.txt       # Python dependencies
└── README.md             # Project documentation
```

## 🛠️ Local Development

### Requirements
- Python 3.9+
- Git

### Install Dependencies
```bash
pip install -r requirements.txt
```

### Local Build
```bash
# Build static site
mkdocs build

# Local preview
mkdocs serve
```

### Using Docker
```bash
# Build image
docker build -t mkdocs-material-template .

# Build site
docker run --rm -v $(pwd):/docs mkdocs-material-template mkdocs build

# Local preview
docker run --rm -p 8000:8000 -v $(pwd):/docs mkdocs-material-template mkdocs serve -a 0.0.0.0:8000
```

## 📝 Adding New Pages

1. **Create Markdown File**:
   ```bash
   # Create new file in docs/ directory
   touch docs/new-page.md
   ```

2. **Edit Content**:
   ```markdown
   # New Page Title
   
   Page content goes here...
   ```

3. **Add to Navigation**:
   Edit `mkdocs.yml` file:
   ```yaml
   nav:
     - Home: index.md
     - New Page: new-page.md
   ```

4. **Multi-level Navigation**:
   ```yaml
   nav:
     - Home: index.md
     - Getting Started:
       - Overview: get-started/index.md
       - What is YC365: what-is-yc365.md
       - How to Sign Up: how-to-sign-up.md
   ```

## 🎨 Page Styling

### Using MkDocs Material Features

1. **Admonitions**:
   ```markdown
   !!! note "Note"
       This is a note message.

   !!! warning "Warning"
       This is a warning message.

   !!! danger "Danger"
       This is a danger message.
   ```

2. **Code Blocks**:
   ```markdown
   ```python
   def hello_world():
       print("Hello, World!")
   ```
   ```

3. **Tables**:
   ```markdown
   | Feature | Description | Status |
   |---------|-------------|--------|
   | Prediction Markets | Users can create and participate in predictions | ✅ |
   | Liquidity Mining | Earn rewards by providing liquidity | ✅ |
   ```

## 🔧 Configuration

### mkdocs.yml Main Configuration
- `site_name`: Site name
- `theme`: Using Material theme
- `nav`: Navigation structure
- `plugins`: Enabled plugins
- `markdown_extensions`: Markdown extensions

### GitHub Pages Configuration
1. Go to repository Settings
2. Find Pages section
3. Set Source to "GitHub Actions"
4. Save settings

## 🌐 Access URLs

After deployment, documentation will be available at:
- **GitHub Pages**: [https://prediction-platform.github.io/docs](https://prediction-platform.github.io/docs/)
- **Custom Domain**: Can be configured in repository settings

## 📊 Deployment Status

Check deployment status:
1. Go to repository Actions tab
2. View "Deploy to GitHub Pages" workflow
3. Check build and deployment logs

## 🔍 Troubleshooting

### Common Issues

1. **Build Failure**:
   - Check Python version (requires 3.9+)
   - Verify dependency installation
   - Review build logs

2. **Deployment Failure**:
   - Confirm repository permission settings
   - Check GitHub Pages configuration
   - Verify workflow permissions

3. **Page Not Displaying**:
   - Wait a few minutes (first deployment takes time)
   - Check GitHub Pages settings
   - Verify branch name

### Manual Deployment

If manual deployment is needed, use the provided script:
```bash
./deploy_to_github_pages.sh
```

## 🤝 Contributing

1. Fork the project
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License.
