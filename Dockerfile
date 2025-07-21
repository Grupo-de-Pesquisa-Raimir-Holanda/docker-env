# Base: jupyter/scipy-notebook com Python e libs científicas
FROM jupyter/scipy-notebook:latest

# Instala o OpenJDK 21 (ou versão estável disponível)
USER root

RUN apt-get update && apt-get install -y openjdk-21-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Volta para o usuário jovyan (padrão do Jupyter)
USER $NB_UID

# Copia o requirements para dentro do container
COPY requirements.txt /tmp/

# Atualiza pip e instala os pacotes do requirements
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

# Define o diretório de trabalho
WORKDIR /home/jovyan/work
