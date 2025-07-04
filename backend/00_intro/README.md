# Introdução

## Módulos e Scripts

**Move** tem dois tipos diferentes de programas: Módulos e Scripts. 

Os módulos são bibliotecas que definem structs (`struct`) junto com funções (`fun`) que operam sobre eles. Os structs definem o esquema do `global storage` do **Move**, e as funções dos módulos definem as regras para atualizar o armazenamento. Os próprios módulos também são salvos no `global storage`. 

Os scripts são pontos de entrada executáveis similares a uma função `main` em uma linguagem convencional. Um script geralmente chama funções de um módulo publicado que realizam atualizações do `global storage`. Os scripts são fragmentos de código efêmeros que não são publicados no `global storage`.

Um arquivo **Move** (ou unidade de compilação) pode conter múltiplos módulos e scripts. No entanto, publicar um módulo ou executar um script são operações VM independentes.

Módulo:
* Contém funções e tipos.

Script:
* Executa funções de um Módulo.

Nos seguintes tutoriais trabalharemos **apenas com módulos**.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/00_intro
>```

Entre no seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] 0x5a6f6e612054726573::practica_sui::prueba
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

Parabéns! :partying_face: Você acabou de executar com sucesso seu primeiro módulo Move. Agora, vamos analisar o que está acontecendo.

Na pasta `sources` podemos encontrar um arquivo chamado `introducao.move`. Este arquivo, como indica a extensão, contém o código Move que estamos executando. Neste caso, é um **módulo** com uma **função** e um **teste**.

## Estrutura de um módulo

A estrutura de um **módulo** é a seguinte:

```rust
module endereco::nome_modulo {
    // ...  resto do código
}
```

1. Declaração do módulo com a palavra-chave `module`.
2. Endereço onde o módulo será implantado.
    O endereço o encontramos no arquivo de configurações `Move.toml`, na seção de `addresses`. No nosso caso:
    ```toml
    [addresses]
    introduccion = "0x5A6F6E612054726573"
    ```
3. Nome do módulo, no nosso caso: `pratica_sui`

Portanto, nosso código fica assim:
```rust
module introduccion::pratica_sui {
    // ...  resto do código
}
```

Depois, vem os `imports` ou os módulos/bibliotecas que estamos importando para que o nosso funcione. No nosso código, estamos importando duas funções da biblioteca principal do **Sui**:

```rust
    use std::debug::print;
    use std::string::utf8;
```

É importada a função para imprimir no console, bem como uma função para converter cadeias de texto para um formato aceito pela função anterior. Isso veremos mais adiante nesta série de tutoriais.

A próxima seção de código inclui nossa primeira função:

```rust
    fun pratica() {
        print(&utf8(b"Hello, World!"));
    }
```

Nela, fazemos uso de ambas as bibliotecas importadas. A função simplesmente imprime a string `Hello, World!` no console.

E por último, precisamos de uma forma de executar esta função. Por enquanto estamos fazendo isso através de um **bloco de testes** ou `test`:

```rust
    #[test]
    fun teste() {
        pratica();
    }
```

Ao termos executado `sui move test` estamos dizendo à CLI para executar todas as funções que tenham um bloco `[#test]`, neste caso, executa nossa função `teste`, que por sua vez chama a função `pratica`.

## Output

Por último, vamos analisar o resultado que foi impresso no console.

```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] 0x5a6f6e612054726573::practica_sui::prueba
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

O primeiro bloco de texto nos indica que está incluindo as dependências necessárias para executar o projeto:

```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
```

Essas dependências podem ser vistas no arquivo `Move.toml`:
```toml
[dependencies.SuiStdlib]
git = 'https://github.com/sui-labs/sui-core.git'
rev = 'main'
subdir = 'sui-move/framework/sui-stdlib'

[dependencies.MoveStdlib]
git = 'https://github.com/sui-labs/sui-core.git'
rev = 'main'
subdir = 'sui-move/framework/move-stdlib'
```

Cada uma dessas dependências está sendo importada de um repositório do **Github**, neste caso, o repositório oficial do **Sui Core**.

> :information_source: Você pode ver o repositório oficial aqui: [Sui Core](https://github.com/sui-labs/sui-core).

A próxima linha no output nos indica que serão executados os testes unitários no arquivo, lembre-se de que isso é porque executamos o comando `sui move test`:
```
Running Move unit tests
```

Depois, obtemos a mensagem que executa a função teste, no nosso caso, a linha de texto `Hello, World!`:
```sh
[debug] "Hello, World!"
```

Agora, na próxima linha, podemos obter informações sobre exatamente quais funções foram executadas:
```sh
[ PASS    ] 0x5a6f6e612054726573::pratica_sui::teste
```
A estrutura é algo assim:
```rust
endereco::nome_modulo::funcao
```
Com isso, podemos verificar que a função que foi executada foi `teste`.

Por último, obtemos informações sobre os testes unitários, quantos foram executados e quantos passaram:

```sh
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Desafio final

Como desafio final, modifique a função para que, em vez de mostrar `Hello, World!`, imprima o logo do **Sui** em arte ASCII:
```ASCII
MMMMMMMMMMMMMMMMWKkdc;'..          ..';cdkKWMMMMMMMMMMMMMMMM
MMMMMMMMMMMMWXkl,.                        .,lkXWMMMMMMMMMMMM
MMMMMMMMMMXk:.                                .ckXMMMMMMMMMM
MMMMMMMWKo'                               ...    'oKWMMMMMMM
MMMMMMXo.                               .:OX0l.    .oXMMMMMM
MMMMMNd;;;,;;,,,,,,,,,,,,,,,,,,,;;;,,,;lOWMMMW0l;,;;:dXMMMMM
MMMMMWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWMMMMMMMMMWWWWWWWMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKXWMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNx,.'oXMMMMMMMMMMMMMMMMMMMM
N0kkkkkkkkkkkkkkkkkkkkkkkkkkkkkko,     'okkkkkkkkkkkkkkkkk0N
x.                                                        .x
;                              .;;.                        ;
.                           .cx0WW0c.                      .
olllllllllllllllllllllllllld0WMMMMMW0olllllllllllllllllllllo
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMXkkXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMXd'  'xXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
koollloolllllllllollc'      'clllllllllllllllllllllllllllllx
l                                                          c
0'                 .cl;                                   '0
Wx.              .oKWMNk,                                .xW
MW0xxxxxxxxxxxxxkXWMMMMMNOkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk0WM
MMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMXd;,l0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMWKd,    .lOKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXWMMMMMMM
MMMMMMMNx'        ................................;kNMMMMMMM
MMMMMMMMWKd,.                                  .,dKWMMMMMMMM
MMMMMMMMMMMN0o,.                            .,o0NMMMMMMMMMMM
MMMMMMMMMMMMMMWKxl;..                  ..;lxKWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMWKko:'.          .';okKWMMMMMMMMMMMMMMMMMM
```

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer `push` para o seu repositório do **Github**.