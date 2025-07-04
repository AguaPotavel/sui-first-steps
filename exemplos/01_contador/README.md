# Exemplos: Contador

Este exemplo é a versão sem comentários do código usado na lição [11 Armazenamento Global](https://github.com/AguaPotavel/sui-first-steps/tree/master/backend/11_armazenamento_global).

## Implantando o contrato

* [Instalar a Sui CLI](https://github.com/AguaPotavel/sui-first-steps/)
* Clonar o repositório e navegar para o diretório do projeto.
    ```sh
    cd ejemplos/01_contador
    ```
* Inicializar o projeto para poder interagir com a Blockchain do Sui.
    ```sh
    sui init
    ```
* Financiar sua conta (opcional).
    ```sh
    sui account fund-with-faucet --account default
    ```
* Compilar o projeto.
    ```sh
    sui move compile --named-addresses cuenta=default
    ```
* Implantar o projeto.
    ```sh
    sui move publish --named-addresses cuenta=default
    ```

## Interagindo com o contrato

Os métodos são:

* **`publicar`**
    ```sh
    sui move run --function-id 'default::contador::publicar' --args u64:1
    ```
* **`obter_contador`**
    ```sh
    sui move view --function-id 'default::contador::obter_contador' --args address:0x9ec76cffd7571d19a3abfe8f9721484eb7309fa55bd99722c60f94f5d70c2119
    ```

    > :information_source: Lembre-se de substituir o `address` com seu próprio `address`. Se não souber qual é, pode vê-lo executando:
    >```sh
    >sui account lookup-address
    >```
* **`incrementar`**
    ```sh
    sui move run --function-id 'default::contador::incrementar' --args address:<seu_endereco>
    ```
* **`restabelecer`**
    ```sh
    sui move run --function-id 'default::contador::restabelecer'
    ```
* **`existe`**
    ```sh
    sui move view --function-id 'default::contador::existe' --args address:<seu_endereco>
    ```
* **`eliminar`**
    ```sh
    sui move run --function-id 'default::contador::eliminar'
    ```