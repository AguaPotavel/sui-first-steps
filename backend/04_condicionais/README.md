# Condicionais

As funções condicionais são usadas para tomar decisões em um programa. Elas podem executar blocos de código dependendo do resultado ou avaliar condições para continuar ou abortar a execução de um módulo.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/04_condicionais
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Condicionales
Running Move unit tests
[debug] "a es mayor a 0"
[debug] "a no es mayor a 20"
[debug] 10
[debug] "Usuario tiene acceso."
[ PASS    ] 0x5a6f6e612054726573::condicionales::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

### If Else

A expressão `if` é usada para tomar decisões em um programa. Avalia uma expressão booleana e executa um bloco de código se a expressão for verdadeira. Junto com `else`, pode executar um bloco de código diferente se a expressão for falsa.

A sintaxe da expressão if é

```rust
if (<expressão_bool>) <expressão>;
```
```rust
if (<expressão_bool>) <expressão> else <expressão>;
```

ou

```rust
if (<expressão_bool>) {
  <expressão>
};
```
```rust
if (<expressão_bool>) {
  <expressão>
} else {
  <expressão>
};
```

### Abort

A palavra-chave `abort` é usada para abortar a execução de uma função. É usada junto com um código de aborto, que será retornado para quem chama a função. O código de cancelamento é um inteiro do tipo `u64`.

```rust
if (<expressão_bool>) {
  abort <código_de_erro>
};
```
ou
```rust
if (<expressão_bool>) {
  abort(<código_de_erro>)
};
```

### Assert

`assert!` é uma macro que pode ser usada para afirmar uma condição. Se a condição for falsa, a execução da função será cancelada com o código de cancelamento fornecido. A macro `assert!` é uma forma prática de abortar uma função se uma condição não for atendida. A macro encurta o código que de outra forma seria escrito com uma expressão `if` + `abort`. O argumento código é obrigatório e deve ser um valor `u64`.

```rust
assert!(<expressão_bool>, <código_de_erro>);
```

### Códigos de erro

Para que os códigos de erro sejam mais descritivos, é uma boa prática definir **constantes de erro**. São definidas como declarações `const` e geralmente carregam o prefixo `E` seguido de um nome em `camel case`. As **constantes de erro** não são diferentes de outras constantes e não têm tratamento especial, no entanto, são usadas para aumentar a legibilidade do código e facilitar a compreensão dos cenários de aborto.

```rust
const ECodigo_de_erro: u64 = <código_de_erro>;
```
ou
```rust
const ECodigo_de_erro_1: u64 = 1;
const ECODIGO_DE_ERRO_2: u64 = 2;
```

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/condicionais.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

## Desafio

* Crie uma constante de erro com o valor que você desejar para indicar que o usuário é menor de idade.
* Crie uma variável que represente uma idade.
* Avalie esta variável em um bloco condicional usando `if` e `else`:
  * Se o usuário for maior de idade, imprima uma mensagem para fazer com que saiba que pode acessar os conteúdos do seu programa.
  * Se o usuário **não** for maior de idade, aborte a execução enviando o código de erro que você criou no início.
* Faça esta mesma avaliação usando `assert`. Lembre-se de que `assert` não retorna nenhuma mensagem, mas retorna um número como código de erro.

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer `push` para seu repositório do **Github**.