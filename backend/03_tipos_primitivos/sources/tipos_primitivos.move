module suiz3::tipos_primitivos {
    use std::debug::print;

    fun pratica() {
        // Inteiros (Integers)
        let a = 1; // Quando o tipo de dados não é especificado, o compilador assume u64.
        print(&a); // Resultado: [debug] 1

        let b: u8 = 2; // Você pode especificar o dado ao declarar a variável.
        print(&b); // Resultado: [debug] 2

        let c = 3u16; // Ou você pode declarar o valor usando literais.
        print(&c); // Resultado: [debug] 3

        let d = 1_123_456; // Você pode usar sublinhado _ para separar números longos para melhorar a leitura dos mesmos.
        print(&d); // Resultado: [debug] 1123456

        let e: u32 = 0xCAFE; // Também pode escrever literais em hexadecimal.
        print(&e); // Resultado: [debug] 51966

        let f = 0xBE_BE_FE_00; // E separá-los usando sublinhado.
        print(&f); // Resultado: [debug] 3200187904

        // Operações
        let numero_1 = 2;
        let numero_2 = 4;
        let _soma = numero_1 + numero_2; // 6
        let _subtracao = numero_2 - numero_1; // 2
        let _multiplicacao = numero_1 * numero_2; // 8
        let _divisao = numero_2 / numero_1; // 2
        let _modulo = numero_2 % numero_1; // 0

        // Lembre-se que os tipos de ambas variáveis devem ser iguais.
        let numero_3: u8 = 1;
        let numero_4: u8 = 4;
        let _outra_soma = numero_3 + numero_4; //5

        // Comparações e igualdades
        let menor_que = numero_3 < numero_4; // true
        let _menor_ou_igual = numero_3 <= numero_4; // true
        let _maior_que = numero_3 > numero_4; // false
        let _maior_ou_igual = numero_3 >= numero_4; // false
        let _igual = numero_3 == numero_4; // false
        let _nao_igual = numero_3 != numero_4; // true
        print(&menor_que); // Resultado: [debug] true. Lembre-se que o resultado de uma comparação retorna um bool.

        // Conversão (Cast)
        let um_u8: u8 = 100;
        let _converte_para_u16 = (um_u8 as u16);

        // Bool
        let and = true && false; // Precisa que ambos valores sejam verdadeiros.
        print(&and); // Resultado: [debug] false

        let or = true || false; // Precisa que qualquer um dos valores seja verdadeiro.
        print(&or); // Resultado: [debug] true
        
        let negacao = !true; // Inverte o valor.
        print(&negacao); // Resultado: [debug] false

        
    }

    #[test]
    fun teste() {
        pratica();
    }
}
