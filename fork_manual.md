# Fork 仓库到 typhfeng 账户

## 方法 1: 使用 GitHub CLI

### 步骤 1: 登录 GitHub CLI（使用 typhfeng 账户）

```bash
gh auth login
```

选择：
- GitHub.com
- HTTPS
- 选择认证方式（浏览器或 token）

### 步骤 2: Fork 仓库

```bash
gh repo fork https://github.com/ZhuLinsen/daily_stock_analysis --clone=false
```

## 方法 2: 使用 GitHub Web 界面

1. 访问：https://github.com/ZhuLinsen/daily_stock_analysis
2. 点击右上角的 "Fork" 按钮
3. 选择 `typhfeng` 账户作为目标
4. 点击 "Create fork"

## 方法 3: 使用 GitHub API（需要 Personal Access Token）

```bash
# 设置 token（需要 typhfeng 账户的 token）
export GITHUB_TOKEN="your_personal_access_token"

# Fork 仓库
curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/ZhuLinsen/daily_stock_analysis/forks
```

## 验证 Fork 是否成功

Fork 成功后，访问：
https://github.com/typhfeng/daily_stock_analysis

## 添加 Fork 为远程仓库

```bash
git remote add fork https://github.com/typhfeng/daily_stock_analysis.git
git remote -v
```
