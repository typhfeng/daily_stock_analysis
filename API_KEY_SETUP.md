# 🔑 API Key 配置指南

## 快速开始

### 1. 创建配置文件

```bash
cp .env.example .env
```

### 2. 编辑配置文件

```bash
nano .env
# 或使用你喜欢的编辑器
```

---

## 📋 必填配置项

### ✅ 1. 股票列表（必填）

```bash
STOCK_LIST=600519,300750,002594
```

**说明**：
- 支持 A股、港股、美股
- A股：`600519`（沪市）、`000001`（深市）、`300750`（创业板）
- 港股：`hk00700`（腾讯）、`hk03690`（美团）
- 美股：`AAPL`（苹果）、`TSLA`（特斯拉）

### ✅ 2. AI 模型配置（至少配置一个）

#### 方案 A：使用 Gemini（推荐，免费额度）

1. 访问：https://aistudio.google.com/
2. 登录 Google 账号
3. 点击 "Get API Key" 创建 API Key
4. 复制 API Key 到 `.env` 文件：

```bash
GEMINI_API_KEY=your_gemini_api_key_here
```

#### 方案 B：使用 OpenAI 兼容 API

**OpenAI 官方**：
```bash
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxx
```

**DeepSeek（国产，便宜）**：
```bash
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxx
OPENAI_BASE_URL=https://api.deepseek.com/v1
OPENAI_MODEL=deepseek-chat
```

**通义千问**：
```bash
OPENAI_API_KEY=your_api_key
OPENAI_BASE_URL=https://dashscope.aliyuncs.com/compatible-mode/v1
OPENAI_MODEL=qwen-turbo
```

---

## 🔍 推荐配置项

### 3. 搜索引擎 API（用于新闻搜索）

#### Tavily（推荐，每月 1000 次免费）

1. 访问：https://tavily.com/
2. 注册账号并获取 API Key
3. 配置：

```bash
TAVILY_API_KEYS=your_tavily_key_here
```

#### SerpAPI（备用）

1. 访问：https://serpapi.com/
2. 注册账号并获取 API Key
3. 配置：

```bash
SERPAPI_API_KEYS=your_serpapi_key_here
```

---

## 📢 通知渠道配置（至少配置一个）

### 方式 1：企业微信

1. 在企业微信群中：设置 → 群机器人 → 添加机器人
2. 复制 Webhook URL
3. 配置：

```bash
WECHAT_WEBHOOK_URL=https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=your_key
```

### 方式 2：飞书

1. 在飞书群中：设置 → 群机器人 → 添加机器人 → 自定义机器人
2. 复制 Webhook URL
3. 配置：

```bash
FEISHU_WEBHOOK_URL=https://open.feishu.cn/open-apis/bot/v2/hook/your_key
```

### 方式 3：Telegram

1. 在 Telegram 找 `@BotFather`，发送 `/newbot` 创建机器人
2. 获取 Bot Token
3. 获取 Chat ID：发消息给 `@userinfobot` 或访问：
   ```
   https://api.telegram.org/bot<your_token>/getUpdates
   ```
4. 配置：

```bash
TELEGRAM_BOT_TOKEN=123456789:ABCdefGHIjklMNOpqrsTUVwxyz
TELEGRAM_CHAT_ID=123456789
```

### 方式 4：邮件

1. 获取邮箱授权码（以 QQ 邮箱为例）：
   - 设置 → 账户 → POP3/SMTP服务 → 开启 → 获取授权码
2. 配置：

```bash
EMAIL_SENDER=your_email@qq.com
EMAIL_PASSWORD=your_email_auth_code
EMAIL_RECEIVERS=receiver@example.com  # 可选，留空则发给自己
```

### 方式 5：自定义 Webhook（钉钉、Discord 等）

```bash
CUSTOM_WEBHOOK_URLS=https://oapi.dingtalk.com/robot/send?access_token=xxx
```

---

## 📊 可选配置项

### Tushare Token（数据源）

1. 访问：https://tushare.pro/
2. 注册并获取 Token
3. 配置：

```bash
TUSHARE_TOKEN=your_tushare_token
```

---

## 🎯 最小配置示例

如果你想快速开始，最少需要配置：

```bash
# 1. 股票列表（必填）
STOCK_LIST=600519,000001

# 2. AI 模型（至少一个）
GEMINI_API_KEY=your_gemini_api_key_here

# 3. 通知渠道（至少一个）
TELEGRAM_BOT_TOKEN=your_bot_token
TELEGRAM_CHAT_ID=your_chat_id

# 4. 搜索引擎（推荐）
TAVILY_API_KEYS=your_tavily_key
```

---

## ✅ 验证配置

运行程序检查配置：

```bash
source venv/bin/activate
python main.py --no-notify
```

如果看到警告信息，说明对应功能未配置，但不影响基本运行。

---

## 🔗 获取 API Key 的链接

- **Gemini API**: https://aistudio.google.com/
- **OpenAI API**: https://platform.openai.com/api-keys
- **DeepSeek**: https://platform.deepseek.com/
- **Tavily**: https://tavily.com/
- **SerpAPI**: https://serpapi.com/
- **Tushare**: https://tushare.pro/

---

## 💡 提示

1. **安全提示**：`.env` 文件包含敏感信息，不要提交到 Git
2. **多 Key 支持**：某些 API 支持配置多个 Key（逗号分隔），系统会自动轮换
3. **免费额度**：Gemini 和 Tavily 都有免费额度，个人使用通常足够
