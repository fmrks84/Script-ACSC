/*select 
cd_atendimento,
nm_paciente,
cd_reg_fat,
cd_gru_fat,
ds_gru_fat,
count(*)Total_lanc_grupo_faturamento
from
(
select 
a.cd_atendimento,
f.nm_paciente,
b.cd_reg_fat,
b.cd_gru_fat,
d.ds_gru_fat,
b.cd_pro_fat,
c.ds_pro_fat,
b.qt_lancamento,
b.sn_pertence_pacote
from reg_fat a 
inner join itreg_fat b on b.cd_reg_fat = a.cd_reg_fat
inner join pro_Fat c on c.cd_pro_fat = b.cd_pro_fat
inner join gru_fat d on d.cd_gru_fat = b.cd_gru_fat
inner join atendime e on e.cd_atendimento = a.cd_atendimento
inner join paciente f on f.cd_paciente = e.cd_paciente
where a.cd_convenio = 862
and b.cd_gru_fat in (4,5,9)
--and a.cd_reg_fat = 329767
order by a.cd_reg_fat,
         b.cd_gru_fat
         
)
group by 
cd_atendimento,
nm_paciente,
cd_reg_fat,
cd_gru_fat,
ds_gru_fat
order by 2
--select * from gru_fat 

;*/

select 
a.cd_atendimento,
f.nm_paciente,
b.cd_reg_fat,
b.cd_gru_fat,
d.ds_gru_fat,
b.cd_pro_fat,
c.ds_pro_fat,
b.qt_lancamento,
b.sn_pertence_pacote
from reg_fat a 
inner join itreg_fat b on b.cd_reg_fat = a.cd_reg_fat
inner join pro_Fat c on c.cd_pro_fat = b.cd_pro_fat
inner join gru_fat d on d.cd_gru_fat = b.cd_gru_fat
inner join atendime e on e.cd_atendimento = a.cd_atendimento
inner join paciente f on f.cd_paciente = e.cd_paciente
where a.cd_convenio = 862
and b.cd_gru_fat in (4,5,9)
order by nm_paciente

