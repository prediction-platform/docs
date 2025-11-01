# Como os preços são calculados?

## Visão geral

A YC365 utiliza um mecanismo de preços sofisticado que combina tecnologia de Automated Market Maker (AMM) com a dinâmica em tempo real do livro de ordens, garantindo descoberta de preços justa, eficiente e transparente em nossos mercados de previsão multilíngues.

## Arquitetura de preços da YC365

### 🏗️ **Fundamentos do sistema**

#### **Integração com smart contracts**:
- **Conjunto de contratos LP**: gerencia pools de liquidez independentes para tokens YES/NO
- **Conjunto de contratos Trading**: executa transações de compra e venda baseadas em preço
- **Modelo de negociação por ordens**: administra o livro de ordens e o mecanismo de matching
- **Conjunto de contratos do cofre**: cuida de ativos e da cobrança de taxas

#### **Componentes da descoberta de preços**:
- **AMM**: fornece liquidez contínua e preços-base
- **Livro de ordens**: permite ordens limitadas e melhora de preços
- **Liquidação em tempo real**: atualização instantânea de preços via contratos na BSC
- **Consistência multilíngue**: preços idênticos nas 6 línguas suportadas

## Mecanismos principais

### 📊 **Implementação atual: modelo de livro de ordens**

#### **Cálculo do preço de mercado**:
```
Preço de mercado = menor preço de venda disponível
```

#### **Etapas da descoberta**:
1. Usuários enviam ordens limitadas de compra/venda
2. O motor de matching segue a prioridade preço-tempo
3. O preço atual = menor oferta de venda no livro
4. Toda negociação atualiza o preço em tempo real

#### **Exemplo**:
```
Livro de ordens:
Vendas (YES): 0,65 – 0,67 – 0,70 USDT
Compras (YES): 0,60 – 0,58 – 0,55 USDT

Preço atual: 0,65 USDT
Spread: 0,65 - 0,60 = 0,05 USDT
```

### 🔄 **Modelo aprimorado (em desenvolvimento)**

#### **Fórmula planejada**:
```
Preço de mercado = média ponderada de:
- Preços de transação (40%)
- Volume negociado (25%)
- Ofertas de compra (20%)
- Profundidade de mercado (15%)
```

#### **Recursos previstos**:
- Volume-Weighted Average Price (VWAP)
- Otimização do spread
- Coerência entre mercados correlatos
- Ajuste de volatilidade

## Gestão de preços por papéis

### 👥 **Responsabilidades do administrador de ativos**

#### **Gestão de liquidez**:
- Definir proporção inicial YES/NO e preço de partida
- Monitorar profundidade do livro e atividade de negociação
- Ajustar liquidez conforme necessário
- Zelar pela estabilidade dos preços

#### **Operação do mercado**:
- Verificar precisão e justiça dos preços
- Detectar e impedir manipulação
- Analisar desempenho e eficiência dos preços
- Administrar taxas (0,15%) e otimizar custos de gas

### 🛠️ **Infraestrutura técnica**

#### **Gerenciamento do livro de ordens**:
- Suporte atual a ordens limitadas (TPS < 100)
- Correspondência por preço e, em caso de empate, por tempo
- Processamento e atualização em tempo real
- Validação das ordens antes do matching

#### **Integração com serviços de liquidação**:
- Cálculo off-chain para eficiência
- Execução on-chain na BSC
- Processamento em lote
- Uso otimizado de gas

## Atualização de preços

### ⚡ **Atualizações em tempo real**

#### **Eventos que disparam atualizações**:
- Novas negociações
- Mudanças no livro (ordens novas, canceladas, modificadas)
- Ajustes de liquidez
- Eventos externos relevantes

#### **Fluxo de atualização**:
1. Execução da ordem via contratos Trading
2. Cálculo do novo preço pelo modelo de ordens
3. Registro on-chain pelo conjunto LP
4. Atualização instantânea nas interfaces multilíngues
5. Distribuição via APIs

#### **Desempenho**:
- Velocidade BSC (~3 s por bloco)
- Baixa latência
- Suporte a alta frequência
- Disponibilidade > 99,9%

### 🌐 **Exibição multilíngue**

#### **Consistência global**:
- Preços idênticos em todas as línguas
- Formatação numérica conforme o padrão local
- Carimbo de data/hora no fuso do usuário
- Apresentação gráfica adaptada aos hábitos culturais

#### **Recursos de localização**:
- Formatos de números e símbolos de moeda
- Estilos de gráfico compatíveis com preferências locais
- Otimização total para dispositivos móveis
- Conformidade com WCAG

## Recursos avançados

### 📈 **Impacto de preço e slippage**

#### **Cálculo do slippage**:
```
Slippage (%) = |Preço esperado - Preço executado| / Preço esperado × 100
```

#### **Fatores influentes**:
- Tamanho da ordem
- Profundidade de liquidez
- Volatilidade
- Horário da negociação

#### **Exemplos**:
```
100 USDT: 0,1-0,5% de slippage
1.000 USDT: 0,5-2%
10.000 USDT: 2-5%
```

### 🛡️ **Proteção de preços**

#### **Salvaguardas contra manipulação**:
- Circuit breakers
- Faixas de preço por período
- Monitoramento de volume anormal
- Limites máximos de ordem

#### **Sistemas de vigilância**:
- Monitoramento em tempo real com IA
- Detecção de anomalias
- Alertas automáticos
- Supervisão manual pelos administradores

## Taxas e impacto nos preços

### 💰 **Integração das taxas de negociação**

#### **Estrutura atual**:
- Taxa da plataforma: 0,15% do valor negociado
- Aplicável a ordens de compra e venda
- Dedução automática pelo contrato Trading
- Taxa de gas (0,005-0,02 USDT em média)

#### **Exemplo**:
```
Compra de 1.000 YES a 0,60 USDT
Valor da negociação: 600 USDT
Taxa da plataforma: 0,90 USDT
Gas: ~0,01 USDT
Custo total: 600,91 USDT
```

#### **Transparência**:
- Exibição das taxas antes da confirmação
- Detalhamento completo nos recibos
- Informação de taxas na língua do usuário
- Exibição dinâmica do custo de gas

## Análise e histórico

### 📊 **Coleta e análise de dados**
- Serviços de gráficos com múltiplos intervalos
- Coleta via API a cada 10 minutos
- Análises de 30 min, 1 h, 1 dia, 1 semana
- Monitoramento de desempenho
- Estatísticas de preço, volume, volatilidade e tendência

### 📱 **Interface e acessibilidade**
- Gráficos em tempo real
- Visualização da profundidade do livro
- Calculadora de impacto antes da negociação
- Acompanhamento de portfólio e P&L
- Interfaces localizadas, responsivas e acessíveis

## Transparência e verificação

### 🔍 **Transparência on-chain**
- Dados de preço registrados na BSC
- Lógica de precificação open source
- Histórico completo de transações e preços
- Trilha de auditoria imutável

### 📋 **Liquidação e preço final**
- Preços finais ajustados para 0 ou 1 USDT conforme o resultado
- Liquidação automática via smart contracts
- Pagamento = posição × preço final
- Taxas distribuídas conforme o modelo de receitas

## Próximos passos

### 🚀 **Modelos avançados**
- AMM dinâmico
- Precificação entre mercados correlatos
- Otimização com IA
- Precificação para mercados multiresultado

### 🌍 **Expansão global**
- Novos idiomas (japonês, coreano, hindi, árabe)
- Ajustes por horário de mercado local
- Apresentações adaptadas a preferências regionais
- Ferramentas móveis avançadas

---

**O mecanismo de preços da YC365 garante descoberta de preços justa e transparente por meio de nosso livro de ordens avançado e integração com smart contracts.** Com atualizações em tempo real, acessibilidade multilíngue e transparência on-chain, oferecemos informações confiáveis a usuários no mundo inteiro.

*Por meio de inovação contínua e otimização do sistema, mantemos a excelência em precificação, ampliamos nossa presença global e aprimoramos a experiência do usuário em todas as línguas e regiões suportadas.*
