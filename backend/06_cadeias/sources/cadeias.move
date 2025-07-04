module suiz3::cadenas {
    use std::debug::print;
    use std::string::{utf8, is_empty, append, append_utf8, insert};
    use sui_std::string_utils::{to_string, debug_string};

    fun pratica() {
        // Strings
        
        // Bytes
        let string_bytes = b"Hello World!";
        print(&string_bytes); // Resultado: [debug] 0x48656c6c6f20576f726c6421
        print(&utf8(string_bytes)); // Resultado: [debug] "Hello World!"
        
        // Hex
        let string_hexadecimal = x"48656C6C6F20576F726C6421";
        print(&string_hexadecimal); // Resultado: [debug] 0x48656c6c6f20576f726c6421 Nota alguma similitude?
        print(&utf8(string_hexadecimal)); // Resultado: [debug] "Hello World!"

        // Operações
        let string_vazia = b"";
        let validacao = is_empty(&utf8(string_vazia)); // Validando se a string está vazia
        print(&validacao); // Resultado: [debug] true

        let string_utf8 = utf8(string_vazia);
        append_utf8(&mut string_utf8, b"Hola"); // Concatenando 2 strings utf8. Note que passamos uma referência mutável.
        print(&string_utf8); // Resultado: [debug] "Hola"

        let outra_string = utf8(b"Adios");
        append(&mut string_utf8, outra_string); // Concatenando 2 strings.
        print(&string_utf8); // Resultado: [debug] "HolaAdios"

        let hex_para_utf8 = utf8(string_hexadecimal);
        append(&mut string_utf8, hex_para_utf8); // Lembre-se de que você pode usar tanto bytes quanto hex.
        print(&string_utf8); // Resultado: [debug] "HolaAdiosHello World!"

        let intruso = utf8(b"INSERTAME");
        insert(&mut string_utf8, 4, intruso); // Inserindo uma string.
        print(&string_utf8); // Resultado: [debug] "HolaINSERTAMEAdiosHello World!"

        let escape = utf8(b"\nEsto se imprimira en una nueva linea.");
        append(&mut string_utf8, escape);
        print(&string_utf8); // Resultado: [debug] "HolaINSERTAMEAdiosHello World!
                                              //            Esto se imprimira en una nueva linea."

        // String utils
        let numero = 100u16; // Podemos converter variáveis para strings.
        print(&to_string<u16>(&numero)); // Resultado: [debug] "100" Note que é impresso como string, e não como número.

        let v: vector<u16> = vector[10, 20, 30]; // Também podemos converter coisas mais complexas
        print(&debug_string(&v)); // Resultado: [debug] "[ 10, 20, 30 ]" Nota: Não funciona com u8.

        // Lembre-se de que você pode obter informações sobre as outras operações em:
        // https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/string.md
        // https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/sui-stdlib/doc/string_utils.md
    }

    #[test]
    fun teste() {
        pratica();
    }
}
