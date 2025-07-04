# Strings

Move não tem um tipo incorporado para representar strings, mas tem duas implementações padrão para strings na Biblioteca Padrão. O módulo `std::string` define um tipo `String` e métodos para strings codificadas em `UTF-8`, e o segundo módulo, `std::ascii`, fornece um tipo `String ASCII` e seus métodos.

Você pode encontrar mais informações sobre as strings e seus métodos na [documentação oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/string.md) do Sui Core.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/06_cadeias
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Cadenas
Running Move unit tests
[debug] 0x48656c6c6f20576f726c6421
[debug] "Hello World!"
[debug] 0x48656c6c6f20576f726c6421
[debug] "Hello World!"
[debug] true
[debug] "Hola"
[debug] "HolaAdios"
[debug] "HolaAdiosHello World!"
[debug] "HolaINSERTAMEAdiosHello World!"
[debug] "HolaINSERTAMEAdiosHello World!
Esto se imprimira en una nueva linea."
[debug] "100"
[debug] "[ 10, 20, 30 ]"
[ PASS    ] 0x5a6f6e612054726573::cadenas::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

### As strings são bytes

Independentemente do tipo de string que você use, é importante saber que as strings são apenas bytes. Os *wrappers* fornecidos pelos módulos `string` e `ascii` são apenas isso: envoltórios. Eles fornecem verificações de segurança e métodos para trabalhar com strings, mas no final das contas, não são mais que vetores de bytes.

### Strings UTF-8

Embora existam dois tipos de strings na biblioteca padrão, o módulo `string` deve ser considerado o padrão. Tem implementações nativas de muitas operações comuns, e portanto é mais eficiente que o módulo `ascii`, que está totalmente implementado em Move.

As strings de bytes são literais de string entre aspas precedidos por um `b`, por exemplo `b"Ola!\n"`.

```rust
let hello: String = string::utf8(b"Ola!");
```

Trata-se de strings codificadas em ASCII que suportam sequências de escape. Atualmente, as sequências de escape suportadas são:

|Sequência|Descrição|
|---|---|
|\n|Nova linha|
|\r|Retorno de carro|
|\t|Tabulador|
|\\\ |Barra invertida|
|\0|Valor `null`|
|\\"|Aspas|
|\xHH|Escape hexadecimal. Adiciona a sequência hexadecimal `HH`|

### Strings hexadecimais

As strings hexadecimais são literais de string entre aspas precedidas de um `x`, por exemplo `x"48656C6C6F210A"`.

Cada par de bytes, de `00` a `FF`, é interpretado como um valor `u8` codificado em hexadecimal. Assim, cada par de bytes corresponde a uma única entrada no `vector<u8>` resultante.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre as strings e seus métodos na [documentação oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/string.md) do Sui Core.

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/cadeias.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

## Desafio

* Crie uma string com um poema de 4 linhas **em uma única variável**. Você pode usar o seguinte como exemplo:
    ```
    Te vi um ponto e, flutuando diante dos meus olhos,
    a imagem dos teus olhos permaneceu,
    como a mancha escura orlada em fogo
    que flutua e cega se se olha para o sol.
    ```
    > :warning: Lembre-se de que o código do Move **não** pode ter acentos nem caracteres especiais.
* Agora crie 4 variáveis, uma para cada linha e concatene-as em uma única variável final.
* Imprima ambas as variáveis.
* Responda: Qual dos dois métodos você acha que é melhor e por quê?

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer `push` para seu repositório do **Github**.