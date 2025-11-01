# 如何注册

YC365 不采用传统的用户名/密码体系，你的钱包地址就是你的身份。按照以下步骤连接钱包即可完成轻量化注册流程。

## 1. 打开 YC365 dApp
- 使用基于 Chromium 的浏览器（Chrome、Edge、Brave 等）访问 [https://dapp.yc365.io](https://dapp.yc365.io)，钱包集成体验更佳。
- 确认网址为 HTTPS 且与官方域名完全一致，以防钓鱼站点。
- 如需验证测试环境，可通过 Chrome Dev MCP 工具查看界面元素。

## 2. 启动钱包连接
- 点击 dApp 右上角的 **Connect Wallet** 按钮。
- 系统会弹出安全的连接窗口，列出支持的钱包与登录方式。

![显示 Google、MetaMask、Coinbase、Trust Wallet 等选项的钱包连接弹窗](../img/yc365/connect-wallet.png)

*注册弹窗提供多种钱包选择，桌面用户推荐使用 MetaMask。*

## 3. 选择首选服务商
- **MetaMask（推荐）**：通用性最佳，在扩展弹窗中批准连接请求即可。
- **Coinbase Wallet / Trust Wallet**：移动端友好，可扫描二维码或在扩展中批准。
- **Google 登录**：通过嵌入式 MPC 服务创建会话级钱包，适合尚未自托管资产的用户。

若你在使用 Chrome Dev MCP 调试，请检查 `window.ethereum` 是否已注入对应的提供商。

## 4. 确认网络与权限
- 确保钱包网络切换至 **BNB Smart Chain (BSC)**，如未切换 dApp 会提示。
- 查看连接所需的权限（读取地址、余额、建议交易等），点击 **Connect** 或 **Approve**。
- 如果选择 Google 登录，按照 OAuth 提示授权 YC365 的 MPC 服务。

## 5. 验证注册成功
- 页眉原先的 **Connect Wallet** 按钮会显示为你的钱包地址。
- 底部导航中的 **Orders** 与 **Person** 标签会解锁，可访问资产与个人设置。
- 在 Chrome Dev MCP 中，可检查 `localStorage` 是否出现 `yc365-auth` 字段，以确认登录态。

---

连接完成后，即可充值资产、浏览实时市场并进行首次交易。下一步请查看《[如何充值](how-to-deposit.md)》。***
