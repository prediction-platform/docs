!!! note "翻译说明"
    本页面的完整中文翻译正在准备中。以下内容暂为英文原文，保证您可以立即查阅所有信息。

# Limit Orders

## Overview

Limit orders are the primary trading mechanism on YC365, allowing users to specify the exact price at which they want to buy or sell YES/NO tokens for prediction market events. This gives traders precise control over their entry and exit points while ensuring transparent and fair price discovery.

## What are Limit Orders?

### Definition
A limit order is an instruction to buy or sell tokens at a specific price or better. Unlike market orders that execute immediately at the current market price, limit orders will only execute when the market reaches your specified price level.

### Key Features
- **Price Control**: Set the exact price you're willing to pay or accept
- **Time in Force**: Orders remain active until filled, cancelled, or expired
- **No Slippage**: Execute at your specified price or better
- **Queue Priority**: Orders filled based on price-time priority

## How Limit Orders Work

### Order Types

#### Buy Limit Orders
- **Purpose**: Purchase YES or NO tokens at or below a specified price
- **Execution**: Fills when market price drops to or below your limit price
- **Example**: Place a buy order for YES tokens at 0.65 USDT when current price is 0.70 USDT

#### Sell Limit Orders
- **Purpose**: Sell YES or NO tokens at or above a specified price
- **Execution**: Fills when market price rises to or above your limit price
- **Example**: Place a sell order for YES tokens at 0.75 USDT when current price is 0.70 USDT

### Order Matching

#### Price-Time Priority
1. **Price Priority**: Orders with better prices get filled first
2. **Time Priority**: Among orders at the same price, earlier orders get filled first
3. **Partial Fills**: Large orders may be filled in multiple smaller transactions

#### Matching Engine
- **Real-time Processing**: Orders processed as soon as they're received
- **Fair Execution**: No preferential treatment for any user
- **Transparent Matching**: All order book activity is visible

## Placing Limit Orders

### Step-by-Step Process

#### 1. Select Event and Condition
- **Browse Events**: Navigate to the event you want to trade
- **Choose Condition**: Select the specific condition/outcome
- **Review Market**: Check current prices and order book depth

#### 2. Choose Token Type
- **YES Tokens**: Buy if you believe the outcome will occur
- **NO Tokens**: Buy if you believe the outcome will not occur
- **Token Pairs**: Each condition has corresponding YES/NO token pairs

#### 3. Set Order Parameters
- **Order Type**: Select "Buy" or "Sell"
- **Token Amount**: Specify how many tokens you want to trade
- **Limit Price**: Set your desired price per token
- **Order Review**: Confirm all details before submission

#### 4. Submit Order
- **Wallet Confirmation**: Approve the transaction in your wallet
- **Asset Lock**: Required assets are locked in the smart contract
- **Order Confirmation**: Receive confirmation of order placement

### Order Parameters

#### Price Settings
- **Minimum Price**: 0.01 USDT per token
- **Maximum Price**: 0.99 USDT per token
- **Price Increments**: 0.01 USDT minimum increments
- **Dynamic Pricing**: Prices automatically adjust based on market activity

#### Quantity Settings
- **Minimum Order**: 1 token minimum order size
- **Maximum Order**: No maximum limit (subject to available liquidity)
- **Decimal Places**: Orders can include decimal token amounts
- **Total Value**: Calculated as Price × Quantity

#### Time Settings
- **Good Till Cancelled (GTC)**: Order remains active until filled or cancelled
- **Event Expiration**: Orders automatically cancelled when event expires
- **Trading Cutoff**: Orders cancelled 1 hour before event resolution

## Order Management

### Viewing Your Orders

#### Active Orders
- **Open Orders**: View all unfilled orders
- **Order Status**: Track order execution progress
- **Partial Fills**: Monitor partially filled orders
- **Order History**: Review all past orders

#### Order Information
- **Order Details**: Price, quantity, token type, timestamp
- **Fill Status**: Filled, partially filled, or open
- **Remaining Quantity**: Amount still waiting to be filled
- **Average Fill Price**: Weighted average price of filled portions

### Modifying Orders

#### Order Cancellation
- **Cancel Process**: Cancel orders through the trading interface
- **Asset Release**: Locked assets returned to your account
- **Immediate Effect**: Cancellation takes effect immediately
- **No Fees**: No fees charged for order cancellation

#### Order Updates
- **Price Changes**: Cancel and replace with new price
- **Quantity Changes**: Cancel and replace with new quantity
- **No Direct Modification**: Orders cannot be directly modified

### Order Execution

#### Fill Types
- **Complete Fill**: Entire order executed at once
- **Partial Fill**: Order filled in multiple smaller amounts
- **No Fill**: Order remains open if price not reached

#### Execution Notifications
- **Fill Notifications**: Instant notifications when orders are filled
- **Email Alerts**: Optional email notifications for order activity
- **Portfolio Updates**: Real-time portfolio balance updates
- **Transaction History**: Complete record of all executions

## Advanced Order Features

### Order Book Integration

#### Market Depth
- **Bid/Ask Spread**: View the difference between buy and sell prices
- **Order Book Depth**: See all pending orders at different price levels
- **Liquidity Analysis**: Assess market liquidity before placing orders
- **Price Impact**: Estimate potential price impact of large orders

#### Market Making
- **Spread Trading**: Place both buy and sell orders to capture spread
- **Liquidity Provision**: Provide liquidity to earn from spreads
- **Market Efficiency**: Help maintain efficient price discovery
- **Risk Management**: Manage inventory and exposure carefully

### Risk Management

#### Position Limits
- **Account Limits**: Maximum position size based on account balance
- **Event Limits**: Limits per individual event
- **Portfolio Limits**: Overall portfolio exposure limits
- **Risk Monitoring**: Real-time risk assessment and alerts

#### Stop-Loss Strategies
- **Manual Monitoring**: Monitor positions and manually place protective orders
- **Portfolio Hedging**: Use opposite positions to hedge risk
- **Diversification**: Spread risk across multiple events and outcomes
- **Capital Management**: Never risk more than you can afford to lose

## Order Fees and Costs

### Trading Fees
- **Platform Fee**: 0.15% fee on executed trades (1.5/1000)
- **Fee Calculation**: Fees calculated on the total trade value
- **Fee Deduction**: Fees automatically deducted from trade proceeds
- **Fee Transparency**: All fees clearly displayed before order submission

### Gas Fees
- **Network Fees**: BSC network gas fees for blockchain transactions
- **Dynamic Pricing**: Gas fees vary based on network congestion
- **Fee Optimization**: Platform optimizes gas usage for efficiency
- **User Responsibility**: Users pay gas fees for their transactions

### Cost Examples

#### Example 1: Buying YES Tokens
- **Order**: Buy 100 YES tokens at 0.65 USDT each
- **Trade Value**: 100 × 0.65 = 65 USDT
- **Platform Fee**: 65 × 0.0015 = 0.0975 USDT
- **Gas Fee**: ~0.01 USDT (varies)
- **Total Cost**: 65 + 0.0975 + 0.01 = 65.1075 USDT

#### Example 2: Selling NO Tokens
- **Order**: Sell 50 NO tokens at 0.45 USDT each
- **Trade Value**: 50 × 0.45 = 22.5 USDT
- **Platform Fee**: 22.5 × 0.0015 = 0.03375 USDT
- **Gas Fee**: ~0.01 USDT (varies)
- **Net Proceeds**: 22.5 - 0.03375 - 0.01 = 22.45625 USDT

## Best Practices

### Order Placement Strategy

#### Market Analysis
- **Study Order Book**: Analyze current buy/sell pressure
- **Check Market History**: Review recent price movements
- **Assess Liquidity**: Ensure sufficient liquidity for your order size
- **Monitor News**: Stay informed about events that may affect prices

#### Timing Considerations
- **Market Hours**: Consider when markets are most active
- **Event Timeline**: Factor in time until event resolution
- **Volatility Periods**: Adjust strategy during high volatility
- **News Events**: Be aware of scheduled announcements

### Risk Management

#### Position Sizing
- **Start Small**: Begin with smaller position sizes
- **Gradual Increase**: Increase position sizes as you gain experience
- **Diversification**: Don't put all funds in a single event
- **Capital Preservation**: Protect your trading capital

#### Order Hygiene
- **Regular Review**: Regularly review and update open orders
- **Stale Orders**: Cancel orders that are no longer relevant
- **Price Validation**: Ensure order prices reflect current market conditions
- **Order Cleanup**: Maintain a clean and organized order book

## Common Issues and Solutions

### Order Execution Issues

#### Orders Not Filling
- **Price Too Aggressive**: Your limit price may be too far from market
- **Low Liquidity**: Insufficient liquidity at your price level
- **Market Movement**: Market moved away from your order price
- **Solution**: Adjust price closer to current market levels

#### Partial Fills
- **Limited Liquidity**: Not enough liquidity to fill entire order
- **Large Order Size**: Order too large for current market depth
- **Solution**: Break large orders into smaller chunks

### Technical Issues

#### Transaction Failures
- **Insufficient Gas**: Increase gas limit for complex transactions
- **Network Congestion**: Wait for lower network activity periods
- **Wallet Issues**: Ensure wallet is properly connected and funded
- **Solution**: Check gas settings and wallet connectivity

#### Order Book Delays
- **Network Latency**: Internet connection delays
- **Platform Load**: High platform usage during peak times
- **Solution**: Refresh page or wait for system to update

## Trading Psychology

### Emotional Management
- **Stay Disciplined**: Stick to your trading plan
- **Avoid FOMO**: Don't chase prices due to fear of missing out
- **Manage Greed**: Take profits when targets are reached
- **Control Fear**: Don't panic during market volatility

### Learning and Improvement
- **Keep Records**: Maintain detailed trading logs
- **Analyze Performance**: Regular review of trading results
- **Learn from Mistakes**: Identify and learn from trading errors
- **Continuous Education**: Stay informed about market developments

## Future Enhancements

### Advanced Order Types
- **Stop Orders**: Automatic order triggers at specific price levels
- **Iceberg Orders**: Hide large order sizes from public view
- **Time-based Orders**: Orders with specific time-based conditions
- **Conditional Orders**: Orders triggered by specific market conditions

### Improved User Experience
- **Mobile Trading**: Enhanced mobile trading interface
- **Order Templates**: Save and reuse common order configurations
- **Advanced Charts**: Integrated charting and technical analysis tools
- **Social Trading**: Follow and copy successful traders

### AI Integration
- **Smart Order Routing**: AI-optimized order execution
- **Predictive Analytics**: AI-powered market predictions
- **Risk Assessment**: Automated risk analysis and alerts
- **Portfolio Optimization**: AI-assisted portfolio management

---

*For the latest information on limit orders and trading features, please check our official announcements.* 