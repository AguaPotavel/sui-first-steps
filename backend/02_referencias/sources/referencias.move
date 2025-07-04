module suiz3::referencias {
    use std::debug::print;

    fun pratica() {
        // Tipo não referenciado:
        let a = 1;
        print(&a); // Para imprimir um tipo não referenciado precisamos adicionar a referência ao valor.

        // Tipo referenciado:
        let b = 7;
        let c : &u64 = &b;
        print(c); // Já que c foi declarado como tipo referenciado, não é necessário especificar a referência.
    
        // Imutável
        let original: u64 = 1;
        let copia_do_original = original; // Note que não estamos passando a referência aqui.
        print(&copia_do_original); // Mas aqui sim.

        let outra_copia = &original;
        print(outra_copia);

        // Mutável
        let copia_mutavel = &mut original; 
        print(copia_mutavel); // Novamente, não é necessário passar a referência.

        *copia_mutavel = 20;
        print(copia_mutavel);
        print(&original); // Por que agora o original é 20 se o que modificamos foi a cópia mutável? 
    }

    #[test]
    fun teste() {
        pratica();
    }
}
