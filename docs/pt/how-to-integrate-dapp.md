# Como integrar o YC365 Dapp

## Visão geral

Este guia explica como a plataforma do comerciante se conecta ao YC365 Dapp. A comunicação suporta dois modos: sem transferência (v1) e com transferência (v2).

- **Modo sem transferência**
  
  O usuário entra no Dapp a partir da plataforma do comerciante sem precisar recarregar antecipadamente. Quando faz um pedido, os fundos são debitados diretamente da conta da plataforma. O backend do Dapp mantém comunicação em tempo real com o backend do comerciante.

  ![img.png](../img/yc365/img_11.png)

- **Modo com transferência**

  Ao acessar o Dapp, o usuário transfere parte de seus ativos da conta da plataforma para a conta do Dapp. O backend do Dapp permanece relativamente independente e não requer comunicação em tempo real com a plataforma.

  ![img.png](../img/yc365/img_10.png)

## 🎯 Funcionalidades principais

1. **Obter código de convite para registro**: fornecido offline por um representante comercial da YC365. Um código equivale a uma conta de comerciante.
2. **Registro do comerciante**: este endpoint precisa ser liberado manualmente. O comerciante (ou o time YC365) envia os parâmetros necessários e, após o registro, recebe `app_id`, `api_key` e `wallet_address`, que devem ser guardados com segurança.
   - Antes de registrar, é preciso preparar as integrações e escolher entre os modos v1 ou v2, pois cada modo exige APIs diferentes.
   - Armazene `app_id` e `api_key` no backend do comerciante; `api_key` é usada para assinar/encriptar a comunicação com o backend do Dapp.
   - `wallet_address` é o endereço do comerciante no Dapp e deve ser abastecido com USDT na BSC.
3. **Obter URL de acesso ao Dapp**: quando o usuário clica em um link ou ícone na plataforma, o backend do comerciante chama esta API com os parâmetros necessários para receber o endereço do Dapp.
4. **Detalhes de pedidos**: o comerciante consegue visualizar as transações dentro do Dapp, facilitando a conciliação.
5. **Relatórios para o comerciante**: disponibiliza dados diários, semanais e mensais.
6. **Envio diário de resumo**: o backend do Dapp envia o resumo do dia anterior às 00:00 UTC.

Formato de dados:
```json
{
  "event_type": "merchant_overview", // Tipo de evento: resumo diário
  "data": {
     "app_id":"string",            // ID do comerciante
     "balance":0.000000,           // Saldo disponível em USDT
     "frozen":0.000000,            // Saldo congelado em USDT
     "period_date":"string",       // Primeiro dia do período, ex.: 2025-08-01
     "users":0,                    // Total de usuários do comerciante no Dapp
     "total_deposit":0.000000,     // Valor total depositado (0 no modo v1)
     "total_deposit_count":0,      // Número de depósitos (0 no modo v1)
     "total_withdraw":0.000000,    // Valor total sacado (0 no modo v1)
     "total_withdraw_count":0,     // Número de saques (0 no modo v1)
     "total_buy_volume":0.000000,  // Volume total de compras
     "total_sell_volume":0.000000, // Volume total de vendas
     "currency":"string"           // Moeda: USDT
  },
  "signature": "xxxxxxxx"
}
```

## 🛡️ Códigos de status

| Código | Significado | Descrição |
| ------ | ---- | ---- |
| 0 | OK | Requisição concluída |
| 1 | Canceled | Requisição cancelada |
| 2 | Unknown | Erro desconhecido |
| 3 | InvalidArgument | Parâmetro inválido |
| 7 | PermissionDenied | Falha na autenticação por assinatura |
| 8 | ResourceExhausted | Limite de requisições excedido |
| 13 | Internal | Erro interno do serviço |

## 💡 APIs disponíveis

O YC365 Dapp disponibiliza os seguintes endpoints para integração do comerciante.

### 1. Obter código de convite

**GET** `/account/v1/app/invitecode`

O código é retirado offline. O cabeçalho deve conter `Authorization`.

**Resposta**
```json
{
   "code": 0,
   "message": "string",
   "data": "string"    // Código de convite
}
```

### 2. Criar comerciante

**POST** `/account/v1/app/create`

Antes de criar o comerciante, contate o representante YC365 para obter o código de convite.

**Corpo da requisição**
```json
{
   "app_name": "string",         // Nome do comerciante
   "app_desc": "string",         // Descrição
   "api_version": "string",      // v1 = sem transferência, v2 = com transferência
   "signature_method": "string", // Atualmente apenas hmac-sha256
   "assets_api": "string",
   "create_order_api": "string",
   "trade_order_api": "string",
   "cancel_order_api": "string",
   "settlement_api": "string",
   "webhook_api": "string",
   "invite_code": "string"       // Código de convite
}
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "app_id": "string",        // ID do comerciante
        "api_key": "string",       // Chave API
        "wallet_address": "string" // Endereço de carteira
    }
}
```

### 3. Obter URL de acesso ao Dapp

**POST** `/account/v1/app/access`

Usado para gerar o link de acesso para o usuário. `Authorization` deve ser Base64 de `app_id:signature` (detalhes na seção de assinatura).

**Corpo da requisição**
```json
{
   "user_id": "string",   // ID único do usuário na plataforma
   "user_name": "string", // Apelido do usuário
   "lang": "string",      // Idioma: en ou zh
   "email": "string",     // E-mail opcional
   "phone": "string",     // Telefone opcional, ex.: +55 11999999999
   "avatar": "string",    // URL do avatar
   "timestamp": 0,        // Timestamp em milissegundos
   "signature": "string"  // Assinatura da carga útil
}
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "url": "string" // URL do Dapp
    }
}
```

### 4. Sincronizar ativos (apenas v1)

**POST** `/account/v1/app/account/assets`

Sincroniza os saldos do usuário no modo sem transferência.

**Corpo da requisição**
```json
{
   "user_id": "string",
   "assets": [
     {
       "asset": "string",   // Tipo de ativo (USDT)
       "balance": 0.000000, // Saldo disponível
       "frozen": 0.000000   // Saldo congelado
     }
   ],
   "timestamp": 0,
   "signature": "string"
}
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 5. Criar pedido (apenas v1)

**POST** `/account/v1/app/order/create`

Chamado antes do envio da ordem. Após o pagamento, retorna o status da transação.

**Corpo da requisição**
```json
{
   "user_id": "string",          // ID do usuário na plataforma
   "order_id": "string",         // ID do pedido na plataforma
   "side": "buy/sell",           // Compra ou venda
   "outcome": "yes/no",          // yes = aposta a favor, no = aposta contra
   "market_id": "string",        // ID do mercado
   "price": 0.000000,            // Preço
   "quantity": 0.000000,         // Quantidade
   "amount": 0.000000,           // Valor do pedido
   "fee": 0.000000,              // Taxa
   "timestamp": 0,
   "signature": "string"
}
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "status": "success",  // success = sucesso, failed = falha
        "fail_reason": ""     // Motivo da falha, se existir
    }
}
```

### 6. Callback de execução (apenas v1)

**POST** `/account/v1/app/order/trade`

Acionado quando a ordem é executada no Dapp. O comerciante deve responder confirmando o processamento.

**Corpo da requisição**
```json
{
   "order_id": "string",          // ID do pedido
   "trade_id": "string",          // ID da execução
   "side": "buy/sell",            // Lado da operação
   "outcome": "yes/no",           // Resultado apostado
   "price": 0.000000,             // Preço executado
   "quantity": 0.000000,          // Quantidade executada
   "amount": 0.000000,            // Valor executado
   "fee": 0.000000,               // Taxa
   "timestamp": 0,
   "signature": "string"
}
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 7. Callback de cancelamento (apenas v1)

**POST** `/account/v1/app/order/cancel`

Chamado quando a ordem é cancelada no Dapp.

**Corpo da requisição**
```json
{
   "order_id": "string",
   "timestamp": 0,
   "signature": "string"
}
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 8. Callback de liquidação (apenas v1)

**POST** `/account/v1/app/order/settlement`

Enviado após a liquidação do mercado para informar ganhos e perdas.

**Corpo da requisição**
```json
{
   "market_id": "string",
   "user_id": "string",
   "outcome": "yes/no",
   "quantity": 0.000000,
   "payout": 0.000000,
   "timestamp": 0,
   "signature": "string"
}
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {}
}
```

### 9. Consultar detalhes da ordem

**GET** `/account/v1/app/order/detail`

Permite verificar o status e os fills de uma ordem.

**Parâmetro**
```
order_id=string
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": {
        "order_id": "string",
        "user_id": "string",
        "status": "string",
        "trades": [
           {
              "trade_id": "string",
              "price": 0.000000,
              "quantity": 0.000000,
              "amount": 0.000000,
              "fee": 0.000000,
              "created_at": "string"
           }
        ]
    }
}
```

### 10. Relatórios do comerciante

**GET** `/account/v1/app/report`

Retorna dados agregados para um intervalo de datas.

**Parâmetros**
```
start_date=string   // Formato yyyy-MM-dd
end_date=string     // Formato yyyy-MM-dd
```

**Resposta**
```json
{
    "code": 0,
    "message": "string",
    "data": [
       {
          "period_date": "string",       // Data do relatório
          "users": 0,                    // Usuários ativos
          "total_deposit": 0.000000,     // Total depositado
          "total_withdraw": 0.000000,    // Total sacado
          "total_buy_volume": 0.000000,  // Volume comprado
          "total_sell_volume": 0.000000, // Volume vendido
          "currency": "string"           // Moeda
       }
    ]
}
```

## 🔐 Regras de assinatura

Todas as requisições que exigem assinatura utilizam `HMAC-SHA256`. Procedimento:

1. Converter o corpo da requisição (JSON em string) para UTF-8;
2. Calcular `HMAC-SHA256` usando `api_key` como chave;
3. Converter o resultado para string hexadecimal e usar como `signature`.

Exemplo em Python:
```python
import hmac
import hashlib

def sign(payload: str, api_key: str) -> str:
    return hmac.new(api_key.encode('utf-8'),
                    payload.encode('utf-8'),
                    hashlib.sha256).hexdigest()
```

## 📄 Anexo

- Todas as respostas seguem o formato `code`, `message`, `data`;
- Requisições e respostas usam JSON e os valores numéricos mantêm 6 casas decimais;
- Todos os horários são em UTC;
- Recomenda-se registrar logs de todas as chamadas para facilitar auditoria e suporte.
