# ML-Workspace FORK para Desenvolvedores Python
## Propósito Original
O ML workspace é uma IDE web baseada em um só lugar especializada em machine learning e ciência de dados. É simples de implantar e começa em minutos para construir soluções ML de forma produtiva nas suas próprias máquinas. Este workspace é a ferramenta definitiva para desenvolvedores, pré-instalado com uma variedade de bibliotecas populares de ciência de dados (ex.: Tensorflow, PyTorch, Keras, Sklearn) e ferramentas de desenvolvimento (ex.: Jupyter, VS, Code, Tensorboard) configuradas, otimizadas e integradas perfeitamente.

## Propósito deste repositório
Este repositório usa a base do ML-Workspace para gerar uma imagem pronta para uso para desenvolvimento em Python. 
As alterações em relação ao propósito original são as atualizações de bibliotecas, permitir que a construção seja feita via Docker Compose, usar imagens oficiais do CUDA e diminuir a quantidade de pacotes no env base.

## Como usar?
Para usar esta imagem, você pode simplesmente usar o Docker Compose.
```bash
docker compose up -d 
```

## Como buildar?

```bash
export TAG=-$(git rev-parse --abbrev-ref HEAD)
docker compose build
```

Ao executar o compose, verifique os volumes necessários dentro do arquivo docker-compose para não excluir nada indesejado.
Ao executar, crie um hash para acessar a página e coloque-o na variável de ambiente: AUTHENTICATE_VIA_JUPYTER .

Recomendo usar o Conda e o workspace em um ambiente separado para reduzir o tamanho do pod, para isso, apenas copie as pastas Conda e workspace da imagem e coloque-as em um local que você tenha espaço.

### Copiar ambinete conda para pasta no host
```bash
docker cp ml-workspace:/opt/conda /mnt/ssds/SSD_1/mltooling/conda
docker cp ml-workspace:/root/workspace /mnt/ssds/SSD_1/mltooling/jupyter-data
```

## Se erro no VNC

Reinicie o VNC.
Limpe os caches do navegador.