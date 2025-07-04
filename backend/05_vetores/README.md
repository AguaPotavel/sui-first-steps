# Vetores

Os vetores são uma forma nativa de armazenar coleções de elementos em Move. São similares às matrizes de outras linguagens de programação, mas com algumas diferenças.

`vector<T>` é o único tipo de coleção primitiva que o Move fornece. Um `vector<T>` é uma coleção homogênea de `T`s que pode crescer ou diminuir fazendo `push`/`pop` de valores no final.

Um `vector<T>` pode ser instanciado com qualquer tipo `T`. Por exemplo, `vector<u64>`, `vector<address>`, `vector<0x1337::meu_modulo::meu_recurso>`, e `vector<vector<u8>>` são todos tipos de vetor válidos.

Você pode encontrar mais informações sobre os vetores e seus métodos na [documentação oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/vector.md) do Sui Core.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/05_vetores
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Vectores
Running Move unit tests
[debug] 1
[debug] 3
[debug] 55
[debug] 40
[ PASS    ] 0x5a6f6e612054726573::vectores::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

### Literais de um vetor

|Sintaxe|Tipo|Descrição|
|---|---|---|
|`vector[]`|`vector[]: vector<T>` onde `T` é qualquer tipo, não referenciado.|Um vetor vazio|
|`vector[e1, ..., en]`|`vector[e1, ..., en]: vector<T>` onde `e_i: T` tem ` 0 < i <= n` e `n > 0`|Um vetor com `n` elementos (de comprimento `n`)|

Nestes casos, o tipo do vetor é inferido, seja a partir do tipo do elemento ou do uso do vetor. Se o tipo não puder ser deduzido, ou simplesmente para maior clareza, o tipo pode ser especificado explicitamente:

```rust
vector<T>[]: vector<T>
vector<T>[e1, ..., en]: vector<T>
```

### Operações

Estas são algumas das operações mais comuns usadas ao trabalhar com vetores:

|Função|Descrição|Aborta|
|---|---|---|
|`empty<T>(): vector<T>`|Cria um vetor vazio que pode armazenar dados do tipo `T`|Nunca|
|`singleton<T>(t: T): vector<T>`|Cria um vetor de comprimento 1 que contém `t`|Nunca
|`push_back<T>(v: &mut vector<T>, t: T)`|Adiciona um elemento ao final de `v`|Nunca|
|`pop_back<T>(v: &mut vector<T>): T`|Remove e retorna o último elemento de `v`|Se v estiver vazio|
|`borrow<T>(v: &vector<T>, i: u64): &T`|Retorna uma referência imutável ao `T` no índice `i`|Se `i` estiver fora dos limites|
|`borrow_mut<T>(v: &mut vector<T>, i: u64): &mut T`|Retorna uma referência mutável ao `T` no índice `i`|Se `i` estiver fora dos limites|
|`destroy_empty<T>(v: vector<T>)`|Elimina v|Se `v` não estiver vazio|
|`append<T>(v1: &mut vector<T>, v2: vector<T>)`|Adiciona os elementos em `v2` ao final de `v1`|Nunca|
|`contains<T>(v: &vector<T>, e: &T): bool`|Retorna `true` se `e` estiver no vetor `v`. Caso contrário, retorna `false`|Nunca|
|`swap<T>(v: &mut vector<T>, i: u64, j: u64)`|Troca os elementos nos índices `i` e `j` no vetor `v`|Se `i` ou `j` estiverem fora dos limites|
|`reverse<T>(v: &mut vector<T>)`|Inverte a ordem dos elementos no vetor `v`|Nunca|
|`index_of<T>(v: &vector<T>, e: &T): (bool, u64)`|Retorna `(true, i)` se `e` estiver no vetor `v` no índice `i`. Caso contrário, retorna `(false, 0)`|Nunca|
|`remove<T>(v: &mut vector<T>, i: u64): T`|Remove o elemento no índice `i` do vetor `v`, deslocando os demais elementos. Esta operação é `O(n)` e preserva a ordem dos elementos.|Se `i` estiver fora dos limites|
|`swap_remove<T>(v: &mut vector<T>, i: u64): T`|Troca o elemento no índice `i` do vetor v com o último elemento e depois elimina o último elemento. Esta operação é `O(n)` mas não preserva a ordem dos elementos no vetor.|Se `i` estiver fora dos limites|

> :information_source: Lembre-se de que você pode ver informações sobre o restante dos métodos na [documentação oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/vector.md) do Sui Core.

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/vetores.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

## Desafio

* Crie uma matriz de 3x3 e inicialize-a com os valores que você desejar.
* Imprima cada um desses elementos.

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer `push` para seu repositório do **Github**.