/*\*create or replace view acsc_vw_xml_regime_internacao as
(*\
select conv.cd_hospital_no_convenio||'-'||
case when a.cd_tipo_internacao in (1,2,3,4,31,32) then '01'
     when a.cd_tipo_internacao in (27) then '05'
       when a.cd_tipo_internacao in (28) then '04'
         when a.cd_tipo_internacao in (29) then '18'
          when a.cd_tipo_internacao in (26) then '03'
           end regime_internacao,
           a.cd_atendimento
from atendime a 
inner join empresa_convenio conv on conv.cd_convenio = a.cd_convenio
and conv.cd_multi_empresa = a.cd_multi_empresa
where 1 = 1 --a.cd_Atendimento = 5186453
--);


select x.regime_internacao from acsc_vw_xml_regime_internacao x where x.cd_atendimento = :par3 

select * from tiss_guia where cd_atendimento = 4782848

select x.regime_internacao from acsc_vw_xml_regime_internacao x where x.cd_atendimento = 4782887
---select * from atendime where cd_atendimento = 5186453

*/

create or replace view acsc_vw_xml_regime_internacao as
(
select 
distinct
econv.cd_hospital_no_convenio||'-'||
case when atd.tp_atendimento = 'I' then '1'
     end reg_atd,
     rm.cd_remessa
from 
dbamv.remessa_fatura rm 
inner join dbamv.reg_fat rg on rg.cd_remessa = rm.cd_remessa
inner join dbamv.fatura ft on ft.cd_fatura = rm.cd_fatura
inner join dbamv.atendime atd on atd.cd_atendimento = rg.cd_atendimento
inner join dbamv.empresa_convenio econv on econv.cd_convenio = atd.cd_convenio
where rm.dt_prevista_para_pgto is not null

union all

select 
distinct
econvx.cd_hospital_no_convenio||'-'||
case when atdx.tp_atendimento = 'U' then '3'
     when atdx.tp_atendimento = 'A' then '5'
     when atdx.tp_atendimento = 'E' then '2'
     end reg_atd,
     rmx.cd_remessa
from 
dbamv.remessa_fatura rmx 
inner join dbamv.reg_amb ramb on ramb.cd_remessa = rmx.cd_remessa
inner join dbamv.itreg_amb iramb on iramb.cd_reg_amb = ramb.cd_reg_amb
inner join dbamv.fatura ftx on ftx.cd_fatura = rmx.cd_fatura
inner join dbamv.atendime atdx on atdx.cd_atendimento = iramb.cd_atendimento
inner join dbamv.empresa_convenio econvx on econvx.cd_convenio = atdx.cd_convenio
where rmx.dt_prevista_para_pgto is not null
);



select x.reg_atd from acsc_vw_xml_regime_internacao x where x.cd_remessa = :par5 
/*
E - 2 
I - 1
U - 3
A - 5
*/

--select * from empresa_convenio where cd_convenio in (99,42,41,139,181)
