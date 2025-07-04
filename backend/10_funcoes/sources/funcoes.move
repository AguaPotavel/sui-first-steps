address suiz3 { // Agora usamos uma nova sintaxe, já que vamos ter diferentes módulos dentro do mesmo address.
    module funciones1 {
        use std::debug::print;
        use std::string::utf8;

        fun retorno(): u64 { // As funções podem retornar algo, até agora a maioria das funções que usamos não retornava nada.
            let a = 0u64;
            a // Para retornar algo, precisa ser a última linha na expressão. Omitimos o ;
            // Isto é um retorno implícito
        }

        fun retorno_condicional(a: u64): bool { // As funções podem incluir no nome: a a z, A a Z, _, dígitos de 0 a 9.
            // O nome de uma função não pode ter _ no início, mas sim depois do primeiro caractere.
            if (a > 0) {
                true
            } else {
                false
            } // Normalmente fecharíamos aqui, mas como o resultado do if vamos retornar, não fechamos
        }

        public fun funcao_publica() { // Podemos declarar funções públicas para serem chamadas de outros módulos
            print(&utf8(b"Hola desde funciones1!"));
        }

        #[test]
        fun teste() {
            retorno();
            let a = retorno_condicional(0); // É importante notar que se vamos retornar algo precisa ser consumido. A menos que tenha a habilidade drop
            print(&a); // Resultado: [debug] false
        }
    }

    module funciones2 { // Novo módulo!
        use suiz3::funciones1::{Self, funcao_publica}; // Usaremos este import para demonstrar as diferentes maneiras de importar um módulo.

        fun chamada_externa() {
            // Podemos fazer chamada a funções públicas:
            suiz3::funciones1::funcao_publica(); // Esta forma de chamá-la é quando não importamos a função com use
            funciones1::funcao_publica(); // Esta forma é quando importamos Self
            funcao_publica(); // E por último esta é quando importamos a função diretamente.
            // As 3 chamadas são equivalentes, qual utilizar depende do seu caso de uso.
        }

        #[test]
        fun teste() {
            chamada_externa(); // Resultado: [debug] "Hola desde funciones1!"
        }
    }

    module funciones3 {
        use std::debug::print;

        fun parametros(a: u64, b: u64) { // As funções podem receber parâmetros, cada um separado por uma vírgula e especificando o tipo esperado.
            print(&a); // Resultado: [debug] 1
            print(&b); // Resultado: [debug] 2
        }

        fun retorno_multiplo(): (vector<u8>, u64) { // As funções podem ter múltiplos retornos. É necessário colocá-los entre parênteses.
            (b"Sui", 0) // O mesmo ao retorná-los
        }

        fun retorno_explicito(): u8 { // Como vimos acima, podemos omitir a palavra return se nosso código avalia para um valor final
            return 100 // Ainda assim, também podemos usar return se for necessário. Note que também se omite ;
        }

        #[test_only] // Podemos importar módulos que serão usados apenas nos testes com test_only
        use std::string::utf8; // Por exemplo, este import só o usaremos abaixo para imprimir o valor recebido, mas acima não precisamos dele.

        #[test]
        fun teste() {
            let a = 1u64; // Os parâmetros têm que ser do tipo esperado pela função.
            parametros(a, 2); // Ao enviar parâmetros, lembre-se de separá-los com ,

            let (nome, numero) = retorno_multiplo(); // Ao receber uma função com retorno múltiplo, atribuímos novas variáveis para guardar cada valor.
            print(&utf8(nome)); // Resultado: [debug] "Sui"
            print(&numero); // Resultado: [debug] 0

            let retorno_explicito = retorno_explicito(); // Havia mencionado que as funções e variáveis podem ter o mesmo nome?
            print(&retorno_explicito); // Resultado: [debug] 100
        }
    }

    module funciones4 {
        public entry fun funcao_entry() { // O modificador entry é essencialmente o que seria o modificador main em outras linguagens
            suiz3::funciones1::funcao_publica(); // São funções que permitem que sejam chamadas de maneira segura e invocadas diretamente.

            // Não é um modificador restritivo. Essas funções podem continuar sendo chamadas por outras funções dentro do módulo.
            // As funções entry são as funções que vamos poder chamar do terminal no momento de subir o código para a blockchain.
            // As funções entry NÃO podem retornar um valor.
        }

        #[view] // Por último, podemos ter funções de leitura, são atribuídas com #view.
        public fun funcao_leitura(): u16 { // Essas funções também podem ser chamadas do terminal.
            200 // As funções view devem retornar um valor
            // Dentro deste contexto não fazem muito sentido, mas as abordaremos na próxima lição.
        }

        #[test_only]
        use std::debug::print;

        #[test]
        fun teste() {
            funcao_entry(); // Resultado: [debug] "Hola desde funciones1!"
            let a = funcao_leitura();
            print(&a); // Resultado: [debug] 200
        }

        // Lembre-se de que você pode ver mais informações sobre as funções e suas declarações na documentação oficial da linguagem Move:
        // https://move-language.github.io/move/functions.html
    }
}
