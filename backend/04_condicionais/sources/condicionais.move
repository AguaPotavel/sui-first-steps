module suiz3::condicionales {
    use std::debug::print;
    use std::string::utf8;

    const ESemAcesso: u64 = 1; // Usualmente as constantes para indicar um erro iniciam com E maiúscula, seguido da razão do erro.
    const NAO_HA_ACESSO: u64 = 2; // Embora não seja necessário, apenas seja descritivo em seus erros.

    fun pratica() {
        // If
        let a = 10;
        if (a > 0) { // A avaliação da condição dentro do if tem que dar um resultado booleano.
            print(&utf8(b"a es mayor a 0")); // A operação depois da avaliação pode ser quase qualquer coisa.
        }; // Fechamos bloco.
        // Resultado: [debug] "a es mayor a 0"

        // Else
        if (a > 20) {
            print(&utf8(b"a es mayor a 20"));
        } else { // Não fechamos bloco.
            print(&utf8(b"a no es mayor a 20"));
        }; // Até aqui se fecha.
        // Resultado: [debug] "a no es mayor a 20"

        // Se a expressão dá um resultado, é possível armazená-la em uma variável
        let armazenada = if (a < 100) a else 100;
        print(&armazenada); // Resultado: [debug] 10

        // Abort
        let acesso_usuario: bool = true; // Neste cenário, nosso usuário tem acesso a todas as funções.
        // Normalmente você teria que avaliar isso dependendo do seu módulo.
        if(!acesso_usuario) { // Tente remover a negação e execute novamente.
            abort(1) // O código é retornado ao usuário se a execução abortar.
        } else {
            print(&utf8(b"Usuario tiene acceso."));
        };

        // Assert
        assert!(acesso_usuario, 1); // Outra forma de escrever a expressão anterior sem necessidade de retornar algo.
        // Tente negar o acesso usando !

        // Códigos de erro
        assert!(acesso_usuario, ESemAcesso); // É boa prática especificar a razão de um abort/assert.
        assert!(acesso_usuario, NAO_HA_ACESSO);
    }

    #[test]
    fun teste() {
        pratica();
    }
}
