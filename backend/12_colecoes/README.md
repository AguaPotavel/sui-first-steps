# Coleções

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/12_colecoes
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Colecciones
Running Move unit tests
[debug] 30
[debug] 31
[debug] 32
[debug] false
[ PASS    ] 0x5a6f6e612054726573::tabla::teste
[debug] 0x5a6f6e612054726573::mapa_simple::Livro {
  titulo: "O Alquimista",
  autor: "Paulo Coelho",
  publicado: 1988
}
[debug] 0x5a6f6e612054726573::mapa_simple::Livro {
  titulo: "O Alquimista",
  autor: "Paulo Coelho",
  publicado: 1988
}
[debug] "[ 123, 425 ]"
[debug] "[
  0x5a6f6e612054726573::mapa_simple::Livro {
    titulo: \"O Alquimista\",
    autor: \"Paulo Coelho\",
    publicado: 1988
  },
  0x5a6f6e612054726573::mapa_simple::Livro {
    titulo: \"Carrie\",
    autor: \"Stephen King\",
    publicado: 1974
  }
]"
[debug] "[ 123, 425 ]"
[debug] "[
  0x5a6f6e612054726573::mapa_simple::Livro {
    titulo: \"O Alquimista\",
    autor: \"Paulo Coelho\",
    publicado: 1988
  },
  0x5a6f6e612054726573::mapa_simple::Livro {
    titulo: \"Carrie\",
    autor: \"Stephen King\",
    publicado: 1974
  }
]"
[debug] "Some(425)"
[debug] "Some(0x5a6f6e612054726573::mapa_simple::Livro {
  titulo: \"Carrie\",
  autor: \"Stephen King\",
  publicado: 1974
})"
[ PASS    ] 0x5a6f6e612054726573::mapa_simple::teste
Test result: OK. Total tests: 2; passed: 2; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/colecoes.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre as coleções e seus métodos na [documentação](https://github.com/sui-labs/sui-core/tree/main/sui-move/framework/sui-stdlib/doc) oficial do Sui Core.