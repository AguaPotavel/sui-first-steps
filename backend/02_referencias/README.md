# Referências

Move tem dois tipos de referências: imutáveis `&` e mutáveis `&mut`. As referências imutáveis são somente leitura e não podem modificar seu valor (ou qualquer um de seus campos). As referências mutáveis permitem modificações mediante escrita através dessa referência. O sistema de tipos do Move impõe uma disciplina de propriedade `ownership` que evita erros de referência.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/02_referencias
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Referencias
Running Move unit tests
[debug] 1
[debug] 7
[debug] 1
[debug] 1
[debug] 1
[debug] 20
[debug] 20
[ PASS    ] 0x5a6f6e612054726573::referencias::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

### Operadores

Você deve ter notado que nas lições anteriores, para utilizar um valor, como nas funções para imprimir no console, coloca-se um *ampersand* `&` antes das variáveis. Isso é o que chamamos de uma referência. Se removermos esse símbolo, o compilador marca erro, já que esse `scope` não é proprietário dessa variável, ou seja, precisamos dizer ao compilador que a função `print` vai tomar "emprestado" esse valor para poder utilizá-lo.

Move fornece operadores para criar e ampliar referências, assim como para converter uma referência mutável para uma imutável. Utilizaremos a notação `e: T` para "expressão" `e` tem tipo `T`.

|Sintaxe|Tipo|Descrição|
|---|---|---|
|`&e` | `&T` onde `e: T` e `T` é um tipo não referenciado.| Cria uma referência **imutável** de `e`.|
|`&mut e` | `&mut T` onde `e: T` e `T` é um tipo não referenciado.|	Cria uma referência **mutável** de `e`.|
|`&e.f` | `&T` onde `e.f: T` | Cria uma referência **imutável** ao campo `f` do `struct` `e`.|
|`&mut e.f` |	`&mut T` onde `e.f: T` |	Cria uma referência **mutável** ao campo `f` do `struct` `e`.|
| `freeze(e)` |	`&T` onde `e: &mut T` | Converte a referência **mutável** `e` para uma referência **imutável**.

### Lendo e escrevendo através de referências

Tanto as referências mutáveis quanto as imutáveis podem ser lidas para produzir uma cópia do valor referenciado.

Apenas as referências mutáveis podem ser escritas. Uma escrita *x = v descarta o valor armazenado previamente em x e o atualiza com v.

|Sintaxe|Tipo|Descrição|
|---|---|---|
| `*e` | `T` onde `e` é `&T` ou `&mut T` | Lê o valor apontado por `e` |
|`*e1 = e2` | `()` onde `e1: &mut T` e `e2: T` | Atualiza o valor de `e1` com o de `e2` |

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/referencias.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.