# Arquitetura do Sistema (System Architecture)

## Visão Geral

A YC365 é construída sobre uma arquitetura modular, com cada componente lidando com responsabilidades específicas enquanto trabalham juntos para fornecer uma plataforma abrangente de mercado de previsão. O sistema é projetado para transparência, segurança e escalabilidade.

## Visão Geral da Arquitetura

### Componentes Principais

#### 1. Conjunto de Contratos Inteligentes (BSC Chain)
- **Conjunto de Contratos LP**: Gerencia pools de liquidez para cada condição
- **Conjunto de Contratos DP**: Lida com publicação de eventos/condições e resultados
- **Conjunto de Contratos Vault**: Gerencia depósitos e retiradas de usuários
- **Conjunto de Contratos de Negociação**: Executa transações de compra/venda
- **Conjunto de Contratos Factory**: Gerencia eventos, condições e permissões
- **Contratos de Condição Temporária**: Contratos individuais específicos para condições

#### 2. Provedor de Dados (Data Provider - DP)
- **Gestão de Eventos**: Tipos de eventos, criação e publicação
- **Gestão de Condições**: Criação de condições e operações em cadeia
- **Gestão de Permissões**: Controle de acesso baseado em função
- **Serviços de API**: Serviços de consulta de dados externos

#### 3. Modelo de Negociação de Ordens (Order Trading Model)
- **Livro de Ordens (Order Book)**: Gerencia ordens limitadas
- **Motor de Correspondência**: Correspondência por prioridade de preço e tempo
- **Preço de Mercado**: Cálculo de preço em tempo real
- **Serviço de Liquidação**: Cálculo off-chain, execução on-chain

#### 4. Serviço de Backend DApp
- **Gestão de Usuários**: Login/registro baseado em carteira
- **Análise**: Dados históricos e análise de tendências
- **Painel**: Estatísticas de usuários e métricas de desempenho
- **Busca e Gráfico**: Busca de eventos e visualização de tendências de preços

#### 5. Frontend DApp
- **Interface do Usuário**: Interface intuitiva de negociação e gestão
- **Suporte Multi-idioma**: Chinês Tradicional e Inglês
- **Atualizações em Tempo Real**: Atualizações ao vivo de preços e ordens

## Arquitetura de Contrato Inteligente

### 1. Conjunto de Contratos LP (Liquidity Pool)

#### Funções Principais:
- **Gestão de Pool de Liquidez**: Pools independentes para tokens SIM/NÃO de cada condição
- **Gestão de TVL**: Depósitos de stablecoin do DP e usuários
- **Processamento de Ordens**: Execução de ordens de compra/venda
- **Liquidação**: Distribuição de lucros e liquidação de tokens NÃO

#### Recursos Chave:
- **Pools Independentes**: Cada condição tem seu próprio pool de liquidez
- **Liquidação Automática**: Processamento de liquidação acionado
- **Distribuição de Lucros**: Detentores de tokens SIM recebem 1 USDT por token
- **Liquidação de Token NÃO**: Tokens NÃO tornam-se sem valor

### 2. Conjunto de Contratos DP (Data Provider)

#### Gestão de Eventos:
- **Publicação de Eventos**: Implantar eventos e condições na cadeia
- **Inicialização de Condição**: Definir probabilidades iniciais e liquidez
- **Publicação de Resultados**: Publicar resultados de eventos
- **Gestão de Liquidez**: Adicionar ou recuperar liquidez

#### Sistema de Permissões:
- **Acesso Baseado em Função**: Permissões diferentes para funções diferentes
- **Sem Super Admin**: Modelo de autoridade distribuída
- **Permissões Específicas**: Gestão de permissões baseada em endereço

### 3. Conjunto de Contratos Vault

#### Gestão de Ativos:
- **Depósitos DP**: Gestão de depósitos/retiradas do provedor de dados
- **Depósitos de Usuários**: Gestão de depósitos/retiradas de usuários regulares
- **Distribuição de Recompensas**: Alocação de recompensas de usuários
- **Gestão de Tokens**: Custódia de tokens SIM/NÃO (sob consideração)

#### Recursos de Segurança:
- **Contratos Auditados**: Todos os contratos passam por auditorias de segurança
- **Código Aberto**: Código transparente e verificável
- **Avaliação de Risco**: Usuários mantêm controle total dos ativos

### 4. Conjunto de Contratos de Negociação

#### Processamento de Transações:
- **Função de Transferência**: Executar negociações de tokens SIM/NÃO
- **Integração de Serviço de Ordens**: Acionado pelo serviço de ordens
- **Congelamento de Ativos**: Bloqueios temporários de ativos para ordens
- **Processamento em Lote**: Execução eficiente de transações em massa

#### Restrições de Negociação:
- **Negociação Pré-resultado**: Negociação para 1 hora antes dos resultados
- **Verificação de Identidade**: Verificação de assinatura de chave privada
- **Validação de Ordem**: Autenticação de serviço de ordem

### 5. Conjunto de Contratos Factory

#### Funções de Gestão:
- **Gestão de Eventos/Condições**: Publicar ou excluir eventos e condições
- **Gestão de Permissões**: Definir endereços de permissão
- **Gestão de Usuários**: Definir diferentes funções de usuário
- **Implantação de Contrato**: Implantar contratos de condição temporária

#### Funções de Usuário:
- **Operadores de Cadeia DP**: Operações de cadeia do provedor de dados
- **Operadores de Ordem**: Submissão de transações do livro de ordens
- **Usuários Regulares**: Depósito, retirada, colocação de ordem

### 6. Contratos de Condição Temporária

#### Contratos Individuais:
- **Serviços Específicos de Condição**: Cada condição recebe seu próprio contrato
- **Gestão de Tokens SIM/NÃO**: Criação e destruição de tokens
- **Gestão de TVL**: Valor total bloqueado específico da condição
- **Implementação de Liquidação**: Lógica de liquidação específica

#### Considerações de Design:
- **Design Modular**: Contrato independente para cada condição
- **Integração de Serviço**: Chamado por outros contratos, não diretamente por usuários
- **Otimização de Gás**: Design de contrato eficiente para BSC

## Sistema de Provedor de Dados (DP System)

### 1. Gestão de Tipo de Evento

#### Funções Principais:
- **Criação de Tipo**: Adicionar e gerenciar categorias de eventos
- **Sistema de Classificação**: Todos os eventos pertencem a tipos específicos
- **Importação/Exportação**: Capacidades de importação e exportação em lote
- **Manutenção de Dados**: Gestão e atualizações de dados de tipo

### 2. Gestão de Eventos

#### Operações de Eventos:
- **Entrada Manual**: Criação manual de eventos por usuário Admin
- **Importação em Lote**: Importação em massa de arquivos externos
- **Validação de Dados**: Verificação de dados de eventos
- **Publicação em Cadeia**: Implantação de eventos em blockchain

#### Processo de Publicação:
- **Criação de Evento**: Definir parâmetros de evento
- **Configuração de Condição**: Criar condições de evento
- **Inicialização de Liquidez**: Definir probabilidades iniciais e liquidez
- **Lançamento de Mercado**: Habilitar negociação para o evento

### 3. Operações em Cadeia

#### Funções DP:
- **Publicação de Eventos**: Implantar eventos em blockchain
- **Gestão de Condições**: Criar e gerenciar condições
- **Operações de Liquidez**: Adicionar ou recuperar liquidez
- **Publicação de Resultados**: Publicar resultados de eventos
- **Execução de Liquidação**: Acionar processo de liquidação

#### Serviços Automatizados:
- **Operações Agendadas**: Execução automática de tarefas específicas
- **Paradas de Negociação**: Paradas automáticas de negociação de condições
- **Publicação de Resultados**: Publicação automática de resultados
- **Processamento de Liquidação**: Execução automática de liquidação

### 4. Gestão de Permissões

#### Acesso Baseado em Função:
- **Administradores**: Gerenciar permissões de outras contas e configuração de contrato
- **Equipe de Entrada de Dados**: Entrada e manutenção de dados de eventos/condições
- **Gerentes de Ativos**: Operações de cadeia e gestão de operações

#### Recursos de Segurança:
- **Permissões Específicas**: Apenas usuários autorizados podem operar dados em cadeia
- **Confirmação de Transação**: Aguardar confirmação de transação antes do próximo passo
- **Auditoria de Permissão**: Revisão e atualizações regulares de permissão

## Modelo de Negociação de Ordens (Order Trading Model)

### 1. Gestão de Livro de Ordens (Order Book)

#### Funções Principais:
- **Suporte a Ordem Limitada**: Apenas ordens limitadas atualmente suportadas
- **Armazenamento de Ordens**: Gestão eficiente de dados de ordens
- **Correspondência de Ordens**: Correspondência por prioridade de preço e tempo
- **Validação de Ordem**: Verificação de integridade de ordem

#### Considerações Técnicas:
- **Cluster Único**: Sem requisitos de implantação distribuída
- **Desempenho**: TPS < 100
- **Escalabilidade**: Considerações para expansão futura

### 2. Motor de Correspondência (Matching Engine)

#### Princípios de Correspondência:
- **Prioridade de Preço**: Melhores preços correspondidos primeiro
- **Prioridade de Tempo**: Ordens anteriores correspondidas primeiro
- **Tipos de Ordem**: Atualmente apenas ordens limitadas
- **Processamento em Tempo Real**: Processamento imediato de ordens

#### Recursos do Motor:
- **Correspondência Eficiente**: Algoritmos de correspondência otimizados
- **Validação de Ordem**: Verificação de ordem pré-correspondência
- **Integração de Liquidação**: Processamento de liquidação contínuo

### 3. Cálculo de Preço de Mercado

#### Determinação de Preço:
- **Preço Baseado no Vendedor**: Preço mínimo do vendedor como preço de mercado
- **Melhorias Futuras**: Cálculo de preço abrangente
- **Atualizações em Tempo Real**: Atualizações contínuas de preços
- **Dados Históricos**: Rastreamento de histórico de preços

#### Fatores de Cálculo:
- **Versão Atual**: Preço mínimo do vendedor
- **Versão Futura**: Cálculo abrangente incluindo:
  - Preços de transação
  - Volume de negociação
  - Preços de comprador
  - Profundidade de mercado

### 4. Serviço de Liquidação

#### Processo de Liquidação:
- **Cálculo Off-chain**: Cálculos de liquidação realizados fora da cadeia
- **Execução On-chain**: Mudanças de ativos executadas em blockchain
- **Processamento em Lote**: Processamento eficiente de transações em massa
- **Verificação**: Verificação de resultado de liquidação

#### Recursos de Segurança:
- **Verificação de Transação**: Todas as transações verificadas em cadeia
- **Segurança de Ativos**: Ativos do usuário protegidos durante todo o processo
- **Trilha de Auditoria**: Histórico completo de transações

## Serviço de Backend DApp

### 1. Gestão de Usuários

#### Autenticação:
- **Conexão de Carteira**: Conectar carteira para login/registro
- **Suporte SSO**: Integração de login único
- **Configurações de Usuário**: Gestão de preferências do usuário
- **Módulo de Visão Geral**: Painel de usuário e estatísticas

#### Recursos de Usuário:
- **Gestão de Perfil**: Perfil e configurações do usuário
- **Rastreamento de Atividade**: Monitoramento de atividade do usuário
- **Análise de Desempenho**: Métricas de desempenho do usuário

### 2. Módulo de Atividade

#### Configuração de Admin:
- **Gestão de Atividade**: Configuração direta de admin
- **Gestão de Imagem**: Gestão de endereço de imagem de atividade
- **Gestão de Link**: Gestão de endereço de link de atividade
- **Integração de API**: Fornecimento de dados de atividade do lado do cliente

#### Recursos:
- **Conteúdo Dinâmico**: Conteúdo de atividade configurável
- **Exibição de Imagem**: Apresentação de imagem de atividade
- **Manuseio de Link**: Gestão de link externo
- **Serviços de API**: Fornecimento de API de dados de atividade

### 3. Gestão de Histórico de Ordens

#### Histórico de Ordens:
- **Filtragem de Tempo**: Filtrar ordens por período de tempo
- **Filtragem de Status**: Filtrar ordens por status
- **Filtragem de Evento**: Filtrar ordens por evento
- **Busca Abrangente**: Busca de ordens multicritério

#### Integração de Dados:
- **API de Livro de Ordens**: API básica do serviço de livro de ordens
- **Agregação de Dados**: Coleta abrangente de dados de ordens
- **Interface do Usuário**: Exibição amigável de histórico de ordens

### 4. Módulo de Painel

#### Análise de Depósito:
- **Tendências de Depósito**: Gráficos de tendência de valor de depósito
- **Coleta de Dados**: Intervalos de leitura de contrato de 30 segundos
- **Monitoramento de Eventos**: Monitoramento de eventos de depósito/retirada de contrato Vault
- **Cálculo de Lucro**: Cálculo de lucro abrangente

#### Análise de Receita:
- **Tendências de Lucro**: Gráficos de tendência de valor de lucro
- **Atualizações em Tempo Real**: Cálculo de lucro ao vivo
- **Dados Históricos**: Histórico completo de lucros
- **Métricas de Desempenho**: Análise de desempenho do usuário

#### Análise de Atividade:
- **Tendências de Volume de Ordens**: Gráficos de volume de ordens diários
- **Tendências de Valor de Ordens**: Gráficos de valor de ordens diários
- **Monitoramento de Eventos**: Monitoramento de SubmitOrderEvent
- **Análise de Dados**: Análise abrangente de dados de ordens

### 5. Serviços de Busca e Gráfico

#### Funcionalidade de Busca:
- **Busca por Palavra-chave**: Buscar todos os eventos relacionados
- **Integração de Serviço DP**: API básica do serviço DP
- **Filtragem Avançada**: Busca multicritério
- **Resultados em Tempo Real**: Resultados de busca instantâneos

#### Serviços de Gráfico:
- **Gráficos de Tendência de Preço**: Visualização de tendência de preço de mercado
- **Intervalos de Tempo**: Estatísticas de 30 minutos, 1 hora, 1 dia, 1 semana
- **Coleta de Dados**: Intervalos de coleta de dados de API de 10 minutos
- **Análise de Preço**: Análise abrangente de dados de preço

## Frontend DApp

### 1. Interface do Usuário

#### Recursos Principais:
- **Design Simples**: Interface intuitiva e amigável
- **Experiência Confiável**: Serviço transparente e confiável
- **Atualizações em Tempo Real**: Atualizações de dados ao vivo
- **Design Responsivo**: Compatibilidade com celular e desktop

#### Experiência do Usuário:
- **Navegação Fácil**: Navegação simples e clara
- **Feedback Visual**: Indicadores visuais claros
- **Tratamento de Erros**: Gestão abrangente de erros
- **Estados de Carregamento**: Indicadores de carregamento claros

### 2. Sistema de Autenticação

#### Métodos de Login:
- **Conexão de Carteira**: MetaMask e outras carteiras EVM
- **Integração SSO**: Suporte a login único
- **Processo de Registro**: Registro de usuário simples
- **Gestão de Sessão**: Manuseio seguro de sessão

#### Recursos de Segurança:
- **Segurança de Chave Privada**: Manuseio seguro de chave privada
- **Assinatura de Transação**: Assinatura segura de transação
- **Verificação de Identidade**: Verificação de identidade do usuário

### 3. Gestão de Ativos

#### Depósito/Retirada:
- **Visualização de Ativos**: Ver ativos do usuário por endereço
- **Função de Depósito**: Processo de depósito simples
- **Função de Retirada**: Processo de retirada seguro
- **Rastreamento de Saldo**: Atualizações de saldo em tempo real

#### Recursos de Ativos:
- **Suporte Multi-ativos**: Suporte para vários ativos
- **Histórico de Transações**: Registros completos de transações
- **Análise de Ativos**: Análise de desempenho de ativos

### 4. Centro Pessoal

#### Painel do Usuário:
- **Visão Geral Pessoal**: Visão geral abrangente do usuário
- **Minhas Ordens**: Gestão de ordens do usuário
- **Configurações**: Configurações de preferência do usuário
- **Rastreamento de Desempenho**: Métricas de desempenho do usuário

#### Funções de Gestão:
- **Histórico de Ordens**: Histórico completo de ordens
- **Gestão de Ativos**: Visão geral e gestão de ativos
- **Configuração de Ajustes**: Configurações e preferências do usuário

### 5. Negociação de Ordem Limitada

#### Recursos de Ordem:
- **Ordens de Compra/Venda**: Enviar ordens de compra e venda
- **Visualização de Preço de Mercado**: Exibição de preço de mercado em tempo real
- **Tendências de Preço**: Visualização de tendência de preço
- **Detalhes do Livro de Ordens**: Informações detalhadas do livro de ordens

#### Interface de Negociação:
- **Colocação de Ordem**: Colocação de ordem simples
- **Gráficos de Preço**: Gráficos de preço em tempo real
- **Gestão de Ordem**: Modificação e cancelamento de ordem
- **Histórico de Negociação**: Histórico completo de negociação

### 6. Gestão de Eventos

#### Serviços de Eventos:
- **Listas de Eventos**: Listagens abrangentes de eventos
- **Filtragem de Eventos**: Filtragem avançada de eventos
- **Busca de Eventos**: Funcionalidade de busca de eventos
- **Detalhes do Evento**: Informações detalhadas do evento

#### Gestão de Condições:
- **Listas de Condições**: Listagens de condições de eventos
- **Informações de Preço**: Dados de preço em tempo real
- **Detalhes do Livro de Ordens**: Informações detalhadas do livro de ordens
- **Tendências de Preço de Mercado**: Visualização de tendência de preço

### 7. Análise de Dados

#### Análise de Tendência:
- **Tendências de Depósito**: Gráficos de tendência de valor de depósito
- **Tendências de Lucro**: Gráficos de tendência de valor de lucro
- **Tendências de Atividade**: Tendências de volume e valor de ordens
- **Métricas de Desempenho**: Análise de desempenho do usuário

#### Visualização:
- **Gráficos Interativos**: Visualização de dados interativa
- **Atualizações em Tempo Real**: Atualizações de dados ao vivo
- **Análise Histórica**: Análise de dados históricos
- **Prazos Personalizados**: Seleção flexível de período de tempo

### 8. Suporte Multi-idioma

#### Opções de Idioma:
- **Inglês**: Suporte ao idioma inglês (padrão)
- **Chinês Simplificado**: Suporte ao idioma chinês simplificado
- **Chinês Tradicional**: Suporte ao idioma chinês tradicional
- **Tailandês**: Suporte ao idioma tailandês
- **Indonésio**: Suporte ao idioma indonésio
- **Vietnamita**: Suporte ao idioma vietnamita

#### Recursos de Localização:
- **Tradução Dinâmica**: Troca de idioma em tempo real
- **Adaptação Cultural**: Conteúdo e design localizados
- **Preferências do Usuário**: Configurações de preferência de idioma do usuário
- **Conteúdo Regional**: Conteúdo e recursos específicos da região

## Modelo de Receita

### 1. Taxas de Transação

#### Estrutura de Taxas:
- **Taxa de Negociação**: 1.5/1000 (0.15%) do valor da transação
- **Divisão Comprador/Vendedor**: Ambas as partes cobradas a taxa
- **Dedução Automática**: Taxas deduzidas automaticamente das transações
- **Distribuição de Receita**: Distribuição de receita da plataforma

#### Coleta de Taxas:
- **Processamento Automático**: Coleta automática de taxas
- **Preços Transparentes**: Estrutura de taxas clara
- **Rastreamento de Receita**: Rastreamento abrangente de receita
- **Sustentabilidade da Plataforma**: Receita para desenvolvimento da plataforma

## Limitações e Riscos do Sistema

### 1. Limitações Técnicas

#### Restrições de Desempenho:
- **TPS de Contrato**: < 500 transações por segundo
- **TPS de Sistema de Ordens**: < 100 transações por segundo
- **Risco de Centralização**: Resultados de eventos determinados pelo DP
- **Gestão de Liquidez**: Liquidez fornecida apenas pelo operador

#### Restrições Atuais:
- **Apenas Ordens Limitadas**: Nenhuma ordem de mercado atualmente suportada
- **Sem Carteira Interna**: Uso direto de carteiras de mercado (MetaMask)
- **Sem Controle de Risco**: Sistema de controle de risco não implementado
- **Cluster Único**: Sem implantação distribuída

### 2. Considerações de Segurança

#### Segurança de Contrato:
- **Risco de Vulnerabilidade**: Potencial de vulnerabilidade de contrato inteligente
- **Requisitos de Auditoria**: Auditorias de segurança abrangentes
- **Código Aberto**: Código transparente para revisão da comunidade
- **Atualizações Regulares**: Melhorias contínuas de segurança

#### Segurança Operacional:
- **Gestão de Permissões**: Controles de permissão estritos
- **Verificação de Transação**: Todas as transações verificadas
- **Proteção de Ativos**: Medidas de segurança de ativos do usuário
- **Sistemas de Monitoramento**: Monitoramento contínuo de segurança

### 3. Mitigação de Risco

#### Medidas Técnicas:
- **Testes Abrangentes**: Procedimentos de teste extensivos
- **Auditorias de Segurança**: Auditorias de segurança regulares
- **Revisões de Código**: Processos de revisão de código minuciosos
- **Sistemas de Backup**: Implementações de sistema redundantes

#### Medidas Operacionais:
- **Avaliação de Risco**: Avaliações de risco regulares
- **Resposta a Incidentes**: Planos de resposta a incidentes abrangentes
- **Educação do Usuário**: Educação de segurança do usuário
- **Supervisão da Comunidade**: Monitoramento e feedback da comunidade

---

*Para as informações mais recentes sobre arquitetura do sistema e atualizações, verifique nossos anúncios oficiais.*