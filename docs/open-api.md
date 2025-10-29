# Open API

## Overview

YC365 provides a comprehensive Open API that enables developers to integrate prediction market functionality into their applications, build custom trading interfaces, and access real-time market data. Our API is designed with developer experience in mind, offering RESTful endpoints with comprehensive documentation and SDK support.

## API Features

### 🔌 **Core Capabilities**
- **Market Data**: Real-time price feeds, volume, and market statistics
- **Trading Operations**: Place orders, manage positions, and execute trades
- **User Management**: Account information, balances, and transaction history
- **Event Management**: Create, monitor, and resolve prediction markets
- **WebSocket Support**: Real-time data streaming for live updates

### 🛡️ **Security & Authentication**
- **API Key Authentication**: Secure access using API keys
- **Rate Limiting**: Fair usage policies to ensure platform stability
- **Request Signing**: Cryptographic request verification
- **IP Whitelisting**: Enhanced security through IP restrictions

## Getting Started

### 1. API Access

#### **Registration Process**
1. **Create Account**: Sign up for a YC365 account
2. **API Key Generation**: Generate your API keys in the dashboard
3. **Documentation Access**: Access comprehensive API documentation
4. **Testing Environment**: Use sandbox environment for development

#### **API Key Management**
- **Primary Key**: Full access to all API endpoints
- **Read-Only Key**: Limited to data retrieval operations
- **Custom Scopes**: Granular permission control
- **Key Rotation**: Regular key updates for enhanced security

### 2. Base Configuration

#### **Base URLs**
```
Production: https://api.yc365.io/v1
Sandbox: https://api-sandbox.yc365.io/v1
WebSocket: wss://ws.yc365.io/v1
```

#### **Authentication Headers**
```http
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
X-API-Version: 1.0
```

## API Endpoints

### 📊 **Market Data**

#### **Get All Markets**
```http
GET /markets
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "market_001",
      "title": "Will Bitcoin reach $100,000 by end of 2024?",
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

#### **Get Market Details**
```http
GET /markets/{market_id}
```

**Parameters:**
- `market_id` (string): Unique market identifier

**Response:**
```json
{
  "success": true,
  "data": {
    "id": "market_001",
    "title": "Will Bitcoin reach $100,000 by end of 2024?",
    "description": "This market will resolve to YES if Bitcoin reaches $100,000 or higher by December 31, 2024.",
    "category": "cryptocurrency",
    "status": "active",
    "created_at": "2024-01-15T10:30:00Z",
    "end_time": "2024-12-31T23:59:59Z",
    "resolution_criteria": "Price data from CoinGecko",
    "yes_price": 0.65,
    "no_price": 0.35,
    "volume_24h": 125000,
    "liquidity": 500000,
    "trading_fee": 0.0015,
    "tags": ["bitcoin", "price", "cryptocurrency"]
  }
}
```

#### **Get Market History**
```http
GET /markets/{market_id}/history
```

**Parameters:**
- `market_id` (string): Market identifier
- `interval` (string): Time interval (1m, 5m, 1h, 1d)
- `start_time` (string): Start time (ISO 8601)
- `end_time` (string): End time (ISO 8601)

**Response:**
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

### 💰 **Trading Operations**

#### **Place Order**
```http
POST /orders
```

**Request Body:**
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

**Response:**
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

#### **Get Order Status**
```http
GET /orders/{order_id}
```

**Response:**
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

#### **Cancel Order**
```http
DELETE /orders/{order_id}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "order_id": "order_12345",
    "status": "cancelled",
    "message": "Order successfully cancelled"
  }
}
```

### 👤 **User Management**

#### **Get Account Balance**
```http
GET /account/balance
```

**Response:**
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

#### **Get Transaction History**
```http
GET /account/transactions
```

**Parameters:**
- `type` (string): Transaction type (deposit, withdrawal, trade, fee)
- `start_date` (string): Start date (ISO 8601)
- `end_date` (string): End date (ISO 8601)
- `page` (integer): Page number
- `limit` (integer): Items per page

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "transaction_id": "tx_12345",
      "type": "trade",
      "amount": 1000,
      "currency": "USDT",
      "description": "Buy YES tokens for market_001",
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

### 🎯 **Event Management**

#### **Create Market Proposal**
```http
POST /markets/proposals
```

**Request Body:**
```json
{
  "title": "Will Ethereum reach $5,000 by Q2 2024?",
  "description": "This market will resolve to YES if Ethereum reaches $5,000 or higher by June 30, 2024.",
  "category": "cryptocurrency",
  "end_time": "2024-06-30T23:59:59Z",
  "resolution_criteria": "Price data from CoinGecko",
  "tags": ["ethereum", "price", "cryptocurrency"]
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "proposal_id": "prop_12345",
    "status": "pending_review",
    "title": "Will Ethereum reach $5,000 by Q2 2024?",
    "created_at": "2024-01-15T10:30:00Z",
    "estimated_review_time": "2-3 business days"
  }
}
```

## WebSocket API

### 🔌 **Real-time Data Streaming**

#### **Connection**
```javascript
const ws = new WebSocket('wss://ws.yc365.io/v1');
```

#### **Authentication**
```javascript
ws.onopen = function() {
  ws.send(JSON.stringify({
    type: 'auth',
    api_key: 'YOUR_API_KEY'
  }));
};
```

#### **Subscribe to Market Updates**
```javascript
ws.send(JSON.stringify({
  type: 'subscribe',
  channel: 'market_updates',
  market_id: 'market_001'
}));
```

#### **Message Format**
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

## SDK Support

### 📚 **Available SDKs**

#### **JavaScript/Node.js**
```bash
npm install yc365-sdk
```

```javascript
const YC365 = require('yc365-sdk');

const client = new YC365({
  apiKey: 'YOUR_API_KEY',
  environment: 'sandbox' // or 'production'
});

// Get markets
const markets = await client.markets.getAll();

// Place order
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

# Get markets
markets = client.markets.get_all()

# Place order
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
    
    // Get markets
    markets, err := client.Markets.GetAll()
    
    // Place order
    order, err := client.Orders.Create(yc365.CreateOrderRequest{
        MarketID: "market_001",
        Side:     "buy",
        Outcome:  "yes",
        Amount:   1000,
        Price:    0.65,
    })
}
```

## Rate Limits

### ⚡ **Rate Limiting Policy**

| Endpoint Type | Rate Limit | Burst Limit |
|---------------|------------|-------------|
| **Market Data** | 100 requests/minute | 200 requests/minute |
| **Trading Operations** | 50 requests/minute | 100 requests/minute |
| **User Management** | 30 requests/minute | 60 requests/minute |
| **WebSocket** | 10 connections | 20 connections |

### 📊 **Rate Limit Headers**
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1642234567
```

## Error Handling

### ❌ **Error Response Format**
```json
{
  "success": false,
  "error": {
    "code": "INVALID_PARAMETER",
    "message": "Invalid market_id provided",
    "details": {
      "field": "market_id",
      "value": "invalid_id",
      "expected": "string"
    }
  },
  "request_id": "req_12345"
}
```

### 🔢 **Error Codes**

| Code | Description | HTTP Status |
|------|-------------|-------------|
| `INVALID_PARAMETER` | Invalid request parameter | 400 |
| `UNAUTHORIZED` | Invalid or missing API key | 401 |
| `FORBIDDEN` | Insufficient permissions | 403 |
| `NOT_FOUND` | Resource not found | 404 |
| `RATE_LIMITED` | Rate limit exceeded | 429 |
| `INTERNAL_ERROR` | Server error | 500 |
| `MARKET_CLOSED` | Market is not available for trading | 400 |
| `INSUFFICIENT_BALANCE` | Not enough balance for operation | 400 |
| `ORDER_NOT_FOUND` | Order does not exist | 404 |

## Testing and Development

### 🧪 **Sandbox Environment**

#### **Features**
- **Test Data**: Realistic market data for testing
- **Virtual Funds**: Unlimited test USDT for development
- **Full API Access**: All production endpoints available
- **WebSocket Support**: Real-time data streaming

#### **Getting Started**
1. **Sign Up**: Create a sandbox account
2. **Generate API Key**: Get your sandbox API key
3. **Start Testing**: Use sandbox endpoints for development
4. **Monitor Usage**: Track API usage and performance

### 📝 **API Testing Tools**

#### **Postman Collection**
- **Download**: Complete Postman collection available
- **Environment Variables**: Pre-configured environments
- **Examples**: Sample requests for all endpoints
- **Documentation**: Integrated API documentation

#### **cURL Examples**
```bash
# Get all markets
curl -X GET "https://api-sandbox.yc365.io/v1/markets" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json"

# Place order
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

## Best Practices

### 💡 **Development Guidelines**

#### **API Usage**
- **Use HTTPS**: Always use secure connections
- **Handle Errors**: Implement proper error handling
- **Rate Limiting**: Respect rate limits and implement backoff
- **Caching**: Cache market data when appropriate
- **WebSockets**: Use WebSockets for real-time data

#### **Security**
- **API Key Protection**: Never expose API keys in client-side code
- **Request Signing**: Use request signing for sensitive operations
- **IP Whitelisting**: Restrict API access to known IP addresses
- **Key Rotation**: Regularly rotate API keys

#### **Performance**
- **Connection Pooling**: Reuse HTTP connections
- **Batch Operations**: Use batch endpoints when available
- **Pagination**: Implement proper pagination for large datasets
- **Monitoring**: Monitor API usage and performance

## Support and Resources

### 🆘 **Developer Support**

#### **Documentation**
- **API Reference**: Complete endpoint documentation
- **SDK Documentation**: Language-specific guides
- **Code Examples**: Sample implementations
- **Tutorials**: Step-by-step integration guides

#### **Community**
- **Developer Forum**: Community support and discussions
- **GitHub**: Open source SDKs and examples
- **Discord**: Real-time developer chat
- **Stack Overflow**: Tagged questions and answers

#### **Support Channels**
- **Email**: api-support@yc365.io
- **Live Chat**: Available 24/7 for API issues
- **Priority Support**: Dedicated support for enterprise clients

### 📞 **Contact Information**

For API-related support, please contact:
- **Email**: api-support@yc365.io
- **Live Chat**: Available 24/7 on platform
- **Telegram**: @YC365DevSupport
- **Discord**: YC365 Developer Server

---

**Start building with YC365 API today!** Our comprehensive API and SDK support make it easy to integrate prediction market functionality into your applications.

*Join thousands of developers who are already building innovative applications on the YC365 platform.*
