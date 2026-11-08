# Análise de Despesas de Operadoras de Saúde — ANS

Projeto de análise de dados públicos da Agência Nacional de Saúde Suplementar (ANS), utilizando MySQL 8 para relacionar operadoras cadastradas e demonstrativos contábeis.

## Objetivos
- Modelar tabelas para cadastro de operadoras e dados contábeis.
- Importar arquivos CSV disponibilizados pela ANS.
- Identificar operadoras com maiores despesas assistenciais no trimestre mais recente presente na base.
- Comparar as maiores despesas acumuladas no ano de 2024.

## Tecnologias
MySQL 8.0+, SQL, JOIN, agregações, GROUP BY, subqueries e filtros por período.

## Estrutura esperada
```
ans/       # cadastro de operadoras (CSV)
gov/       # demonstrativos contábeis por trimestre/ano
queries/
  criar_schema.sql
  importar_dados.sql
  despesas_ultimo_trimestre.sql
  despesas_ano_2024.sql
```

## Ordem de execução
1. Execute `queries/criar_schema.sql`.
2. Ajuste os caminhos dos CSVs em `queries/importar_dados.sql` para o diretório permitido pelo MySQL.
3. Importe os dados executando `queries/importar_dados.sql`.
4. Execute `queries/despesas_ultimo_trimestre.sql` para o ranking agregado do trimestre mais recente na base.
5. Execute `queries/despesas_ano_2024.sql` para o ranking anual de 2024.

Conecte-se ao servidor com:

```bash
mysql -u root -p
```

No prompt SQL, execute cada arquivo com `SOURCE /caminho/para/arquivo.sql;`.

## Critérios das consultas
As consultas consideram registros cuja descrição corresponde a eventos/sinistros conhecidos ou avisados de assistência médico-hospitalar e cujo saldo final é positivo. A consulta trimestral soma os valores por operadora durante todo o trimestre mais recente identificado pela maior competência disponível, não apenas a última competência mensal.

## Observações
- A importação com `LOAD DATA INFILE` depende das permissões e do diretório configurado em `secure_file_priv`.
- Os caminhos dos arquivos CSV variam conforme o sistema operacional e a instalação.
- Valide a competência e a atualização da base antes de interpretar os resultados.
