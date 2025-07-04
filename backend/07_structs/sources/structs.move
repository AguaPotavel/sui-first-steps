module suiz3::cadenas {
    use std::debug::print;
    use std::string_utils::debug_string;
    use std::string::{String,utf8};
    use std::option::{Option, some};

    // Faça uma nota mental de `has drop`. Veremos isso mais adiante. Por enquanto não é necessário que entenda.
    struct Autor has drop { // Declaramos um struct. É um tipo personalizado que podemos usar no resto do nosso código.
        nome: String, // Este tipo só tem um campo.
    }

    struct Livro { // Agora criamos um tipo com mais campos.
        titulo: String,
        autor: Autor, // Note que usamos o tipo que declaramos acima.
        publicado: u16,
        tem_audiolivro: bool,
        edicao: Option<u16>, // O que é isso?
    } // Note que não fechamos com ;

    fun pratica() {
        
        let autor = Autor { nome: utf8(b"Paulo Cohelo") };
        print(&debug_string(&autor)); // Note que usamos debug_string da lição anterior para imprimir o struct completo.
        // Resultado:
        // [debug] "0x5a6f6e612054726573::cadenas::Autor {
        //   nome: \"Paulo Cohelo\"
        // }"

        let livro = Livro {
            titulo: utf8(b"El Alquimista"), // Usamos , similar a quando declaramos um objeto em outras linguagens.
            autor, // Como a variável que declaramos acima tem o mesmo nome que a propriedade, não é necessário colocar algo como autor: autor,
            publicado: 1988u16, // Lembre-se de que podemos especificar o tipo do número literalmente
            tem_audiolivro: true,
            edicao: some(1), // Ou deixar que o compilador o infira
        }; // Temos que fechar o bloco aqui.

        print(&debug_string(&livro)); // Note a impressão do campo Autor.
        //[debug] "0x5a6f6e612054726573::cadenas::Livro {
        //  titulo: \"El Alquimista\",
        //  autor: 0x5a6f6e612054726573::cadenas::Autor {
        //    nome: \"Paulo Cohelo\"
        //  },
        //  publicado: 1988,
        //  tem_audiolivro: true,
        //  edicao: Some(1)
        //}"

        // Podemos acessar valores específicos da estrutura.
        print(&livro.titulo); 
        print(&livro.autor.nome);

        // Também podemos desestruturar um struct.
        let Livro { titulo: _, autor: _ , publicado, tem_audiolivro, edicao:_ } = livro; 
        // Basicamente pegamos um struct e o decompomos em variáveis, para que possam ser usadas depois, por exemplo:
        print(&publicado); // Resultado: [debug] 1988
        print(&tem_audiolivro); // Resultado: [debug] true

        // Note que estamos ignorando certos valores desta forma: titulo: _, para que não se criem variáveis para eles.
        // O que significa que este código falharia: print(&titulo);
        // Já que não criamos uma variável para esse valor, simplesmente o ignoramos.

        let autor = Autor { nome: utf8(b"J. K. Rowling") }; // Shadowing da variável autor.
        let Autor { nome: outro_nome } = autor; // Ao desestruturar você pode alterar o nome da variável.
        print(&outro_nome); // Resultado: [debug] "J. K. Rowling"

        let Autor { nome } = Autor { nome: utf8(b"John Green") }; // Podemos até mesmo atribuir valores e desestruturá-los ao mesmo tempo:
        print(&nome); // Resultado: [debug] "John Green"

        // Ou criar novas referências:
        let autor = Autor { nome: utf8(b"Octavio Paz") };
        let Autor { nome } = &autor; // Referência imutável
        print(nome); // Agora nome é um tipo referenciado. Resultado: [debug] "Octavio Paz"

        let autor = Autor { nome: utf8(b"Carlos Fuentes") };
        let Autor { nome } = &mut autor; // Criamos uma referência mutável
        print(nome); // Resultado: [debug] "Carlos Fuentes"
        *nome = utf8(b"Edgar Allan Poe"); // Como é mutável podemos modificar o valor
        print(nome); // Resultado: [debug] "Edgar Allan Poe"

        // Referências
        let autor = Autor { nome: utf8(b"George Orwell") };
        let autor_ref = &autor;

        let leitura = autor_ref.nome; // Podemos ler um valor através da referência.
        print(&leitura); // Resultado: [debug] "George Orwell"

        let modificavel = &mut autor.nome;
        *modificavel = utf8(b"Charles Dickens"); // E podemos modificá-la
        print(modificavel); // Resultado: [debug] "Charles Dickens"
        print(&debug_string(&autor)); // Estamos fazendo uma referência ao valor diretamente, por isso:
        // Resultado:
        // [debug] "0x5a6f6e612054726573::cadenas::Autor {
        //   nome: \"Charles Dickens\"
        // }"

        // Lembre-se de que você pode obter informações sobre as outras operações em:
        // https://move-language.github.io/move/structs-and-resources.html
    }

    #[test]
    fun teste() {
        pratica();
    }
}
