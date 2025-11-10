# YC365 水龙头 - 领取测试币

欢迎使用 YC365 水龙头！本指南将帮助您获取用于 YC365 平台测试和开发的测试代币。

## 📜 水龙头规则

### 领取限额

YC365 水龙头通过两个渠道提供测试 USDT 代币：

| 渠道 | 每次领取金额 | 频率 | 要求 |
|------|-------------|------|------|
| **dApp 水龙头** | 50 USDT | 每24小时一次 | 连接钱包 |
| **Discord 水龙头** | 100 USDT | 每24小时一次 | Discord 成员 |

!!! note "重要提示"
    - 每个钱包地址每个渠道每24小时只能领取一次
    - 测试代币没有实际价值，仅用于测试目的
    - 切勿在主网上使用测试代币

## 🚰 如何获取测试 USDT

### 方式一：YC365 dApp 水龙头

1. **连接您的钱包**
   - 访问 [dapp.yc365.io](https://dapp.yc365.io)
   - 连接您的 MetaMask 或兼容钱包
   - 确保您在 **BSC 测试网**上

2. **访问水龙头**
   - 导航到"水龙头"部分
   - 点击"领取测试 USDT"

3. **接收代币**
   - 您将收到 50 个测试 USDT
   - 代币将在几秒钟内出现在您的钱包中
   - 等待 24 小时后才能再次领取

### 方式二：Discord 水龙头

1. **加入 YC365 Discord**
   - 加入我们的[官方 Discord 服务器](https://discord.gg/yc365)
   - 完成服务器验证

2. **进入水龙头频道**
   - 前往 `#faucet` 频道
   - 阅读置顶说明

3. **请求代币**
   - 使用水龙头机器人命令并提供您的钱包地址
   - 接收 100 个测试 USDT
   - 等待 24 小时后才能再次请求

## 🔗 获取测试 BNB (tBNB)

要与 YC365 平台交互，您还需要测试 BNB (tBNB) 来支付 Gas 费用。

### 从 BSC 官方水龙头获取 tBNB

访问官方币安智能链测试网水龙头：

**👉 [https://www.bnbchain.org/en/testnet-faucet](https://www.bnbchain.org/en/testnet-faucet)**

#### 获取 tBNB 的步骤：

1. **访问 BSC 水龙头**
   - 点击上面的链接打开官方 BSC 测试网水龙头
   - 您需要在 BSC 主网上有 0.002 BNB 用于验证

2. **输入您的钱包地址**
   - 粘贴您的 BSC 测试网钱包地址
   - 从下拉菜单中选择 "0.3 BNB"

3. **提交请求**
   - 点击 "Send 0.3 BNB"
   - 等待交易完成

4. **验证接收**
   - 检查您的钱包是否收到测试 BNB
   - 24 小时后可以再次请求

!!! tip "其他 tBNB 来源"
    - **BNB Chain Discord**: 加入 [BNB Chain Discord](https://discord.gg/bnbchain) 并使用其水龙头频道
    - **QuickNode**: 使用 [QuickNode 的 BSC 水龙头](https://www.quicknode.com/faucet/bsc-testnet)
    - **Chainstack**: 尝试 [Chainstack 的水龙头](https://chainstack.com/labs/faucets/bsc-testnet-faucet/)

## 🔧 故障排除

### 常见问题

#### 领取请求失败

**问题**：水龙头请求失败或显示错误

**解决方案**：
- 验证您在 BSC 测试网上（链 ID: 97）
- 检查您在过去 24 小时内没有领取过
- 确保您的钱包已正确连接
- 几分钟后重试

#### 未收到代币

**问题**：已领取代币但未收到

**解决方案**：
- 等待 30-60 秒并刷新您的钱包
- 检查您正在查看正确的网络（BSC 测试网）
- 在 [BSC 测试网浏览器](https://testnet.bscscan.com)上验证交易
- 如果问题持续存在，请联系支持

#### 速率限制错误

**问题**："您已领取"或速率限制错误

**解决方案**：
- 等待 24 小时冷却期
- 检查您上次领取的确切时间
- 尝试另一个水龙头渠道（dApp 或 Discord）

#### 网络错误

**问题**：连接到错误的网络

**解决方案**：
1. 打开 MetaMask
2. 点击网络下拉菜单
3. 选择"BSC 测试网"
4. 如果不可用，手动添加 BSC 测试网：
   - 网络名称：BSC Testnet
   - RPC URL：https://data-seed-prebsc-1-s1.binance.org:8545/
   - 链 ID：97
   - 符号：tBNB
   - 浏览器：https://testnet.bscscan.com

## 📋 网络配置

### BSC 测试网详情

将这些详细信息添加到您的钱包以连接到 BSC 测试网：

```
网络名称：BSC Testnet
RPC URL：https://data-seed-prebsc-1-s1.binance.org:8545/
链 ID：97
货币符号：tBNB
区块浏览器：https://testnet.bscscan.com
```

### 备用 RPC 端点

如果主 RPC 较慢，请尝试以下替代方案：

- https://data-seed-prebsc-2-s1.binance.org:8545/
- https://data-seed-prebsc-1-s2.binance.org:8545/
- https://data-seed-prebsc-2-s2.binance.org:8545/

## ⚠️ 重要说明

### 测试代币没有价值

- **测试 USDT** 和 **tBNB** **没有实际价值**
- 它们不能被交易、出售或兑换为真实资产
- 仅用于测试和开发目的

### 安全提醒

- 切勿分享您的私钥或助记词
- 测试代币与主网代币是分开的
- 测试前始终验证您在测试网上
- 不要将真实资产发送到测试网地址

### 防止水龙头滥用

为确保所有用户的公平访问：
- 每个钱包每个渠道每 24 小时最多领取 1 次
- 可疑活动可能导致临时限制
- 多钱包滥用会被监控和限制
- 尊重速率限制和社区准则

## 🎯 下一步

获得测试代币后：

1. **验证余额**
   - 检查钱包中的测试 USDT 余额
   - 确认您有足够的 tBNB 用于 Gas 费用

2. **进行测试充值**
   - 访问 YC365 dApp
   - 遵循[如何充值](how-to-deposit.md)指南
   - 从小额测试充值开始（10-20 USDT）

3. **探索平台**
   - 浏览可用的预测市场
   - 练习下测试订单
   - 无风险学习平台功能

4. **加入社区**
   - 在 Discord 上分享反馈
   - 报告您遇到的任何问题
   - 帮助其他测试者入门

## 📞 需要帮助？

如果您在使用水龙头时遇到任何问题：

- **Discord 支持**: 加入我们的 [Discord 服务器](https://discord.gg/yc365)
- **Telegram**: 在 [Telegram](https://t.me/yc365official) 上联系我们
- **邮箱**: support@yc365.io

---

**测试愉快！** 🚀 YC365 水龙头让您轻松开始测试我们的预测市场平台。立即获取您的测试代币并开始探索！

