# Imagem com python, jupyter, etc
FROM jupyter/scipy-notebook:latest

# Copia as dependências para dentro do container
COPY requirements.txt /tmp/

# Atualiza o pip e instala os pacotes do requirements
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

# Define o diretório de trabalho no container
WORKDIR /home/jovyan/work