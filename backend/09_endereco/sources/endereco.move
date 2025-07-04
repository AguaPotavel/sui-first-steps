// Desta vez usaremos o endereço explícito em vez do nomeado.
module 0x5A6F6E612054726573::address { // Não está dentro de uma expressão, por isso não é necessário @

    use std::debug::print; // Quando importamos usando use na verdade std é um endereço nomeado
    use 0x1::signer::Self; // 0x1 é o endereço ao qual std faz referência

    fun pratica_address() {
        let a1: address = @0x1; // versão curta de 0x00000000000000000000000000000001
        print(&a1); // Resultado: [debug] @0x1
        let a2: address = @0xBEBE; // versão curta de 0x0000000000000000000000000000BEBE
        print(&a2); // Resultado: [debug] @0xbebe
        let a3: address = @66;
        print(&a3); // Resultado: [debug] @0x42
    }

    fun pratica_signer(conta: signer) {
        print(&conta); // Resultado: [debug] signer(@0xaaaa)
        
        // Operações
        let s = signer::address_of(&conta); // Podemos usá-la para converter um signer em um address
        print(&s); // Resultado: [debug] @0xaaaa

        let s = signer::borrow_address(&conta); // Ou para criar uma referência a um address
        print(s); // Resultado: [debug] @0xaaaa
    }

    #[test(conta = @0xAAAA)] // Para testes. Passamos uma variável que servirá como a conta assinando transações
    fun teste(conta: signer) {
        pratica_address();
        pratica_signer(conta); // Lembre-se de passá-la como parâmetro!
    }
}
