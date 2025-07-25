# How Are Prices Calculated?

## Overview

YC365 uses advanced pricing mechanisms to ensure fair and efficient prediction markets. This guide explains how prices are calculated and updated in real-time on the platform.

## Pricing Mechanisms

### 1. Automated Market Maker (AMM)

#### Core Principle:
YC365 uses an Automated Market Maker (AMM) system that automatically calculates prices based on supply and demand.

#### Price Formula:
```
Price = (Yes Tokens) / (Yes Tokens + No Tokens)
```

#### Key Features:
- **Continuous Pricing**: Prices update in real-time
- **Liquidity Provision**: Automated liquidity management
- **No Order Book**: No need for matching buyers and sellers

### 2. Constant Product Formula

#### Mathematical Foundation:
The AMM uses a constant product formula similar to Uniswap:
```
(Yes Tokens) × (No Tokens) = k (constant)
```

#### Price Calculation:
- **Yes Price**: `Yes Tokens / (Yes Tokens + No Tokens)`
- **No Price**: `No Tokens / (Yes Tokens + No Tokens)`
- **Total**: Yes Price + No Price = 1.0

#### Example:
- If 60 Yes tokens and 40 No tokens exist:
- Yes Price = 60 / (60 + 40) = 0.60 (60%)
- No Price = 40 / (60 + 40) = 0.40 (40%)

## Price Updates

### 1. Real-Time Updates

#### Trigger Events:
- **New Trades**: Every buy/sell transaction
- **Liquidity Changes**: Additions or removals of liquidity
- **Market Events**: News or significant developments

#### Update Frequency:
- **Instant**: Prices update immediately after each trade
- **Continuous**: No delays or batch processing
- **Transparent**: All calculations visible on-chain

### 2. Slippage and Impact

#### Slippage Calculation:
```
Slippage = (Expected Price - Actual Price) / Expected Price
```

#### Factors Affecting Slippage:
- **Trade Size**: Larger trades cause more slippage
- **Liquidity Depth**: More liquidity reduces slippage
- **Market Volatility**: High volatility increases slippage

#### Example:
- Small trade: 0.1% slippage
- Medium trade: 1-2% slippage
- Large trade: 5-10% slippage

## Market Efficiency

### 1. Information Aggregation

#### Collective Intelligence:
- **Crowd Wisdom**: Prices reflect collective beliefs
- **Information Flow**: New information quickly incorporated
- **Efficient Markets**: Prices adjust to new data rapidly

#### Price Discovery:
- **Bid-Ask Spread**: Minimal spreads in liquid markets
- **Price Convergence**: Prices converge to true probabilities
- **Arbitrage**: Traders eliminate price discrepancies

### 2. Liquidity and Efficiency

#### Liquidity Providers:
- **Automated Liquidity**: AMM provides continuous liquidity
- **Incentive Structure**: Rewards for providing liquidity
- **Risk Management**: Diversified liquidity positions

#### Efficiency Metrics:
- **Tight Spreads**: Small bid-ask spreads
- **High Volume**: Active trading activity
- **Price Stability**: Consistent pricing patterns

## Price Manipulation Protection

### 1. Anti-Manipulation Measures

#### Technical Safeguards:
- **Large Trade Limits**: Maximum trade size restrictions
- **Circuit Breakers**: Temporary trading halts
- **Price Bands**: Maximum price movement limits

#### Monitoring Systems:
- **Anomaly Detection**: Identify unusual trading patterns
- **Volume Analysis**: Monitor trading volume spikes
- **Price Surveillance**: Track price manipulation attempts

### 2. Governance Controls

#### Community Oversight:
- **Market Monitoring**: Community watches for manipulation
- **Reporting System**: Users can report suspicious activity
- **Dispute Resolution**: Process for handling manipulation claims

#### Administrative Actions:
- **Trading Suspensions**: Temporary halts if needed
- **Market Closures**: Permanent closure for severe cases
- **Compensation**: Reimbursement for affected users

## Advanced Pricing Features

### 1. Dynamic Fees

#### Fee Structure:
- **Base Fee**: Standard trading fee (0.3%)
- **Dynamic Adjustment**: Fees change based on market conditions
- **Liquidity Rewards**: Fees distributed to liquidity providers

#### Fee Calculation:
```
Total Fee = Base Fee + Dynamic Component
```

### 2. Price Oracles

#### External Data:
- **Oracle Integration**: Real-world data feeds
- **Price Verification**: Cross-reference with external sources
- **Fallback Mechanisms**: Multiple data sources for reliability

#### Oracle Types:
- **Sports Results**: Official game outcomes
- **Economic Data**: Government statistics
- **News Events**: Verified news sources

## Price History and Analytics

### 1. Historical Data

#### Price Charts:
- **Time Series**: Price movements over time
- **Volume Analysis**: Trading volume patterns
- **Volatility Metrics**: Price stability measures

#### Data Availability:
- **Real-Time**: Live price feeds
- **Historical**: Past price data
- **Analytics**: Advanced market analysis tools

### 2. Market Analytics

#### Performance Metrics:
- **Price Accuracy**: How well prices predict outcomes
- **Market Efficiency**: Speed of information incorporation
- **Liquidity Depth**: Market depth and stability

#### User Tools:
- **Price Alerts**: Notifications for price changes
- **Portfolio Tracking**: Monitor your positions
- **Performance Analysis**: Track your trading success

## Price Resolution

### 1. Final Settlement

#### Resolution Process:
- **Outcome Determination**: Official result verification
- **Price Finalization**: Final price set to 0 or 1
- **Token Redemption**: Users claim their winnings

#### Settlement Timeline:
- **Immediate**: Some markets settle instantly
- **Verification Period**: Time for outcome confirmation
- **Dispute Window**: Period for challenging results

### 2. Payout Calculation

#### Winning Calculation:
```
Payout = (Your Tokens) × (Final Price)
```

#### Example:
- You own 100 Yes tokens
- Final Yes price = 1.0 (outcome occurred)
- Payout = 100 × 1.0 = 100 USDT

## Price Transparency

### 1. On-Chain Transparency

#### Blockchain Verification:
- **Public Ledger**: All trades visible on BSC
- **Smart Contract**: Automated and verifiable
- **No Hidden Fees**: All costs transparent

#### Data Availability:
- **Open Source**: Code publicly available
- **Real-Time**: Live data feeds
- **Historical**: Complete trade history

### 2. User Interface

#### Price Display:
- **Current Price**: Real-time price updates
- **Price History**: Historical price charts
- **Market Depth**: Liquidity information

#### Trading Interface:
- **Buy/Sell Buttons**: Easy trading interface
- **Price Impact**: Shows how your trade affects price
- **Confirmation**: Clear trade confirmation

## Future Enhancements

### 1. Advanced Pricing Models

#### Planned Features:
- **Dynamic AMM**: Adaptive liquidity curves
- **Multi-Asset Markets**: Complex market structures
- **Conditional Pricing**: Dependent market pricing

#### Research Areas:
- **Machine Learning**: AI-powered price prediction
- **Sentiment Analysis**: Social media impact on prices
- **Cross-Market Correlation**: Related market analysis

### 2. Enhanced Analytics

#### User Tools:
- **Advanced Charts**: Technical analysis tools
- **Portfolio Analytics**: Comprehensive performance tracking
- **Risk Management**: Position sizing and risk tools

#### Platform Features:
- **Market Predictions**: AI-powered market forecasting
- **Trend Analysis**: Pattern recognition tools
- **Risk Metrics**: Volatility and correlation analysis

---

*For the latest information on pricing mechanisms and updates, please check our official announcements.* 