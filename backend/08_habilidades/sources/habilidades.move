module suiz3::habilidades {
    // drop
    struct IgnoreMe has drop { a: u8 }
    struct SemDrop { a: u8}

    fun pratica_drop() {
        let sem_drop = SemDrop { a: 1 };
        let _ = IgnoreMe { a: 1 }; // Podemos descartar este valor diretamente. Aqui estamos ignorando na declaração.

        let _valor_nao_usado = IgnoreMe { a: 1 }; // Ou podemos declará-lo e simplesmente não usá-lo. Deixamos o _ apenas para evitar que o compilador envie warnings.
    
        let SemDrop { a: _ } = sem_drop; // Este valor precisamos pelo menos desestruturá-lo para que o compilador o considere como usado.
    }

    // copy
    struct Copiavel has copy {}

    fun pratica_copy() {
        let a = Copiavel {}; // Instanciamos a estrutura copiável
        let b = a; // `a` é copiado para `b`
        let c = *&b; // cópia explícita usando desreferenciamento

        // Se parássemos aqui, daria erro, já que as variáveis acima não têm `drop`
        // Por isso precisamos usá-las, neste caso com desestruturação:
        let Copiavel {} = a;
        let Copiavel {} = b;
        let Copiavel {} = c;
    }

    // copy & drop
    struct Valor has copy, drop {}

    fun pratica_copy_drop() {
        let _a = Valor {}; // Podemos parar aqui sem fazer uso desta variável, já que tem a habilidade `drop`.
        let b = 1; // Lembre-se de que alguns tipos primitivos também têm essas habilidades.
        let _c = &b; // E também as referências enquanto seu valor referenciado também as tenha.
    }

    // key
    struct Objeto has key {}

    fun pratica_key() {
        let objeto = Objeto {}; // Por enquanto, validamos que um struct pode ter a habilidade key.
        let Objeto {} = objeto; // Não tem drop, por isso temos que consumi-lo.
    }

    // key & store
    struct Armazenavel has store {}
    struct Conteiner has key, store {
        armazena: Armazenavel,
    }

    fun pratica_key_store() {
        let armazenavel = Armazenavel {}; // Estrutura com a habilidade `store`
        let conteiner = Conteiner { // E a guardamos.
            armazena: armazenavel, // Para poder guardá-la aqui, precisamos que a variável acima tenha `store`.
        }; // Esta estrutura podemos armazenar e usar de chave ao mesmo tempo. Mas como?? Onde??

        let Conteiner { armazena } = conteiner;
        let Armazenavel {} = armazena; // Não têm `drop`, então temos que consumi-las.
        // Claro que isso se resolveria adicionando `drop`, mas é útil saber a sintaxe de desestruturação.
        
        // key e store farão mais sentido nas próximas lições. Por agora, analise as sintaxes e entenda quais são as habilidades que existem em Move.
    }


    #[test]
    fun teste() {
        pratica_drop();
        pratica_copy();
        pratica_copy_drop();
        pratica_key();
        pratica_key_store();
    }
}
