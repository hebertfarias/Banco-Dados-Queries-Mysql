# Análise de Despesas de Operadoras de Saúde

Este projeto consiste em uma análise de despesas de operadoras de saúde, utilizando dados da ANS e do governo. O projeto inclui scripts SQL para criar o banco de dados, importar dados e realizar análises específicas.

## Estrutura do Projeto

```
.
├── ans/
│   └── Relatorio_cadop.csv
├── gov/
│   ├── 2023/
│   │   ├── 1T2023.csv
│   │   ├── 2t2023.csv
│   │   ├── 3T2023.csv
│   │   └── 4T2023.csv
│   └── 2024/
│       ├── 1T2024.csv
│       ├── 2T2024.csv
│       ├── 3T2024.csv
│       └── 4T2024.csv
└── queries/
    ├── criar_schema.sql
    ├── importar_dados.sql
    ├── despesas_ultimo_trimestre.sql
    └── despesas_ano_2024.sql
```

## Pré-requisitos

- MySQL Server 8.0 ou superior
- Docker (opcional, para execução em container)

## Instruções de Execução

### Opção 1: Execução Local

1. **Instalar MySQL Server**
   - Windows: Baixe e instale o MySQL Server do [site oficial](https://dev.mysql.com/downloads/mysql/)
   - Linux: `sudo apt-get install mysql-server`
   - Mac: `brew install mysql`

2. **Iniciar o MySQL Server**
   - Windows: O serviço deve iniciar automaticamente
   - Linux: `sudo systemctl start mysql`
   - Mac: `brew services start mysql`

3. **Configurar o diretório de arquivos**
   - Copie todos os arquivos CSV para o diretório de importação do MySQL:
     - Windows: `C:\ProgramData\MySQL\MySQL Server 8.0\Data\db_desafio_hebert`
     - Linux/Mac: `/var/lib/mysql-files`

4. **Executar os scripts SQL através do bash**
   ```bash
   # Conectar ao MySQL
   mysql -u root -p

   Executar os scripts na ordem:
   source /caminho/para/queries/criar_schema.sql
   source /caminho/para/queries/importar_dados.sql
   source /caminho/para/queries/despesas_ultimo_trimestre.sql
   source /caminho/para/queries/despesas_ano_2024.sql
   ```
 OU

 4. **Executar os scripts diretamente em um gerenciador de banco de dados a sua escolha, ex: MySQL Workbench**

Executar os scripts na ordem:
```
   ./queries/criar_schema.sql
   ./queries/importar_dados.sql
   ./queries/despesas_ultimo_trimestre.sql
   ./queries/despesas_ano_2024.sql
```

### Opção 2: Execução com Docker

1. **Criar um arquivo docker-compose.yml**
   ```yaml
   version: '3.8'
   services:
     mysql:
       image: mysql:8.0
       environment:
         MYSQL_ROOT_PASSWORD: sua_senha
       ports:
         - "3306:3306"
       volumes:
         - ./ans:/var/lib/mysql-files/ans
         - ./gov:/var/lib/mysql-files/gov
         - ./queries:/docker-entrypoint-initdb.d
   ```

2. **Iniciar o container**
   ```bash
   docker-compose up -d
   ```

3. **Executar os scripts**
   ```bash
   docker exec -it nome_do_container mysql -uroot -psua_senha -e "source /docker-entrypoint-initdb.d/criar_schema.sql"
   docker exec -it nome_do_container mysql -uroot -psua_senha -e "source /docker-entrypoint-initdb.d/importar_dados.sql"
   docker exec -it nome_do_container mysql -uroot -psua_senha -e "source /docker-entrypoint-initdb.d/despesas_ultimo_trimestre.sql"
   docker exec -it nome_do_container mysql -uroot -psua_senha -e "source /docker-entrypoint-initdb.d/despesas_ano_2024.sql"
   ```

## Ordem de Execução dos Scripts

1. `criar_schema.sql`: Cria o banco de dados e as tabelas necessárias
2. `importar_dados.sql`: Importa os dados dos arquivos CSV para as tabelas
3. `despesas_ultimo_trimestre.sql`: Analisa as 10 operadoras com maiores despesas no último trimestre
4. `despesas_ano_2024.sql`: Analisa as 10 operadoras com maiores despesas no ano de 2024

## Resultados

Os scripts irão gerar dois resultados:
1. As 10 operadoras com maiores despesas no último trimestre (4T2024)
2. As 10 operadoras com maiores despesas no ano de 2024

## Observações

- Certifique-se de que todos os arquivos CSV estão presentes nos diretórios corretos antes de executar os scripts
- Em ambiente Windows, pode ser necessário ajustar os caminhos dos arquivos nos scripts SQL
- Para execução em Docker, os arquivos CSV devem estar nos diretórios corretos conforme especificado no docker-compose.yml 