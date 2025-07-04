module suiz3::vectores {
    use std::debug::print;
    use std::vector::{empty, length, borrow, borrow_mut, push_back}; // Apenas para criar um vetor não é necessário importar a biblioteca.
    // Mas as operações dos vetores (como push, pop_back) precisam que você a importe.

    fun pratica() {
        // Vetores
        let _vazio: vector<u64> = vector[]; // Um vetor vazio.
        let _vazio2 = empty<u32>(); // Outra forma de criar um vetor vazio.
        let _v1: vector<u8> = vector[10, 20, 30]; // Um vetor de u8 inicializado com 3 elementos.
        let _v2: vector<vector<u16>> = vector[
            vector[10, 20],
            vector[30, 40]
        ]; // Um vetor de vetores u16 inicializado com 2 elementos, cada um com 2 elementos.

        // Operações
        let v3: vector<u8> = vector[1, 2, 3];

        let elemento = *borrow(&v3, 0); // Obtendo o primeiro elemento do vetor.
        print(&elemento); // Resultado: [debug] 1

        let comprimento = length(&v3); // Obtendo o comprimento do vetor.
        print(&comprimento); // Resultado: [debug] 3

        *borrow_mut(&mut v3, 1) = 55; // Substituindo um valor no vetor.
        print(borrow(&v3, 1)); // Resultado: [debug] 55

        push_back(&mut v3, 40); // Adicionando um elemento ao final do vetor.
        print(borrow(&v3, 3)); // Resultado: [debug] 40

        // Lembre-se de que você pode obter informações sobre as outras operações em:
        // https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/vector.md
    }

    #[test]
    fun teste() {
        pratica();
    }
}
