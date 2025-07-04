# Armazenamento Global

Nesta lição você aprenderá a utilizar todas as operações do Global Storage, e compreenderá a segurança e confiabilidade do gerenciamento de recursos da linguagem Move.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/11_armazenamento_global
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test --named-addresses cuenta=0x5A6F6E612054726573
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Almacenamiento Global
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
{
  "Result": "Success"
}
```

Normalmente aqui pararíamos... Mas para esta lição interagiremos com a Blockchain do Sui diretamente pela primeira vez.

### Inicializando Sui CLI
Vamos inicializar este diretório para trabalhar com a Blockchain. Primeiro, execute o seguinte comando em seu terminal:

```sh
sui init
```

Você receberá a seguinte mensagem:
```
Configuring for profile default
Choose network from [devnet, testnet, mainnet, local, custom | defaults to devnet]
```

Para este tutorial vamos usar a `devnet` (mais informações sobre a devnet na seção **Tutorial**). Você pode escrevê-la ou simplesmente pressione `Enter`:
```
No network given, using devnet...
Enter your private key as a hex literal (0x...) [Current: None | No input: Generate new key (or keep one if present)]
```

Novamente, por enquanto apenas pressione `Enter`. Você deve obter algo similar a isto:
```
No key given, generating key...
Account 0xe0727f9554856401a427fe29f0ab0b27d39e79b7eb7b4081dd68f11426bb5eaf doesn't exist, creating it and funding it with 100000000 Octas
Account 0xe0727f9554856401a427fe29f0ab0b27d39e79b7eb7b4081dd68f11426bb5eaf funded successfully

---
Sui CLI is now set up for account 0xe0727f9554856401a427fe29f0ab0b27d39e79b7eb7b4081dd68f11426bb5eaf as profile default!  Run `sui --help` for more information about commands
{
  "Result": "Success"
}
```

A conta gerada deve ser diferente para você.

O que acabamos de fazer é criar uma nova conta na Blockchain. Neste caso, estamos trabalhando na rede de desenvolvimento `devnet`, portanto o que fizermos não tem impacto na Blockchain principal (ou `mainnet`) e os tokens que utilizarmos são fictícios, então você pode experimentar sem preocupações.

### Financiando a conta

Inicialmente a conta que criamos tem alguns tokens fictícios, mas podemos adicionar mais, ou financiar a conta usando um faucet. Para isso execute o seguinte comando:

```sh
sui account fund-with-faucet --account default
```

Você receberá algo similar a isto:
```
{
  "Result": "Added 100000000 Octas to account 0xe0727f9554856401a427fe29f0ab0b27d39e79b7eb7b4081dd68f11426bb5eaf"
}
```

Algo importante a notar aqui é que acabamos de financiar a conta `default`. Dado que não especificamos algum perfil para a conta, ela é atribuída ao perfil padrão, ou `default`.

### Compilando o código

Agora, vamos compilar o código. Para isso você precisa executar o seguinte comando:

```sh
sui move compile --named-addresses cuenta=default
```

Seu terminal mostrará algo como isto:
```
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/sui-labs/sui-core.git
UPDATING GIT DEPENDENCY https://github.com/sui-labs/sui-core.git
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Almacenamiento Global
{
  "Result": [
    "e0727f9554856401a427fe29f0ab0b27d39e79b7eb7b4081dd68f11426bb5eaf::almacenamiento_global"
  ]
}
```

No arquivo `Move.toml` você pode encontrar as seguintes propriedades:

```toml
[addresses]
cuenta = "_"
```

E no arquivo `sources/armazenamento_global.move` o endereço do módulo mudou para:

```move
module cuenta::almacenamiento_global {
    // ... resto do código ...
}
```
Todas essas mudanças são para poder trabalhar com a conta `default`. No `Move.toml` deixamos o parâmetro de conta vazio, portanto ao executar o comando `sui move compile` precisamos dizer a qual conta pretendemos publicar este pacote. É por isso que especificamos com a flag `--named-addresses cuenta=default`, indicando para usar a conta `default`, exatamente a que acabamos de criar.

### Publicando o pacote

Vamos publicar este pacote, execute este comando:
```sh
sui move publish --named-addresses cuenta=default
```

Você obterá algo como:

```sh
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/sui-labs/sui-core.git
UPDATING GIT DEPENDENCY https://github.com/sui-labs/sui-core.git
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Almacenamiento Global
package size 3038 bytes
Do you want to submit a transaction for a range of [212800 - 319200] Octas at a gas unit price of 100 Octas? [yes/no] >
```

Neste momento, o console está pedindo autorização para gastar `gas`, basicamente, usará tokens da sua conta para pagar pelo cálculo e armazenamento necessário para publicar seu pacote. Digite `yes` e pressione `Enter`. Agora você terá algo como isto:
```
{
  "Result": {
    "transaction_hash": "0x05014d5e16c78da4692b3cf3e4ae0f9f88ab29949b635b1178a898fca2e190ee",
    "gas_used": 2128,
    "gas_unit_price": 100,
    "sender": "e0727f9554856401a427fe29f0ab0b27d39e79b7eb7b4081dd68f11426bb5eaf",
    "sequence_number": 0,
    "success": true,
    "timestamp_us": 1719443012949647,
    "version": 78274391,
    "vm_status": "Executed successfully"
  }
}
```
Esta mensagem nos indica que a publicação do nosso pacote dentro da rede `devnet` na blockchain do **Sui** foi bem-sucedida. Parabéns! Você acabou de publicar seu primeiro pacote na blockchain.

Por enquanto, leia um pouco da teoria e o código, para depois interagir com o pacote que acabou de publicar.

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/armazenamento_global.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

### Operações

Os programas Move podem criar, eliminar e atualizar recursos no armazenamento global utilizando as cinco instruções seguintes:

|Operação|Descrição|Aborta|
|---|---|---|
|`move_to<T>(&signer, T)`|Publica `T` em `signer.address`.|Se `signer.address` já tem um `T`.|
|`move_from<T>(address): T`|Remove `T` de `address` e retorna seu valor.|Se `address` não tem um `T`.|
|`borrow_global<T>(address): &T`|Retorna uma referência imutável ao `T` armazenado em `address`.|Se `address` não tem um `T`.|
|`borrow_global_mut<T>(address): &mut T`|Retorna uma referência mutável ao `T` armazenado em `address`.|Se `address` não tem um `T`.|
|`exists<T>(address): bool`|Retorna `true` se um `T` está armazenado em `address`. Caso contrário, retorna `false`.|Nunca.|

### Referências a recursos

As referências a recursos globais retornadas por `borrow_global` ou `borrow_global_mut` se comportam em sua maior parte como referências a armazenamento local: podem ser lidas e escritas utilizando operadores de referência ordinários e passadas como argumentos a outra função. No entanto, existe uma diferença importante entre as referências locais e as globais: **uma função não pode retornar uma referência que aponte para um armazenamento global**.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre o Armazenamento Global na [documentação](https://move-language.github.io/move/global-storage-operators.html) oficial da linguagem Move.

### Interagindo com o pacote publicado

> :information_source: Para seguir esta parte você precisa ter feito os passos descritos na seção **Executando o tutorial**.

Uma vez preparado e publicado seu pacote, vamos interagir com ele.

### `publicar`

Para usar a primeira função do nosso código, você pode executar:

```sh
sui move run --function-id 'default::almacenamiento_global::publicar' --args u64:1
```

Neste comando, estamos executando com `run` a função `<conta>::<modulo>::<funcao>` e enviando os argumentos que requer `--args <tipo>:<valor>`.
Você deve obter algo como isto:

```
Do you want to submit a transaction for a range of [44600 - 66900] Octas at a gas unit price of 100 Octas? [yes/no] >
```

Dado que vamos escrever na blockchain, é necessário pagar pelo cálculo e armazenamento desta transação. Digite `yes` e pressione `Enter`. O terminal mostrará algo similar:
```
{
  "Result": {
    "transaction_hash": "0x23921cc4c3c3cf475101261915f0823a4da5c0c5b6e8cd1c0a0a99d5c22b21f1",
    "gas_used": 446,
    "gas_unit_price": 100,
    "sender": "d81c7c2bcbb7055e254a20ff50099cd7609d070400e848f14b038072c89e5e8d",
    "sequence_number": 1,
    "success": true,
    "timestamp_us": 1719443577263826,
    "version": 78374805,
    "vm_status": "Executed successfully"
  }
}
```

Pronto! Você acabou de executar com sucesso sua primeira transação usando um pacote Move.

### Métodos de visualização

Vamos executar o método `obtener_contador`:

```sh
sui move view --function-id 'default::almacenamiento_global::obtener_contador' --args address:0x9ec76cffd7571d19a3abfe8f9721484eb7309fa55bd99722c60f94f5d70c2119
```

> :information_source: Lembre-se de substituir o `address` com seu próprio `address`. Se não souber qual é, você pode vê-lo executando:
>```sh
>sui account lookup-address
>```

Você deve obter algo como isto:
```
9a3abfe8f9721484eb7309fa55bd99722c60f94f5d70c2119
{
  "Result": [
    "1"
  ]
}
```

O que está correto, o valor que inicializamos foi `1`.

> :warning: Lembre-se de que estamos executando `sui move view`. Note o `view`. Se você executar uma função de visualização usando `sui move run` obterá um erro como o seguinte:
>```
>{
>  "Error": "Simulation failed with status: INVALID_MAIN_FUNCTION_SIGNATURE"
>}
>```

### Testando o resto dos métodos

Você pode testar o programa e ver o funcionamento do mesmo, os comandos são:

`incrementar`
```sh
sui move run --function-id 'default::almacenamiento_global::incrementar' --args address:<seu_endereco>
```

`restablecer`
```sh
sui move run --function-id 'default::almacenamiento_global::restablecer'
```

`existe`
```sh
sui move view --function-id 'default::almacenamiento_global::existe' --args address:<seu_endereco>
```

`eliminar`
```sh
sui move run --function-id 'default::almacenamiento_global::eliminar'
```

## Desafio

Com base no exemplo do contador, modifique o struct para armazenar mais campos
* Os novos campos podem ser do tipo que quiser, experimente!
* Pelo menos 3 campos.
* Cada um dos campos deve ter pelo menos uma função para modificá-lo.
* Não é necessário deixar os comentários da documentação, já que estes ocupam muito espaço.

> :information_source: Lembre-se de salvar suas mudanças no arquivo para posteriormente fazer `push` ao seu repositório do **Github**.