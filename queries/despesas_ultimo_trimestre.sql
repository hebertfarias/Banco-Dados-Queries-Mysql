SELECT 
    o.razao_social,
    o.registro_ans,
    d.vl_saldo_final as valor_despesa,
    d.descricao
FROM dados_governo d
JOIN operadoras_ans o ON d.reg_ans = o.registro_ans
WHERE d.data_competencia = (
    SELECT MAX(data_competencia) 
    FROM dados_governo
)
AND REGEXP_REPLACE(UPPER(TRIM(d.descricao)), '\\s+', ' ') LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
AND d.vl_saldo_final > 0
ORDER BY d.vl_saldo_final DESC
LIMIT 10; 