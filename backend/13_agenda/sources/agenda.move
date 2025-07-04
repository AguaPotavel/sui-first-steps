/// Módulo de uma agenda simples utilizado como exemplo no programa de certificação Sui Developer Backend Expert.
/// As funções são:
/// * Cria recursos de Agenda na conta do assinante
/// * Adiciona Registros na Agenda publicada na conta do assinante
/// * Elimina e modifica tais Registros
module cuenta::agenda {
    use sui_std::table::{Self, Table};
    use std::string::String;
    use std::option::{Self, Option, is_some};
    use std::signer::address_of;

    /// Agenda já inicializada. Cada conta pode ter apenas 1 recurso deste tipo.
    const JA_INICIALIZADO: u64 = 1;
    /// Ainda não foi inicializada a Agenda.
    const NAO_INICIALIZADO: u64 = 2;
    /// O Registro procurado não foi encontrado com o Nome fornecido.
    const REGISTRO_NAO_EXISTE: u64 = 3;
    /// O nome que se está tentando usar já existe
    const REGISTRO_JA_EXISTE: u64 = 4;
    /// Não foram fornecidos valores a modificar.
    const NADA_A_MODIFICAR: u64 = 5;
    

    /// Estrutura para usar como chave na coleção. Não é totalmente necessária e poderia ser substituída por uma String,
    struct Nome has copy, drop {
        nome: String,
    }

    /// Estrutura que guarda os dados que queremos armazenar dos nossos contatos. Você pode adicionar mais se desejar.
    struct Registro has store, copy, drop { // Precisa da habilidade store para poder ser armazenada na coleção.
        telefone: u64,
        discord: String,
        email: String,
        endereco: address,
    }

    /// Estrutura que armazenará todos os registros da conta.
    struct Agenda has key { // Precisa da habilidade key para poder ser usada em operações com o armazenamento global.
        registros: Table<Nome, Registro> // Vamos usar Nome como chave, e Registro como a estrutura a armazenar.
    }

    /// Funções
    /// Cria uma nova Agenda se não existe e a armazena na conta do assinante
    public entry fun inicializar(conta: &signer) {
        assert!(!exists<Agenda>(address_of(conta)), JA_INICIALIZADO); // No caso de que JÁ exista a Agenda, abortamos o processo.
        move_to(conta, Agenda {
            registros: table::new<Nome, Registro>(),
        })
    }

    /// Adiciona um registro a uma Agenda existente.
    public entry fun adicionar_registro(
        conta: &signer, 
        nome: String, 
        telefone: u64, 
        discord: String, 
        email: String, 
        endereco: address,
    ) acquires Agenda {
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO); // Precisamos que a função de inicializar tenha sido executada primeiro.

        let registros = borrow_global_mut<Agenda>(address_of(conta));
        assert!(!table::contains(&registros.registros, Nome { nome }), REGISTRO_JA_EXISTE);

        table::add(&mut registros.registros, Nome {
            nome,
        }, Registro {
            telefone,
            discord,
            email,
            endereco
        });
    }

    #[view]
    /// Obtém o Registro relacionado com o Nome dado.
    public fun obter_registro(conta: address, nome: String): Registro acquires Agenda {
        assert!(exists<Agenda>(conta), NAO_INICIALIZADO);

        let registros = borrow_global<Agenda>(conta);
        let resultado = table::borrow(&registros.registros, Nome { nome });
        *resultado
    }

    /// Modifica o telefone do Registro relacionado com o Nome dado.
    public entry fun modificar_telefone(conta: &signer, nome: String, telefone: u64) acquires Agenda {
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(conta));

        assert!(table::contains(&registros.registros, Nome { nome }), REGISTRO_NAO_EXISTE);
        let telefone_atual = &mut table::borrow_mut(&mut registros.registros, Nome { nome }).telefone;
        *telefone_atual = telefone;
    }

    /// Modifica o discord do Registro relacionado com o Nome dado.
    public entry fun modificar_discord(conta: &signer, nome: String, discord: String) acquires Agenda {
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(conta));

        assert!(table::contains(&registros.registros, Nome { nome }), REGISTRO_NAO_EXISTE);
        let discord_atual = &mut table::borrow_mut(&mut registros.registros, Nome { nome }).discord;
        *discord_atual = discord;
    }

    /// Modifica o email do Registro relacionado com o Nome dado.
    public entry fun modificar_email(conta: &signer, nome: String, email: String) acquires Agenda {
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(conta));

        assert!(table::contains(&registros.registros, Nome { nome }), REGISTRO_NAO_EXISTE);
        let email_atual = &mut table::borrow_mut(&mut registros.registros, Nome { nome }).email;
        *email_atual = email;
    }

    /// Modifica o endereco do Registro relacionado com o Nome dado.
    public entry fun modificar_endereco(conta: &signer, nome: String, endereco: address) acquires Agenda {
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(conta));

        assert!(table::contains(&registros.registros, Nome { nome }), REGISTRO_NAO_EXISTE);
        let endereco_atual = &mut table::borrow_mut(&mut registros.registros, Nome { nome }).endereco;
        *endereco_atual = endereco;
    }

    /// Modifica o Nome com o qual está guardado um registro.
    public entry fun modificar_nome(conta: &signer, nome_atual: String, nome_novo: String) acquires Agenda {
        // Na verdade não existe uma operação para isso, mas podemos fazer uma cópia dos valores, guardá-los com o novo nome, e eliminar o registro anterior
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO);

        let registros = borrow_global_mut<Agenda>(address_of(conta));
        assert!(table::contains(&registros.registros, Nome { nome: nome_atual }), REGISTRO_NAO_EXISTE);
        assert!(!table::contains(&registros.registros, Nome { nome: nome_novo }), REGISTRO_JA_EXISTE);

        let registro = table::borrow(&registros.registros, Nome { nome: nome_atual });
        table::add(&mut registros.registros, Nome { nome: nome_novo }, *registro); // Aqui se faz a cópia
        table::remove(&mut registros.registros, Nome { nome: nome_atual });
    }

    /// Modifica o Registro relacionado com o Nome dado.
    /// Esta função não pode ser usada no console.
    /// Mas você pode testá-la no explorador: https://explorer.suilabs.com/
    public entry fun modificar_registro(
        conta: &signer, 
        nome: String, 
        telefone: Option<u64>, // Esta função aceita parâmetros do tipo Option, se um valor não é necessário para a operação podemos ignorá-lo.
        discord: Option<String>,
        email: Option<String>, 
        endereco: Option<address>,
    ) acquires Agenda {
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO);
        assert!(is_some(&telefone) || is_some(&discord) || is_some(&email), NADA_A_MODIFICAR); // Avaliamos que pelo menos 1 valor tenha sido enviado para modificá-lo no Registro.

        let registros = borrow_global_mut<Agenda>(address_of(conta));

        assert!(table::contains(&registros.registros, Nome { nome }), REGISTRO_NAO_EXISTE);
        let registro = table::borrow_mut(&mut registros.registros, Nome { nome });
        
        // E avaliamos cada uma das Options. Se têm um valor, se modifica, se não, não acontece nada.
        if (is_some(&telefone)) registro.telefone = *option::borrow(&telefone);
        if (is_some(&discord)) registro.discord = *option::borrow(&discord);
        if (is_some(&email)) registro.email = *option::borrow(&email);
        if (is_some(&endereco)) registro.endereco = *option::borrow(&endereco);
    }
    
    /// Elimina o Registro com base no Nome dado.
    public entry fun eliminar_registro(conta: &signer, nome: String) acquires Agenda {
        assert!(exists<Agenda>(address_of(conta)), NAO_INICIALIZADO);

        let registros = borrow_global_mut<Agenda>(address_of(conta));
        assert!(table::contains(&registros.registros, Nome { nome }), REGISTRO_NAO_EXISTE);

        table::remove(&mut registros.registros, Nome { nome });
    }
}
