address suiz3 {
    module tabla {
        use std::debug::print;
        use sui_std::table::{Self, Table};
        use std::string::{String,utf8};
        use std::signer::address_of;

        struct Tabela has key { // Dado que utilizaremos este struct com operações do global_storage, precisa ter a habilidade key
            tabela: Table<String, u8> // Declaramos tipo
        }

        fun pratica(conta: &signer) acquires Tabela {
            // Inicializando
            let tabela = table::new<String, u8>(); // Declaração de uma nova tabela
            move_to(conta, Tabela { tabela }); // Movendo o recurso
            
            // Adicionando elementos
            let tabela_mutavel = borrow_global_mut<Tabela>(address_of(conta)); // Obtemos referência mutável
            table::add(&mut tabela_mutavel.tabela, utf8(b"Juanito"), 30u8);
            table::add(&mut tabela_mutavel.tabela, utf8(b"Rosarito"), 25u8);

            // Obtendo um valor
            let juanito = table::borrow(&mut tabela_mutavel.tabela, utf8(b"Juanito"));
            print(juanito);

            // Atualizando um valor
            // Upsert insere o valor se não existe, ou o atualiza se existe.
            table::upsert(&mut tabela_mutavel.tabela, utf8(b"Juanito"), 31u8);
            print(table::borrow(&mut tabela_mutavel.tabela, utf8(b"Juanito")));

            // Ou podemos fazer borrow do próprio valor
            let juanito = table::borrow_mut(&mut tabela_mutavel.tabela, utf8(b"Juanito"));
            *juanito = 32;
            print(table::borrow(&mut tabela_mutavel.tabela, utf8(b"Juanito")));

            // Eliminando um valor
            table::remove(&mut tabela_mutavel.tabela, utf8(b"Juanito"));

            // Contém
            let contem = table::contains(&mut tabela_mutavel.tabela, utf8(b"Juanito"));
            print(&contem);

            // Você pode revisar as demais operações de table na documentação oficial:
            // https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/sui-stdlib/doc/table.md#0x1_table_add_box
        }

        #[test(conta = @0xBEBE)]
        fun teste(conta: signer) acquires Tabela {
            pratica(&conta);
        }
    }

    module mapa_simple {
        use std::debug::print;
        use std::string_utils::debug_string;
        use std::simple_map::{Self, SimpleMap};
        use std::string::{String, utf8};
        use std::signer::address_of;
        use std::option::Self;

        struct MapaSimples has key {
            mapa: SimpleMap<u16, Livro> // Declaramos tipo
        }

        struct Livro has store, copy, drop {
            titulo: String,
            autor: String,
            publicado: u16,
        }

        fun pratica(conta: &signer) acquires MapaSimples {
            // Inicializando
            let mapa_novo = simple_map::new<u16, Livro>();
            move_to(conta, MapaSimples { mapa: mapa_novo });

            // Adicionando registros
            let mapa = borrow_global_mut<MapaSimples>(address_of(conta)).mapa;
            let livro1 = Livro { titulo: utf8(b"O Alquimista"), autor: utf8(b"Paulo Coelho"), publicado: 1988u16 };
            let livro2 = Livro { titulo: utf8(b"Carrie"), autor: utf8(b"Stephen King"), publicado: 1974u16 };
            simple_map::add(&mut mapa, 123, livro1);
            simple_map::add(&mut mapa, 425, livro2);

            // Obter um valor
            let livro = simple_map::borrow(&mapa, &123u16);
            print(livro);

            // Modificar um valor
            let livro = simple_map::borrow_mut(&mut mapa, &123u16);
            livro.titulo = utf8(b"O Alquimista");
            print(livro);

            // Obter todas as chaves
            let chaves = simple_map::keys(&mapa);
            print(&debug_string(&chaves));

            // Obter todos os valores
            let valores = simple_map::values(&mapa);
            print(&debug_string(&valores));

            // Obter chaves + valores
            let (keys, vals) = simple_map::to_vec_pair(mapa);
            print(&debug_string(&keys));
            print(&debug_string(&vals));

            // Inserir ou atualizar um valor
            let livro3 = Livro { titulo: utf8(b"It"), autor: utf8(b"Stephen King"), publicado: 1974u16 };
            let (upsert1, upsert2) = simple_map::upsert(&mut mapa, 425, livro3);
            print(&debug_string(&upsert1));
            print(&debug_string(&upsert2));

            // Você pode revisar as demais operações de simple_map na documentação oficial:
            // https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/sui-stdlib/doc/simple_map.md#0x1_simple_map_add
        }

        #[test(conta = @0xBEBE)]
        fun teste(conta: signer) acquires MapaSimples {
           pratica(&conta);
        }
    }
}
