# Funções

As funções são os componentes básicos dos programas Move. São chamadas a partir de transações de usuário e de outras funções e agrupam código executável em unidades reutilizáveis. As funções podem receber argumentos e retornar um valor. São declaradas com a palavra-chave `fun` no nível do módulo. Como qualquer outro membro de um módulo, por padrão são privadas e só podem ser acessadas de dentro do próprio módulo. No entanto, é possível alterar esse comportamento com modificadores de visibilidade.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/10_funcoes
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter algo similar a isto:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Funciones
Running Move unit tests
[debug] 1
[debug] 2
[debug] "Hola desde funciones1!"
[debug] false
[debug] "Sui"
[debug] 0
[debug] 100
[debug] "Hola desde funciones1!"
[debug] "Hola desde funciones1!"
[debug] "Hola desde funciones1!"
[ PASS    ] 0x5a6f6e612054726573::funciones1::teste
[ PASS    ] 0x5a6f6e612054726573::funciones4::teste
[ PASS    ] 0x5a6f6e612054726573::funciones3::teste
[ PASS    ] 0x5a6f6e612054726573::funciones2::teste
Test result: OK. Total tests: 4; passed: 4; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/funcoes.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre as funções na [documentação](https://move-book.com/move-basics/function.html) oficial da linguagem Move.

## Desafio

Simplesmente leia a documentação e certifique-se de entendê-la. A partir de agora a maioria dos tutoriais contará com múltiplas funções.