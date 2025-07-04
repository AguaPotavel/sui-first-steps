# Exemplos

Neste diretório você encontrará os exemplos completos e sem comentários utilizados nos diferentes tutoriais do repositório.

Além disso, serão adicionados diferentes exemplos que você pode utilizar como guia para sua certificação no programa **Sui Backend Expert** ou adicionar um frontend para o programa **Sui Frontend Expert**.

## Executando os exemplos

Cada exemplo tem sua própria documentação, além disso você pode encontrar instruções mais detalhadas para a implantação na lição [11 Armazenamento Global](https://github.com/AguaPotavel/sui-first-steps/tree/master/backend/11_armazenamento_global).

Em termos gerais você precisa:

* [Instalar a Sui CLI](https://github.com/AguaPotavel/sui-first-steps/)
* Clonar o repositório e navegar para o diretório do projeto.
    ```sh
    ## Por exemplo
    cd ejemplos/01_contador
    ```
* Inicializar o projeto para poder interagir com a Blockchain do Sui.
    ```sh
    sui init
    ```
* Compilar o projeto.
    ```sh
    sui move compile --named-addresses cuenta=default
    ```
* Implantar o projeto.
    ```sh
    sui move publish --named-addresses cuenta=default
    ```
* Interagir com o contrato.
    * Utilizando a [Sui CLI](https://github.com/AguaPotavel/sui-first-steps/tree/master/backend/11_armazenamento_global).
    * Utilizando o [Sui Explorer](https://explorer.suilabs.com/).

> :information_source: Lembre-se de que você pode encontrar mais informações sobre estes programas de certificação no Discord da [Zona Tres](https://discord.gg/zonatres).