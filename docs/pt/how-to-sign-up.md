# Como criar sua conta

YC365 não usa contas tradicionais de usuário e senha. O endereço da sua carteira passa a ser sua identidade. Siga os passos abaixo para conectar a carteira e concluir o cadastro de forma rápida.

## 1. Abra o dApp do YC365
- Acesse [https://dapp.yc365.io](https://dapp.yc365.io) em um navegador baseado em Chromium (Chrome, Edge, Brave) para a melhor compatibilidade com carteiras.
- Verifique se o URL é HTTPS e corresponde exatamente ao domínio oficial, evitando sites de phishing.
- Opcional: se estiver validando uma versão de testes, utilize as ferramentas do Chrome Dev MCP para inspecionar a interface antes de conectar.

## 2. Inicie o conector de carteira
- Clique no botão **Connect Wallet** no canto superior direito do dApp.
- Um modal seguro será exibido com as opções de autenticação disponíveis.

![Modal de conexão exibindo Google, MetaMask, Coinbase e Trust Wallet](../img/yc365/connect-wallet.png)

*O modal de cadastro oferece diversos provedores. Recomendamos o MetaMask para a maioria dos usuários de desktop.*

## 3. Escolha o provedor preferido
- **MetaMask (recomendado):** opção mais versátil. Aprove a solicitação na janela pop-up da extensão.
- **Coinbase Wallet / Trust Wallet:** alternativas amigáveis para celular. Escaneie o QR code ou aprove a conexão na extensão.
- **Login com Google:** cria uma carteira vinculada à sessão via MPC, ideal para quem ainda não possui self-custody.

Se estiver usando o fluxo do Chrome Dev MCP, confirme que o provider aparece em `window.ethereum` antes de continuar.

## 4. Confirme a rede e as permissões
- Certifique-se de que a carteira está na **BNB Smart Chain (BSC)**. Caso contrário, o dApp solicitará a troca de rede.
- Revise as permissões solicitadas (visualizar endereço, saldo, transações sugeridas) e clique em **Connect** ou **Approve**.
- No login com Google, siga as etapas do OAuth e autorize o acesso MPC do YC365.

## 5. Verifique o sucesso do cadastro
- O botão **Connect Wallet** passa a exibir o seu endereço de carteira.
- As guias **Orders** e **Person** na barra inferior são liberadas, permitindo acesso ao portfólio e às configurações.
- No Chrome Dev MCP, confirme o estado autenticado verificando se o `localStorage` contém o item `yc365-auth`.

---

Depois de conectar, você já pode depositar fundos, explorar mercados ao vivo e fazer sua primeira negociação. Continue no guia “[Como depositar](how-to-deposit.md)” para seguir com o próximo passo.***
