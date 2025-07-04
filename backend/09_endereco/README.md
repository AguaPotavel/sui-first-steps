# Address

Antes de aprender o que é o **armazenamento global** é necessário entender o tipo `address`. Até agora, estamos apenas usando a linguagem **Move** e executando funções de maneira local, mas não devemos esquecer que o objetivo é usá-la em conjunto com a blockchain do **Sui**.

`address` é um identificador único de uma localização na blockchain. É usado para identificar pacotes, contas e objetos. Um `address` tem um tamanho fixo de 32 bytes e geralmente é representado como uma string hexadecimal com o prefixo `0x`. Os endereços não distinguem entre maiúsculas e minúsculas.

```
0xe51ff5cd221a81c3d6e22b9e670ddf99004d71de4f769b0312b68c7c4872e2f1
```

O endereço acima é um exemplo de `address` válido. Tem 64 caracteres (32 bytes) e o prefixo `0x`.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/09_endereco
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh

```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/endereco.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

### Sintaxe

Os endereços podem ser numéricos ou nomeados. A sintaxe de um `address` nomeado segue as mesmas regras que qualquer identificador nomeado em **Move**. A sintaxe de um endereço numérico não está restrita a valores codificados hexadecimais, e qualquer valor numérico `u128` válido pode ser usado como valor de endereço, por exemplo, `42`, `0xBEBE` e `2024` são todos literais de endereço numérico válidos.

Para distinguir quando um endereço é usado em um contexto de expressão ou não, a sintaxe ao usar um endereço difere dependendo do contexto em que é usado:

* Quando um endereço é usado como expressão, deve ser precedido pelo caractere `@`, ou seja, `@<valor_numerico>` ou `@<identificador_endereco_nomeado>`.
* Fora dos contextos de expressão, o endereço pode ser escrito sem o caractere `@` inicial, ou seja, `<valor_numerico>` ou `<identificador_endereco_nomeado>`.

### Endereços nomeados

Os endereços nomeados são uma característica que permite usar identificadores em lugar de valores numéricos em qualquer lugar onde endereços sejam usados, e não apenas no nível de valor. Os endereços nomeados são declarados e vinculados como elementos de nível superior (fora de módulos e scripts) nos pacotes Move, ou são passados como argumentos para o compilador Move.

Os endereços nomeados só existem no nível da linguagem fonte e serão substituídos completamente por seu valor no nível de código de bytes. Devido a isso, deve-se acessar os módulos e os membros dos módulos __através do endereço nomeado do módulo e não através do valor numérico__ atribuído ao endereço nomeado durante a compilação, por exemplo, usar `meu_endereco::foo` não é equivalente a usar `0x2::foo` mesmo se o programa Move for compilado com `meu_endereco` definido como `0x2`.

### Operações de Armazenamento Global

O propósito principal dos `address` é interagir com as operações de **armazenamento global**. Os `address` são usados com as operações `exists`, `borrow_global`, `borrow_global_mut` e `move_from`.

A única operação de **armazenamento global** que não usa endereço é `move_to`, que `usa signer`.

### Signer

`signer` é um tipo de recurso em Move. Um `signer` permite ao portador **agir** em nome de um endereço determinado. Move pode criar qualquer valor de endereço sem nenhuma permissão especial usando literais de `address`:

```move
let a1 = 0x1;
let a2 = 0x2;
// ...
```

No entanto, `signer` é especial porque você não pode criá-lo usando literais ou instruções. Só podem ser criados pela **MoveVM**.

Uma função pode ter um número arbitrário de `signer` desde que os `signers` estejam antes de qualquer outro argumento. Em outras palavras, todos os argumentos de `signer` devem vir primeiro:

```move
use std::signer;
fun main(s1: signer, s2: signer, x: u64, y: u8) {
    // ...
}
```

### Operações de `signer`

O módulo `std::signer` da biblioteca padrão fornece duas funções sobre os valores de `signer`:

|Função|Descrição|
|---|---|
|`address_of(&signer): address`|Retorna o `address` envolvido no `signer`.|
|`borrow_address(&signer): &address`|Retorna uma referência ao `address` envolvido no `signer`.|

## Desafio

Simplesmente leia a documentação e certifique-se de entendê-la.