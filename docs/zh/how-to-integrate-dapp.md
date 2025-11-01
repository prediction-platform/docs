# 如何集成 YC365 Dapp

## 概述

本文介绍商户平台与 YC365 Dapp 的交互方式。通信支持两种模式：免转账模式（v1）与转账模式（v2）。

- **免转账模式**
  
  用户从商户平台进入 Dapp 时无需充值。下单时，资金直接从平台账户扣除，Dapp 后台与平台保持实时通信。

  ![img.png](../img/yc365/img_11.png)

- **转账模式**

  用户进入 Dapp 时，需要将平台账户中的部分资产划转至 Dapp 账户。Dapp 后台相对独立于平台，无需实时通信。

  ![img.png](../img/yc365/img_10.png)

## 🎯 主要功能

1. **获取注册邀请码**：通过与 YC365 商务代表线下沟通获取。一个邀请码仅限一个商户账号使用。
2. **商户注册**：此接口需要线下申请开通。商户或 YC365 商务提交必要参数后即可注册。注册完成将获得 `app_id`、`api_key`、`wallet_address` 等关键信息，必须妥善保管。
   - 注册前需准备相关接口，并确认使用 v1 还是 v2 模式，不同模式所需接口不同。
   - 注册得到的 `app_id` 与 `api_key` 建议存放于商户后台，其中 `api_key` 用于与 Dapp 后台进行加密通信。
   - `wallet_address` 是商户在 Dapp 中的 BSC 钱包地址，需要充值 USDT。
3. **获取 Dapp 访问地址**：当用户在平台页面点击文本链接或图标时，平台后台调用该接口并携带必要参数，以获取 Dapp 地址。
4. **订单详情**：商户可在 Dapp 中查看交易明细，方便双方对账。
5. **商户报表**：支持查看每日、每周、每月的报表数据。
6. **每日汇总数据推送**：Dapp 后台会在 UTC 时间每日 0 点向商户推送上一日的汇总数据。

数据格式示例：
```json
{
  "event_type": "merchant_overview", // 业务事件类型：每日汇总数据推送
  "data": {
     "app_id":"string",            // 商户 ID
     "balance":0.000000,           // 商户可用 USDT
     "frozen":0.000000,            // 商户冻结 USDT
     "period_date":"string",       // 统计周期第一天，例如 2025-08-01
     "users":0,                    // 商户在 Dapp 中的用户总数
     "total_deposit":0.000000,     // 充值总额，v1 模式为 0
     "total_deposit_count":0,      // 充值次数，v1 模式为 0
     "total_withdraw":0.000000,    // 提现总额，v1 模式为 0
     "total_withdraw_count":0,     // 提现次数，v1 模式为 0
     "total_buy_volume":0.000000,  // 买入总额
     "total_sell_volume":0.000000, // 卖出总额
     "currency":"string"           // 币种：USDT
  },
  "signature": "xxxxxxxx"
}
```

## 🛡️ 状态码说明

| 状态码 | 含义 | 描述 |
| ------ | ---- | ---- |
| 0 | OK | 请求成功 |
| 1 | Canceled | 请求被取消 |
| 2 | Unknown | 未知服务错误 |
| 3 | InvalidArgument | 参数无效 |
| 7 | PermissionDenied | 签名认证失败 |
| 8 | ResourceExhausted | 当前被限流 |
| 13 | Internal | 内部服务错误 |

## 💡 API 接口

YC365 Dapp 为商户平台提供以下接口：

### 1. 获取邀请码

**GET** `/account/v1/app/invitecode`

邀请码需线下领取，一个账号一个邀请码。请求头必须包含 `Authorization`。

**响应示例**
```json
{
   "code": 0,
   "message": "string",
   "data": "string"    // 邀请码
}
```

### 2. 创建商户

**POST** `/account/v1/app/create`

创建商户前请联系商务代表获取邀请码。

**请求体**
```json
{
   "app_name": "string",         // 商户名称
   "app_desc": "string",         // 商户描述
   "api_version": "string",      // v1：免转账模式；v2：转账模式
   "signature_method": "string", // 目前仅支持 hmac-sha256
   "assets_api": "string",
   "create_order_api": "string",
   "trade_order_api": "string",
   "cancel_order_api": "string",
   "settlement_api": "string",
   "webhook_api": "string",
   "invite_code": "string"       // 邀请码
}
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "app_id": "string",        // 商户 ID
        "api_key": "string",       // API 密钥
        "wallet_address": "string" // 钱包地址
    }
}
```

### 3. 获取 Dapp 访问地址

**POST** `/account/v1/app/access`

平台可调用该接口为用户获取 Dapp 访问链接。`Authorization` 由 `app_id:signature`（base64）组成。加签方式详见后文「签名规则」。

**请求体**
```json
{
   "user_id": "string",   // 商户平台中的用户唯一 ID
   "user_name": "string", // 用户昵称
   "lang": "string",      // 语言：en、zh
   "email": "string",     // 邮箱，选填
   "phone": "string",     // 手机号码，选填，格式 +86 188xxxxxx
   "avatar": "string",    // 头像地址
   "timestamp": 0,        // 发起请求的时间戳（毫秒）
   "signature": "string"  // 数据签名
}
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "url": "string" // Dapp 访问地址
    }
}
```

### 4. 同步资产（仅 v1）

**POST** `/account/v1/app/account/assets`

用于免转账模式下同步用户资产。`Authorization` 同上。

**请求体**
```json
{
   "user_id": "string", // 商户平台用户唯一 ID
   "assets": [
     {
       "asset": "string",   // 资产类型：USDT
       "balance": 0.000000, // 可用余额
       "frozen": 0.000000   // 冻结余额
     }
   ],
   "timestamp": 0,
   "signature": "string"
}
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 5. 创建订单（仅 v1）

**POST** `/account/v1/app/order/create`

商户用户下单前调用。支付成功后返回订单状态。`Authorization` 同上。

**请求体**
```json
{
   "user_id": "string",          // 商户平台用户唯一 ID
   "order_id": "string",         // 商户生成的订单 ID
   "side": "buy/sell",           // 买入 / 卖出
   "outcome": "yes/no",          // yes：买涨；no：买跌
   "market_id": "string",        // 市场 ID
   "price": 0.000000,            // 下单价格
   "quantity": 0.000000,         // 下单数量
   "amount": 0.000000,           // 订单金额
   "fee": 0.000000,              // 手续费
   "timestamp": 0,
   "signature": "string"
}
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "status": "success",  // success：成功；failed：失败
        "fail_reason": ""     // 失败原因
    }
}
```

### 6. 订单撮合回调（仅 v1）

**POST** `/account/v1/app/order/trade`

当订单在 Dapp 侧成交时回调。商户需返回处理结果。

**请求体**
```json
{
   "order_id": "string",          // 商户订单 ID
   "trade_id": "string",          // 成交 ID
   "side": "buy/sell",            // 方向
   "outcome": "yes/no",           // yes：买涨；no：买跌
   "price": 0.000000,             // 成交价格
   "quantity": 0.000000,          // 成交数量
   "amount": 0.000000,            // 成交金额
   "fee": 0.000000,               // 手续费
   "timestamp": 0,
   "signature": "string"
}
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 7. 取消订单回调（仅 v1）

**POST** `/account/v1/app/order/cancel`

订单在 Dapp 侧被取消时回调。商户需返回处理结果。

**请求体**
```json
{
   "order_id": "string",  // 商户订单 ID
   "timestamp": 0,
   "signature": "string"
}
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 8. 结算回调（仅 v1）

**POST** `/account/v1/app/order/settlement`

市场结算后回调，通知商户盈亏信息。

**请求体**
```json
{
   "market_id": "string",       // 市场 ID
   "user_id": "string",         // 商户平台用户 ID
   "outcome": "yes/no",         // 用户持有的结果
   "quantity": 0.000000,        // 结算数量
   "payout": 0.000000,          // 结算金额
   "timestamp": 0,
   "signature": "string"
}
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 9. 订单详情查询

**GET** `/account/v1/app/order/detail`

商户可查询订单状态及明细。

**请求参数**
```
order_id=string
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "order_id": "string",
        "user_id": "string",
        "status": "string",   // 订单状态
        "trades": [           // 成交列表
           {
              "trade_id": "string",
              "price": 0.000000,
              "quantity": 0.000000,
              "amount": 0.000000,
              "fee": 0.000000,
              "created_at": "string"
           }
        ]
    }
}
```

### 10. 商户报表

**GET** `/account/v1/app/report`

可按日期区间查询报表数据。

**请求参数**
```
start_date=string   // yyyy-MM-dd
end_date=string     // yyyy-MM-dd
```

**响应示例**
```json
{
    "code": 0,
    "message": "string",
    "data": [
       {
          "period_date": "string",       // 报表日期
          "users": 0,                    // 活跃用户数
          "total_deposit": 0.000000,     // 充值金额
          "total_withdraw": 0.000000,    // 提现金额
          "total_buy_volume": 0.000000,  // 买入成交额
          "total_sell_volume": 0.000000, // 卖出成交额
          "currency": "string"           // 币种
       }
    ]
}
```

## 🔐 签名规则

所有需要签名的接口均使用 `HMAC-SHA256`。签名步骤：

1. 将请求体（JSON 字符串）按 UTF-8 编码；
2. 使用商户 `api_key` 作为密钥，对请求体计算 `HMAC-SHA256`；
3. 将结果转成十六进制字符串，即为 `signature`。

示例 Python 代码：
```python
import hmac
import hashlib

def sign(payload: str, api_key: str) -> str:
    return hmac.new(api_key.encode('utf-8'),
                    payload.encode('utf-8'),
                    hashlib.sha256).hexdigest()
```

## 📄 附录

- 接口返回值统一包含 `code`、`message`、`data` 三部分。
- 请求与响应均使用 JSON 格式，数值保留 6 位小数。
- 所有时间均为 UTC 时间。
- 建议商户后台对接口调用进行日志记录，便于排查问题。
