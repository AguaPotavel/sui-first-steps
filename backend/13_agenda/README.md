# Agenda

Neste exemplo utilizaremos tudo o que aprendemos até agora e o combinaremos em um programa completamente executável.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar em seu terminal para este diretório:
>```sh
>cd backend/13_agenda
>```

Digite em seu terminal e execute os seguintes comandos:

```sh
sui move test --named-addresses cuenta=0x5A6F6E612054726573
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY SuiStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING Agenda
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
{
  "Result": "Success"
}
```

### Inicializando o projeto para trabalhar com a Sui CLI

> :information_source: Os passos para a inicialização foram explicados com detalhe na lição [11_armazenamento_global](https://github.com/AguaPotavel/sui-first-steps/tree/master/backend/11_armazenamento_global).

Execute:

```sh
sui init --network devnet
```

Você obterá uma tela como a seguinte:

```
Configuring for profile default
Configuring for network Devnet
Enter your private key as a hex literal (0x...) [Current: Redacted | No input: Generate new key (or keep one if present)]
```

Simplesmente pressione `Enter`.

Lembre-se de que você pode adicionar mais tokens se necessário:
```sh
sui account fund-with-faucet --account default
```

### Compilando e publicando o código

```sh
sui move compile --named-addresses cuenta=default
sui move publish --named-addresses cuenta=default
```

### Executando as funções

> :information_source: Vamos utilizar a flag `assume-yes` para evitar ter que confirmar cada transação.

* Inicializar contrato:
    * Cria uma nova `Agenda` se não existe e a armazena na conta do assinante
    ```sh
    sui move run --function-id 'default::agenda::inicializar' --assume-yes
    ```
* Adicionar `Registro`:
    * Adiciona um `Registro` a uma `Agenda` existente.
    ```sh
    sui move run --function-id 'default::agenda::adicionar_registro' --args 'String:João' u64:4444444444 'String:joao_ito' 'String:joao_ito@gmail.com' address:0xFE00 --assume-yes
    ```
* Obter `Registro`:
    * Obtém o `Registro` relacionado com o `Nome` dado.
    ```sh
    sui move view --function-id 'default::agenda::obter_registro' --args address:default 'String:João'
    ```
* Modificar `telefone`:
    * Modifica o `telefone` do `Registro` relacionado com o `Nome` dado.
    ```sh
    sui move run --function-id 'default::agenda::modificar_telefone' --args 'String:João' u64:4444444445 --assume-yes
    ```
* Modificar `discord`:
    * Modifica o `discord` do `Registro` relacionado com o `Nome` dado.
    ```sh
    sui move run --function-id 'default::agenda::modificar_discord' --args 'String:João' 'String:joao_john' --assume-yes
    ```
* Modificar `email`:
    * Modifica o `email` do `Registro` relacionado com o `Nome` dado.
    ```sh
    sui move run --function-id 'default::agenda::modificar_email' --args 'String:João' 'String:joao_john@gmail.com' --assume-yes
    ```
* Modificar `endereco`:
    * Modifica o `endereco` do `Registro` relacionado com o `Nome` dado.
    ```sh
    sui move run --function-id 'default::agenda::modificar_endereco' --args 'String:João' address:0xBEBE --assume-yes
    ```
* Modificar `nome`:
    * Modifica o `Nome` com o qual está guardado um `Registro`.
    ```sh
    sui move run --function-id 'default::agenda::modificar_nome' --args 'String:João' 'String:John' --assume-yes
    ```

Você pode verificar que todas as mudanças funcionaram executando a função de visualização `obter_registro`. Lembre-se de que mudamos o nome, portanto o comando agora seria assim:
```sh
sui move view --function-id 'default::agenda::obter_registro' --args address:default 'String:John'
```

### Testando no Explorador

Você notará que o exemplo tem uma função a mais que não testamos: `modificar_registro`. Esta função não pode ser executada no terminal, dado que a CLI não suporta valores opcionais no momento.

Mas você pode testar a função utilizando o [Explorador de Transações](https://explorer.suilabs.com/).

Deixei uma conta com este contrato já implantado, você pode conectar sua wallet e testá-la [aqui](https://explorer.suilabs.com/account/0x8a5c141aec1a4d3c5ef8b50f5c2c2f777f13c404f51cf3e8ba9ce66a46e9d772/modules/run/agenda/inicializar?network=testnet).

Você pode testar todas as funções, mas no caso particular de `modificar_registro` é uma função que, em vez de ter múltiplas funções para modificar cada campo, podemos ter uma só que dependendo dos valores que enviamos e quais não. Ao executá-la no explorador, simplesmente deixe vazios os campos que não quer modificar do registro.