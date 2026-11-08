-- Soma as despesas assistenciais de todo o trimestre mais recente disponível.
-- O período é derivado da maior data_competencia existente na tabela.

WITH ultima_competencia AS (
    SELECT MAX(data_competencia) AS data_maxima
    FROM dados_governo
),
periodo AS (
    SELECT
        DATE_ADD(
            MAKEDATE(YEAR(data_maxima), 1),
            INTERVAL ((QUARTER(data_maxima) - 1) * 3) MONTH
        ) AS inicio_trimestre,
        DATE_ADD(
            DATE_ADD(
                MAKEDATE(YEAR(data_maxima), 1),
                INTERVAL ((QUARTER(data_maxima) - 1) * 3) MONTH
            ),
            INTERVAL 3 MONTH
        ) AS fim_trimestre
    FROM ultima_competencia
)
SELECT
    o.razao_social,
    o.registro_ans,
    SUM(d.vl_saldo_final) AS valor_despesa_trimestral,
    YEAR(p.inicio_trimestre) AS ano,
    QUARTER(p.inicio_trimestre) AS trimestre
FROM dados_governo AS d
JOIN operadoras_ans AS o
    ON d.reg_ans = o.registro_ans
CROSS JOIN periodo AS p
WHERE d.data_competencia >= p.inicio_trimestre
  AND d.data_competencia < p.fim_trimestre
  AND UPPER(TRIM(d.descricao)) LIKE
      '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
  AND d.vl_saldo_final > 0
GROUP BY
    o.razao_social,
    o.registro_ans,
    p.inicio_trimestre
ORDER BY valor_despesa_trimestral DESC
LIMIT 10;
