// Para estudar o funcionamento do Global Storage vamos fazer um programa completo.
// Integraremos a maioria das coisas que foram vistas até agora, por isso é necessário que não tenha pulado os temas anteriores.
// O módulo é simplesmente um contador. Armazenaremos um número inteiro e teremos uma função para incrementá-lo.
module cuenta::almacenamiento_global {
    use std::signer; // Global Storage funciona sobre o signer e address como vimos anteriormente.

    struct Contador has key { valor: u64 } // Criamos um tipo personalizado chamado Contador para armazenar um valor dentro do nosso contador.
    // Dado que vai ser utilizado para operações com o global storage é necessário que tenha a habilidade key.

    // Publica um recurso `Contador` com valor `valor` na conta fornecida.
    public entry fun publicar(cuenta: &signer, valor: u64) { // A função recebe 2 parâmetros, mas na verdade ao executá-la, só enviaremos 1.
    // O signer é recebido automaticamente.

        let recurso = Contador { valor }; // Vamos criar um recurso. Não é mais que um struct.
        // Este recurso pode ser armazenado dentro da blockchain utilizando o global storage.

        // Para armazená-lo no global storage usamos move_to. Fato curioso: Esta é a razão pela qual Move se chama desta maneira.
        // À pessoa que invocou este método, ou seja, a quem assinou esta transação, será criado um recurso no armazenamento global do tipo Contador:
        move_to(cuenta, recurso) // A esta ação se chama empacotar, ou pack. Note a omissão do ; Por que é isto?
        // Esta operação só pode ser feita dentro dos módulos que declarem o recurso Contador
        // Muito importante, note que estamos enviando o parâmetro conta, ou seja o signer. Esta operação requer o signer.
    }

    // Lê o valor do recurso `Contador` armazenado no `endereco`
    // Várias coisas acontecem aqui:
    // 1. Como vamos obter um recurso, é necessário que se especifique que a função vai adquirir esse recurso, para que o compilador autorize.
    // Isto se faz com a palavra `acquires`
    // 2. Usualmente, este é um método de visualização. Dado que só vamos ver o valor que tem armazenado o recurso.
    // Nestes casos NÃO se utiliza signer, mas sim devemos enviar o `address` como um parâmetro no momento de executar a função.
    #[view] // Podemos especificar que é um método de visualização
    public fun obter_contador(endereco: address): u64 acquires Contador {
        // Usamos borrow_global para obter esse recurso.
        borrow_global<Contador>(endereco).valor // Lembre-se que o recurso é simplesmente um struct, então podemos acessar seus campos com .
        // Note que esta operação é uma referência imutável. Também diferente da operação de publicar e move_to, aqui usamos o address.
    }

    // Incrementa o valor do recurso `Contador` que pertence ao `endereco`
    // Note que estamos usando address. Essencialmente qualquer um pode aumentar o Contador de qualquer endereço enquanto conhecer esse endereço.
    public entry fun incrementar(endereco: address) acquires Contador { // acquires dado que vamos adquirir esse recurso
        // Vamos obter uma referência mutável ao valor do contador
        // Para isso usamos a operação borrow_global_mut, indicamos o tipo do recurso que vamos receber, ou seja Contador
        let referencia_contador = &mut borrow_global_mut<Contador>(endereco).valor; // E acessamos seu campo valor usando .
        *referencia_contador = *referencia_contador + 1 // E como é mutável, podemos modificar seu valor diretamente usando desreferenciação.
    }

    // Restabelece o valor do recurso `Contador` da `conta` para 0
    // Aqui usamos signer em vez de address. Ou seja, que só a pessoa que assinar a transação pode restabelecer seu contador.
    public entry fun restabelecer(conta: &signer) acquires Contador { // acquires dado que vamos adquirir esse recurso
        // Recebemos signer como parâmetro, mas lembremos que borrow_global e borrow_global_mut requerem um address ...
        let referencia_contador = &mut borrow_global_mut<Contador>(signer::address_of(conta)).valor; // Por isso convertemos usando a operação address_of
        *referencia_contador = 0
    }

    // Podemos validar se um `address` já tem um recurso do tipo Contador armazenado no global storage.
    #[view] // Só estamos validando algo, então podemos usá-lo como view
    public fun existe(endereco: address): bool { // Não estamos adquirindo o recurso, só estamos verificando se existe ou não
        exists<Contador>(endereco) // Usamos a operação exists, que retorna true ou false dependendo se o recurso existe ou não na conta dada.
        // Como exists retorna um bool podemos retornar esse valor diretamente.
    }

    // Elimina o recurso `Contador` sob a `conta` e retorna seu valor
    // Estamos usando signer como parâmetro, ou seja, que só pode apagar o recurso da sua conta se chamar este método.
    public entry fun eliminar(conta: &signer) acquires Contador { // acquires dado que vamos adquirir esse recurso
        // move_from basicamente tira o recurso do global storage.
        // Uma vez que fizermos isso, o recurso já não estará no global storage a menos que o devolvamos.
        let contador = move_from<Contador>(signer::address_of(conta)); // Como usamos signer, há que convertê-lo em address.
        // Agora, já adquirimos o recurso, já está fora do global storage e o temos armazenado na variável contador
        // Como podemos nos livrar dele? Não podemos simplesmente ignorá-lo porque não tem drop...
        let Contador { valor: _ } = contador; // Lembre-se da desestruturação de structs.
        // e podemos parar, dado que u64 tem drop e podemos ignorá-lo.
    }

    // E onde estão os prints?
    // Agora entende por que Move se chama Move?
}
