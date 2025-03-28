SELECT 
    o.razao_social,
    o.registro_ans,
    SUM(d.vl_saldo_final) as valor_despesa_anual,
    YEAR(MAX(d.data_competencia)) as ano
FROM dados_governo d
JOIN operadoras_ans o ON d.reg_ans = o.registro_ans
WHERE YEAR(d.data_competencia) = 2024
AND REGEXP_REPLACE(UPPER(TRIM(d.descricao)), '\\s+', ' ') LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
AND d.vl_saldo_final > 0
GROUP BY o.razao_social, o.registro_ans
ORDER BY valor_despesa_anual DESC
LIMIT 10; 