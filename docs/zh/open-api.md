# 开放 API (Open API)

## 概览

YC365 提供全面的开放 API，使开发人员能够将预测市场功能集成到他们的应用程序中，构建自定义交易界面，并访问实时市场数据。我们的 API 专为开发人员体验而设计，提供具有全面文档和 SDK 支持的 RESTful 端点。

## API 功能

### 🔌 **核心能力**
- **市场数据**：实时价格源、成交量和市场统计数据
- **交易操作**：下达订单、管理头寸和执行交易
- **用户管理**：账户信息、余额和交易历史
- **事件管理**：创建、监控和解决预测市场
- **WebSocket 支持**：用于实时更新的实时数据流

### 🛡️ **安全与认证**
- **API 密钥认证**：使用 API 密钥的安全访问
- **速率限制**：确保平台稳定性的公平使用政策
- **请求签名**：加密请求验证
- **IP 白名单**：通过 IP 限制增强安全性

## 入门指南

### 1. API 访问

#### **注册流程**
1. **创建账户**：注册 YC365 账户
2. **API 密钥生成**：在仪表板中生成您的 API 密钥
3. **文档访问**：访问全面的 API 文档
4. **测试环境**：使用沙盒环境进行开发

#### **API 密钥管理**
- **主密钥**：完全访问所有 API 端点
- **只读密钥**：仅限于数据检索操作
- **自定义范围**：细粒度的权限控制
- **密钥轮换**：定期密钥更新以增强安全性

### 2. 基础配置

#### **基础 URL**
```
生产环境: https://api.yc365.io/v1
沙盒环境: https://api-sandbox.yc365.io/v1
WebSocket: wss://ws.yc365.io/v1
```

#### **认证标头**
```http
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
X-API-Version: 1.0
```

## API 端点

### 📊 **市场数据**

#### **获取所有市场**
```http
GET /markets
```

**响应:**
```json
{
  "success": true,
  "data": [
    {
      "id": "market_001",
      "title": "比特币会在 2024 年底达到 100,000 美元吗？",
      "category": "cryptocurrency",
      "status": "active",
      "end_time": "2024-12-31T23:59:59Z",
      "yes_price": 0.65,
      "no_price": 0.35,
      "volume_24h": 125000,
      "liquidity": 500000
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 50,
    "total": 150
  }
}
```

#### **获取市场详情**
```http
GET /markets/{market_id}
```

**参数:**
- `market_id` (string): 唯一市场标识符

**响应:**
```json
{
  "success": true,
  "data": {
    "id": "market_001",
    "title": "比特币会在 2024 年底达到 100,000 美元吗？",
    "description": "如果比特币在 2024 年 12 月 31 日达到或超过 100,000 美元，该市场将决议为 YES。",
    "category": "cryptocurrency",
    "status": "active",
    "created_at": "2024-01-15T10:30:00Z",
    "end_time": "2024-12-31T23:59:59Z",
    "resolution_criteria": "来自 CoinGecko 的价格数据",
    "yes_price": 0.65,
    "no_price": 0.35,
    "volume_24h": 125000,
    "liquidity": 500000,
    "trading_fee": 0.0015,
    "tags": ["bitcoin", "price", "cryptocurrency"]
  }
}
```

#### **获取市场历史**
```http
GET /markets/{market_id}/history
```

**参数:**
- `market_id` (string): 市场标识符
- `interval` (string): 时间间隔 (1m, 5m, 1h, 1d)
- `start_time` (string): 开始时间 (ISO 8601)
- `end_time` (string): 结束时间 (ISO 8601)

**响应:**
```json
{
  "success": true,
  "data": [
    {
      "timestamp": "2024-01-15T10:00:00Z",
      "yes_price": 0.62,
      "no_price": 0.38,
      "volume": 5000,
      "trades": 25
    }
  ]
}
```

### 💰 **交易操作**

#### **下订单**
```http
POST /orders
```

**请求体:**
```json
{
  "market_id": "market_001",
  "side": "buy",
  "outcome": "yes",
  "amount": 1000,
  "price": 0.65,
  "order_type": "limit"
}
```

**响应:**
```json
{
  "success": true,
  "data": {
    "order_id": "order_12345",
    "status": "pending",
    "market_id": "market_001",
    "side": "buy",
    "outcome": "yes",
    "amount": 1000,
    "price": 0.65,
    "filled_amount": 0,
    "remaining_amount": 1000,
    "created_at": "2024-01-15T10:30:00Z"
  }
}
```

#### **获取订单状态**
```http
GET /orders/{order_id}
```

**响应:**
```json
{
  "success": true,
  "data": {
    "order_id": "order_12345",
    "status": "filled",
    "market_id": "market_001",
    "side": "buy",
    "outcome": "yes",
    "amount": 1000,
    "price": 0.65,
    "filled_amount": 1000,
    "remaining_amount": 0,
    "created_at": "2024-01-15T10:30:00Z",
    "filled_at": "2024-01-15T10:31:15Z",
    "trades": [
      {
        "trade_id": "trade_67890",
        "amount": 1000,
        "price": 0.65,
        "timestamp": "2024-01-15T10:31:15Z"
      }
    ]
  }
}
```

#### **取消订单**
```http
DELETE /orders/{order_id}
```

**响应:**
```json
{
  "success": true,
  "data": {
    "order_id": "order_12345",
    "status": "cancelled",
    "message": "订单已成功取消"
  }
}
```

### 👤 **用户管理**

#### **获取账户余额**
```http
GET /account/balance
```

**响应:**
```json
{
  "success": true,
  "data": {
    "total_balance": 10000,
    "available_balance": 8500,
    "locked_balance": 1500,
    "currency": "USDT",
    "positions": [
      {
        "market_id": "market_001",
        "outcome": "yes",
        "amount": 1000,
        "average_price": 0.65,
        "unrealized_pnl": 150
      }
    ]
  }
}
```

#### **获取交易历史**
```http
GET /account/transactions
```

**参数:**
- `type` (string): 交易类型 (deposit, withdrawal, trade, fee)
- `start_date` (string): 开始日期 (ISO 8601)
- `end_date` (string): 结束日期 (ISO 8601)
- `page` (integer): 页码
- `limit` (integer): 每页条目数

**响应:**
```json
{
  "success": true,
  "data": [
    {
      "transaction_id": "tx_12345",
      "type": "trade",
      "amount": 1000,
      "currency": "USDT",
      "description": "购买 market_001 的 YES 代币",
      "timestamp": "2024-01-15T10:31:15Z",
      "status": "completed"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 50,
    "total": 200
  }
}
```

### 🎯 **事件管理**

#### **创建市场提案**
```http
POST /markets/proposals
```

**请求体:**
```json
{
  "title": "以太坊会在 2024 年第二季度达到 5,000 美元吗？",
  "description": "如果以太坊在 2024 年 6 月 30 日达到或超过 5,000 美元，该市场将决议为 YES。",
  "category": "cryptocurrency",
  "end_time": "2024-06-30T23:59:59Z",
  "resolution_criteria": "来自 CoinGecko 的价格数据",
  "tags": ["ethereum", "price", "cryptocurrency"]
}
```

**响应:**
```json
{
  "success": true,
  "data": {
    "proposal_id": "prop_12345",
    "status": "pending_review",
    "title": "以太坊会在 2024 年第二季度达到 5,000 美元吗？",
    "created_at": "2024-01-15T10:30:00Z",
    "estimated_review_time": "2-3 个工作日"
  }
}
```

## WebSocket API

### 🔌 **实时数据流**

#### **连接**
```javascript
const ws = new WebSocket('wss://ws.yc365.io/v1');
```

#### **认证**
```javascript
ws.onopen = function() {
  ws.send(JSON.stringify({
    type: 'auth',
    api_key: 'YOUR_API_KEY'
  }));
};
```

#### **订阅市场更新**
```javascript
ws.send(JSON.stringify({
  type: 'subscribe',
  channel: 'market_updates',
  market_id: 'market_001'
}));
```

#### **消息格式**
```json
{
  "type": "market_update",
  "market_id": "market_001",
  "data": {
    "yes_price": 0.67,
    "no_price": 0.33,
    "volume_24h": 130000,
    "timestamp": "2024-01-15T10:35:00Z"
  }
}
```

## SDK 支持

### 📚 **可用 SDK**

#### **JavaScript/Node.js**
```bash
npm install yc365-sdk
```

```javascript
const YC365 = require('yc365-sdk');

const client = new YC365({
  apiKey: 'YOUR_API_KEY',
  environment: 'sandbox' // 或 'production'
});

// 获取市场
const markets = await client.markets.getAll();

// 下订单
const order = await client.orders.create({
  market_id: 'market_001',
  side: 'buy',
  outcome: 'yes',
  amount: 1000,
  price: 0.65
});
```

#### **Python**
```bash
pip install yc365-sdk
```

```python
from yc365 import YC365Client

client = YC365Client(
    api_key='YOUR_API_KEY',
    environment='sandbox'
)

# 获取市场
markets = client.markets.get_all()

# 下订单
order = client.orders.create(
    market_id='market_001',
    side='buy',
    outcome='yes',
    amount=1000,
    price=0.65
)
```

#### **Go**
```bash
go get github.com/yc365/go-sdk
```

```go
package main

import (
    "github.com/yc365/go-sdk"
)

func main() {
    client := yc365.NewClient("YOUR_API_KEY", "sandbox")
    
    // 获取市场
    markets, err := client.Markets.GetAll()
    
    // 下订单
    order, err := client.Orders.Create(yc365.CreateOrderRequest{
        MarketID: "market_001",
        Side:     "buy",
        Outcome:  "yes",
        Amount:   1000,
        Price:    0.65,
    })
}
```

## 速率限制

### ⚡ **速率限制政策**

| 端点类型 | 速率限制 | 突发限制 |
|---------------|------------|-------------|
| **市场数据** | 100 请求/分钟 | 200 请求/分钟 |
| **交易操作** | 50 请求/分钟 | 100 请求/分钟 |
| **用户管理** | 30 请求/分钟 | 60 请求/分钟 |
| **WebSocket** | 10 连接 | 20 连接 |

### 📊 **速率限制标头**
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1642234567
```

## 错误处理

### ❌ **错误响应格式**
```json
{
  "success": false,
  "error": {
    "code": "INVALID_PARAMETER",
    "message": "提供的 market_id 无效",
    "details": {
      "field": "market_id",
      "value": "invalid_id",
      "expected": "string"
    }
  },
  "request_id": "req_12345"
}
```

### 🔢 **错误代码**

| 代码 | 描述 | HTTP 状态 |
|------|-------------|-------------|
| `INVALID_PARAMETER` | 无效的请求参数 | 400 |
| `UNAUTHORIZED` | 无效或缺失 API 密钥 | 401 |
| `FORBIDDEN` | 权限不足 | 403 |
| `NOT_FOUND` | 未找到资源 | 404 |
| `RATE_LIMITED` | 超过速率限制 | 429 |
| `INTERNAL_ERROR` | 服务器错误 | 500 |
| `MARKET_CLOSED` | 市场不可交易 | 400 |
| `INSUFFICIENT_BALANCE` | 余额不足以进行操作 | 400 |
| `ORDER_NOT_FOUND` | 订单不存在 | 404 |

## 测试与开发

### 🧪 **沙盒环境**

#### **功能**
- **测试数据**：用于测试的真实市场数据
- **虚拟资金**：用于开发的无限测试 USDT
- **完全 API 访问**：所有生产端点可用
- **WebSocket 支持**：实时数据流

#### **入门指南**
1. **注册**：创建沙盒账户
2. **生成 API 密钥**：获取您的沙盒 API 密钥
3. **开始测试**：使用沙盒端点进行开发
4. **监控使用**：跟踪 API 使用和性能

### 📝 **API 测试工具**

#### **Postman 集合**
- **下载**：提供完整的 Postman 集合
- **环境变量**：预配置的环境
- **示例**：所有端点的示例请求
- **文档**：集成 API 文档

#### **cURL 示例**
```bash
# 获取所有市场
curl -X GET "https://api-sandbox.yc365.io/v1/markets" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json"

# 下订单
curl -X POST "https://api-sandbox.yc365.io/v1/orders" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "market_id": "market_001",
    "side": "buy",
    "outcome": "yes",
    "amount": 1000,
    "price": 0.65
  }'
```

## 最佳实践

### 💡 **开发指南**

#### **API 使用**
- **使用 HTTPS**：始终使用安全连接
- **处理错误**：实施适当的错误处理
- **速率限制**：遵守速率限制并实施退避
- **缓存**：适当时缓存市场数据
- **WebSockets**：使用 WebSockets 获取实时数据

#### **安全**
- **API 密钥保护**：切勿在客户端代码中暴露 API 密钥
- **请求签名**：对敏感操作使用请求签名
- **IP 白名单**：将 API 访问限制为已知 IP 地址
- **密钥轮换**：定期轮换 API 密钥

#### **性能**
- **连接池**：重用 HTTP 连接
- **批量操作**：可用时使用批量端点
- **分页**：对大型数据集实施适当的分页
- **监控**：监控 API 使用和性能

## 支持与资源

### 🆘 **开发者支持**

#### **文档**
- **API 参考**：完整的端点文档
- **SDK 文档**：特定语言指南
- **代码示例**：示例实现
- **教程**：分步集成指南

#### **社区**
- **开发者论坛**：社区支持和讨论
- **GitHub**：开源 SDK 和示例
- **Discord**：实时开发者聊天
- **Stack Overflow**：标记的问题和答案

#### **支持渠道**
- **电子邮件**：api-support@yc365.io
- **实时聊天**：全天候提供 API 问题支持
- **优先支持**：为企业客户提供专门支持

### 📞 **联系信息**

有关 API 相关的支持，请联系：
- **电子邮件**：api-support@yc365.io
- **实时聊天**：平台全天候可用
- **Telegram**：@YC365DevSupport
- **Discord**：YC365 开发者服务器

---

**立即开始使用 YC365 API 进行构建！** 我们全面的 API 和 SDK 支持使您可以轻松地将预测市场功能集成到您的应用程序中。

*加入成千上万已经在 YC365 平台上构建创新应用程序的开发人员。*
