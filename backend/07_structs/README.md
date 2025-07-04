# Structs

Os tipos definidos pelo usuário podem se adaptar às necessidades específicas da aplicação. Não apenas no nível de dados, mas também em seu comportamento. Nesta seção apresentamos a definição de `struct` e como utilizá-la.

Um `struct` é uma estrutura de dados definida pelo usuário que contém campos tipados. Os `struct` podem armazenar qualquer tipo não referenciado, incluindo outros structs.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/07_structs
>```

Digite em seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Structs
Running Move unit tests
[debug] "0x5a6f6e612054726573::cadenas::Autor {
  nombre: \"Paulo Cohelo\"
}"
[debug] "0x5a6f6e612054726573::cadenas::Libro {
  titulo: \"El Alquimista\",
  autor: 0x5a6f6e612054726573::cadenas::Autor {
    nombre: \"Paulo Cohelo\"
  },
  publicado: 1988,
  tiene_audiolibro: true,
  edicion: Some(1)
}"
[debug] "El Alquimista"
[debug] "Paulo Cohelo"
[debug] 1988
[debug] true
[debug] "J. K. Rowling"
[debug] "John Green"
[debug] "Octavio Paz"
[debug] "Carlos Fuentes"
[debug] "Edgar Allan Poe"
[debug] "George Orwell"
[debug] "Charles Dickens"
[debug] "0x5a6f6e612054726573::cadenas::Autor {
  nombre: \"Charles Dickens\"
}"
[ PASS    ] 0x5a6f6e612054726573::cadenas::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
{
  "Result": "Success"
}
```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/structs.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos temas abordados.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre os `struct` e seus métodos na [documentação](https://move-language.github.io/move/structs-and-resources.html) oficial da linguagem Move.

## Desafio

* Crie um `struct` de uma Pessoa com os campos que você desejar. Pelo menos 3. 
    * Por exemplo: `nome`, `idade`.
* Crie um `struct` de uma Aula (uma aula de uma escola) com os campos que você desejar.
    * Por exemplo: `materia`, `horario`.
    * Deve incluir o `struct` Pessoa em algum dos campos. Por exemplo em um campo chamado Professor.
* Crie um `struct` de uma Escola com os campos que você desejar.
    * Por exemplo `nome`, `endereco`.
    * Deve incluir um `vector` de Aulas.
* Use esses `struct` de maneira que você tenha uma Escola com um `vector` de Aulas, que inclua pelo menos 2 aulas de 2 professores diferentes.
* Imprima a variável que você criar da Escola no console usando `debug_string`. Deve imprimir todos os campos.

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer `push` para seu repositório do **Github**.