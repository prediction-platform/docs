# How to Sign-Up

YC365 does not use traditional username/password accounts. Your wallet address becomes your identity. Follow the steps below to connect your wallet and finish the lightweight sign-up flow.

## 1. Open the YC365 dApp
- Visit [https://dapp.yc365.io](https://dapp.yc365.io) in a Chromium-based browser (Chrome, Edge, Brave) for the smoothest wallet integrations.
- Make sure the URL uses HTTPS and matches exactly to avoid phishing sites.
- Optional: use the Chrome Dev MCP tooling to inspect the UI if you're validating a staging build.

## 2. Launch the Wallet Connector
- Click the **Connect Wallet** button in the top-right corner of the dApp.
- A secure modal will slide in listing the supported authentication options.

![Wallet connection modal showing Google, MetaMask, Coinbase, and Trust Wallet options](../img/yc365/connect-wallet.png)

*The sign-up modal offers multiple wallet providers. MetaMask is recommended for most desktop users.*

## 3. Choose Your Preferred Provider
- **MetaMask (Recommended):** Best general-purpose option. Approve the connection request in the extension popup.
- **Coinbase Wallet / Trust Wallet:** Mobile-friendly alternatives. Scan the QR code or approve from your browser extension.
- **Google Login:** Uses your Google account to issue a session-bound wallet via the embedded MPC provider, ideal for users without self-custody yet.

If you are using the Chrome Dev MCP pipeline, verify that the injected provider appears under the `window.ethereum` object before continuing.

## 4. Confirm Network and Permissions
- Ensure your wallet is switched to **BNB Smart Chain (BSC)**. The dApp will prompt a network switch if needed.
- Review the permissions requested (view wallet address, balance, suggested transactions) and click **Connect** or **Approve**.
- For Google login, follow the OAuth prompts and authorize YC365 MPC access.

## 5. Verify Successful Sign-Up
- Your wallet address now appears in the header, replacing the **Connect Wallet** button.
- The **Orders** and **Person** tabs in the bottom navigation unlock, allowing access to your portfolio and profile settings.
- In Chrome Dev MCP, you can confirm the authenticated state by checking that `localStorage` contains the `yc365-auth` token.

---

Once connected, you are ready to deposit funds, explore live markets, and place your first trade. Refer to [How to Deposit](how-to-deposit.md) for the next steps.
