SELECT
'INTERNADO'TP_ATEND,
--D.CD_CONVENIO||' - '||E.NM_CONVENIO NM_CONVENIO,
D.CD_ATENDIMENTO,
D.DT_ATENDIMENTO,
A.NM_EXA_LAB,
A.NM_MNEMONICO,
A.CD_PRO_FAT ,
B.QT_LANCAMENTO,
NVL(B.VL_UNITARIO,0)VL_UNITARIO,
NVL(B.VL_TOTAL_CONTA,0)VL_TOTAL_CONTA
FROM EXA_LAB A
INNER JOIN ITREG_FAT B ON B.CD_PRO_FAT = A.CD_PRO_FAT
INNER JOIN REG_FAT C ON C.CD_REG_FAT = B.CD_REG_FAT
INNER JOIN ATENDIME D ON D.CD_ATENDIMENTO = C.CD_ATENDIMENTO AND D.CD_CONVENIO = C.CD_CONVENIO
INNER JOIN CONVENIO E ON E.CD_CONVENIO = D.CD_CONVENIO
WHERE A.NM_MNEMONICO IN ('ALUR','AMINPL','AMINUR','FUNGMIC3','ANTIBANA',
'SM-RNP','ARSEN','CAURISO','CAUR','CITOBLIQ','AVIDCITO','TCRCF','TCRPCR','CLORDIAZ','COBALTO',
'CIM','CRHFACTH','CROMO','CROMUR','WUR3JURG','CONFCYP21','POLIOMABKPCR','ENTERORNALCR','ESTANHO',
'FLURAZEP','QHHV7PCR','MERCURIO','PLAQCONURG','AVIDRUB','FISHSMDLMA','AVIDTOXO','COLPONCO','FISHPHMD','FISHPHSG','FISHXYMD','FISHXYSG','FISHEWS','FISHFKHR' 
,'FISHMLL','FISHCHIC2','FISHM3MD','FISHM3SG','FISHSYT','FISHSMDLMA'  
,'FUNGMIC3','ANTIBANA','ANTIB','CROMUR','CLORDIAZ','FLURAZEP','BENZUR','BROMAZEP','DIAZEPAM',	
'FLURAZEP',	'OXAZEPAM',	'TCRCF','TCRPCR','CITOBLIQ','COLPONCO',	
'RUBIGG','AVIDRUB','ARSEN','ARSENUR','CADMIO','CADMIOUR','COBALTO',	
'ESTANHO','MANGANUR','MERCURUR','MERCURIO','NIQUEL','NIQUELUR','ALUR',
'QUELAL','AL','CYP21','CONFCYP21','POLIOMABKPCR','ENTERORNALCR','CPMPDNA',
'QHHV7PCR','HHV6PCR','CRHFACTH','CROMO')
AND D.CD_CONVENIO IN (4,37,40,54,207/*,208,210,485,822*/,862)
AND trunc(D.DT_ATENDIMENTO) BETWEEN '01/10/2021' AND '31/10/2022'

UNION ALL

SELECT
'AMB/URG/EXT'TP_ATEND,
--D.CD_CONVENIO||' - '||E1.NM_CONVENIO NM_CONVENIO,
D.CD_ATENDIMENTO,
D.DT_ATENDIMENTO,
A.NM_EXA_LAB,
A.NM_MNEMONICO,
A.CD_PRO_FAT ,
B1.QT_LANCAMENTO,
NVL(B1.VL_UNITARIO,0)VL_UNITARIO,
NVL(B1.VL_TOTAL_CONTA,0)VL_TOTAL_CONTA

FROM
EXA_LAB A
INNER JOIN ITREG_AMB B1 ON B1.CD_PRO_FAT = A.CD_PRO_FAT
INNER JOIN ATENDIME D ON D.CD_ATENDIMENTO = B1.CD_ATENDIMENTO AND D.CD_CONVENIO = B1.CD_CONVENIO
INNER JOIN CONVENIO E1 ON E1.CD_CONVENIO = D.CD_CONVENIO
WHERE A.NM_MNEMONICO IN ('ALUR','AMINPL','AMINUR','FUNGMIC3','ANTIBANA',
'SM-RNP','ARSEN','CAURISO','CAUR','CITOBLIQ','AVIDCITO','TCRCF','TCRPCR','CLORDIAZ','COBALTO',
'CIM','CRHFACTH','CROMO','CROMUR','WUR3JURG','CONFCYP21','POLIOMABKPCR','ENTERORNALCR','ESTANHO',
'FLURAZEP','QHHV7PCR','MERCURIO','PLAQCONURG','AVIDRUB','FISHSMDLMA','AVIDTOXO','COLPONCO','FISHPHMD','FISHPHSG','FISHXYMD','FISHXYSG','FISHEWS','FISHFKHR' 
,'FISHMLL','FISHCHIC2','FISHM3MD','FISHM3SG','FISHSYT','FISHSMDLMA'  
,'FUNGMIC3','ANTIBANA','ANTIB','CROMUR','CLORDIAZ','FLURAZEP','BENZUR','BROMAZEP','DIAZEPAM',	
'FLURAZEP',	'OXAZEPAM',	'TCRCF','TCRPCR','CITOBLIQ','COLPONCO',	
'RUBIGG','AVIDRUB','ARSEN','ARSENUR','CADMIO','CADMIOUR','COBALTO',	
'ESTANHO','MANGANUR','MERCURUR','MERCURIO','NIQUEL','NIQUELUR','ALUR',
'QUELAL','AL','CYP21','CONFCYP21','POLIOMABKPCR','ENTERORNALCR','CPMPDNA',
'QHHV7PCR','HHV6PCR','CRHFACTH','CROMO')
AND D.CD_CONVENIO IN (4,37,40,54,207/*,208,210,485,822*/,862)
AND trunc(D.DT_ATENDIMENTO) BETWEEN '01/10/2021' AND '31/10/2022'
ORDER BY 2,1



