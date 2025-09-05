# Walrus

**Walrus** é uma solução de armazenamento descentralizado pensada para arquivos binários grandes (conhecidos como blobs), como imagens, modelos 3D, música, ou até mesmo sites completos. É especialmente útil em casos onde um app ou jogo precisa guardar muitos assets diretamente na blockchain. Se você está desenvolvendo um projeto sobre Sui que precisa armazenar conteúdo pesado, Walrus é a ferramenta ideal.

## Características principais

* **Armazenamento e recuperação**: você pode guardar e ler arquivos grandes (blobs), e comprovar que continuam disponíveis com o tempo.
* **Eficiência de custos**: graças a técnicas como erasure coding, armazenar dados é mais econômico e resistente a falhas que replicá-los completamente.
* **Integração com a blockchain do Sui**: cada arquivo guardado se representa como um objeto dentro do Sui, o que permite interagir com eles desde contratos inteligentes.
* **Token WAL e delegação de stake:** Walrus funciona com seu próprio token, WAL (e sua subunidade FROST), que é usado para pagar por armazenamento e participar no consenso do protocolo.
* **Interação flexível**: você pode usar Walrus desde o terminal (CLI), mediante SDKs ou até mesmo com tecnologias tradicionais como HTTP, ideal se você vem do mundo Web2.

## Documentação oficial

* Você pode visitar o site oficial do Walrus aqui: https://www.walrus.xyz/
* Você pode encontrar a documentação oficial em inglês aqui: https://docs.wal.app/

## Instalação

> :information_source: Antes de instalar e configurar Walrus você precisa ter seu Sui Client configurado corretamente com o ambiente que requeira. Por exemplo, para este tutorial estaremos utilizando a `testnet`.

1. [Instalação com SuiUp](#suiupwalrus)
2. [Instalação no Mac e Linux (sem SuiUp)](#maclinuxsuiup)
3. [Instalação no Windows](#windowswalrus)

### Instalação com SuiUp <a id="suiupwalrus"></a>

Se você tem instalada a ferramenta `suiup` pode instalar walrus com o seguinte comando:
```sh
suiup install walrus
```

Por padrão o ambiente instalado é `testnet`. Você pode comprovar que tudo saiu bem executando o comando:
```sh
walrus --help
```

### Instalação no Mac e Linux (sem SuiUp) <a id="maclinuxsuiup"></a>

Você pode instalar Walrus utilizando o seguinte comando:
```sh
curl -sSf https://install.wal.app | sh -s -- -n testnet
```

Neste caso, estaremos instalando o ambiente de `testnet`. Você pode comprovar que tudo saiu bem executando o comando:
```sh
walrus --help
```

### Instalação no Windows <a id="windowswalrus"></a>

A instalação no Windows é a mais complexa. Você pode baixar o executável do Walrus usando o seguinte comando:
> :information_source: Lembre-se de executar estes comandos usando PowerShell
```powershell
(New-Object System.Net.WebClient).DownloadFile(
  "https://storage.googleapis.com/mysten-walrus-binaries/walrus-testnet-latest-windows-x86_64.exe",
  "walrus.exe"
)
```

Isto baixará o arquivo executável do Walrus. Uma vez feito isso, é necessário adicioná-lo ao `PATH` para poder executá-lo desde o terminal. Te recomendamos mover o arquivo para um lugar mais permanente, por exemplo:

1. Obter o diretório do usuário atual
```powershell
$UserDir = [Environment]::GetFolderPath("UserProfile")
```
2. Criar a pasta 'tools' se não existir
```powershell
$ToolsDir = Join-Path $UserDir "tools"
if (-Not (Test-Path $ToolsDir)) {
    New-Item -ItemType Directory -Path $ToolsDir
}
```

3. Mover walrus.exe para essa pasta (assumindo que está no mesmo diretório atual)
```powershell
Move-Item -Path ".\walrus.exe" -Destination "$ToolsDir\walrus.exe" -Force
```

4. Adicionar a pasta ao `PATH` do usuário se não estiver já
```powershell
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if (-Not ($CurrentPath.Split(";") -contains $ToolsDir)) {
    [Environment]::SetEnvironmentVariable("Path", "$CurrentPath;$ToolsDir", "User")
    Write-Output "Se agregou $ToolsDir al PATH del usuario. Reinicia PowerShell para que surta efecto."
} else {
    Write-Output "$ToolsDir ya está en el PATH del usuario."
}
```

5. Forçar o recarregamento do seu `PATH` na sessão atual:
```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "User") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "Machine")
```

Uma vez terminado este processo, você pode executar o seguinte comando para verificar que tudo se executou de maneira correta:
```powershell
walrus --help
```

## Configuração do Walrus

1. [Configuração no Mac e Linux](#maclinuxconfig)
2. [Configuração no Windows](#windowsconfig)

### Configuração no Mac e Linux <a id="maclinuxconfig"></a>

Crie a seguinte pasta para armazenar a informação de configuração do Walrus:
```sh
mkdir  ~/.config/walrus/
```

Uma vez feito isso, você pode baixar a configuração de `testnet` usando este comando:
```sh
curl https://docs.wal.app/setup/client_config_testnet.yaml -o ~/.config/walrus/client_config.yaml
```

### Configuração no Windows <a id="windowsconfig"></a>

Para baixar a configuração de `testnet` do Walrus execute os seguintes comandos:

```powershell
$UserDir = [Environment]::GetFolderPath("UserProfile")
```

Precisaremos criar a pasta onde será armazenada a configuração:
```powershell
$WalrusConfigDir = Join-Path $UserDir ".config\walrus"
if (-Not (Test-Path $WalrusConfigDir)) {
    New-Item -ItemType Directory -Path $WalrusConfigDir -Force
}
```

Baixe o arquivo de configuração de `testnet`:
```powershell
Invoke-WebRequest "https://docs.wal.app/setup/client_config_testnet.yaml" -OutFile (Join-Path $WalrusConfigDir "client_config.yaml")
```

## Obtendo tokens WAL 
> :information_source: Se não o fez ainda, mude seu ambiente do Sui Client para `testnet`:
> `sui client switch --env testnet`
> Você pode encontrar informação sobre como configurar isso na lição Sui Client neste mesmo repositório.

Já que você instalou Walrus, primeiro precisaremos obter tokens WAL. Dado que estamos na `testnet` estes tokens são fictícios. Você pode obtê-los usando o seguinte comando:

```sh
walrus get-wal
```

Você deveria obter algo similar a isto se toda a configuração foi correta:
```sh
2025-08-08T18:45:10.294962Z  INFO walrus: client version: 1.30.0-2c369d9b99ae
2025-08-08T18:45:10.295818Z  INFO walrus_sdk::config: using Walrus configuration from 'C:\Users\aklas\.config\walrus\client_config.yaml' with default context
2025-08-08T18:45:10.296197Z  INFO walrus_sui::config: using Sui wallet configuration from 'C:\Users\aklas\.sui\sui_config\client.yaml'
2025-08-08T18:45:12.641907Z  INFO walrus_service::client::cli::runner: exchanging 0.500 SUI for WAL using exchange object 0x19825121c52080bb1073662231cfea5c0e4d905fd13e95f21e9a018f2ef41862
Success: Exchanged 0.500 SUI for WAL.
```
> :information_source: Lembre-se que você precisa financiar sua conta de `testnet` no Sui Client.

Finalmente podemos trabalhar com Walrus através da CLI!

## Subindo um arquivo

Para subir qualquer arquivo ao Walrus você pode usar este comando:
```sh
walrus store <FILES> --epochs <EPOCHS>
```

Por exemplo, criemos um arquivo de texto que diga `Olá, Mundo!`:

No Linux/Mac:
```sh
echo "Olá, Mundo!" > ola.txt
```

Ou no Windows:
```powershell
"Olá, Mundo!" | Out-File -Encoding utf8 ola.txt
```

E podemos subi-lo ao Walrus usando:
```sh
walrus store ola.txt --epochs 1
```

> :information_source: Epochs indica quanto tempo estará disponível o arquivo. Na `testnet` 1 epoch é igual a 1 dia. Na `mainnet` cada epoch equivale a 2 semanas.

O output deste comando é algo longo, e similar a isto:

```sh
2025-08-08T18:58:25.097679Z  INFO walrus: client version: 1.30.0-2c369d9b99ae
2025-08-08T18:58:25.098471Z  INFO walrus_sdk::config: using Walrus configuration from 'C:\Users\aklas\.config\walrus\client_config.yaml' with default context
2025-08-08T18:58:25.099016Z  INFO walrus_sui::config: using Sui wallet configuration from 'C:\Users\aklas\.sui\sui_config\client.yaml'
2025-08-08T18:58:25.100237Z  WARN walrus_sui::client: blob is marked as neither deletable nor permanent; blobs are currently permanent by default, but this behavior will change in the future; use `--deletable` or `--permanent` to explicitly specify the desired behavior
2025-08-08T18:58:27.931646Z  INFO walrus_service::client::cli::runner: storing 1 files as blobs on Walrus
 ◌ encoding the blob [00:00:01]                                                                                         2025-08-08T18:58:29.045250Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client: encoded sliver pairs and metadata symbol_size=2 primary_sliver_size=1334 secondary_sliver_size=668 duration=1.1119338s
 ◉ blob encoded; blob ID: OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA [00:00:01]                                        2025-08-08T18:58:29.047728Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client: storing 1 sliver pairs with metadata
2025-08-08T18:58:30.196883Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client: retrieved 1 blob statuses duration=1.148592s
2025-08-08T18:58:30.197531Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client::resource: num_blobs=1 num_to_be_processed=1
2025-08-08T18:58:33.541298Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client: 1 blob resources obtained
Some(RegisterNew { blob: Blob { id: 0xbdf0e74c402d8517101a81753439a56fb75364e4ec77a19c4266726534dfb720, registered_epoch: 127, blob_id: BlobId(OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA), size: 17, encoding_type: RS2, certified_epoch: None, storage: StorageResource { id: 0x0f3eb405b09f8dac831b589bd3389374632138550d41cb7b0dbfcdfb2755cdb7, start_epoch: 127, end_epoch: 128, storage_size: 66034000 }, deletable: false }, operation: RegisterFromScratch { encoded_length: 66034000, epochs_ahead: 1 } }) duration=3.3437346s
2025-08-08T18:58:33.757705Z  INFO reserve_and_store_blobs_retry_committees_with_path:send_blob_data_and_get_certificate: walrus_sdk::client: starting to send data to storage nodes blob_id=OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA
 • sending slivers (OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA) [00:00:00] [-------------------------------] 0/667 (0s) ◉ slivers sent (OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA) [00:00:03] [################################] 667/667 (0s) ◉ slivers sent (OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA) [00:00:03] [################################] 667/667 (0s)
 ◉ additional slivers stored (OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA) [00:00:02]                                   2025-08-08T18:58:38.962134Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client: finished sending blob data and collecting certificate blob_id=OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA duration=5.2044706s blob_size=17
2025-08-08T18:58:38.962586Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client: get 1 blobs certificates duration=5.4202987s
2025-08-08T18:58:40.708093Z  INFO reserve_and_store_blobs_retry_committees_with_path: walrus_sdk::client: certified 1 blobs on Sui duration=1.7451294s
2025-08-08T18:58:40.709734Z  INFO walrus_service::client::cli::runner: 1 out of 1 blobs stored duration=12.7778725s
Success: Permanent blob stored successfully.
Path: ola.txt
Blob ID: OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA
Sui object ID: 0xbdf0e74c402d8517101a81753439a56fb75364e4ec77a19c4266726534dfb720
Unencoded size: 17 B
Encoded size (including replicated metadata): 63.0 MiB
Cost (excluding gas): 0.011 WAL (storage was purchased, and a new blob object was registered)
Expiry epoch (exclusive): 128
Encoding type: RedStuff/Reed-Solomon

Summary for Modified or Created Blobs (1 newly certified)
Total encoded size: 63.0 MiB
Total cost: 0.011 WAL
```

A parte que nos interessa é a parte final:
```sh
Success: Permanent blob stored successfully.
Path: ola.txt
Blob ID: OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA
Sui object ID: 0xbdf0e74c402d8517101a81753439a56fb75364e4ec77a19c4266726534dfb720
Unencoded size: 17 B
Encoded size (including replicated metadata): 63.0 MiB
Cost (excluding gas): 0.011 WAL (storage was purchased, and a new blob object was registered)
Expiry epoch (exclusive): 128
Encoding type: RedStuff/Reed-Solomon

Summary for Modified or Created Blobs (1 newly certified)
Total encoded size: 63.0 MiB
Total cost: 0.011 WAL
```
Aqui podemos encontrar o ID do nosso arquivo na seção **Blob ID:**. Neste caso, para meu arquivo é `OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA`. Você deveria ter um ID diferente.

> :information_source: Lembre-se que no Sui tudo manejamos com objetos, e cada objeto tem seu ID. Os blobs ou arquivos no Walrus não são exceção.

Podemos fazer várias coisas com este arquivo, podemos verificar seu status:
```sh
walrus blob-status --blob-id OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA
```

Obteriamos algo similar a isto:
```sh
There is a certified permanent Blob object for blob ID OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA.
Expiry epoch: 128
Estimated expiry timestamp: 2025-08-08T20:38:08.446+00:00
Related event: (tx: mFDQGtWRy7uy5sDwq3iwut8JyhsvhQcMHUwdLf3BvGe, seq: 0)
Initially certified in epoch: 127
```

Podemos baixá-lo usando:
```sh
walrus read OG2-BgMGF-g5dpf08jLCr1I02WH95fjm0b4ztKGJ6DA --out Decodificado.txt # Você pode colocar o nome de arquivo que quiser
```

Ou podemos compartilhá-lo para que qualquer um possa baixá-lo:
```sh
walrus share --blob-obj-id 0xbdf0e74c402d8517101a81753439a56fb75364e4ec77a19c4266726534dfb720
```

Note que para este comando estamos usando o **Object ID** e não o **Blob ID**. Este Object ID você encontra no output quando subiu o arquivo ou consultando o status do blob.

```sh
Success: The blob has been shared, object id: 0x43c35e51dd664211d8a9efb71af63c0be5d9f095a29e067ba63509c60f3e6a9c
```

Você pode consultar a documentação oficial para mais casos de uso aqui: https://docs.wal.app/usage/client-cli.html