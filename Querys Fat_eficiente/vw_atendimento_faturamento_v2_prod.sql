--CREATE OR REPLACE VIEW ENSEMBLE.VW_ATENDIMENTO_FATURAMENTO AS
SELECT atendime.cd_atendimento,
        atendime.cd_paciente,
        paciente.nm_paciente,
        atendime.cd_convenio,
        convenio.nm_convenio,
        atendime.cd_con_pla,
        con_pla.ds_con_pla,
        atendime.cd_sub_plano,
        sub_plano.ds_sub_plano,
       -- ensemble.fnc_data_hora(atendime.dt_atendimento, atendime.hr_atendimento) dh_atendimento,
        decode(tp_atendimento,'I','INTERNACAO','U','PRONTO_SOCORRO','E','EXAMES','A','CONSULTA')tp_Atendimento,
        atendime.cd_multi_empresa cd_prestador, -- adicionado
        multi_empresas.ds_multi_empresa nm_prestador,
        atendime.nr_carteira,
        atendime.dt_validade,
     --   ensemble.fnc_data_hora(atendime.dt_alta, atendime.hr_alta) dh_alta,
        case when atendime.tp_atendimento = 'I' then 'INTERNACAO' when atendime.tp_atendimento in ('U','E') then 'SADT' WHEN atendime.tp_atendimento in ('C','A') then 'CONSULTA' END tp_guia,
        case when atendime.tp_carater_internacao in ('E',null) then 'ELETIVO' else 'URGENCIA_EMERGENCIA'end carater_Atendimento,
        case when atendime.cd_tipo_internacao in (1,3) then 'CLINICA'
             when atendime.cd_tipo_internacao in (2,4,26,27,28,29,32) then 'CIRURGICA'
             when atendime.cd_tipo_internacao in (31) then 'OBSTETRICA' end tp_internacao,
        case when atendime.cd_tip_acom in (3,4,61) then 'HOSPITAL_DIA' else 'HOSPITALAR' end regime_Internacao,
        case when (SYSDATE - paciente.dt_nascimento) <= 28 then 'TRUE' else 'false' end atendimento_RN,
        atendime.cd_multi_empresa,
        atendime.cd_guia, --- alterado 16/03/2021
        atendime.cd_ori_ate cd_orig_atend, -- incluido 09/06/2021
        ori_ate.ds_ori_ate ds_orig_atend -- incluido 09/06/2021
   FROM dbamv.atendime,
        dbamv.paciente,
        dbamv.prestador,
        dbamv.convenio,
        dbamv.con_pla,
        dbamv.sub_plano,
        dbamv.multi_empresas,
        dbamv.ori_ate 
WHERE convenio.tp_convenio = 'C'
  AND atendime.cd_convenio = convenio.cd_convenio
  AND paciente.cd_paciente = atendime.cd_paciente
  AND prestador.cd_prestador = atendime.cd_prestador
  AND convenio.cd_convenio = con_pla.cd_convenio
  AND con_pla.cd_convenio = sub_plano.cd_convenio(+)
  AND con_pla.cd_con_pla = sub_plano.cd_con_pla(+)
  AND atendime.cd_sub_plano = sub_plano.cd_sub_plano(+)
  AND atendime.cd_con_pla = con_pla.cd_con_pla
  and atendime.cd_multi_empresa = multi_empresas.cd_multi_empresa
  and ori_ate.cd_ori_ate = atendime.cd_ori_ate
  and atendime.cd_atendimento = 2966204--;
  
  

