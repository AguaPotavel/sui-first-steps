# Variáveis

### Locais
As variáveis locais em Move têm um `scope` léxico (estático). Novas variáveis são introduzidas com a palavra-chave `let`, que fará `shadow` a qualquer local anterior com o mesmo nome. As variáveis locais são **mutáveis** e podem ser atualizadas tanto diretamente quanto através de uma referência mutável.


### Constantes
As constantes são uma forma de dar um nome a valores estáticos compartilhados dentro de um `module` ou `script`.

A constante deve ser conhecida no momento da compilação. O valor da constante é armazenado no `module` ou `script` compilado. E cada vez que a constante é utilizada, uma nova cópia desse valor é feita.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/01_variaveis
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Variables
Running Move unit tests
[debug] "Hola, Mundo!"
[debug] true
[debug] 1
[debug] 2
[debug] "Sui"
[debug] 0
[debug] 1
[debug] 100
[debug] 10
[debug] 15
[debug] false
[ PASS    ] 0x5a6f6e612054726573::variables::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/variaveis.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

Os temas são:
* Constantes
* Declarando variáveis
* Nomeando variáveis
* Anotações de tipo
* Declaração múltipla
* Reatribuição
* Escopo
* Shadowing