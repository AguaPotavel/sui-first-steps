# Exemplos: Agenda

Este exemplo é a versão sem comentários do código usado na lição [13 Agenda](https://github.com/AguaPotavel/sui-first-steps/tree/master/backend/13_agenda).

## Implantando o contrato

* [Instalar a Sui CLI](https://github.com/AguaPotavel/sui-first-steps/)
* Clonar o repositório e navegar para o diretório do projeto.
    ```sh
    cd ejemplos/02_agenda
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

* **`inicializar`**
    ```sh
    sui move run --function-id 'default::agenda::inicializar'
    ```
* **`adicionar_registro`**
    ```sh
    sui move run --function-id 'default::agenda::adicionar_registro' --args 'String:João' u64:4444444444 'String:joao_ito' 'String:joao_ito@gmail.com' address:0xFE00 --assume-yes
    ```
* **`obter_registro`**
    ```sh
    sui move view --function-id 'default::agenda::obter_registro' --args address:default 'String:João'
    ```
* **`modificar_telefone`**
    ```sh
    sui move run --function-id 'default::agenda::modificar_telefone' --args 'String:João' u64:4444444445
    ```
* **`modificar_discord`**
    ```sh
    sui move run --function-id 'default::agenda::modificar_discord' --args 'String:João' 'String:joao_john' --assume-yes
    ```
* **`modificar_email`**
    ```sh
    sui move run --function-id 'default::agenda::modificar_email' --args 'String:João' 'String:joao_john@gmail.com' --assume-yes
    ```
* **`modificar_endereco`**
    ```sh
    sui move run --function-id 'default::agenda::modificar_endereco' --args 'String:João' address:0xBEBE --assume-yes
    ```
* **`modificar_nome`**
    ```sh
    sui move run --function-id 'default::agenda::modificar_nome' --args 'String:João' 'String:John' --assume-yes
    ```