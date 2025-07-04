# Tipos primitivos

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/03_tipos_primitivos
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Tipos primitivos
Running Move unit tests
[debug] 1
[debug] 2
[debug] 3
[debug] 1123456
[debug] 51966
[debug] 3200187904
[debug] true
[debug] false
[debug] true
[debug] false
[ PASS    ] 0x5a6f6e612054726573::tipos_primitivos::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

### Inteiros (Integers)

Move suporta seis tipos de inteiros sem sinal: `u8`, `u16`, `u32`, `u64`, `u128` e `u256`. Os valores desses tipos vão de 0 a um máximo que depende do tamanho do tipo.

|Tipo|Intervalo de valores|
|---|---|
| Inteiro de 8-bits sem sinal, `u8` | 0 a 2<sup>8</sup> -1 |
| Inteiro de 16-bits sem sinal, `u16` | 0 a 2<sup>16</sup> -1 |
| Inteiro de 32-bits sem sinal, `u32` | 0 a 2<sup>32</sup> -1 |
| Inteiro de 64-bits sem sinal, `u64` | 0 a 2<sup>64</sup> -1 |
| Inteiro de 128-bits sem sinal, `u128` | 0 a 2<sup>128</sup> -1 |
| Inteiro de 256-bits sem sinal, `u256` | 0 a 2<sup>256</sup> -1 |

### Valores literais (literals)

Os valores literais para esses tipos são especificados como uma sequência de dígitos (por exemplo, `123`) ou como literais hexadecimais, por exemplo, `0xAA`. O tipo do literal pode ser adicionado opcionalmente como sufixo, por exemplo, `123u8`. Se o tipo não for especificado, o compilador tentará deduzi-lo do contexto em que o literal é usado. Se o tipo não puder ser deduzido, assume-se que é `u64`.

Os literais numéricos podem ser separados por sublinhados para agrupá-los e facilitar a leitura. (por exemplo, `1_234_5678`, `1_000u128`, `0xAB_CD_12_35`).

Se um literal for muito grande para seu intervalo de tamanho especificado (ou inferido), ocorrerá um erro.

### Operações aritméticas

Para todas essas operações, ambos argumentos (os operandos esquerdo e direito) devem ser do mesmo tipo. Se você precisar operar inteiros de tipos diferentes, terá que converter um deles primeiro.

Todas as operações aritméticas abortam em vez de se comportar como não fariam os inteiros matemáticos (por exemplo, overflow, underflow, divisão por zero).

|Sintaxe|Operação|Aborta se...|
|---|---|---|
|+| Soma | O resultado é muito grande para o tipo de dados. |
|-| Subtração | O resultado é menor que `0` |
|*| Multiplicação | O resultado é muito grande para o tipo de dados. |
|/| Divisão | O divisor é `0` |
|%| Módulo | O divisor é `0` |

### Comparações

Os tipos inteiros são os *únicos* tipos em Move que podem usar os operadores de comparação. Ambos argumentos devem ser do mesmo tipo. Se você precisar comparar inteiros de tipos diferentes, terá que converter um deles primeiro.

|Sintaxe|Operação|
|---|---|
|<| Menor que |
|>| Maior que |
|<=| Menor ou igual que |
|>=| Maior ou igual que |

### Igualdades

Ambos argumentos devem ser do mesmo tipo. Se você precisar comparar inteiros de tipos diferentes, terá que converter um deles primeiro.

|Sintaxe|Operação|
|---|---|
|==| Igual|
|!=| Não igual|

### Conversão (Cast)

Os tipos inteiros de um tamanho podem ser convertidos em tipos inteiros de outro tamanho. Os inteiros são os *únicos* tipos do Move que suportam conversão.

As conversões não truncam. A conversão abortará se o resultado for muito grande para o tipo especificado.

|Sintaxe|Operação|Aborta se...|
|---|---|---|
|`(e as T)`| Converte a expressão inteira `e` em um inteiro do tipo `T`| `e` é muito grande para ser representado como `T`|

### Bool

`bool` é o tipo primitivo do Move para valores booleanos verdadeiro e falso. Os literais para bool são `true` ou `false`. `bool` suporta três operações lógicas:

|Sintaxe|Descrição|Expressão equivalente|
|---|---|---|
|`&&`|Comparação lógica **and**.|`p && q` é equivalente a `if (p) q else false`|
|`\|\|`|Comparação lógica **or**.|`p \|\| q` é equivalente a `if (p) true else q`|
|`!`|Negação lógica|`!p` é equivalente a `if (p) false else true`|

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/tipos_primitivos.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

## Desafio

* Declare 1 valor inteiro **constante** com qualquer valor que você queira.
* Declare 1 variável inteira com qualquer valor que você queira.
* Imprima ambos os números.
* Declare uma variável que compare se esses números são iguais.
* Declare uma variável que compare se o 1º número é maior que o segundo.
* Declare uma variável que compare se as 2 comparações anteriores são verdadeiras.
* Imprima o resultado desta última variável.

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer `push` para seu repositório do **Github**.