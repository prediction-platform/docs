# 集成指南 (Integration Guide)

## 概览

这份全面的集成指南将帮助开发人员将 YC365 的预测市场功能无缝集成到他们的应用程序中。无论您是构建交易机器人、创建自定义界面还是开发 DeFi 应用程序，本指南都提供了分步说明和最佳实践。

## 快速开始

### 🚀 **5 分钟集成**

#### **第 1 步：获取 API 访问权限**
1. **注册**：创建您的 YC365 账户
2. **生成 API 密钥**：访问开发者仪表板
3. **选择环境**：从沙盒开始进行测试
4. **下载 SDK**：安装您首选语言的 SDK

#### **第 2 步：基本集成**
```javascript
// 安装 SDK
npm install yc365-sdk

// 基本设置
const YC365 = require('yc365-sdk');
const client = new YC365({
  apiKey: 'YOUR_API_KEY',
  environment: 'sandbox'
});

// 获取市场
const markets = await client.markets.getAll();
console.log('可用市场:', markets.data);
```

#### **第 3 步：测试交易**
```javascript
// 下达测试订单
const order = await client.orders.create({
  market_id: 'market_001',
  side: 'buy',
  outcome: 'yes',
  amount: 100, // 使用小额测试
  price: 0.5
});

console.log('订单已下达:', order.data);
```

## 集成模式

### 📱 **移动应用集成**

#### **React Native 示例**
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
      console.error('加载市场失败:', error);
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
      throw new Error(`订单失败: ${error.message}`);
    }
  }
}
```

#### **iOS Swift 示例**
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
                print("加载市场失败: \(error)")
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
                print("订单已下达: \(order.data)")
            case .failure(let error):
                print("订单失败: \(error)")
            }
        }
    }
}
```

### 🌐 **Web 应用程序集成**

#### **React.js 示例**
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
      console.error('加载市场失败:', error);
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
      alert('订单下达成功！');
      setOrderForm({ side: 'buy', outcome: 'yes', amount: '', price: '' });
    } catch (error) {
      alert(`订单失败: ${error.message}`);
    }
  };

  return (
    <div className="trading-interface">
      <h2>YC365 交易界面</h2>
      
      <div className="markets-section">
        <h3>可用市场</h3>
        {markets.map(market => (
          <div key={market.id} className="market-card">
            <h4>{market.title}</h4>
            <p>YES: {market.yes_price} | NO: {market.no_price}</p>
            <button onClick={() => setSelectedMarket(market)}>
              交易此市场
            </button>
          </div>
        ))}
      </div>

      {selectedMarket && (
        <div className="order-form">
          <h3>下订单 - {selectedMarket.title}</h3>
          <form onSubmit={handleOrderSubmit}>
            <select 
              value={orderForm.side} 
              onChange={(e) => setOrderForm({...orderForm, side: e.target.value})}
            >
              <option value="buy">买入</option>
              <option value="sell">卖出</option>
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
              placeholder="数量"
              value={orderForm.amount}
              onChange={(e) => setOrderForm({...orderForm, amount: e.target.value})}
              required
            />
            
            <input
              type="number"
              step="0.01"
              placeholder="价格"
              value={orderForm.price}
              onChange={(e) => setOrderForm({...orderForm, price: e.target.value})}
              required
            />
            
            <button type="submit">下订单</button>
          </form>
        </div>
      )}
    </div>
  );
};

export default TradingInterface;
```

#### **Vue.js 示例**
```vue
<template>
  <div class="trading-app">
    <h2>YC365 交易应用</h2>
    
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
        <div class="volume">成交量: {{ formatVolume(market.volume_24h) }}</div>
      </div>
    </div>

    <div v-if="selectedMarket" class="order-panel">
      <h3>交易: {{ selectedMarket.title }}</h3>
      
      <form @submit.prevent="placeOrder">
        <div class="form-group">
          <label>方向:</label>
          <select v-model="orderForm.side">
            <option value="buy">买入</option>
            <option value="sell">卖出</option>
          </select>
        </div>
        
        <div class="form-group">
          <label>结果:</label>
          <select v-model="orderForm.outcome">
            <option value="yes">YES</option>
            <option value="no">NO</option>
          </select>
        </div>
        
        <div class="form-group">
          <label>数量:</label>
          <input 
            type="number" 
            v-model="orderForm.amount"
            placeholder="输入数量"
            required
          />
        </div>
        
        <div class="form-group">
          <label>价格:</label>
          <input 
            type="number" 
            step="0.01"
            v-model="orderForm.price"
            placeholder="输入价格"
            required
          />
        </div>
        
        <button type="submit" :disabled="!isOrderValid">
          下订单
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
        console.error('加载市场失败:', error);
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
        
        this.$toast.success('订单下达成功！');
        this.resetOrderForm();
      } catch (error) {
        this.$toast.error(`订单失败: ${error.message}`);
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

### 🤖 **交易机器人集成**

#### **Python 交易机器人**
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
        """启动交易机器人"""
        # 连接到 WebSocket 以获取实时数据
        await self.ws.connect()
        
        # 订阅市场更新
        await self.ws.subscribe('market_updates')
        
        # 启动主交易循环
        await self.trading_loop()
    
    async def trading_loop(self):
        """主交易策略循环"""
        while True:
            try:
                # 获取当前市场
                markets = await self.client.markets.get_all()
                
                # 分析每个市场
                for market in markets.data:
                    await self.analyze_market(market)
                
                # 在下一次迭代前等待
                await asyncio.sleep(60)  # 1 分钟间隔
                
            except Exception as e:
                self.logger.error(f"交易循环错误: {e}")
                await asyncio.sleep(30)  # 重试前等待
    
    async def analyze_market(self, market):
        """分析市场并做出交易决策"""
        try:
            # 获取市场历史进行分析
            history = await self.client.markets.get_history(
                market_id=market['id'],
                interval='1h',
                limit=24
            )
            
            # 简单移动平均策略
            prices = [h['yes_price'] for h in history.data]
            if len(prices) >= 20:
                sma_short = sum(prices[-10:]) / 10
                sma_long = sum(prices[-20:]) / 20
                
                current_price = market['yes_price']
                
                # 买入信号：短期 MA 上穿长期 MA
                if sma_short > sma_long and current_price < sma_short:
                    await self.place_order(
                        market_id=market['id'],
                        side='buy',
                        outcome='yes',
                        amount=100,
                        price=current_price
                    )
                
                # 卖出信号：短期 MA 下穿长期 MA
                elif sma_short < sma_long and current_price > sma_short:
                    await self.close_position(market['id'])
                    
        except Exception as e:
            self.logger.error(f"分析市场 {market['id']} 时出错: {e}")
    
    async def place_order(self, market_id, side, outcome, amount, price):
        """下达交易订单"""
        try:
            order = await self.client.orders.create(
                market_id=market_id,
                side=side,
                outcome=outcome,
                amount=amount,
                price=price
            )
            
            self.logger.info(f"订单已下达: {order.data}")
            
            # 跟踪头寸
            if market_id not in self.positions:
                self.positions[market_id] = []
            self.positions[market_id].append(order.data)
            
        except Exception as e:
            self.logger.error(f"下订单失败: {e}")
    
    async def close_position(self, market_id):
        """平仓现有头寸"""
        if market_id in self.positions:
            for position in self.positions[market_id]:
                try:
                    # 下达相反订单以平仓
                    opposite_side = 'sell' if position['side'] == 'buy' else 'buy'
                    await self.client.orders.create(
                        market_id=market_id,
                        side=opposite_side,
                        outcome=position['outcome'],
                        amount=position['amount'],
                        price=position['price']
                    )
                    self.logger.info(f"市场 {market_id} 已平仓")
                except Exception as e:
                    self.logger.error(f"平仓失败: {e}")
            
            # 清除头寸
            self.positions[market_id] = []

# 用法
async def main():
    bot = TradingBot(
        api_key='YOUR_API_KEY',
        environment='sandbox'
    )
    
    await bot.start()

if __name__ == '__main__':
    asyncio.run(main())
```

#### **Node.js 交易机器人**
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
    console.log('正在启动交易机器人...');
    this.isRunning = true;
    
    // 连接到 WebSocket
    await this.connectWebSocket();
    
    // 启动交易循环
    this.tradingLoop();
  }

  async connectWebSocket() {
    return new Promise((resolve, reject) => {
      this.ws = new WebSocket('wss://ws.yc365.io/v1');
      
      this.ws.on('open', () => {
        console.log('WebSocket 已连接');
        
        // 认证
        this.ws.send(JSON.stringify({
          type: 'auth',
          api_key: this.client.apiKey
        }));
        
        // 订阅市场更新
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
        console.error('WebSocket 错误:', error);
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
    
    // 简单策略：价格大幅下跌时买入
    if (yes_price < 0.3) {
      await this.placeOrder(market_id, 'buy', 'yes', 100, yes_price);
    }
    
    // 价格大幅上涨时卖出
    if (yes_price > 0.7) {
      await this.closePosition(market_id);
    }
  }

  async tradingLoop() {
    while (this.isRunning) {
      try {
        // 获取所有市场
        const markets = await this.client.markets.getAll();
        
        // 分析每个市场
        for (const market of markets.data) {
          await this.analyzeMarket(market);
        }
        
        // 在下一次迭代前等待
        await this.sleep(60000); // 1 分钟
        
      } catch (error) {
        console.error('交易循环错误:', error);
        await this.sleep(30000); // 重试前等待
      }
    }
  }

  async analyzeMarket(market) {
    try {
      // 获取市场历史
      const history = await this.client.markets.getHistory(market.id, {
        interval: '1h',
        limit: 24
      });
      
      if (history.data.length >= 20) {
        const prices = history.data.map(h => h.yes_price);
        const smaShort = this.calculateSMA(prices.slice(-10));
        const smaLong = this.calculateSMA(prices.slice(-20));
        
        const currentPrice = market.yes_price;
        
        // 交易逻辑
        if (smaShort > smaLong && currentPrice < smaShort) {
          await this.placeOrder(market.id, 'buy', 'yes', 100, currentPrice);
        } else if (smaShort < smaLong && currentPrice > smaShort) {
          await this.closePosition(market.id);
        }
      }
      
    } catch (error) {
      console.error(`分析市场 ${market.id} 时出错:`, error);
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
      
      console.log('订单已下达:', order.data);
      
      // 跟踪头寸
      if (!this.positions.has(marketId)) {
        this.positions.set(marketId, []);
      }
      this.positions.get(marketId).push(order.data);
      
    } catch (error) {
      console.error('下订单失败:', error);
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
          console.log(`市场 ${marketId} 已平仓`);
        } catch (error) {
          console.error('平仓失败:', error);
        }
      }
      
      // 清除头寸
      this.positions.set(marketId, []);
    }
  }

  sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  stop() {
    console.log('正在停止交易机器人...');
    this.isRunning = false;
    if (this.ws) {
      this.ws.close();
    }
  }
}

// 用法
const bot = new TradingBot('YOUR_API_KEY', 'sandbox');
bot.start().catch(console.error);

// 优雅关闭
process.on('SIGINT', () => {
  bot.stop();
  process.exit(0);
});
```

## DeFi 集成

### 🔗 **智能合约集成**

#### **Solidity 示例**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YC365Integration is ReentrancyGuard, Ownable {
    // YC365 API 端点
    string private constant API_BASE = "https://api.yc365.io/v1";
    
    // 事件
    event OrderPlaced(bytes32 indexed orderId, string marketId, uint256 amount);
    event OrderFilled(bytes32 indexed orderId, uint256 fillAmount);
    
    // 订单结构
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
    
    // 通过 API 下订单
    function placeOrder(
        string memory marketId,
        string memory side,
        string memory outcome,
        uint256 amount,
        uint256 price
    ) external nonReentrant returns (bytes32) {
        require(amount > 0, "金额必须大于 0");
        require(price > 0 && price <= 1e18, "价格无效");
        
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
        
        // 调用外部 API (需要预言机或链下执行)
        _executeOrder(orderId);
        
        return orderId;
    }
    
    // 通过 API 调用执行订单
    function _executeOrder(bytes32 orderId) internal {
        Order storage order = orders[orderId];
        
        // 这通常在链下或通过预言机完成
        // 为了演示目的，我们将模拟 API 调用
        
        // 在实际实现中，您将：
        // 1. 向 YC365 API 发出 HTTP 请求
        // 2. 处理响应
        // 3. 更新订单状态
        
        // 模拟成功执行
        order.isActive = false;
        emit OrderFilled(orderId, order.amount);
    }
    
    // 获取用户的订单
    function getUserOrders(address user) external view returns (bytes32[] memory) {
        return userOrders[user];
    }
    
    // 获取订单详情
    function getOrder(bytes32 orderId) external view returns (Order memory) {
        return orders[orderId];
    }
}
```

### 🌉 **跨链集成**

#### **多链支持**
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
        console.error(`从 ${chain} 获取市场失败:`, error);
        markets[chain] = [];
      }
    }
    
    return markets;
  }

  async placeOrderOnChain(chain, orderParams) {
    const client = this.chains[chain];
    if (!client) {
      throw new Error(`不支持的链: ${chain}`);
    }
    
    return await client.orders.create(orderParams);
  }

  async bridgeAndTrade(fromChain, toChain, orderParams) {
    // 1. 将代币桥接到目标链
    await this.bridgeTokens(fromChain, toChain, orderParams.amount);
    
    // 2. 在目标链上下订单
    return await this.placeOrderOnChain(toChain, orderParams);
  }

  async bridgeTokens(fromChain, toChain, amount) {
    // 实现将取决于您的桥接解决方案
    // 这是实际桥接逻辑的占位符
    console.log(`将 ${amount} 代币从 ${fromChain} 桥接到 ${toChain}`);
  }
}
```

## 测试与调试

### 🧪 **测试策略**

#### **单元测试**
```javascript
// Jest 测试示例
const YC365 = require('yc365-sdk');

describe('YC365 集成测试', () => {
  let client;
  
  beforeEach(() => {
    client = new YC365({
      apiKey: 'test-api-key',
      environment: 'sandbox'
    });
  });
  
  test('应该获取市场', async () => {
    const markets = await client.markets.getAll();
    expect(markets.success).toBe(true);
    expect(Array.isArray(markets.data)).toBe(true);
  });
  
  test('应该下订单', async () => {
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
  
  test('应该优雅地处理错误', async () => {
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

#### **集成测试**
```python
import pytest
import asyncio
from yc365 import YC365Client

@pytest.fixture
async def client():
    return YC365Client(api_key='test-key', environment='sandbox')

@pytest.mark.asyncio
async def test_market_integration(client):
    # 测试市场检索
    markets = await client.markets.get_all()
    assert markets.success is True
    assert len(markets.data) > 0
    
    # 测试市场详情
    market_id = markets.data[0]['id']
    market_details = await client.markets.get_details(market_id)
    assert market_details.success is True
    assert market_details.data['id'] == market_id

@pytest.mark.asyncio
async def test_trading_integration(client):
    # 测试下订单
    order = await client.orders.create(
        market_id='test-market',
        side='buy',
        outcome='yes',
        amount=100,
        price=0.5
    )
    assert order.success is True
    assert order.data['order_id'] is not None
    
    # 测试订单状态
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

### 🐛 **调试工具**

#### **API 调试**
```javascript
class YC365Debugger {
  constructor(client) {
    this.client = client;
    this.logs = [];
  }
  
  enableDebugMode() {
    // 覆盖客户端方法以添加日志记录
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
        console.log('API 调用:', logEntry);
        
        return response;
      } catch (error) {
        logEntry.endTime = Date.now();
        logEntry.duration = logEntry.endTime - logEntry.startTime;
        logEntry.success = false;
        logEntry.error = error.message;
        
        this.logs.push(logEntry);
        console.error('API 错误:', logEntry);
        
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

// 用法
const client = new YC365({ apiKey: 'your-key', environment: 'sandbox' });
const debugger = new YC365Debugger(client);
debugger.enableDebugMode();

// 您的 API 调用现在将被记录
const markets = await client.markets.getAll();
console.log('调试日志:', debugger.getLogs());
```

## 性能优化

### ⚡ **最佳实践**

#### **缓存策略**
```javascript
class YC365Cache {
  constructor(ttl = 60000) { // 默认 1 分钟 TTL
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

#### **连接池**
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

// 在客户端配置中使用
const pool = new YC365ConnectionPool();
const client = new YC365({
  apiKey: 'your-key',
  environment: 'production',
  httpAgent: pool.getAgent('https://api.yc365.io')
});
```

## 安全注意事项

### 🔒 **安全最佳实践**

#### **API 密钥管理**
```javascript
class SecureYC365Client {
  constructor(config) {
    // 切勿记录 API 密钥
    this.apiKey = config.apiKey;
    this.environment = config.environment;
    
    // 验证 API 密钥格式
    if (!this.validateApiKey(this.apiKey)) {
      throw new Error('无效的 API 密钥格式');
    }
  }
  
  validateApiKey(apiKey) {
    // 基本验证 - 根据您的密钥格式进行调整
    return typeof apiKey === 'string' && apiKey.length >= 32;
  }
  
  // 清理日志以删除敏感数据
  sanitizeLog(data) {
    const sanitized = { ...data };
    if (sanitized.apiKey) {
      sanitized.apiKey = '***REDACTED***';
    }
    return sanitized;
  }
}
```

#### **请求签名**
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
    
    // 使用签名标头发出请求
    return await this.client.request(method, path, body, headers);
  }
}
```

## 支持与资源

### 📚 **其他资源**

#### **文档链接**
- **API 参考**：完整的端点文档
- **SDK 文档**：特定语言指南
- **代码示例**：示例实现
- **教程**：分步指南

#### **社区支持**
- **开发者论坛**：社区讨论
- **GitHub**：开源示例和 SDK
- **Discord**：实时开发者聊天
- **Stack Overflow**：标记的问题

#### **企业支持**
- **专属支持**：为企业客户提供优先支持
- **自定义集成**：量身定制的集成协助
- **培训**：团队培训和研讨会
- **咨询**：架构和策略咨询

### 📞 **联系信息**

有关集成支持，请联系：
- **电子邮件**：integration-support@yc365.io
- **实时聊天**：平台全天候可用
- **Telegram**：@YC365DevSupport
- **Discord**：YC365 开发者服务器

---

**准备好将 YC365 集成到您的应用程序中了吗？** 我们全面的集成指南和 SDK 支持使您可以轻松开始使用预测市场功能。

*加入成千上万已经在 YC365 平台上构建创新应用程序的开发人员。*
