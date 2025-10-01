![banner](./recursos/imagens/banner.jpg)
# Primeiros passos em Sui

## Introdução

**Sui** é uma plataforma de blockchain e contratos inteligentes de **camada 1** projetada para que a propriedade de ativos digitais seja rápida, privada, segura e acessível.

**Move** é uma linguagem de código aberto para escrever pacotes seguros para manipular objetos na blockchain. Ela permite bibliotecas, ferramentas e comunidades de desenvolvedores comuns em blockchains com modelos de dados e execução muito diferentes.

## Instalando um editor de código

Para este tutorial, instalaremos o **Visual Studio Code**.

1. Baixe o instalador para o seu sistema operacional na [página oficial do Visual Studio](https://code.visualstudio.com/)
2. (Opcional) Recomendamos instalar as seguintes extensões:
    * [Move (Extension)](https://marketplace.visualstudio.com/items?itemName=mysten.move) é uma extensão de servidor de linguagem para Move mantida pela [Mysten Labs](https://www.mystenlabs.com/).
    * [Move Formatter](https://marketplace.visualstudio.com/items?itemName=mysten.prettier-move) é um formatador de código para Move, desenvolvido e mantido pela Mysten Labs.
    * [Move Syntax](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax) uma simples extensão de realce de sintaxe para Move por [Damir Shamanaev](https://github.com/damirka/).

## Clonando este repositório

> :information_source: Certifique-se de ter acesso a um console em seu computador com permissões para instalação de software.

## 1. Instalação do Git

1. [Instalação no Mac](#macgit)
2. [Instalação no Windows](#windowsgit)
3. [Instalação no Linux](#linuxgit)

## Instalação no Mac <a id="macgit"></a>

1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e insira os seguintes comandos:
```sh
brew update
brew install git
```
3. Se precisar de mais informações sobre a instalação, você pode encontrá-las na documentação [oficial do Git](https://www.git-scm.com/download/mac).

## Instalação no Windows <a id="windowsgit"></a>

1. Baixe o instalador na página oficial do Git: [https://www.git-scm.com/download/win](https://www.git-scm.com/download/win).
2. Siga as instruções indicadas. As opções padrão do instalador geralmente são suficientes, mas se você quiser personalizar sua instalação de alguma forma e souber o que está fazendo, sinta-se à vontade para mudar o que for necessário.

## Instalação no Linux <a id="linuxgit"></a>

1. Para distribuições baseadas em Debian, como o Ubuntu, você pode executar os seguintes comandos:
```bash
sudo apt update
sudo apt install git-all
```
2. Se precisar de informações sobre a instalação em alguma outra distribuição específica, você pode encontrá-las na documentação [oficial do Git](https://git-scm.com/download/linux).

## 2. Configurando o Git

É uma boa ideia configurar os valores globais do seu usuário antes de começar a usar o Git. Você pode fazer isso com os seguintes comandos.

> :information_source: Lembre-se de substituir os exemplos com seus dados pessoais.
```sh
git config --global user.name "Nome Exemplo"
git config --global user.email nome@exemplo.com
```

## 3. Clonando o repositório localmente

No seu terminal, execute o seguinte comando:

```sh
git clone https://github.com/AguaPotavel/sui-first-steps.git
```

> :information_source: Lembre-se que você pode mudar o diretório onde o repositório será clonado. Utilize `cd` para se mover entre os diretórios do seu computador, e `mkdir` para criar um novo. </br></br>
> Mais informações: [Tutorial de comandos básicos](https://aprendolinux.com/aprende-los-comandos-basicos-de-linux/).

Uma vez que o repositório for clonado, você pode navegar até ele:
```sh
cd sui-first-steps
```

Para visualizar o conteúdo, você pode executar o comando:

```sh
ls -a
```

E para abri-lo no editor de código (no nosso caso, VS Code), você pode executar:
```sh
code .
```

## 3. Instalação da Sui CLI

Para poder interagir com o conteúdo dos tutoriais, é necessário instalar a **Sui CLI**.

1. [Instalação no Mac](#maccli)
2. [Instalação no Windows](#windowscli)
3. [Instalação no Linux](#linuxcli)

## Instalação no Mac <a id="maccli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando o Hombrew. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

* Execute o seguinte comando no seu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* Ou você pode baixar os binários e instalá-lo manualmente diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opção é um pouco mais avançada, então se você nunca instalou algo de forma semelhante, recomendamos usar o comando acima.

> :information_source: Se você não sabe qual arquitetura possui, pode executar o seguinte comando:
> ```sh
> uname -m
> ```
> * Se aparecer **arm64** → Baixe suiup-macOS-arm64.tar.gz.
> * Se aparecer **x86_64** → Baixe suiup-macOS-x86_64.tar.gz.

1. Você pode testar se a instalação do `suiup` foi bem-sucedida executando o seguinte comando:
```sh
suiup --version
```

2. Depois de instalar o `suiup`, independentemente da opção escolhida, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

3. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### Hombrew

1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e insira os seguintes comandos:
```sh
brew update
brew install sui
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## Instalação no Windows <a id="windowscli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando um gerenciador de pacotes como o **Chocolatey**. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

1. Baixe o instalador diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases).

> :information_source: Se você não sabe qual arquitetura possui, simplesmente baixe o arquivo `suiup-Windows-msvc-x86_64.zip`.

2. Uma vez instalado, abra um terminal e execute o seguinte comando para verificar se tudo correu bem:
```sh
suiup --version
```
> :information_source: Recomendamos usar o Powershell como terminal para executar todos os comandos deste repositório no Windows.

3. Depois de instalar o `suiup`, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

4. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### `choco`

1. Certifique-se de ter o **Chocolatey** instalado: [https://chocolatey.org/install](https://chocolatey.org/install).
2. Abra um terminal e insira o seguinte comando:
```sh
choco install sui
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## Instalação no Linux <a id="linuxcli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando o gerenciador de pacotes para **Rust** chamado `cargo`. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

* Execute o seguinte comando no seu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* Ou você pode baixar os binários e instalá-lo manualmente diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opção é um pouco mais avançada, então se você nunca instalou algo de forma semelhante, recomendamos usar o comando acima.

> :information_source: Se você não sabe qual arquitetura possui, pode executar o seguinte comando:
> ```sh
> uname -m
> ```
> * Se aparecer **arm64** → Baixe `suiup-Linux-musl-arm64.tar.gz`.
> * Se aparecer **x86_64** → Baixe `suiup-Linux-musl-x86_64.tar.gz`.

1. Você pode testar se a instalação do `suiup` foi bem-sucedida executando o seguinte comando:
```sh
suiup --version
```

2. Depois de instalar o `suiup`, independentemente da opção escolhida, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

3. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### `cargo`

1. Certifique-se de ter o `rustup` instalado: [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install).
2. Abra um terminal e insira os seguintes comandos:
```sh
rustup update stable
cargo install --git https://github.com/MystenLabs/sui.git sui --branch devnet
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## 4. Instalação do MVR

O **Move Registry** (MVR) é um gerenciador de pacotes para o Move. Ele permite a qualquer pessoa publicar e utilizar pacotes publicados em novas aplicações desenvolvidas com o Move. 

1. A forma de instalar o `mvr` depende de como você instalou a `sui` CLI.

* Se você instalou com `suiup` (independentemente do seu sistema operacional), execute o seguinte comando:
```sh
suiup install mvr
```

* Se você instalou o `sui` utilizando `cargo`, execute o seguinte comando:
```sh
cargo install --locked --git https://github.com/mystenlabs/mvr --branch release mvr
```

* Por último, se você realizou a instalação manualmente baixando o instalador e **não** instalou o `suiup`, pode baixar o instalador do `mvr` no [repositório oficial](https://github.com/MystenLabs/mvr/releases).

2. Independentemente da opção escolhida, lembre-se de verificar se a instalação foi realizada corretamente:
```sh
mvr --version
```

## 5. Interagindo com o repositório.

O repositório é composto por várias pastas com arquivos para cada tutorial, simplesmente navegue até elas usando `cd` e siga as instruções dentro delas.</br></br>
Cada tutorial possui um arquivo `README.md` com instruções claras de como interagir com eles.

## Créditos

Este repositório é uma tradução para o português do projeto original em espanhol desenvolvido por [WayLearnLatam](https://github.com/WayLearnLatam). Você pode encontrar o repositório original em:

**Repositório Original:** [https://github.com/WayLearnLatam/sui-first-steps](https://github.com/WayLearnLatam/sui-first-steps)

Agradecemos à equipe WayLearnLatam por criar este excelente material educativo sobre Sui e Move.
