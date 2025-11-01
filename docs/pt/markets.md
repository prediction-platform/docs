# Mercados

O hub de mercados do YC365 reúne oportunidades ao vivo, populares e futuras em um só lugar. Ele combina filtros rápidos, cards ricos em informações e widgets analíticos para que você encontre negociações em segundos.

## Explorando mercados ao vivo

![Diretório de mercados com chips de categoria, busca e cards em destaque](../img/yc365/home-dashboard.png)

*A visualização “All Markets” lista eventos em destaque, probabilidades em tempo real e botões YES/NO para ordens instantâneas.*

- **Chips de categoria** no topo (AI, Election, Sports, Movies etc.) filtram os mercados instantaneamente.
- **Busca** no canto superior direito restringe resultados por título do evento ou palavra-chave.
- **Cards de mercado** mostram probabilidade implícita, volume atual e botões de compra sem sair da página.
- Após conectar a carteira, **ações rápidas** (`Yes` / `No`) permitem lançar ordens imediatamente.

Ao usar as ferramentas do Chrome Dev MCP, valide os dados de cada card analisando a resposta GraphQL `livemarkets` na aba Network.

## Ranking e atividade

O YC365 também exibe dados agregados de desempenho para destacar carteiras e formadores de mercado de maior impacto.

![Tela de ranking exibindo volumes e lucros com alternância diária/semanal/mensal](../img/yc365/leaderboard.png)

*Alterne entre as visões diária, semanal, mensal ou acumulada para identificar contas influentes e avaliar a profundidade de liquidez.*

- **Ranking por volume** revela as carteiras que movimentam o maior volume em todos os mercados.
- **Ranking por lucro** evidencia os vencedores consistentes e ajuda a comparar sua própria estratégia.
- **Alternância de períodos** (Day/Week/Month/All) mostra o equilíbrio entre momento de curto prazo e consistência de longo prazo.
- **Dica Chrome Dev MCP**: durante o QA, capture essa tela para garantir que as respostas da API de rankings estejam cacheadas e paginadas corretamente.

---

Quer avançar para a prática? Confira “[Realizando sua primeira negociação](making-your-first-trade.md)” ou “[Como usar o livro de ordens](using-the-order-book.md)” para instruções operacionais detalhadas.
