module cuenta::contador {
    use std::signer;

    struct Contador has key { valor: u64 }

    public entry fun publicar(cuenta: &signer, valor: u64) {
        let recurso = Contador { valor };
        move_to(cuenta, recurso)
    }

    #[view]
    public fun obtener_contador(direccion: address): u64 acquires Contador {
        borrow_global<Contador>(direccion).valor
    }

    public entry fun incrementar(direccion: address) acquires Contador {
        let referencia_contador = &mut borrow_global_mut<Contador>(direccion).valor;
        *referencia_contador = *referencia_contador + 1
    }

    public entry fun restablecer(cuenta: &signer) acquires Contador {
        let referencia_contador = &mut borrow_global_mut<Contador>(signer::address_of(cuenta)).valor;
        *referencia_contador = 0
    }

    #[view]
    public fun existe(direccion: address): bool {
        exists<Contador>(direccion)
    }

    public entry fun eliminar(cuenta: &signer) acquires Contador {
        let contador = move_from<Contador>(signer::address_of(cuenta));
        let Contador { valor: _ } = contador;
    }
}
