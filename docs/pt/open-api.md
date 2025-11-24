# Open API

## Visão Geral

A YC365 fornece uma Open API abrangente que permite aos desenvolvedores integrar a funcionalidade do mercado de previsão em seus aplicativos, construir interfaces de negociação personalizadas e acessar dados de mercado em tempo real. Nossa API é projetada pensando na experiência do desenvolvedor, oferecendo endpoints RESTful com documentação abrangente e suporte a SDK.

## Recursos da API

### 🔌 **Capacidades Principais**
- **Dados de Mercado**: Feeds de preços em tempo real, volume e estatísticas de mercado
- **Operações de Negociação**: Colocar ordens, gerenciar posições e executar negociações
- **Gestão de Usuários**: Informações da conta, saldos e histórico de transações
- **Gestão de Eventos**: Criar, monitorar e resolver mercados de previsão
- **Suporte WebSocket**: Streaming de dados em tempo real para atualizações ao vivo

### 🛡️ **Segurança e Autenticação**
- **Autenticação de Chave API**: Acesso seguro usando chaves API
- **Limitação de Taxa (Rate Limiting)**: Políticas de uso justo para garantir a estabilidade da plataforma
- **Assinatura de Solicitação**: Verificação criptográfica de solicitação
- **Lista Branca de IP**: Segurança aprimorada através de restrições de IP

## Começando

### 1. Acesso à API

#### **Processo de Registro**
1. **Criar Conta**: Inscreva-se para uma conta YC365
2. **Gerar Chave API**: Gere suas chaves API no painel
3. **Acesso à Documentação**: Acesse a documentação abrangente da API
4. **Ambiente de Teste**: Use o ambiente sandbox para desenvolvimento

#### **Gestão de Chaves API**
- **Chave Principal**: Acesso total a todos os endpoints da API
- **Chave Somente Leitura**: Limitada a operações de recuperação de dados
- **Escopos Personalizados**: Controle granular de permissões
- **Rotação de Chaves**: Atualizações regulares de chaves para segurança aprimorada

### 2. Configuração Base

#### **URLs Base**
```
Produção: https://api.yc365.io/v1
Sandbox: https://api-sandbox.yc365.io/v1
WebSocket: wss://ws.yc365.io/v1
```

#### **Cabeçalhos de Autenticação**
```http
Authorization: Bearer SUA_CHAVE_API
Content-Type: application/json
X-API-Version: 1.0
```

## Endpoints da API

### 📊 **Dados de Mercado**

#### **Obter Todos os Mercados**
```http
GET /markets
```

**Resposta:**
```json
{
  "success": true,
  "data": [
    {
      "id": "market_001",
      "title": "O Bitcoin atingirá $100.000 até o final de 2024?",
      "category": "cryptocurrency",
      "status": "active",
      "end_time": "2024-12-31T23:59:59Z",
      "yes_price": 0.65,
      "no_price": 0.35,
      "volume_24h": 125000,
      "liquidity": 500000
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 50,
    "total": 150
  }
}
```

#### **Obter Detalhes do Mercado**
```http
GET /markets/{market_id}
```

**Parâmetros:**
- `market_id` (string): Identificador único do mercado

**Resposta:**
```json
{
  "success": true,
  "data": {
    "id": "market_001",
    "title": "O Bitcoin atingirá $100.000 até o final de 2024?",
    "description": "Este mercado será resolvido como SIM se o Bitcoin atingir $100.000 ou mais até 31 de dezembro de 2024.",
    "category": "cryptocurrency",
    "status": "active",
    "created_at": "2024-01-15T10:30:00Z",
    "end_time": "2024-12-31T23:59:59Z",
    "resolution_criteria": "Dados de preço da CoinGecko",
    "yes_price": 0.65,
    "no_price": 0.35,
    "volume_24h": 125000,
    "liquidity": 500000,
    "trading_fee": 0.0015,
    "tags": ["bitcoin", "price", "cryptocurrency"]
  }
}
```

#### **Obter Histórico do Mercado**
```http
GET /markets/{market_id}/history
```

**Parâmetros:**
- `market_id` (string): Identificador do mercado
- `interval` (string): Intervalo de tempo (1m, 5m, 1h, 1d)
- `start_time` (string): Hora de início (ISO 8601)
- `end_time` (string): Hora de término (ISO 8601)

**Resposta:**
```json
{
  "success": true,
  "data": [
    {
      "timestamp": "2024-01-15T10:00:00Z",
      "yes_price": 0.62,
      "no_price": 0.38,
      "volume": 5000,
      "trades": 25
    }
  ]
}
```

### 💰 **Operações de Negociação**

#### **Colocar Ordem**
```http
POST /orders
```

**Corpo da Solicitação:**
```json
{
  "market_id": "market_001",
  "side": "buy",
  "outcome": "yes",
  "amount": 1000,
  "price": 0.65,
  "order_type": "limit"
}
```

**Resposta:**
```json
{
  "success": true,
  "data": {
    "order_id": "order_12345",
    "status": "pending",
    "market_id": "market_001",
    "side": "buy",
    "outcome": "yes",
    "amount": 1000,
    "price": 0.65,
    "filled_amount": 0,
    "remaining_amount": 1000,
    "created_at": "2024-01-15T10:30:00Z"
  }
}
```

#### **Obter Status da Ordem**
```http
GET /orders/{order_id}
```

**Resposta:**
```json
{
  "success": true,
  "data": {
    "order_id": "order_12345",
    "status": "filled",
    "market_id": "market_001",
    "side": "buy",
    "outcome": "yes",
    "amount": 1000,
    "price": 0.65,
    "filled_amount": 1000,
    "remaining_amount": 0,
    "created_at": "2024-01-15T10:30:00Z",
    "filled_at": "2024-01-15T10:31:15Z",
    "trades": [
      {
        "trade_id": "trade_67890",
        "amount": 1000,
        "price": 0.65,
        "timestamp": "2024-01-15T10:31:15Z"
      }
    ]
  }
}
```

#### **Cancelar Ordem**
```http
DELETE /orders/{order_id}
```

**Resposta:**
```json
{
  "success": true,
  "data": {
    "order_id": "order_12345",
    "status": "cancelled",
    "message": "Order successfully cancelled"
  }
}
```

### 👤 **Gestão de Usuários**

#### **Obter Saldo da Conta**
```http
GET /account/balance
```

**Resposta:**
```json
{
  "success": true,
  "data": {
    "total_balance": 10000,
    "available_balance": 8500,
    "locked_balance": 1500,
    "currency": "USDT",
    "positions": [
      {
        "market_id": "market_001",
        "outcome": "yes",
        "amount": 1000,
        "average_price": 0.65,
        "unrealized_pnl": 150
      }
    ]
  }
}
```

#### **Obter Histórico de Transações**
```http
GET /account/transactions
```

**Parâmetros:**
- `type` (string): Tipo de transação (deposit, withdrawal, trade, fee)
- `start_date` (string): Data de início (ISO 8601)
- `end_date` (string): Data de término (ISO 8601)
- `page` (integer): Número da página
- `limit` (integer): Itens por página

**Resposta:**
```json
{
  "success": true,
  "data": [
    {
      "transaction_id": "tx_12345",
      "type": "trade",
      "amount": 1000,
      "currency": "USDT",
      "description": "Buy YES tokens for market_001",
      "timestamp": "2024-01-15T10:31:15Z",
      "status": "completed"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 50,
    "total": 200
  }
}
```

### 🎯 **Gestão de Eventos**

#### **Criar Proposta de Mercado**
```http
POST /markets/proposals
```

**Corpo da Solicitação:**
```json
{
  "title": "O Ethereum atingirá $5.000 até o segundo trimestre de 2024?",
  "description": "Este mercado será resolvido como SIM se o Ethereum atingir $5.000 ou mais até 30 de junho de 2024.",
  "category": "cryptocurrency",
  "end_time": "2024-06-30T23:59:59Z",
  "resolution_criteria": "Dados de preço da CoinGecko",
  "tags": ["ethereum", "price", "cryptocurrency"]
}
```

**Resposta:**
```json
{
  "success": true,
  "data": {
    "proposal_id": "prop_12345",
    "status": "pending_review",
    "title": "O Ethereum atingirá $5.000 até o segundo trimestre de 2024?",
    "created_at": "2024-01-15T10:30:00Z",
    "estimated_review_time": "2-3 business days"
  }
}
```

## WebSocket API

### 🔌 **Streaming de Dados em Tempo Real**

#### **Conexão**
```javascript
const ws = new WebSocket('wss://ws.yc365.io/v1');
```

#### **Autenticação**
```javascript
ws.onopen = function() {
  ws.send(JSON.stringify({
    type: 'auth',
    api_key: 'SUA_CHAVE_API'
  }));
};
```

#### **Inscrever-se para Atualizações de Mercado**
```javascript
ws.send(JSON.stringify({
  type: 'subscribe',
  channel: 'market_updates',
  market_id: 'market_001'
}));
```

#### **Formato da Mensagem**
```json
{
  "type": "market_update",
  "market_id": "market_001",
  "data": {
    "yes_price": 0.67,
    "no_price": 0.33,
    "volume_24h": 130000,
    "timestamp": "2024-01-15T10:35:00Z"
  }
}
```

## Suporte a SDK

### 📚 **SDKs Disponíveis**

#### **JavaScript/Node.js**
```bash
npm install yc365-sdk
```

```javascript
const YC365 = require('yc365-sdk');

const client = new YC365({
  apiKey: 'SUA_CHAVE_API',
  environment: 'sandbox' // ou 'production'
});

// Obter mercados
const markets = await client.markets.getAll();

// Colocar ordem
const order = await client.orders.create({
  market_id: 'market_001',
  side: 'buy',
  outcome: 'yes',
  amount: 1000,
  price: 0.65
});
```

#### **Python**
```bash
pip install yc365-sdk
```

```python
from yc365 import YC365Client

client = YC365Client(
    api_key='SUA_CHAVE_API',
    environment='sandbox'
)

# Obter mercados
markets = client.markets.get_all()

# Colocar ordem
order = client.orders.create(
    market_id='market_001',
    side='buy',
    outcome='yes',
    amount=1000,
    price=0.65
)
```

#### **Go**
```bash
go get github.com/yc365/go-sdk
```

```go
package main

import (
    "github.com/yc365/go-sdk"
)

func main() {
    client := yc365.NewClient("SUA_CHAVE_API", "sandbox")
    
    // Obter mercados
    markets, err := client.Markets.GetAll()
    
    // Colocar ordem
    order, err := client.Orders.Create(yc365.CreateOrderRequest{
        MarketID: "market_001",
        Side:     "buy",
        Outcome:  "yes",
        Amount:   1000,
        Price:    0.65,
    })
}
```

## Limites de Taxa (Rate Limits)

### ⚡ **Política de Limitação de Taxa**

| Tipo de Endpoint | Limite de Taxa | Limite de Burst |
|---------------|------------|-------------|
| **Dados de Mercado** | 100 solicitações/minuto | 200 solicitações/minuto |
| **Operações de Negociação** | 50 solicitações/minuto | 100 solicitações/minuto |
| **Gestão de Usuários** | 30 solicitações/minuto | 60 solicitações/minuto |
| **WebSocket** | 10 conexões | 20 conexões |

### 📊 **Cabeçalhos de Limite de Taxa**
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1642234567
```

## Tratamento de Erros

### ❌ **Formato de Resposta de Erro**
```json
{
  "success": false,
  "error": {
    "code": "INVALID_PARAMETER",
    "message": "Invalid market_id provided",
    "details": {
      "field": "market_id",
      "value": "invalid_id",
      "expected": "string"
    }
  },
  "request_id": "req_12345"
}
```

### 🔢 **Códigos de Erro**

| Código | Descrição | Status HTTP |
|------|-------------|-------------|
| `INVALID_PARAMETER` | Parâmetro de solicitação inválido | 400 |
| `UNAUTHORIZED` | Chave API inválida ou ausente | 401 |
| `FORBIDDEN` | Permissões insuficientes | 403 |
| `NOT_FOUND` | Recurso não encontrado | 404 |
| `RATE_LIMITED` | Limite de taxa excedido | 429 |
| `INTERNAL_ERROR` | Erro do servidor | 500 |
| `MARKET_CLOSED` | Mercado não está disponível para negociação | 400 |
| `INSUFFICIENT_BALANCE` | Saldo insuficiente para operação | 400 |
| `ORDER_NOT_FOUND` | A ordem não existe | 404 |

## Teste e Desenvolvimento

### 🧪 **Ambiente Sandbox**

#### **Recursos**
- **Dados de Teste**: Dados de mercado realistas para teste
- **Fundos Virtuais**: USDT de teste ilimitado para desenvolvimento
- **Acesso Total à API**: Todos os endpoints de produção disponíveis
- **Suporte WebSocket**: Streaming de dados em tempo real

#### **Começando**
1. **Inscrever-se**: Crie uma conta sandbox
2. **Gerar Chave API**: Obtenha sua chave API sandbox
3. **Iniciar Teste**: Use endpoints sandbox para desenvolvimento
4. **Monitorar Uso**: Rastreie o uso e desempenho da API

### 📝 **Ferramentas de Teste de API**

#### **Coleção Postman**
- **Download**: Coleção Postman completa disponível
- **Variáveis de Ambiente**: Ambientes pré-configurados
- **Exemplos**: Solicitações de amostra para todos os endpoints
- **Documentação**: Documentação de API integrada

#### **Exemplos cURL**
```bash
# Obter todos os mercados
curl -X GET "https://api-sandbox.yc365.io/v1/markets" \
  -H "Authorization: Bearer SUA_CHAVE_API" \
  -H "Content-Type: application/json"

# Colocar ordem
curl -X POST "https://api-sandbox.yc365.io/v1/orders" \
  -H "Authorization: Bearer SUA_CHAVE_API" \
  -H "Content-Type: application/json" \
  -d '{
    "market_id": "market_001",
    "side": "buy",
    "outcome": "yes",
    "amount": 1000,
    "price": 0.65
  }'
```

## Melhores Práticas

### 💡 **Diretrizes de Desenvolvimento**

#### **Uso da API**
- **Use HTTPS**: Sempre use conexões seguras
- **Trate Erros**: Implemente tratamento de erros adequado
- **Limitação de Taxa**: Respeite os limites de taxa e implemente backoff
- **Cache**: Armazene em cache dados de mercado quando apropriado
- **WebSockets**: Use WebSockets para dados em tempo real

#### **Segurança**
- **Proteção de Chave API**: Nunca exponha chaves API no código do lado do cliente
- **Assinatura de Solicitação**: Use assinatura de solicitação para operações sensíveis
- **Lista Branca de IP**: Restrinja o acesso à API a endereços IP conhecidos
- **Rotação de Chaves**: Gire regularmente as chaves API

#### **Desempenho**
- **Pooling de Conexão**: Reutilize conexões HTTP
- **Operações em Lote**: Use endpoints em lote quando disponíveis
- **Paginação**: Implemente paginação adequada para grandes conjuntos de dados
- **Monitoramento**: Monitore o uso e desempenho da API

## Suporte e Recursos

### 🆘 **Suporte ao Desenvolvedor**

#### **Documentação**
- **Referência da API**: Documentação completa do endpoint
- **Documentação do SDK**: Guias específicos de linguagem
- **Exemplos de Código**: Implementações de amostra
- **Tutoriais**: Guias de integração passo a passo

#### **Comunidade**
- **Fórum de Desenvolvedores**: Suporte e discussões da comunidade
- **GitHub**: SDKs e exemplos de código aberto
- **Discord**: Chat de desenvolvedores em tempo real
- **Stack Overflow**: Perguntas e respostas marcadas

#### **Canais de Suporte**
- **E-mail**: api-support@yc365.io
- **Chat Ao Vivo**: Disponível 24/7 para problemas de API
- **Suporte Prioritário**: Suporte dedicado para clientes corporativos

### 📞 **Informações de Contato**

Para suporte relacionado à API, entre em contato:
- **E-mail**: api-support@yc365.io
- **Chat Ao Vivo**: Disponível 24/7 na plataforma
- **Telegram**: @YC365DevSupport
- **Discord**: Servidor de Desenvolvedores YC365

---

**Comece a construir com a API YC365 hoje!** Nossa API abrangente e suporte a SDK facilitam a integração da funcionalidade do mercado de previsão em seus aplicativos.

*Junte-se a milhares de desenvolvedores que já estão construindo aplicativos inovadores na plataforma YC365.*
