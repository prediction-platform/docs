!!! note "หมายเหตุการแปล"
    หน้านี้กำลังอยู่ระหว่างการแปลเป็นภาษาไทย เนื้อหาด้านล่างเป็นต้นฉบับภาษาอังกฤษเพื่อให้เข้าถึงข้อมูลได้ทันที

# Integration Guide

## Overview

This comprehensive integration guide will help developers seamlessly integrate YC365's prediction market functionality into their applications. Whether you're building a trading bot, creating a custom interface, or developing a DeFi application, this guide provides step-by-step instructions and best practices.

## Quick Start

### 🚀 **5-Minute Integration**

#### **Step 1: Get API Access**
1. **Sign Up**: Create your YC365 account
2. **Generate API Key**: Access the developer dashboard
3. **Choose Environment**: Start with sandbox for testing
4. **Download SDK**: Install your preferred language SDK

#### **Step 2: Basic Integration**
```javascript
// Install SDK
npm install yc365-sdk

// Basic setup
const YC365 = require('yc365-sdk');
const client = new YC365({
  apiKey: 'YOUR_API_KEY',
  environment: 'sandbox'
});

// Get markets
const markets = await client.markets.getAll();
console.log('Available markets:', markets.data);
```

#### **Step 3: Test Trading**
```javascript
// Place a test order
const order = await client.orders.create({
  market_id: 'market_001',
  side: 'buy',
  outcome: 'yes',
  amount: 100, // Test with small amount
  price: 0.5
});

console.log('Order placed:', order.data);
```

## Integration Patterns

### 📱 **Mobile App Integration**

#### **React Native Example**
```javascript
import { YC365Client } from 'yc365-sdk-react-native';

class TradingApp extends Component {
  constructor(props) {
    super(props);
    this.client = new YC365Client({
      apiKey: 'YOUR_API_KEY',
      environment: 'production'
    });
  }

  async loadMarkets() {
    try {
      const response = await this.client.markets.getAll();
      this.setState({ markets: response.data });
    } catch (error) {
      console.error('Failed to load markets:', error);
    }
  }

  async placeOrder(marketId, side, outcome, amount, price) {
    try {
      const order = await this.client.orders.create({
        market_id: marketId,
        side: side,
        outcome: outcome,
        amount: amount,
        price: price
      });
      return order.data;
    } catch (error) {
      throw new Error(`Order failed: ${error.message}`);
    }
  }
}
```

#### **iOS Swift Example**
```swift
import YC365SDK

class TradingViewController: UIViewController {
    private let client = YC365Client(apiKey: "YOUR_API_KEY", environment: .production)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMarkets()
    }
    
    private func loadMarkets() {
        client.markets.getAll { result in
            switch result {
            case .success(let markets):
                DispatchQueue.main.async {
                    self.updateMarkets(markets.data)
                }
            case .failure(let error):
                print("Failed to load markets: \(error)")
            }
        }
    }
    
    private func placeOrder(marketId: String, side: String, outcome: String, amount: Double, price: Double) {
        let orderRequest = CreateOrderRequest(
            marketId: marketId,
            side: side,
            outcome: outcome,
            amount: amount,
            price: price
        )
        
        client.orders.create(orderRequest) { result in
            switch result {
            case .success(let order):
                print("Order placed: \(order.data)")
            case .failure(let error):
                print("Order failed: \(error)")
            }
        }
    }
}
```

### 🌐 **Web Application Integration**

#### **React.js Example**
```jsx
import React, { useState, useEffect } from 'react';
import { YC365Client } from 'yc365-sdk';

const TradingInterface = () => {
  const [client] = useState(new YC365Client({
    apiKey: process.env.REACT_APP_YC365_API_KEY,
    environment: 'production'
  }));
  const [markets, setMarkets] = useState([]);
  const [selectedMarket, setSelectedMarket] = useState(null);
  const [orderForm, setOrderForm] = useState({
    side: 'buy',
    outcome: 'yes',
    amount: '',
    price: ''
  });

  useEffect(() => {
    loadMarkets();
  }, []);

  const loadMarkets = async () => {
    try {
      const response = await client.markets.getAll();
      setMarkets(response.data);
    } catch (error) {
      console.error('Failed to load markets:', error);
    }
  };

  const handleOrderSubmit = async (e) => {
    e.preventDefault();
    try {
      const order = await client.orders.create({
        market_id: selectedMarket.id,
        ...orderForm,
        amount: parseFloat(orderForm.amount),
        price: parseFloat(orderForm.price)
      });
      alert('Order placed successfully!');
      setOrderForm({ side: 'buy', outcome: 'yes', amount: '', price: '' });
    } catch (error) {
      alert(`Order failed: ${error.message}`);
    }
  };

  return (
    <div className="trading-interface">
      <h2>YC365 Trading Interface</h2>
      
      <div className="markets-section">
        <h3>Available Markets</h3>
        {markets.map(market => (
          <div key={market.id} className="market-card">
            <h4>{market.title}</h4>
            <p>YES: {market.yes_price} | NO: {market.no_price}</p>
            <button onClick={() => setSelectedMarket(market)}>
              Trade This Market
            </button>
          </div>
        ))}
      </div>

      {selectedMarket && (
        <div className="order-form">
          <h3>Place Order - {selectedMarket.title}</h3>
          <form onSubmit={handleOrderSubmit}>
            <select 
              value={orderForm.side} 
              onChange={(e) => setOrderForm({...orderForm, side: e.target.value})}
            >
              <option value="buy">Buy</option>
              <option value="sell">Sell</option>
            </select>
            
            <select 
              value={orderForm.outcome} 
              onChange={(e) => setOrderForm({...orderForm, outcome: e.target.value})}
            >
              <option value="yes">YES</option>
              <option value="no">NO</option>
            </select>
            
            <input
              type="number"
              placeholder="Amount"
              value={orderForm.amount}
              onChange={(e) => setOrderForm({...orderForm, amount: e.target.value})}
              required
            />
            
            <input
              type="number"
              step="0.01"
              placeholder="Price"
              value={orderForm.price}
              onChange={(e) => setOrderForm({...orderForm, price: e.target.value})}
              required
            />
            
            <button type="submit">Place Order</button>
          </form>
        </div>
      )}
    </div>
  );
};

export default TradingInterface;
```

#### **Vue.js Example**
```vue
<template>
  <div class="trading-app">
    <h2>YC365 Trading App</h2>
    
    <div class="markets-grid">
      <div 
        v-for="market in markets" 
        :key="market.id"
        class="market-card"
        @click="selectMarket(market)"
      >
        <h3>{{ market.title }}</h3>
        <div class="prices">
          <span class="yes-price">YES: {{ market.yes_price }}</span>
          <span class="no-price">NO: {{ market.no_price }}</span>
        </div>
        <div class="volume">Volume: {{ formatVolume(market.volume_24h) }}</div>
      </div>
    </div>

    <div v-if="selectedMarket" class="order-panel">
      <h3>Trade: {{ selectedMarket.title }}</h3>
      
      <form @submit.prevent="placeOrder">
        <div class="form-group">
          <label>Side:</label>
          <select v-model="orderForm.side">
            <option value="buy">Buy</option>
            <option value="sell">Sell</option>
          </select>
        </div>
        
        <div class="form-group">
          <label>Outcome:</label>
          <select v-model="orderForm.outcome">
            <option value="yes">YES</option>
            <option value="no">NO</option>
          </select>
        </div>
        
        <div class="form-group">
          <label>Amount:</label>
          <input 
            type="number" 
            v-model="orderForm.amount"
            placeholder="Enter amount"
            required
          />
        </div>
        
        <div class="form-group">
          <label>Price:</label>
          <input 
            type="number" 
            step="0.01"
            v-model="orderForm.price"
            placeholder="Enter price"
            required
          />
        </div>
        
        <button type="submit" :disabled="!isOrderValid">
          Place Order
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import { YC365Client } from 'yc365-sdk';

export default {
  name: 'TradingApp',
  data() {
    return {
      client: new YC365Client({
        apiKey: process.env.VUE_APP_YC365_API_KEY,
        environment: 'production'
      }),
      markets: [],
      selectedMarket: null,
      orderForm: {
        side: 'buy',
        outcome: 'yes',
        amount: '',
        price: ''
      }
    };
  },
  computed: {
    isOrderValid() {
      return this.orderForm.amount && this.orderForm.price && this.selectedMarket;
    }
  },
  async mounted() {
    await this.loadMarkets();
  },
  methods: {
    async loadMarkets() {
      try {
        const response = await this.client.markets.getAll();
        this.markets = response.data;
      } catch (error) {
        console.error('Failed to load markets:', error);
      }
    },
    
    selectMarket(market) {
      this.selectedMarket = market;
    },
    
    async placeOrder() {
      try {
        const order = await this.client.orders.create({
          market_id: this.selectedMarket.id,
          ...this.orderForm,
          amount: parseFloat(this.orderForm.amount),
          price: parseFloat(this.orderForm.price)
        });
        
        this.$toast.success('Order placed successfully!');
        this.resetOrderForm();
      } catch (error) {
        this.$toast.error(`Order failed: ${error.message}`);
      }
    },
    
    resetOrderForm() {
      this.orderForm = {
        side: 'buy',
        outcome: 'yes',
        amount: '',
        price: ''
      };
    },
    
    formatVolume(volume) {
      return new Intl.NumberFormat().format(volume);
    }
  }
};
</script>
```

### 🤖 **Trading Bot Integration**

#### **Python Trading Bot**
```python
import asyncio
import logging
from yc365 import YC365Client
from yc365.websocket import YC365WebSocket

class TradingBot:
    def __init__(self, api_key, environment='sandbox'):
        self.client = YC365Client(api_key=api_key, environment=environment)
        self.ws = YC365WebSocket(api_key=api_key, environment=environment)
        self.positions = {}
        self.logger = logging.getLogger(__name__)
        
    async def start(self):
        """Start the trading bot"""
        # Connect to WebSocket for real-time data
        await self.ws.connect()
        
        # Subscribe to market updates
        await self.ws.subscribe('market_updates')
        
        # Start main trading loop
        await self.trading_loop()
    
    async def trading_loop(self):
        """Main trading strategy loop"""
        while True:
            try:
                # Get current markets
                markets = await self.client.markets.get_all()
                
                # Analyze each market
                for market in markets.data:
                    await self.analyze_market(market)
                
                # Wait before next iteration
                await asyncio.sleep(60)  # 1 minute intervals
                
            except Exception as e:
                self.logger.error(f"Error in trading loop: {e}")
                await asyncio.sleep(30)  # Wait before retry
    
    async def analyze_market(self, market):
        """Analyze market and make trading decisions"""
        try:
            # Get market history for analysis
            history = await self.client.markets.get_history(
                market_id=market['id'],
                interval='1h',
                limit=24
            )
            
            # Simple moving average strategy
            prices = [h['yes_price'] for h in history.data]
            if len(prices) >= 20:
                sma_short = sum(prices[-10:]) / 10
                sma_long = sum(prices[-20:]) / 20
                
                current_price = market['yes_price']
                
                # Buy signal: short MA crosses above long MA
                if sma_short > sma_long and current_price < sma_short:
                    await self.place_order(
                        market_id=market['id'],
                        side='buy',
                        outcome='yes',
                        amount=100,
                        price=current_price
                    )
                
                # Sell signal: short MA crosses below long MA
                elif sma_short < sma_long and current_price > sma_short:
                    await self.close_position(market['id'])
                    
        except Exception as e:
            self.logger.error(f"Error analyzing market {market['id']}: {e}")
    
    async def place_order(self, market_id, side, outcome, amount, price):
        """Place a trading order"""
        try:
            order = await self.client.orders.create(
                market_id=market_id,
                side=side,
                outcome=outcome,
                amount=amount,
                price=price
            )
            
            self.logger.info(f"Order placed: {order.data}")
            
            # Track position
            if market_id not in self.positions:
                self.positions[market_id] = []
            self.positions[market_id].append(order.data)
            
        except Exception as e:
            self.logger.error(f"Failed to place order: {e}")
    
    async def close_position(self, market_id):
        """Close existing position"""
        if market_id in self.positions:
            for position in self.positions[market_id]:
                try:
                    # Place opposite order to close position
                    opposite_side = 'sell' if position['side'] == 'buy' else 'buy'
                    await self.client.orders.create(
                        market_id=market_id,
                        side=opposite_side,
                        outcome=position['outcome'],
                        amount=position['amount'],
                        price=position['price']
                    )
                    self.logger.info(f"Position closed for market {market_id}")
                except Exception as e:
                    self.logger.error(f"Failed to close position: {e}")
            
            # Clear positions
            self.positions[market_id] = []

# Usage
async def main():
    bot = TradingBot(
        api_key='YOUR_API_KEY',
        environment='sandbox'
    )
    
    await bot.start()

if __name__ == '__main__':
    asyncio.run(main())
```

#### **Node.js Trading Bot**
```javascript
const YC365 = require('yc365-sdk');
const WebSocket = require('ws');

class TradingBot {
  constructor(apiKey, environment = 'sandbox') {
    this.client = new YC365({
      apiKey: apiKey,
      environment: environment
    });
    this.ws = null;
    this.positions = new Map();
    this.isRunning = false;
  }

  async start() {
    console.log('Starting trading bot...');
    this.isRunning = true;
    
    // Connect to WebSocket
    await this.connectWebSocket();
    
    // Start trading loop
    this.tradingLoop();
  }

  async connectWebSocket() {
    return new Promise((resolve, reject) => {
      this.ws = new WebSocket('wss://ws.yc365.io/v1');
      
      this.ws.on('open', () => {
        console.log('WebSocket connected');
        
        // Authenticate
        this.ws.send(JSON.stringify({
          type: 'auth',
          api_key: this.client.apiKey
        }));
        
        // Subscribe to market updates
        this.ws.send(JSON.stringify({
          type: 'subscribe',
          channel: 'market_updates'
        }));
        
        resolve();
      });
      
      this.ws.on('message', (data) => {
        const message = JSON.parse(data);
        this.handleWebSocketMessage(message);
      });
      
      this.ws.on('error', (error) => {
        console.error('WebSocket error:', error);
        reject(error);
      });
    });
  }

  handleWebSocketMessage(message) {
    if (message.type === 'market_update') {
      this.handleMarketUpdate(message.data);
    }
  }

  async handleMarketUpdate(data) {
    const { market_id, yes_price, no_price } = data;
    
    // Simple strategy: buy when price drops significantly
    if (yes_price < 0.3) {
      await this.placeOrder(market_id, 'buy', 'yes', 100, yes_price);
    }
    
    // Sell when price rises significantly
    if (yes_price > 0.7) {
      await this.closePosition(market_id);
    }
  }

  async tradingLoop() {
    while (this.isRunning) {
      try {
        // Get all markets
        const markets = await this.client.markets.getAll();
        
        // Analyze each market
        for (const market of markets.data) {
          await this.analyzeMarket(market);
        }
        
        // Wait before next iteration
        await this.sleep(60000); // 1 minute
        
      } catch (error) {
        console.error('Error in trading loop:', error);
        await this.sleep(30000); // Wait before retry
      }
    }
  }

  async analyzeMarket(market) {
    try {
      // Get market history
      const history = await this.client.markets.getHistory(market.id, {
        interval: '1h',
        limit: 24
      });
      
      if (history.data.length >= 20) {
        const prices = history.data.map(h => h.yes_price);
        const smaShort = this.calculateSMA(prices.slice(-10));
        const smaLong = this.calculateSMA(prices.slice(-20));
        
        const currentPrice = market.yes_price;
        
        // Trading logic
        if (smaShort > smaLong && currentPrice < smaShort) {
          await this.placeOrder(market.id, 'buy', 'yes', 100, currentPrice);
        } else if (smaShort < smaLong && currentPrice > smaShort) {
          await this.closePosition(market.id);
        }
      }
      
    } catch (error) {
      console.error(`Error analyzing market ${market.id}:`, error);
    }
  }

  calculateSMA(prices) {
    return prices.reduce((sum, price) => sum + price, 0) / prices.length;
  }

  async placeOrder(marketId, side, outcome, amount, price) {
    try {
      const order = await this.client.orders.create({
        market_id: marketId,
        side: side,
        outcome: outcome,
        amount: amount,
        price: price
      });
      
      console.log('Order placed:', order.data);
      
      // Track position
      if (!this.positions.has(marketId)) {
        this.positions.set(marketId, []);
      }
      this.positions.get(marketId).push(order.data);
      
    } catch (error) {
      console.error('Failed to place order:', error);
    }
  }

  async closePosition(marketId) {
    const positions = this.positions.get(marketId);
    if (positions && positions.length > 0) {
      for (const position of positions) {
        try {
          const oppositeSide = position.side === 'buy' ? 'sell' : 'buy';
          await this.client.orders.create({
            market_id: marketId,
            side: oppositeSide,
            outcome: position.outcome,
            amount: position.amount,
            price: position.price
          });
          console.log(`Position closed for market ${marketId}`);
        } catch (error) {
          console.error('Failed to close position:', error);
        }
      }
      
      // Clear positions
      this.positions.set(marketId, []);
    }
  }

  sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  stop() {
    console.log('Stopping trading bot...');
    this.isRunning = false;
    if (this.ws) {
      this.ws.close();
    }
  }
}

// Usage
const bot = new TradingBot('YOUR_API_KEY', 'sandbox');
bot.start().catch(console.error);

// Graceful shutdown
process.on('SIGINT', () => {
  bot.stop();
  process.exit(0);
});
```

## DeFi Integration

### 🔗 **Smart Contract Integration**

#### **Solidity Example**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YC365Integration is ReentrancyGuard, Ownable {
    // YC365 API endpoints
    string private constant API_BASE = "https://api.yc365.io/v1";
    
    // Events
    event OrderPlaced(bytes32 indexed orderId, string marketId, uint256 amount);
    event OrderFilled(bytes32 indexed orderId, uint256 fillAmount);
    
    // Order structure
    struct Order {
        string marketId;
        string side;
        string outcome;
        uint256 amount;
        uint256 price;
        bool isActive;
    }
    
    mapping(bytes32 => Order) public orders;
    mapping(address => bytes32[]) public userOrders;
    
    // Place order through API
    function placeOrder(
        string memory marketId,
        string memory side,
        string memory outcome,
        uint256 amount,
        uint256 price
    ) external nonReentrant returns (bytes32) {
        require(amount > 0, "Amount must be greater than 0");
        require(price > 0 && price <= 1e18, "Invalid price");
        
        bytes32 orderId = keccak256(abi.encodePacked(
            msg.sender,
            marketId,
            side,
            outcome,
            amount,
            price,
            block.timestamp
        ));
        
        orders[orderId] = Order({
            marketId: marketId,
            side: side,
            outcome: outcome,
            amount: amount,
            price: price,
            isActive: true
        });
        
        userOrders[msg.sender].push(orderId);
        
        emit OrderPlaced(orderId, marketId, amount);
        
        // Call external API (would need oracle or off-chain execution)
        _executeOrder(orderId);
        
        return orderId;
    }
    
    // Execute order through API call
    function _executeOrder(bytes32 orderId) internal {
        Order storage order = orders[orderId];
        
        // This would typically be done off-chain or through an oracle
        // For demonstration purposes, we'll simulate the API call
        
        // In a real implementation, you would:
        // 1. Make HTTP request to YC365 API
        // 2. Handle the response
        // 3. Update order status
        
        // Simulate successful execution
        order.isActive = false;
        emit OrderFilled(orderId, order.amount);
    }
    
    // Get user's orders
    function getUserOrders(address user) external view returns (bytes32[] memory) {
        return userOrders[user];
    }
    
    // Get order details
    function getOrder(bytes32 orderId) external view returns (Order memory) {
        return orders[orderId];
    }
}
```

### 🌉 **Cross-Chain Integration**

#### **Multi-Chain Support**
```javascript
class CrossChainYC365 {
  constructor(config) {
    this.chains = {
      ethereum: new YC365Client({
        apiKey: config.ethereum.apiKey,
        environment: config.environment,
        chain: 'ethereum'
      }),
      bsc: new YC365Client({
        apiKey: config.bsc.apiKey,
        environment: config.environment,
        chain: 'bsc'
      }),
      polygon: new YC365Client({
        apiKey: config.polygon.apiKey,
        environment: config.environment,
        chain: 'polygon'
      })
    };
  }

  async getMarketsAcrossChains() {
    const markets = {};
    
    for (const [chain, client] of Object.entries(this.chains)) {
      try {
        const response = await client.markets.getAll();
        markets[chain] = response.data;
      } catch (error) {
        console.error(`Failed to get markets from ${chain}:`, error);
        markets[chain] = [];
      }
    }
    
    return markets;
  }

  async placeOrderOnChain(chain, orderParams) {
    const client = this.chains[chain];
    if (!client) {
      throw new Error(`Unsupported chain: ${chain}`);
    }
    
    return await client.orders.create(orderParams);
  }

  async bridgeAndTrade(fromChain, toChain, orderParams) {
    // 1. Bridge tokens to target chain
    await this.bridgeTokens(fromChain, toChain, orderParams.amount);
    
    // 2. Place order on target chain
    return await this.placeOrderOnChain(toChain, orderParams);
  }

  async bridgeTokens(fromChain, toChain, amount) {
    // Implementation would depend on your bridge solution
    // This is a placeholder for the actual bridging logic
    console.log(`Bridging ${amount} tokens from ${fromChain} to ${toChain}`);
  }
}
```

## Testing and Debugging

### 🧪 **Testing Strategies**

#### **Unit Testing**
```javascript
// Jest test example
const YC365 = require('yc365-sdk');

describe('YC365 Integration Tests', () => {
  let client;
  
  beforeEach(() => {
    client = new YC365({
      apiKey: 'test-api-key',
      environment: 'sandbox'
    });
  });
  
  test('should get markets', async () => {
    const markets = await client.markets.getAll();
    expect(markets.success).toBe(true);
    expect(Array.isArray(markets.data)).toBe(true);
  });
  
  test('should place order', async () => {
    const order = await client.orders.create({
      market_id: 'test-market',
      side: 'buy',
      outcome: 'yes',
      amount: 100,
      price: 0.5
    });
    
    expect(order.success).toBe(true);
    expect(order.data.order_id).toBeDefined();
  });
  
  test('should handle errors gracefully', async () => {
    try {
      await client.orders.create({
        market_id: 'invalid-market',
        side: 'buy',
        outcome: 'yes',
        amount: 100,
        price: 0.5
      });
    } catch (error) {
      expect(error.code).toBe('NOT_FOUND');
    }
  });
});
```

#### **Integration Testing**
```python
import pytest
import asyncio
from yc365 import YC365Client

@pytest.fixture
async def client():
    return YC365Client(api_key='test-key', environment='sandbox')

@pytest.mark.asyncio
async def test_market_integration(client):
    # Test market retrieval
    markets = await client.markets.get_all()
    assert markets.success is True
    assert len(markets.data) > 0
    
    # Test market details
    market_id = markets.data[0]['id']
    market_details = await client.markets.get_details(market_id)
    assert market_details.success is True
    assert market_details.data['id'] == market_id

@pytest.mark.asyncio
async def test_trading_integration(client):
    # Test order placement
    order = await client.orders.create(
        market_id='test-market',
        side='buy',
        outcome='yes',
        amount=100,
        price=0.5
    )
    assert order.success is True
    assert order.data['order_id'] is not None
    
    # Test order status
    order_status = await client.orders.get_status(order.data['order_id'])
    assert order_status.success is True
    assert order_status.data['status'] in ['pending', 'filled', 'cancelled']

@pytest.mark.asyncio
async def test_error_handling(client):
    with pytest.raises(Exception) as exc_info:
        await client.orders.create(
            market_id='invalid-market',
            side='buy',
            outcome='yes',
            amount=100,
            price=0.5
        )
    
    assert exc_info.value.code == 'NOT_FOUND'
```

### 🐛 **Debugging Tools**

#### **API Debugging**
```javascript
class YC365Debugger {
  constructor(client) {
    this.client = client;
    this.logs = [];
  }
  
  enableDebugMode() {
    // Override client methods to add logging
    const originalRequest = this.client.request;
    
    this.client.request = async (...args) => {
      const startTime = Date.now();
      const logEntry = {
        timestamp: new Date().toISOString(),
        method: args[0],
        url: args[1],
        data: args[2],
        startTime: startTime
      };
      
      try {
        const response = await originalRequest.apply(this.client, args);
        logEntry.endTime = Date.now();
        logEntry.duration = logEntry.endTime - logEntry.startTime;
        logEntry.success = true;
        logEntry.response = response;
        
        this.logs.push(logEntry);
        console.log('API Call:', logEntry);
        
        return response;
      } catch (error) {
        logEntry.endTime = Date.now();
        logEntry.duration = logEntry.endTime - logEntry.startTime;
        logEntry.success = false;
        logEntry.error = error.message;
        
        this.logs.push(logEntry);
        console.error('API Error:', logEntry);
        
        throw error;
      }
    };
  }
  
  getLogs() {
    return this.logs;
  }
  
  exportLogs() {
    return JSON.stringify(this.logs, null, 2);
  }
}

// Usage
const client = new YC365({ apiKey: 'your-key', environment: 'sandbox' });
const debugger = new YC365Debugger(client);
debugger.enableDebugMode();

// Your API calls will now be logged
const markets = await client.markets.getAll();
console.log('Debug logs:', debugger.getLogs());
```

## Performance Optimization

### ⚡ **Best Practices**

#### **Caching Strategy**
```javascript
class YC365Cache {
  constructor(ttl = 60000) { // 1 minute default TTL
    this.cache = new Map();
    this.ttl = ttl;
  }
  
  set(key, value) {
    this.cache.set(key, {
      value: value,
      timestamp: Date.now()
    });
  }
  
  get(key) {
    const item = this.cache.get(key);
    if (!item) return null;
    
    if (Date.now() - item.timestamp > this.ttl) {
      this.cache.delete(key);
      return null;
    }
    
    return item.value;
  }
  
  clear() {
    this.cache.clear();
  }
}

class OptimizedYC365Client {
  constructor(config) {
    this.client = new YC365(config);
    this.cache = new YC365Cache();
  }
  
  async getMarkets(useCache = true) {
    const cacheKey = 'markets';
    
    if (useCache) {
      const cached = this.cache.get(cacheKey);
      if (cached) {
        return cached;
      }
    }
    
    const markets = await this.client.markets.getAll();
    this.cache.set(cacheKey, markets);
    
    return markets;
  }
  
  async getMarketDetails(marketId, useCache = true) {
    const cacheKey = `market_${marketId}`;
    
    if (useCache) {
      const cached = this.cache.get(cacheKey);
      if (cached) {
        return cached;
      }
    }
    
    const market = await this.client.markets.getDetails(marketId);
    this.cache.set(cacheKey, market);
    
    return market;
  }
}
```

#### **Connection Pooling**
```javascript
const http = require('http');
const https = require('https');

class YC365ConnectionPool {
  constructor() {
    this.httpAgent = new http.Agent({
      keepAlive: true,
      maxSockets: 10,
      maxFreeSockets: 5,
      timeout: 60000
    });
    
    this.httpsAgent = new https.Agent({
      keepAlive: true,
      maxSockets: 10,
      maxFreeSockets: 5,
      timeout: 60000
    });
  }
  
  getAgent(url) {
    return url.startsWith('https') ? this.httpsAgent : this.httpAgent;
  }
}

// Use in client configuration
const pool = new YC365ConnectionPool();
const client = new YC365({
  apiKey: 'your-key',
  environment: 'production',
  httpAgent: pool.getAgent('https://api.yc365.io')
});
```

## Security Considerations

### 🔒 **Security Best Practices**

#### **API Key Management**
```javascript
class SecureYC365Client {
  constructor(config) {
    // Never log API keys
    this.apiKey = config.apiKey;
    this.environment = config.environment;
    
    // Validate API key format
    if (!this.validateApiKey(this.apiKey)) {
      throw new Error('Invalid API key format');
    }
  }
  
  validateApiKey(apiKey) {
    // Basic validation - adjust based on your key format
    return typeof apiKey === 'string' && apiKey.length >= 32;
  }
  
  // Sanitize logs to remove sensitive data
  sanitizeLog(data) {
    const sanitized = { ...data };
    if (sanitized.apiKey) {
      sanitized.apiKey = '***REDACTED***';
    }
    return sanitized;
  }
}
```

#### **Request Signing**
```javascript
const crypto = require('crypto');

class SignedYC365Client {
  constructor(config) {
    this.apiKey = config.apiKey;
    this.secretKey = config.secretKey;
    this.client = new YC365(config);
  }
  
  signRequest(method, path, body, timestamp) {
    const message = `${method}${path}${body || ''}${timestamp}`;
    const signature = crypto
      .createHmac('sha256', this.secretKey)
      .update(message)
      .digest('hex');
    
    return signature;
  }
  
  async makeSignedRequest(method, path, body = null) {
    const timestamp = Date.now().toString();
    const signature = this.signRequest(method, path, body, timestamp);
    
    const headers = {
      'Authorization': `Bearer ${this.apiKey}`,
      'X-Timestamp': timestamp,
      'X-Signature': signature,
      'Content-Type': 'application/json'
    };
    
    // Make request with signed headers
    return await this.client.request(method, path, body, headers);
  }
}
```

## Support and Resources

### 📚 **Additional Resources**

#### **Documentation Links**
- **API Reference**: Complete endpoint documentation
- **SDK Documentation**: Language-specific guides
- **Code Examples**: Sample implementations
- **Tutorials**: Step-by-step guides

#### **Community Support**
- **Developer Forum**: Community discussions
- **GitHub**: Open source examples and SDKs
- **Discord**: Real-time developer chat
- **Stack Overflow**: Tagged questions

#### **Enterprise Support**
- **Dedicated Support**: Priority support for enterprise clients
- **Custom Integration**: Tailored integration assistance
- **Training**: Team training and workshops
- **Consulting**: Architecture and strategy consulting

### 📞 **Contact Information**

For integration support, please contact:
- **Email**: integration-support@yc365.io
- **Live Chat**: Available 24/7 on platform
- **Telegram**: @YC365DevSupport
- **Discord**: YC365 Developer Server

---

**Ready to integrate YC365 into your application?** Our comprehensive integration guide and SDK support make it easy to get started with prediction market functionality.

*Join thousands of developers who are already building innovative applications on the YC365 platform.*
