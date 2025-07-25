# How Are Prices Calculated?

## Overview

YC365 employs a sophisticated pricing mechanism that combines Automated Market Maker (AMM) technology with real-time order book dynamics to ensure fair, efficient, and transparent price discovery across our global, multi-language prediction markets.

## YC365 Pricing Architecture

### 🏗️ **System Architecture Foundation**

#### **Smart Contract Integration**:
- **LP Contract Set**: Manages independent liquidity pools for each condition's YES/NO tokens
- **Trading Contract Set**: Executes price-based buy/sell transactions
- **Order Trading Model**: Provides order book management and matching engine
- **Vault Contract Set**: Handles asset management and fee collection

#### **Multi-Component Price Discovery**:
- **Automated Market Maker**: Provides continuous liquidity and base pricing
- **Order Book System**: Enables limit order trading and price improvement
- **Real-time Settlement**: Instant price updates via smart contracts on BSC
- **Cross-Language Consistency**: Uniform pricing across all 6 supported languages

## Primary Pricing Mechanisms

### 📊 **Current Implementation: Order Book Model**

#### **Market Price Calculation**:
Based on YC365's technical architecture, the current pricing model uses:

```
Market Price = Lowest Ask Price (Seller's Minimum Price)
```

#### **Price Discovery Process**:
1. **Limit Orders**: Users place buy/sell orders at specific prices
2. **Order Matching**: Matching engine processes orders by price-time priority
3. **Price Setting**: Current market price = lowest available sell order
4. **Real-time Updates**: Prices update instantly with each trade

#### **Example Pricing**:
```
Order Book State:
Sell Orders: 0.65, 0.67, 0.70 USDT (YES tokens)
Buy Orders: 0.60, 0.58, 0.55 USDT (YES tokens)

Current Market Price: 0.65 USDT (lowest sell order)
Bid-Ask Spread: 0.65 - 0.60 = 0.05 USDT
```

### 🔄 **Future Enhancement: Comprehensive Model**

#### **Advanced Price Calculation** (Planned):
```
Market Price = Weighted Average of:
- Transaction Prices (40%)
- Trading Volume (25%)
- Buyer Bid Prices (20%)
- Market Depth (15%)
```

#### **Enhanced Features**:
- **Volume-Weighted Average Price (VWAP)**: Historical trading volume consideration
- **Bid-Ask Spread Optimization**: Tighter spreads through improved liquidity
- **Cross-Market Arbitrage**: Price consistency across related markets
- **Volatility Adjustment**: Price stability mechanisms

## Role-Based Price Management

### 👥 **Asset Administrator Functions**

#### **Liquidity Management**:
- **Initial Liquidity**: Set initial YES/NO token ratios and pricing
- **Liquidity Monitoring**: Track order book depth and trading activity
- **Liquidity Adjustment**: Add or recover liquidity to maintain market efficiency
- **Price Stability**: Ensure stable and fair pricing conditions

#### **Market Operations**:
- **Price Verification**: Monitor pricing accuracy and fairness
- **Arbitrage Prevention**: Detect and prevent price manipulation
- **Performance Analytics**: Analyze market performance and pricing efficiency
- **Fee Optimization**: Manage trading fees (0.15%) and gas cost optimization

### 🛠️ **Technical Price Infrastructure**

#### **Order Book Management** (Order Trading Model):
- **Limit Order Support**: Currently supports limit orders only (TPS < 100)
- **Price-Time Priority**: Orders matched by price first, then by time
- **Real-time Processing**: Immediate order processing and price updates
- **Order Validation**: Pre-matching order verification and integrity checks

#### **Settlement Service Integration**:
- **Off-chain Calculation**: Price calculations performed off-chain for efficiency
- **On-chain Execution**: Price changes executed on BSC blockchain
- **Batch Processing**: Efficient bulk transaction processing
- **Gas Optimization**: Optimized gas usage for BSC transactions

## Price Update Mechanisms

### ⚡ **Real-Time Price Updates**

#### **Update Triggers**:
- **New Trades**: Every buy/sell transaction execution
- **Order Book Changes**: New orders, cancellations, modifications
- **Liquidity Events**: Liquidity additions or removals by Asset Administrators
- **External Events**: News or information affecting market sentiment

#### **Update Process**:
1. **Transaction Execution**: Trade executed via Trading Contract Set
2. **Price Calculation**: New market price calculated by Order Trading Model
3. **Smart Contract Update**: Price stored on-chain via LP Contract Set
4. **UI Updates**: Real-time price display across all language interfaces
5. **API Distribution**: Price data distributed to all connected services

#### **Performance Characteristics**:
- **BSC Speed**: 3-second block times for near-instant confirmation
- **Low Latency**: Minimal delays in price propagation
- **High Throughput**: Support for high-frequency trading
- **Reliability**: 99.9%+ uptime for pricing services

### 🌐 **Multi-Language Price Display**

#### **Global Price Consistency**:
- **Uniform Pricing**: Identical prices across all language interfaces
- **Currency Formatting**: Local number formatting (e.g., 0.65 vs 0,65)
- **Time Zone Adjustment**: Local time stamps for price history
- **Cultural Adaptation**: Region-appropriate price presentation

#### **Localization Features**:
- **Number Formats**: Adapt to local number formatting conventions
- **Currency Symbols**: Display USDT appropriately for each region
- **Chart Styling**: Cultural preferences for chart colors and styles
- **Mobile Optimization**: Responsive pricing displays for all devices

## Advanced Price Features

### 📈 **Price Impact and Slippage**

#### **Slippage Calculation**:
```
Slippage = |Expected Price - Actual Execution Price| / Expected Price × 100%
```

#### **Factors Affecting Price Impact**:
- **Order Size**: Larger orders create more price impact
- **Liquidity Depth**: Deeper order books reduce slippage
- **Market Volatility**: High volatility increases price unpredictability
- **Time of Trade**: Market hours vs. off-hours liquidity differences

#### **Impact Examples**:
```
Small Trade (100 USDT): 0.1-0.5% slippage
Medium Trade (1,000 USDT): 0.5-2% slippage
Large Trade (10,000 USDT): 2-5% slippage
```

### 🛡️ **Price Protection Mechanisms**

#### **Anti-Manipulation Safeguards**:
- **Circuit Breakers**: Temporary trading halts for extreme price movements
- **Price Bands**: Maximum price movement limits per time period
- **Volume Monitoring**: Detect unusual trading volume patterns
- **Order Size Limits**: Maximum order size restrictions

#### **Monitoring Systems**:
- **Real-time Surveillance**: AI-powered price monitoring
- **Anomaly Detection**: Identify suspicious pricing patterns
- **Alert Systems**: Automatic alerts for price irregularities
- **Manual Oversight**: Asset Administrator monitoring and intervention

## Fee Structure and Price Impact

### 💰 **Trading Fee Integration**

#### **Current Fee Structure**:
- **Platform Fee**: 0.15% (1.5/1000) of transaction amount
- **Fee Application**: Applied to both buy and sell transactions
- **Fee Collection**: Automatic deduction via Trading Contract Set
- **Gas Fees**: BSC network fees (typically 0.005-0.02 USDT equivalent)

#### **Fee Calculation Example**:
```
Trade: Buy 1,000 YES tokens at 0.60 USDT each
Trade Value: 1,000 × 0.60 = 600 USDT
Platform Fee: 600 × 0.0015 = 0.90 USDT
Gas Fee: ~0.01 USDT (BSC network fee)
Total Cost: 600 + 0.90 + 0.01 = 600.91 USDT
```

#### **Fee Transparency**:
- **Pre-Trade Display**: Fees shown before transaction confirmation
- **Receipt Details**: Complete fee breakdown in transaction receipts
- **Multi-Language**: Fee information in user's preferred language
- **Real-time Updates**: Current gas fees displayed dynamically

## Price Analytics and Historical Data

### 📊 **Data Collection and Analysis**

#### **DApp Backend Service Integration**:
- **Graph Services**: Market price trend visualization with multiple time intervals
- **Data Collection**: 10-minute API data collection from Order Trading Model
- **Chart Generation**: 30-minute, 1-hour, 1-day, 1-week statistical analysis
- **Performance Tracking**: Comprehensive price performance analysis

#### **Analytics Features**:
- **Price History**: Complete historical price data storage
- **Volume Analysis**: Trading volume correlation with price movements
- **Volatility Metrics**: Price stability and volatility measurements
- **Trend Analysis**: Statistical trend identification and pattern recognition

### 📱 **User Interface and Accessibility**

#### **Price Display Features**:
- **Real-time Charts**: Live price charts with various time frames
- **Order Book Depth**: Visual representation of buy/sell order depth
- **Price Impact Calculator**: Estimate price impact before trading
- **Portfolio Tracking**: Personal position value and P&L calculations

#### **Multi-Language Support**:
- **Localized Interfaces**: Price interfaces in all 6 supported languages
- **Cultural Adaptation**: Chart styles and colors appropriate for each culture
- **Mobile Optimization**: Responsive design for mobile price monitoring
- **Accessibility**: WCAG compliance for price information accessibility

## Price Transparency and Verification

### 🔍 **Blockchain Transparency**

#### **On-Chain Price Data**:
- **Public Verification**: All price changes recorded on BSC blockchain
- **Smart Contract Transparency**: Open-source pricing logic
- **Transaction History**: Complete trade and price history on-chain
- **Audit Trail**: Immutable record of all pricing decisions

#### **External Verification**:
- **API Endpoints**: Public APIs for price data verification
- **Third-party Integration**: Integration with price tracking services
- **Oracle Integration**: Cross-reference with external price oracles
- **Community Monitoring**: User verification of pricing accuracy

### 📋 **Price Resolution and Settlement**

#### **Final Price Determination**:
- **Market Resolution**: Final prices set to 0 or 1 USDT based on outcomes
- **Settlement Process**: Automatic settlement via smart contracts
- **Payout Calculation**: Final payout = (Token Holdings) × (Final Price)
- **Fee Settlement**: Platform fees distributed according to revenue model

#### **Resolution Example**:
```
Market: "Will Bitcoin reach $100,000 by Dec 31, 2024?"
Your Position: 500 YES tokens purchased at average price 0.45 USDT
Outcome: YES (Bitcoin reaches $100,000)
Final Price: 1.00 USDT
Payout: 500 × 1.00 = 500 USDT
Profit: 500 - (500 × 0.45) - fees = 275 USDT - fees
```

## Future Enhancements

### 🚀 **Advanced Pricing Models**

#### **Planned Technical Improvements**:
- **Dynamic AMM**: Adaptive liquidity curves based on market conditions
- **Cross-Market Pricing**: Correlation-based pricing across related markets
- **AI-Enhanced Pricing**: Machine learning for price prediction and optimization
- **Multi-Asset Integration**: Complex pricing for multi-outcome markets

#### **Performance Upgrades**:
- **Increased TPS**: Higher transaction throughput (target: 500+ TPS)
- **Layer 2 Integration**: L2 solutions for faster, cheaper transactions
- **Advanced Order Types**: Market orders, stop-loss, and conditional orders
- **Risk Management**: Automated risk assessment and position sizing tools

### 🌍 **Global Expansion Features**

#### **Enhanced Localization**:
- **Additional Languages**: Japanese, Korean, Hindi, Arabic support
- **Regional Price Customization**: Local market hour adjustments
- **Cultural Price Display**: Region-specific price presentation preferences
- **Advanced Mobile Features**: Enhanced mobile price monitoring tools

---

**YC365's pricing mechanism ensures fair, transparent, and efficient price discovery through our advanced order book system and smart contract integration.** Our commitment to real-time updates, multi-language accessibility, and blockchain transparency provides users worldwide with reliable and accurate pricing information.

*Through continuous innovation and system optimization, we maintain pricing excellence while expanding our global reach and improving user experience across all supported languages and regions.* 