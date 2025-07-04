<!-- ![banner](./recursos/imagenes/banner.png) -->
# Primeiros passos no Sui

## Introdução

**Sui** é uma rede **Layer-1** segura e altamente escalável. Permite a criação de smart contracts com **Move**, uma linguagem de programação projetada especificamente para garantir a segurança e o controle de acesso dos recursos computacionais desta blockchain.

Graças à execução paralela de transações através de seu ambiente de execução **MoveVM**, o Sui tem a capacidade de processar **+100,000 TPS**, tornando-o uma plataforma preparada para a aceleração de **DApps** em nível global.

## Instalando um editor de código

Para este tutorial instalaremos o **Visual Studio Code**.

Você pode simplesmente baixar o instalador para seu sistema operacional na [página oficial do Visual Studio](https://code.visualstudio.com/)

## Clonando este repositório

> :information_source: Certifique-se de ter acesso a um console em seu equipamento com permissões para instalação de software.

## 1. Instalação do Git

1. [Instalação no Mac](#macgit)
2. [Instalação no Windows](#windowsgit)
3. [Instalação no Linux](#linuxgit)

## Instalação no Mac <a id="macgit"></a>

1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e digite os seguintes comandos:
```sh
brew update
brew install git
```
3. Se você precisar de mais informações sobre a instalação, pode encontrá-las na documentação [oficial do Git](https://www.git-scm.com/download/mac).

## Instalação no Windows <a id="windowsgit"></a>

1. Baixe o instalador da página oficial do Git: [https://www.git-scm.com/download/win](https://www.git-scm.com/download/win).
2. Siga as instruções indicadas. As opções padrão do instalador costumam ser suficientes, mas se você quiser personalizar sua instalação de alguma forma e souber o que está fazendo, sinta-se livre para alterar o que precisar.

## Instalação no Linux <a id="linuxgit"></a>

1. Para distribuições baseadas em Debian, como Ubuntu, você pode executar os seguintes comandos:
```bash
sudo apt update
sudo apt install git-all
```
2. Se você precisar de informações sobre a instalação em alguma outra distribuição específica, pode encontrá-las na documentação [oficial do Git](https://git-scm.com/download/linux).

## 2. Configurando o Git

É uma boa ideia configurar os valores globais do seu usuário antes de começar a usar o Git. Você pode fazer isso com os seguintes comandos.

```sh
git config --global user.name "Nome Exemplo"
git config --global user.email nome@exemplo.com
```

> :information_source: Lembre-se de substituir os exemplos pelos seus dados pessoais.

## 3. Clonando o repositório localmente

No seu terminal, execute o seguinte comando:

```sh
git clone https://github.com/AguaPotavel/sui-first-steps.git
```

> :information_source: Lembre-se de que você pode alterar o diretório onde o repositório será clonado. Use `cd` para navegar entre os diretórios do seu equipamento, e `mkdir` para criar um novo. </br></br>
> Mais informações: [Tutorial comandos básicos](https://aprendolinux.com/aprende-los-comandos-basicos-de-linux/).

Uma vez clonado o repositório, você pode navegar até ele:
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

## Instalação da Sui CLI

Para poder interagir com o conteúdo dos tutoriais, é necessário instalar a **Sui CLI**.

1. [Instalação no Mac](#maccli)
2. [Instalação no Windows](#windowscli)
3. [Instalação no Linux](#linuxcli)

## Instalação no Mac <a id="maccli"></a>
1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e digite os seguintes comandos:
```sh
brew update
brew install sui
```
3. Abra outro terminal e execute o comando `sui help` para verificar se a instalação foi bem-sucedida:
```sh
sui help
```
### Atualizar a CLI
Atualizar a CLI com `brew` requer 2 comandos:
```sh
brew update
brew upgrade sui
```

## Instalação no Windows <a id="windowscli"></a>

Pendente.

## Instalação no Linux <a id="linuxcli"></a>
1. Certifique-se de ter o **Python** 3.6 ou superior instalado. Para isso, você pode abrir um terminal e executar o seguinte comando:
```
python3 --version
```

Se o comando anterior retornar um erro, é necessário instalar o **Python**. Se você estiver usando Ubuntu e quiser apenas instalar a versão necessária para este tutorial, pode executar os seguintes comandos:
```sh
sudo apt update
sudo apt install python3.6
```

Se, em vez disso, você desejar personalizar sua instalação ou instalar a versão mais recente do Python, pode fazê-lo através da página oficial: [https://www.python.org/](https://www.python.org/).

2. Uma vez instalado o Python, execute o seguinte comando:
```sh
curl -fsSL "https://sui.dev/scripts/install_cli.py" | python3
```
> :information_source: Se o comando acima der erro, é necessário instalar o `curl`. Você pode fazê-lo com os seguintes comandos:
> ```sh
> sudo apt update
> sudo apt install curl
>```

3. Verifique a instalação usando:
```sh
sui help
```

> :information_source: Se o comando acima der erro, simplesmente feche seu terminal, abra-o novamente e tente novamente.

## Interagindo com o repositório

O repositório é composto por várias pastas com arquivos para cada tutorial. Simplesmente navegue até elas usando `cd` e siga as instruções internas.</br></br>
Cada tutorial possui um arquivo `README.md` com instruções claras de como interagir com eles.