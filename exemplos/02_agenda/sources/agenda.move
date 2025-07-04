module cuenta::agenda {
    use sui_std::table::{Self, Table};
    use std::string::String;
    use std::option::{Self, Option, is_some};
    use std::signer::address_of;

    const YA_INICIALIZADO: u64 = 1;
    const NO_INICIALIZADO: u64 = 2;
    const REGISTRO_NO_EXISTE: u64 = 3;
    const REGISTRO_YA_EXISTE: u64 = 4;
    const NADA_A_MODIFICAR: u64 = 5;
    
    struct Nombre has copy, drop {
        nombre: String,
    }

    struct Registro has store, copy, drop {
        telefono: u64,
        discord: String,
        correo: String,
        direccion: address,
    }

    struct Agenda has key {
        registros: Table<Nombre, Registro>
    }

    public entry fun inicializar(cuenta: &signer) {
        assert!(!exists<Agenda>(address_of(cuenta)), YA_INICIALIZADO);
        move_to(cuenta, Agenda {
            registros: table::new<Nombre, Registro>(),
        })
    }

    public entry fun agregar_registro(
        cuenta: &signer, 
        nombre: String, 
        telefono: u64, 
        discord: String, 
        correo: String, 
        direccion: address,
    ) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);

        let registros = borrow_global_mut<Agenda>(address_of(cuenta));
        assert!(!table::contains(&registros.registros, Nombre { nombre }), REGISTRO_YA_EXISTE);

        table::add(&mut registros.registros, Nombre {
            nombre,
        }, Registro {
            telefono,
            discord,
            correo,
            direccion
        });
    }

    #[view]
    public fun obtener_registro(cuenta: address, nombre: String): Registro acquires Agenda {
        assert!(exists<Agenda>(cuenta), NO_INICIALIZADO);

        let registros = borrow_global<Agenda>(cuenta);
        let resultado = table::borrow(&registros.registros, Nombre { nombre });
        *resultado
    }

    public entry fun modificar_telefono(cuenta: &signer, nombre: String, telefono: u64) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(cuenta));

        assert!(table::contains(&registros.registros, Nombre { nombre }), REGISTRO_NO_EXISTE);
        let telefono_actual = &mut table::borrow_mut(&mut registros.registros, Nombre { nombre }).telefono;
        *telefono_actual = telefono;
    }

    public entry fun modificar_discord(cuenta: &signer, nombre: String, discord: String) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(cuenta));

        assert!(table::contains(&registros.registros, Nombre { nombre }), REGISTRO_NO_EXISTE);
        let discord_actual = &mut table::borrow_mut(&mut registros.registros, Nombre { nombre }).discord;
        *discord_actual = discord;
    }

    public entry fun modificar_correo(cuenta: &signer, nombre: String, correo: String) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(cuenta));

        assert!(table::contains(&registros.registros, Nombre { nombre }), REGISTRO_NO_EXISTE);
        let correo_actual = &mut table::borrow_mut(&mut registros.registros, Nombre { nombre }).correo;
        *correo_actual = correo;
    }

    public entry fun modificar_direccion(cuenta: &signer, nombre: String, direccion: address) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);
        let registros = borrow_global_mut<Agenda>(address_of(cuenta));

        assert!(table::contains(&registros.registros, Nombre { nombre }), REGISTRO_NO_EXISTE);
        let direccion_actual = &mut table::borrow_mut(&mut registros.registros, Nombre { nombre }).direccion;
        *direccion_actual = direccion;
    }

    public entry fun modificar_nombre(cuenta: &signer, nombre_actual: String, nombre_nuevo: String) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);

        let registros = borrow_global_mut<Agenda>(address_of(cuenta));
        assert!(table::contains(&registros.registros, Nombre { nombre: nombre_actual }), REGISTRO_NO_EXISTE);
        assert!(!table::contains(&registros.registros, Nombre { nombre: nombre_nuevo }), REGISTRO_YA_EXISTE);

        let registro = table::borrow(&registros.registros, Nombre { nombre: nombre_actual });
        table::add(&mut registros.registros, Nombre { nombre: nombre_nuevo }, *registro);
        table::remove(&mut registros.registros, Nombre { nombre: nombre_actual });
    }

    public entry fun modificar_registro(
        cuenta: &signer, 
        nombre: String, 
        telefono: Option<u64>,
        discord: Option<String>,
        correo: Option<String>, 
        direccion: Option<address>,
    ) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);
        assert!(is_some(&telefono) || is_some(&discord) || is_some(&correo), NADA_A_MODIFICAR);

        let registros = borrow_global_mut<Agenda>(address_of(cuenta));

        assert!(table::contains(&registros.registros, Nombre { nombre }), REGISTRO_NO_EXISTE);
        let registro = table::borrow_mut(&mut registros.registros, Nombre { nombre });
        
        if (is_some(&telefono)) registro.telefono = *option::borrow(&telefono);
        if (is_some(&discord)) registro.discord = *option::borrow(&discord);
        if (is_some(&correo)) registro.correo = *option::borrow(&correo);
        if (is_some(&direccion)) registro.direccion = *option::borrow(&direccion);
    }
    
    public entry fun eliminar_registro(cuenta: &signer, nombre: String) acquires Agenda {
        assert!(exists<Agenda>(address_of(cuenta)), NO_INICIALIZADO);

        let registros = borrow_global_mut<Agenda>(address_of(cuenta));
        assert!(table::contains(&registros.registros, Nombre { nombre }), REGISTRO_NO_EXISTE);

        table::remove(&mut registros.registros, Nombre { nombre });
    }
}
