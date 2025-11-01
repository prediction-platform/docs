# Markets

The Markets hub inside YC365 highlights live, upcoming, and popular prediction opportunities. It combines fast filters, rich market cards, and analytics widgets so you can discover trades in seconds.

## Browsing Live Markets

![Market directory with category chips, search, and featured market cards](../img/yc365/home-dashboard.png)

*The All Markets view lists featured events, real-time odds, and quick CTA buttons for YES/NO orders.*

- **Category chips** across the top (AI, Election, Sports, Movies, etc.) instantly filter the feed.
- **Search** in the upper-right narrows results by event title or keyword.
- **Market cards** expose implied probability, current volume, and direct buy buttons without leaving the directory.
- **Quick actions** (`Yes` / `No`) allow rapid order placement once your wallet is connected.

When using the Chrome Dev MCP tooling, you can verify each card’s data payload by inspecting the `livemarkets` GraphQL response directly from the Network tab.

## Leaderboard & Activity

YC365 also surfaces aggregated performance data to highlight top-performing wallets and market makers.

![Leaderboard view showing volume and profit rankings with daily/week/month toggles](../img/yc365/leaderboard.png)

*Switch between day, week, month, or all-time rankings to spot influential accounts and gauge liquidity depth.*

- **Volume leaderboard** exposes wallets contributing the most traded volume across markets.
- **Profit leaderboard** surfaces consistent winners and helps you benchmark your own strategy.
- **Timeframe toggles** (Day/Week/Month/All) reveal short-term momentum versus long-term consistency.
- **Chrome Dev MCP tip:** capture this panel during QA to ensure leaderboard API responses are cached and paginated correctly.

---

Ready to get more tactical? Dive into [Making Your First Trade](making-your-first-trade.md) or explore [Using the Order Book](using-the-order-book.md) for execution-level guidance.
