# Configuração do SUI Client

Em qualquer blockchain, as redes são ambientes nos quais usuários e desenvolvedores podem interagir com contratos inteligentes, validar transações ou testar novas funcionalidades. No caso do Sui, essas redes permitem separar o ambiente de desenvolvimento do ambiente de produção, facilitando tanto a experimentação quanto a estabilidade do ecossistema. Cada rede cumpre uma função específica e compreendê-las é fundamental para saber em que momento utilizar cada uma segundo o objetivo: testar, desenvolver ou implementar em produção.

* **Mainnet**: É a rede principal do Sui, onde são executadas transações reais e permanentes. Tudo que acontece aqui tem valor real —por exemplo, transferências de tokens SUI ou NFTs—, e está diretamente vinculado com dinheiro ou ativos que já estão em circulação.
* **Testnet**: É uma rede pensada para testes controlados antes de lançar atualizações importantes. Seu objetivo é garantir que as mudanças não afetem negativamente o desempenho da rede principal. Os desenvolvedores podem validar seus pacotes e scripts aqui sem correr riscos econômicos.
* **Devnet**: É um ambiente mais instável, pensado para quem está trabalhando com funções experimentais que ainda não foram integradas oficialmente. Serve para explorar novas capacidades e obter feedback precoce, embora não se garanta sua continuidade.
* **Localnet**: É uma rede privada que roda localmente no seu computador. É ideal para desenvolver e testar sem conexão com a internet nem necessidade de depender de outros validadores. Te dá controle total sobre o ambiente e permite iterar mais rapidamente.

Essas redes permitem aos desenvolvedores preparar, testar e validar suas aplicações de forma segura antes de movê-las para o ambiente real. Para poder interagir com qualquer uma dessas redes, é necessário conectar-se a uma rede através da Sui CLI, o que implica configurar seu terminal para trabalhar com os endpoints corretos e ter as credenciais necessárias.

## Configuração inicial do cliente

1. Primeiro, vamos verificar se o cliente está configurado corretamente:

```sh
sui client
```

2. Se esta é a primeira vez que você executa este comando, o sistema solicitará que você configure uma nova carteira. Para isso, selecione a opção `y` (yes) e escolha o esquema de assinatura. Para este tutorial, recomendamos usar `0` para **ed25519**.

```sh
Config file ["/home/user/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full Node server [y/N]?y
Sui Full Node server URL (Defaults to Sui Testnet if not specified) : 
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2 for secp256r1): 
0
```

3. Uma vez finalizada a configuração, você pode verificar as informações básicas do seu cliente executando novamente:

```sh
sui client
```

4. Agora você pode ver informações sobre as redes configuradas, endereços disponíveis e outras configurações relevantes:

```sh
Config file ["/home/user/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full Node server [y/N]?y
Sui Full Node server URL (Defaults to Sui Testnet if not specified) : 
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2 for secp256r1): 
0

Generated new keypair and alias for address with scheme "ed25519" [charming-turquoise: 0x123...]
Secret Recovery Phrase : [abandon ability able about above absent absorb abstract absurd abuse access accident]

Config file ["/home/user/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full Node server [y/N]?y
```

> :warning: **Importante**: Guarde sua frase de recuperação secreta em um local seguro. Esta frase é necessária para recuperar sua carteira em caso de perda.

## Financiar uma conta de teste

Para poder executar transações na rede de teste, você precisará de tokens SUI de teste. Para obtê-los:

1. Execute o seguinte comando para solicitar tokens de teste:

```sh
sui client faucet
```

2. Você pode verificar seu saldo executando:

```sh
sui client balance
```

3. Se você quiser ver mais detalhes sobre os objetos em sua conta:

```sh
sui client objects
```

## Mudança entre ambientes de rede

Para alternar entre diferentes redes (mainnet, testnet, devnet), você pode usar os seguintes comandos:

### Listar ambientes disponíveis:

```sh
sui client envs
```

### Alternar para uma rede específica:

```sh
# Para testnet
sui client switch --env testnet

# Para devnet  
sui client switch --env devnet

# Para mainnet
sui client switch --env mainnet
```

### Adicionar uma nova rede:

```sh
sui client new-env --alias [nome-da-rede] --rpc [url-do-endpoint]
```

Por exemplo, para adicionar uma rede local:

```sh
sui client new-env --alias localnet --rpc http://127.0.0.1:9000
```

### Verificar rede atual:

Você pode verificar em qual rede está atualmente conectado executando:

```sh
sui client active-env
```

Com essas configurações, você estará pronto para começar a interagir com a rede Sui de sua escolha e desenvolver aplicações descentralizadas.