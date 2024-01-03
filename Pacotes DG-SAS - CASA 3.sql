-- 32152 - PRO_FAT
-- 194017 - GRU_PRO

SELECT
DISTINCT 
DECODE (A.CD_MULTI_EMPRESA,3,'CSSJ',4,'HST',7,'HSC',10,'HSJ',25,'HCNSC')CASA,
CONV.CD_CONVENIO,
CONV.NM_CONVENIO,
A.CD_PACOTE,
TS.CD_TUSS,
A.CD_PRO_FAT,
C.DS_PRO_FAT,
A.CD_PRO_FAT_PACOTE,
C1.DS_PRO_FAT,
'----------->>>'EXCECAO_PACOTE,
B.CD_GRU_PRO,
GP.DS_GRU_PRO,
B.CD_PRO_FAT,
B.CD_SETOR,
B.CD_TIP_ACOM,
'---------->>>'EXCECAO_VALORES,
XCONV.DT_VIGENCIA,
XCONV.SN_ATIVO,
XCONV.CD_REGRA,
XCONV.VL_TAB_CONVENIO
FROM 
PACOTE A
INNER JOIN PACOTE_EXCECAO B ON B.CD_PACOTE = A.CD_PACOTE
INNER JOIN PRO_FAT C ON C.CD_PRO_FAT = A.CD_PRO_FAT
INNER JOIN PRO_FAT C1 ON C1.CD_PRO_FAT = A.CD_PRO_FAT_PACOTE
INNER JOIN CONVENIO CONV ON CONV.CD_CONVENIO = A.CD_CONVENIO
INNER JOIN GRU_PRO GP ON GP.CD_GRU_PRO = B.CD_GRU_PRO
INNER JOIN TUSS TS ON TS.CD_TUSS = A.CD_PRO_FAT
LEFT JOIN TAB_CONVENIO XCONV ON XCONV.CD_CONVENIO = A.CD_CONVENIO AND XCONV.CD_PRO_FAT = A.CD_PRO_FAT
WHERE  A.CD_MULTI_EMPRESA in (3,4,7)
AND A.DT_VIGENCIA_FINAL IS NULL
--AND A.CD_CONVENIO = 104
--AND C1.DS_PRO_FAT LIKE '%DIARIA%GLOBAL%'
ORDER BY 1,2
;

--SELECT * FROM TAB_CONVENIO WHERE CD_CONVENIO = 104 AND CD_PRO_FAT IN (60000511,60000775,60000929,60001038)
