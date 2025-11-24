# Ordens Limitadas

## Visão Geral

Ordens limitadas são o principal mecanismo de negociação no YC365, permitindo que os usuários especifiquem o preço exato pelo qual desejam comprar ou vender tokens SIM/NÃO para eventos de mercado de previsão. Isso dá aos traders controle preciso sobre seus pontos de entrada e saída, garantindo uma descoberta de preços transparente e justa.

## O que são Ordens Limitadas?

### Definição
Uma ordem limitada é uma instrução para comprar ou vender tokens a um preço específico ou melhor. Ao contrário das ordens de mercado que são executadas imediatamente ao preço atual de mercado, as ordens limitadas só serão executadas quando o mercado atingir o nível de preço especificado.

### Principais Características
- **Controle de Preço**: Defina o preço exato que você está disposto a pagar ou aceitar
- **Tempo em Vigor**: As ordens permanecem ativas até serem preenchidas, canceladas ou expirarem
- **Sem Slippage**: Execute ao seu preço especificado ou melhor
- **Prioridade na Fila**: Ordens preenchidas com base na prioridade de preço-tempo

## Como Funcionam as Ordens Limitadas

### Tipos de Ordem

#### Ordens de Compra Limitada (Buy Limit)
- **Objetivo**: Comprar tokens SIM ou NÃO a um preço especificado ou abaixo
- **Execução**: Preenche quando o preço de mercado cai para ou abaixo do seu preço limite
- **Exemplo**: Coloque uma ordem de compra para tokens SIM a 0,65 USDT quando o preço atual for 0,70 USDT

#### Ordens de Venda Limitada (Sell Limit)
- **Objetivo**: Vender tokens SIM ou NÃO a um preço especificado ou acima
- **Execução**: Preenche quando o preço de mercado sobe para ou acima do seu preço limite
- **Exemplo**: Coloque uma ordem de venda para tokens SIM a 0,75 USDT quando o preço atual for 0,70 USDT

### Correspondência de Ordens

#### Prioridade Preço-Tempo
1. **Prioridade de Preço**: Ordens com melhores preços são preenchidas primeiro
2. **Prioridade de Tempo**: Entre ordens no mesmo preço, ordens anteriores são preenchidas primeiro
3. **Preenchimentos Parciais**: Grandes ordens podem ser preenchidas em várias transações menores

#### Motor de Correspondência
- **Processamento em Tempo Real**: Ordens processadas assim que são recebidas
- **Execução Justa**: Sem tratamento preferencial para qualquer usuário
- **Correspondência Transparente**: Toda a atividade do livro de ordens é visível

## Colocando Ordens Limitadas

### Processo Passo a Passo

#### 1. Selecione Evento e Condição
- **Navegue pelos Eventos**: Vá para o evento que você deseja negociar
- **Escolha a Condição**: Selecione a condição/resultado específico
- **Revise o Mercado**: Verifique os preços atuais e a profundidade do livro de ordens

#### 2. Escolha o Tipo de Token
- **Tokens SIM**: Compre se você acredita que o resultado ocorrerá
- **Tokens NÃO**: Compre se você acredita que o resultado não ocorrerá
- **Pares de Tokens**: Cada condição tem pares de tokens SIM/NÃO correspondentes

#### 3. Defina Parâmetros da Ordem
- **Tipo de Ordem**: Selecione "Comprar" ou "Vender"
- **Quantidade de Tokens**: Especifique quantos tokens você deseja negociar
- **Preço Limite**: Defina seu preço desejado por token
- **Revisão da Ordem**: Confirme todos os detalhes antes do envio

#### 4. Envie a Ordem
- **Confirmação da Carteira**: Aprove a transação em sua carteira
- **Bloqueio de Ativos**: Os ativos necessários são bloqueados no contrato inteligente
- **Confirmação da Ordem**: Receba confirmação da colocação da ordem

### Parâmetros da Ordem

#### Configurações de Preço
- **Preço Mínimo**: 0,01 USDT por token
- **Preço Máximo**: 0,99 USDT por token
- **Incrementos de Preço**: Incrementos mínimos de 0,01 USDT
- **Preços Dinâmicos**: Os preços se ajustam automaticamente com base na atividade do mercado

#### Configurações de Quantidade
- **Ordem Mínima**: Tamanho mínimo de ordem de 1 token
- **Ordem Máxima**: Sem limite máximo (sujeito à liquidez disponível)
- **Casas Decimais**: Ordens podem incluir quantidades decimais de tokens
- **Valor Total**: Calculado como Preço × Quantidade

#### Configurações de Tempo
- **Good Till Cancelled (GTC)**: A ordem permanece ativa até ser preenchida ou cancelada
- **Expiração do Evento**: Ordens canceladas automaticamente quando o evento expira
- **Corte de Negociação**: Ordens canceladas 1 hora antes da resolução do evento

## Gestão de Ordens

### Visualizando Suas Ordens

#### Ordens Ativas
- **Ordens Abertas**: Veja todas as ordens não preenchidas
- **Status da Ordem**: Acompanhe o progresso da execução da ordem
- **Preenchimentos Parciais**: Monitore ordens parcialmente preenchidas
- **Histórico de Ordens**: Revise todas as ordens passadas

#### Informações da Ordem
- **Detalhes da Ordem**: Preço, quantidade, tipo de token, carimbo de data/hora
- **Status de Preenchimento**: Preenchida, parcialmente preenchida ou aberta
- **Quantidade Restante**: Quantidade ainda aguardando para ser preenchida
- **Preço Médio de Preenchimento**: Preço médio ponderado das porções preenchidas

### Modificando Ordens

#### Cancelamento de Ordem
- **Processo de Cancelamento**: Cancele ordens através da interface de negociação
- **Liberação de Ativos**: Ativos bloqueados devolvidos à sua conta
- **Efeito Imediato**: O cancelamento entra em vigor imediatamente
- **Sem Taxas**: Nenhuma taxa cobrada pelo cancelamento de ordem

#### Atualizações de Ordem
- **Mudanças de Preço**: Cancele e substitua por um novo preço
- **Mudanças de Quantidade**: Cancele e substitua por uma nova quantidade
- **Sem Modificação Direta**: Ordens não podem ser modificadas diretamente

### Execução de Ordem

#### Tipos de Preenchimento
- **Preenchimento Completo**: Ordem inteira executada de uma vez
- **Preenchimento Parcial**: Ordem preenchida em várias quantidades menores
- **Sem Preenchimento**: A ordem permanece aberta se o preço não for atingido

#### Notificações de Execução
- **Notificações de Preenchimento**: Notificações instantâneas quando as ordens são preenchidas
- **Alertas por E-mail**: Notificações por e-mail opcionais para atividade de ordem
- **Atualizações de Portfólio**: Atualizações de saldo de portfólio em tempo real
- **Histórico de Transações**: Registro completo de todas as execuções

## Recursos Avançados de Ordem

### Integração com Livro de Ordens

#### Profundidade de Mercado
- **Bid/Ask Spread**: Veja a diferença entre preços de compra e venda
- **Profundidade do Livro**: Veja todas as ordens pendentes em diferentes níveis de preço
- **Análise de Liquidez**: Avalie a liquidez do mercado antes de colocar ordens
- **Impacto no Preço**: Estime o impacto potencial no preço de grandes ordens

#### Market Making
- **Spread Trading**: Coloque ordens de compra e venda para capturar o spread
- **Provisão de Liquidez**: Forneça liquidez para ganhar com spreads
- **Eficiência de Mercado**: Ajude a manter a descoberta de preços eficiente
- **Gestão de Risco**: Gerencie inventário e exposição cuidadosamente

### Gestão de Risco

#### Limites de Posição
- **Limites de Conta**: Tamanho máximo da posição com base no saldo da conta
- **Limites de Evento**: Limites por evento individual
- **Limites de Portfólio**: Limites gerais de exposição do portfólio
- **Monitoramento de Risco**: Avaliação de risco e alertas em tempo real

#### Estratégias de Stop-Loss
- **Monitoramento Manual**: Monitore posições e coloque ordens de proteção manualmente
- **Hedge de Portfólio**: Use posições opostas para proteger o risco
- **Diversificação**: Espalhe o risco por vários eventos e resultados
- **Gestão de Capital**: Nunca arrisque mais do que você pode perder

## Taxas e Custos de Ordem

### Taxas de Negociação
- **Taxa da Plataforma**: Taxa de 0,15% sobre negociações executadas (1,5/1000)
- **Cálculo de Taxa**: Taxas calculadas sobre o valor total da negociação
- **Dedução de Taxa**: Taxas deduzidas automaticamente dos proventos da negociação
- **Transparência de Taxa**: Todas as taxas claramente exibidas antes do envio da ordem

### Taxas de Gás
- **Taxas de Rede**: Taxas de gás da rede BSC para transações blockchain
- **Preços Dinâmicos**: As taxas de gás variam com base no congestionamento da rede
- **Otimização de Taxas**: A plataforma otimiza o uso de gás para eficiência
- **Responsabilidade do Usuário**: Os usuários pagam taxas de gás por suas transações

### Exemplos de Custo

#### Exemplo 1: Comprando Tokens SIM
- **Ordem**: Comprar 100 tokens SIM a 0,65 USDT cada
- **Valor da Negociação**: 100 × 0,65 = 65 USDT
- **Taxa da Plataforma**: 65 × 0,0015 = 0,0975 USDT
- **Taxa de Gás**: ~0,01 USDT (varia)
- **Custo Total**: 65 + 0,0975 + 0,01 = 65,1075 USDT

#### Exemplo 2: Vendendo Tokens NÃO
- **Ordem**: Vender 50 tokens NÃO a 0,45 USDT cada
- **Valor da Negociação**: 50 × 0,45 = 22,5 USDT
- **Taxa da Plataforma**: 22,5 × 0,0015 = 0,03375 USDT
- **Taxa de Gás**: ~0,01 USDT (varia)
- **Proventos Líquidos**: 22,5 - 0,03375 - 0,01 = 22,45625 USDT

## Melhores Práticas

### Estratégia de Colocação de Ordem

#### Análise de Mercado
- **Estude o Livro de Ordens**: Analise a pressão de compra/venda atual
- **Verifique o Histórico do Mercado**: Revise os movimentos recentes de preços
- **Avalie a Liquidez**: Garanta liquidez suficiente para o tamanho da sua ordem
- **Monitore Notícias**: Mantenha-se informado sobre eventos que possam afetar os preços

#### Considerações de Tempo
- **Horário do Mercado**: Considere quando os mercados estão mais ativos
- **Cronograma do Evento**: Fatore o tempo até a resolução do evento
- **Períodos de Volatilidade**: Ajuste a estratégia durante alta volatilidade
- **Eventos de Notícias**: Esteja ciente de anúncios programados

### Gestão de Risco

#### Dimensionamento de Posição
- **Comece Pequeno**: Comece com tamanhos de posição menores
- **Aumento Gradual**: Aumente os tamanhos das posições à medida que ganha experiência
- **Diversificação**: Não coloque todos os fundos em um único evento
- **Preservação de Capital**: Proteja seu capital de negociação

#### Higiene de Ordem
- **Revisão Regular**: Revise e atualize regularmente as ordens abertas
- **Ordens Obsoletas**: Cancele ordens que não são mais relevantes
- **Validação de Preço**: Garanta que os preços das ordens reflitam as condições atuais do mercado
- **Limpeza de Ordem**: Mantenha um livro de ordens limpo e organizado

## Problemas Comuns e Soluções

### Problemas de Execução de Ordem

#### Ordens Não Preenchendo
- **Preço Muito Agressivo**: Seu preço limite pode estar muito longe do mercado
- **Baixa Liquidez**: Liquidez insuficiente no seu nível de preço
- **Movimento do Mercado**: O mercado se afastou do preço da sua ordem
- **Solução**: Ajuste o preço para mais perto dos níveis atuais do mercado

#### Preenchimentos Parciais
- **Liquidez Limitada**: Liquidez insuficiente para preencher toda a ordem
- **Tamanho Grande da Ordem**: Ordem muito grande para a profundidade atual do mercado
- **Solução**: Quebre grandes ordens em pedaços menores

### Problemas Técnicos

#### Falhas de Transação
- **Gás Insuficiente**: Aumente o limite de gás para transações complexas
- **Congestionamento de Rede**: Aguarde períodos de menor atividade de rede
- **Problemas de Carteira**: Garanta que a carteira esteja conectada e financiada corretamente
- **Solução**: Verifique as configurações de gás e a conectividade da carteira

#### Atrasos no Livro de Ordens
- **Latência de Rede**: Atrasos na conexão com a internet
- **Carga da Plataforma**: Alto uso da plataforma durante horários de pico
- **Solução**: Atualize a página ou aguarde a atualização do sistema

## Psicologia de Negociação

### Gestão Emocional
- **Mantenha a Disciplina**: Siga seu plano de negociação
- **Evite FOMO**: Não persiga preços devido ao medo de perder
- **Gerencie a Ganância**: Realize lucros quando as metas forem atingidas
- **Controle o Medo**: Não entre em pânico durante a volatilidade do mercado

### Aprendizado e Melhoria
- **Mantenha Registros**: Mantenha registros de negociação detalhados
- **Analise o Desempenho**: Revisão regular dos resultados de negociação
- **Aprenda com os Erros**: Identifique e aprenda com erros de negociação
- **Educação Contínua**: Mantenha-se informado sobre os desenvolvimentos do mercado

## Melhorias Futuras

### Tipos de Ordem Avançados
- **Stop Orders**: Disparadores de ordem automáticos em níveis de preço específicos
- **Iceberg Orders**: Oculte grandes tamanhos de ordem da visão pública
- **Time-based Orders**: Ordens com condições específicas baseadas no tempo
- **Conditional Orders**: Ordens disparadas por condições de mercado específicas

### Experiência do Usuário Aprimorada
- **Negociação Móvel**: Interface de negociação móvel aprimorada
- **Modelos de Ordem**: Salve e reutilize configurações de ordem comuns
- **Gráficos Avançados**: Ferramentas de análise técnica e gráficos integrados
- **Social Trading**: Siga e copie traders de sucesso

### Integração de IA
- **Smart Order Routing**: Execução de ordem otimizada por IA
- **Predictive Analytics**: Previsões de mercado alimentadas por IA
- **Avaliação de Risco**: Análise de risco e alertas automatizados
- **Otimização de Portfólio**: Gestão de portfólio assistida por IA

---

*Para as informações mais recentes sobre ordens limitadas e recursos de negociação, verifique nossos anúncios oficiais.*