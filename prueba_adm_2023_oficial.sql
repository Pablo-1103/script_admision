/*
PARA LIMIPAR LOS ARCHIVOS Y TODO LO REFERENTE AL 2023

delete from dbo.archivoA2023_oficial
delete from dbo.archivoB2023_oficial
delete from dbo.archivoC2023_oficial
delete from dbo.archivoE2023_oficial
delete from dbo.archivoE2023_bea_oficial
delete from dbo.archivoE2023_pace_oficial
delete from dbo.archivoH2023_oficial
delete from dbo.archivoI2023_oficial
delete from sayd.colegios_2023
delete from sayd.colegios where ano_proc=2023
delete from sayd.admis_resul_umag_psu_2023
delete from sayd.admin_post_umag_psu where ano_proc=2023
delete from sayd.admin_post_umag_psu_bea where ano_proc=2023
delete from sayd.admin_post_umag_psu_pace where ano_proc=2023
delete from sayd.pueblos_originarios_2023
delete from sayd.superior_notas_2023
*/

select * from dbo.archivoC2023_oficial where CODIGO_REGION=12 and PROMEDIO_CM_MAX>799

--delete from sayd.admis_resul_umag_psu_2023 --
--delete from sayd.colegios_2023 --5536 

select * from dbo.archivoA2023_oficial --5564 filas 
select * from dbo.archivoB2023_oficial --296812 filas
select * from dbo.archivoC2023_oficial --296812 filas
select * from dbo.archivoE2023_oficial --2090 filas
select * from dbo.archivoE2023_bea_oficial --0 filas
select * from dbo.archivoE2023_pace_oficial --33 filas
select * from dbo.archivoH2023_oficial --38556 filas
select * from dbo.archivoI2023_oficial --91506 filas
select * from sayd.admin_post_umag_psu order by ano_proc desc
select * from sayd.admin_post_umag_psu_bea order by ano_proc desc
select * from sayd.admin_post_umag_psu_pace order by ano_proc desc
select * from sayd.admis_resul_umag_psu_2021
select * from sayd.colegios order by ano_proc desc --ingresado los colegios que no estaban desde colegios_2023
select * from sayd.colegios_2021
select * from sayd.admis_resul_umag_psu_2021
select * from sayd.admis_resul_umag_psu_2022
select * from sayd.colegios_2022
select * from sayd.colegios_2023 --5564 filas
--DELETE FROM sayd.colegios_2023
select * from sayd.colegios where ano_proc=2023 --23 filas
select * from sayd.admis_resul_umag_psu_2023 --296812 filas
--DELETE FROM sayd.admis_resul_umag_psu_2023
select * from sayd.admin_post_umag_psu where ano_proc=2023
select * from sayd.admin_post_umag_psu_pace where ano_proc=2023
select * from sayd.admin_post_umag_psu_bea where ano_proc=2023
select * from sayd.pueblos_originarios_2023 --de dbo.archivoH2023_oficial a sayd.pueblos_originarios_2023
select * from sayd.superior_notas_2023 --de dbo.archivoI2023_oficial a sayd.superior_notas_2023

SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%admin_post_umag_psu_pace%'  
SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%admin_post_umag_psu_bea'
SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%admin_post_umag_psu'
SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%admis_resul_umag_psu_2023'    
SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%colegios%'  
SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%colegios_2023%'
SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%pueblos_originarios_2023%'  
SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME like '%superior_notas_2023%'
-----------------------------------------------------------------------------------------
/*archivoA2023_oficial en colegios_2023 y colegios*/


select * from dbo.archivoA2023_oficial --5536 filas
--delete from dbo.archivoA2023_oficial

select * from sayd.colegios_2023 --5536 filas
--delete from sayd.colegios_2023

select * from sayd.colegios_2022 --(5778 o 5822) filas
--delete from sayd.colegios_2022


select * from sayd.colegios_2021 --5795 filas
--delete from sayd.colegios_2021

select * from sayd.colegios where ano_proc>2019

--insertar en colegios 2023
/*
insert into sayd.colegios_2023 (local_educ, unid_educ, ano_proc, nombre, codregion, codprov, codcomuna, codpostal,
fono,fax, email, direccion, cod_rama, cod_regimen, cod_dep_col, cod_grup_dep, pm, pf, pt, um, uf, ut, director, orientador, 
relacionador, rbd, codensenanza)
(select LOCAL_EDUCACIONAL, UNIDAD_EDUCATIVA, ANYO_PROCESO, NOMBRE_OFICIAL, CODIGO_REGION, CODIGO_PROVINCIA, CODIGO_COMUNA,
CODIGO_POSTAL, FONO_PRINCIPAL, FAX, EMAIL, DIRECCION, RAMA_EDUCACIONAL, REGIMEN, DEPENDENCIA, GRUPO_DEPENDENCIA, null,
null,null,null,null,null,null,null,null, RBD, COD_ENS
  from dbo.archivoA2023_oficial)
  
  */
  
  --colegios que hay que agregar (pasar de colegios_2023 a colegios)
 SELECT local_educ FROM sayd.colegios_2023
 EXCEPT
 SELECT local_educ FROM sayd.colegios

 select * from 
 (SELECT count(local_educ) as contador, local_educ  FROM sayd.colegios_2023 group by local_educ) a
  where a.contador > 1
  
  select distinct local_educ from sayd.colegios

select * from sayd.colegios where ano_proc in (2021,2022,2023,2020) order by ano_proc

6895,6945,7026,7053,7057,7124,7212,7224,7225,7229,7232,7233,7238,7239,7246,7334,7414,7453,7454,7457,7458,7459,7530

/*

INSERT INTO sayd.colegios ([local_educ], [unid_educ], [ano_proc], [nombre], [codregion], [codprov], [codcomuna], 
 [codpostal], [disdirecto], [fono], [fax], [email], [direccion], [cod_rama], [cod_regimen], [cod_dep_col], [cod_grup_dep], 
 [mpcm], [mpcf], [mpct], [mucm], [mucf], [muct], [director], [orientador], [relacionador], [pnc], [pmnc])
SELECT [local_educ]
      ,[unid_educ]
      ,[ano_proc]
      ,[nombre]
      ,[codregion]
      ,[codprov]
      ,[codcomuna]
      ,[codpostal]
      ,'00' AS disdirecto
      ,[fono]
      ,[fax]
      ,[email]
      ,[direccion]
      ,[cod_rama]
      ,[cod_regimen]
      ,[cod_dep_col]
      ,[cod_grup_dep]
      ,'' as mpcm
      ,'' as mpcf
      ,'' as mpct
      ,'' as mucm
      ,'' as mucf
      ,'' as muct
      ,'' as director
      , NULL as orientador
      , NULL as relacionador
      ,NULL AS PNC
      ,NULL AS PMNC
FROM (
SELECT ROW_NUMBER() OVER(ORDER BY c2023.local_educ) AS Row_Number ,* FROM sayd.colegios_2023 c2023 
WHERE NOT EXISTS (SELECT 1 FROM sayd.colegios c WHERE c.local_educ=c2023.local_educ) ) a
WHERE A.Row_Number NOT IN (0)

*/

/*fin archivoA2023_oficial*/

------------------------------------------------------------------------------------------
/*archivoB2023_oficial y archivoC2023_oficial en admis_resul_umag_psu_2023*/

select * from sayd.admis_resul_umag_psu_2022
select * from sayd.admis_resul_umag_psu_2023

select SUM(PROMEDIO_CM_MAX) from archivoC2023_oficial 
SELECT SUM(PROM_LM) AS suma_promedio_lm FROM sayd.admis_resul_umag_psu_2023

select * from dbo.archivoB2023_oficial -- 286241 filas
--delete from dbo.archivoB2023_oficial

select * from dbo.archivoC2023_oficial -- 286241 filas
--delete from dbo.archivoC2023_oficial

--ESTAN EN B Y NO EN C --0 FILAS
select NUMERO_DOCUMENTO from dbo.archivoB2023_oficial 
except
select NUMERO_DOCUMENTO from dbo.archivoC2023_oficial 

--ESTAN EN C Y NO EN B -- 0 FILAS
select NUMERO_DOCUMENTO from dbo.archivoC2023_oficial
except
select NUMERO_DOCUMENTO from dbo.archivoB2023_oficial


--select * from dbo.archivoB2023_oficial where NUMERO_DOCUMENTO like '%21631826%'

--select * from dbo.archivoC2023_oficial where NUMERO_DOCUMENTO like '%21631826%'


ALTER TABLE sayd.admis_resul_umag_psu_2023 ALTER COLUMN PROM_lm int
ALTER TABLE sayd.admis_resul_umag_psu_2023 ALTER COLUMN PROM_lm decimal(10,2)
ALTER TABLE sayd.admis_resul_umag_psu_2023 ALTER COLUMN prom_nem decimal(5,2) 

--consulta para insertar info de B (en este caso B) y C a admis_resul_umag_psu_2022
INSERT  INTO sayd.admis_resul_umag_psu_2023
        ( tipo_iden ,
          rut_ins ,
          rut_normal ,
          ano_proc ,
          paterno ,
          materno ,
          nombres ,
          cod_nacion ,
          cod_sexo ,
          loca_educ ,
          unid_educ ,
          cod_region ,
          cod_prov ,
          ano_egreso ,
          fecha_nac ,
          cod_est_civil ,
          cod_trab_rem ,
          cod_horario_trab ,
          horas_de_trab ,
          cod_viviria_con ,
          ctos_grupo_fam ,
          ctos_trab_fam ,
          cod_jefe_fam ,
          cod_finan ,
          ctos_est_fam ,
          cod_ing_grup_fam ,
          cod_tipo_salud ,
          cod_viven ,
          cod_nivel_educ_pad ,
          cod_sit_ocup ,
          cod_tipo_empresa ,
          cod_ocupacion ,
          cod_rama_act_eco ,
          rut_padre ,
          rut_madre ,
          domicilio ,
          cod_reg_dom ,
          cod_prov_dom ,
          cod_comuna_dom ,
          telefono ,
          email ,
          folio ,
          cod_sit_egr ,
          cod_rama ,
          cod_grup_dep ,
          prom_nem ,
          ptje_nem ,
          lyc ,
          mat ,
          mat2 ,
          hycs ,
          cs ,
          prom_lm ,
          sec_admis ,
          BEA ,
          modulo_cs ,
          rol_bd ,
          cod_area_telefono ,
          prefijo_celular ,
          numero_celular ,
          codigo_inst_superior ,
          lyc_anterior ,
          mat_anterior ,
          hycs_anterior ,
          cs_anterior ,
          modulo_cs_anterior ,
          prom_lm_anterior ,
          punt_ranking ,
          PACE ,
          HABILITA_PEDAGOGIA ,
          PERCENTIL_LM_ACTUAL ,
          PERCENTIL_LM_ANTERIOR ,
          COINCIDE_GENERO ,
          NOMBRE_SOCIAL ,
          ANYO_LLEGA_CHILE ,
          TIENE_HIJOS ,
          CUANTOS_HIJOS ,
          VIVE_CON_HIJOS ,
          EMBARAZO_ADOLESCENTE ,
          CODIGO_ETNIA ,
          OCUPACION ,
          DISCAPACIDAD ,
          EDUCACION_MADRE ,
          COMPLETO_EDUCACION_MADRE ,
          COMPLETO_EDUCACION_PADRE ,
          ESTUDIO_INSTITUCION_SUPERIOR ,
          CARRERA_INSTITUCION_SUP ,
          TITULACION_CARRERA ,
          DISCAPACIDAD_VISUAL ,
          DISCAPACIDAD_AUDITIVA ,
          DISCAPACIDAD_FISICA ,
          DISCAPACIDAD_PSIQUICA ,
          DISCAPACIDAD_INTELECTUAL,
          PUBLICA_DTE ,
          RINDIO_PROCESO_ANTERIOR ,
          RINDIO_PROCESO_ACTUAL ,
          LYC_ACTUAL_REGULAR ,
          MAT_ACTUAL_REGULAR ,
          MAT2_ACTUAL_REGULAR ,
          HYCS_ACTUAL_REGULAR ,
          CS_ACTUAL_REGULAR ,
          MODULO_ACTUAL_REGULAR ,
          LYC_ACTUAL_INVIERNO ,
          MAT_ACTUAL_INVIERNO ,
          HYCS_ACTUAL_INVIERNO ,
          CS_ACTUAL_INVIERNO ,
          MODULO_ACTUAL_INVIERNO ,
          P_50 ,
          P_60
        )
        ( SELECT    B.TIPO_IDENTIFICACION ,
                    CASE WHEN B.TIPO_IDENTIFICACION LIKE 'C'
                         THEN B.NUMERO_DOCUMENTO + '-' + B.DV
                         ELSE B.NUMERO_DOCUMENTO
                    END AS rut_ins ,
                    CASE WHEN B.TIPO_IDENTIFICACION LIKE 'C'
                         THEN '00' + B.NUMERO_DOCUMENTO + '-' + B.DV
                         ELSE '00' + B.NUMERO_DOCUMENTO
                    END AS rut_normal ,
                    B.ANYO_PROCESO ,
                    /*B.PATERNO*/ null ,
                    /*B.MATERNO*/ null ,
                    /*B.NOMBRES*/ null ,
                    /*B.PAIS_NACIMIENTO*/ null ,
                    /*B.SEXO*/ null ,
                    C.LOCAL_EDUCACIONAL ,
                    C.UNIDAD_EDUCATIVA ,
                    B.CODIGO_REGION ,
                    B.CODIGO_PROVINCIA ,
                    C.ANYO_EGRESO ,
                    /*CASE WHEN B.FECHA_NACIMIENTO = '' THEN NULL
                         ELSE CAST(SUBSTRING(B.FECHA_NACIMIENTO,
                                             CHARINDEX('.', B.FECHA_NACIMIENTO)
                                             + 5, 8) + '-'
                              + SUBSTRING(B.FECHA_NACIMIENTO,
                                          CHARINDEX('.', B.FECHA_NACIMIENTO)
                                          + 3, 2) + '-'
                              + SUBSTRING(B.FECHA_NACIMIENTO,
                                          CHARINDEX('.', B.FECHA_NACIMIENTO)
                                          + 1, 2) AS DATE)
                    END AS fecha_nac*/ null as fecha_nac ,
                    /*B.ESTADO_CIVIL*/ null ,
                    /*B.TIENE_TRABAJO_REM*/ null ,
                    /*B.HORARIO_TRABAJO*/ null ,
                    /*B.HORAS_QUE_DEDICA_TRABAJO*/ null ,
                    /*B.CON_QUIEN_VIVE*/ null ,
                    /*B.GRUPO_FAMILIAR*/ null ,
                    /*B.CUANTOS_TRABAJAN_GRUPO_FAM*/ null ,
                    /*B.QUIEN_ES_EL_JEFE_FAMILIA*/ null ,
                    '' ,
                    /*B.PERSONAS_ESTUDIAN_SUP*/ null ,
                    /*B.INGRESO_BRUTO_FAM*/ null ,
                    '' ,
                    '' ,
                    /*B.EDUCACION_PADRE*/ null ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    B.CODIGO_REGION ,
                    B.CODIGO_PROVINCIA ,
                    B.CODIGO_COMUNA ,
                    /*B.TELEFONO_FIJO*/ null ,
                    /*B.EMAIL*/ null ,
                    C.NUMERO_DOCUMENTO ,
                    C.SITUACION_EGRESO ,
                    C.RAMA_EDUCACIONAL ,
                    C.GRUPO_DEPENDENCIA ,
                    C.PROMEDIO_NOTAS ,
                    C.PTJE_NEM ,
                    /*C.LENG_ACTUAL*/ C.CLEC_MAX,
                    C.MATE_M1_MAX ,
                    C.MATE_M2_MAX ,
                    C.HCSO_MAX ,
                    C.CIEN_MAX ,
                    /*C.PROMEDIO_LM_ACTUAL*/ /*C.PROMEDIO_CM_ACTUAL*/ C.PROMEDIO_CM_MAX ,
                    '' ,
                    C.BEA ,
                    C.MODULO_MAX ,
                    C.RBD ,
                    '' ,
                    '' ,
                    /*B.TELEFONO_CELULAR*/ null ,
                    '' ,
                    C.CLEC_ANTERIOR ,
                    C.MATE_ANTERIOR ,
                    C.HCSO_ANTERIOR ,
                    C.CIEN_ANTERIOR ,
                    C.MODULO_ANTERIOR ,
                    /*C.PROMEDIO_CM_ANTERIOR*/ null ,
                    C.PTJE_RANKING ,
                    C.PACE ,
                    C.PORC_SUP_NOTAS ,
                    /*C.PERCENTIL_LM_ACTUAL*/ /*C.PERCENTIL_CM_ACTUAL*/ null ,
                    /*C.PERCENTIL_CM_ANTERIOR*/ null ,
                    /*B.COINCIDE_GENERO*/ NULL ,
                    /*B.NOMBRE_SOCIAL*/ NULL ,
                    /*B.ANYO_LLEGA_CHILE*/ null ,
                    /*B.TIENE_HIJOS*/ null ,
                    /*B.CUANTOS_HIJOS*/ null ,
                    /*B.VIVE_CON_HIJOS*/ null ,
                    /*B.EMBARAZO_ADOLESCENTE*/ null ,
                    /*B.CODIGO_ETNIA*/ null ,
                    /*B.OCUPACION*/ null ,
                    /*B.DISCAPACIDAD*/ NULL ,
                    /*B.EDUCACION_MADRE*/ null ,
                    /*B.COMPLETO_EDUCACION_MADRE*/ null ,
                    /*B.COMPLETO_EDUCACION_PADRE*/ null ,
                    /*B.ESTUDIO_INSTITUCION_SUPERIOR*/ null ,
                    /*B.CARRERA_INSTITUCION_SUP*/ null ,
                    /*B.TITULACION_CARRERA*/ null ,
                    /*B.DISCAPACIDAD_VISUAL*/ null ,
                    /*B.DISCAPACIDAD_AUDITIVA*/ null ,
                    /*B.DISCAPACIDAD_FISICA*/ null ,
                    /*B.DISCAPACIDAD_PSIQUICA*/ null ,
                    /*B.DISCAPACIDAD_INTELECTUAL*/ null,
                    B.PUBLICA_DTE ,
                    B.RINDIO_PROCESO_ANTERIOR ,
                    B.RINDIO_PROCESO_ACTUAL ,
                    C.CLEC_ACTUAL_REGULAR ,
					C.M1_ACTUAL_REGULAR ,
					C.M2_ACTUAL_REGULAR ,
					C.HCSO_ACTUAL_REGULAR ,
					C.CIEN_ACTUAL_REGULAR ,
					C.MODULO_ACTUAL_REGULAR ,
					C.CLEC_ACTUAL_INVERNO ,
					C.MATE_ACTUAL_INVERNO ,
					C.HCSO_ACTUAL_INVERNO ,
					C.CIEN_ACTUAL_INVERNO ,
					C.MODULO_ACTUAL_INVIERNO ,
                    C.P_50 ,
                    C.P_60
                    
                   
          FROM      dbo.archivoB2023_oficial B
                    LEFT JOIN dbo.archivoC2023_oficial C ON B.NUMERO_DOCUMENTO = C.NUMERO_DOCUMENTO
                    and B.TIPO_IDENTIFICACION LIKE C.TIPO_IDENTIFICACION
        )


UPDATE sayd.admis_resul_umag_psu_2023
set PROM_NEM =
CASE
     WHEN PROM_NEM<10 THEN PROM_NEM*100
     WHEN PROM_NEM<100 and PROM_NEM>10 THEN PROM_NEM*10

     ELSE PROM_NEM
end

ALTER TABLE sayd.admis_resul_umag_psu_2023 ALTER COLUMN prom_nem int --después del cálculo se cambia a int
-------------------------------------------------

UPDATE sayd.admis_resul_umag_psu_2023
set PROM_lm =
CASE
     WHEN PROM_lm<1000 and PROM_lm>100 THEN PROM_lm*10
     ELSE PROM_lm
end

ALTER TABLE sayd.admis_resul_umag_psu_2023 ALTER COLUMN PROM_lm int --después del cálculo a varchar(159)--
ALTER TABLE sayd.admis_resul_umag_psu_2023 ALTER COLUMN PROM_lm varchar(159) --después del cálculo a varchar(159)




UPDATE sayd.admis_resul_umag_psu_2023
set PROM_lm =
CASE
     WHEN PROM_lm>100 THEN PROM_lm*10
     ELSE PROM_lm
end



select * from archivoC2023_oficial  where PROMEDIO_CM_MAX=1000


SELECT SUM(PROM_LM) AS suma_promedio_lm FROM sayd.admis_resul_umag_psu_2023

 

select * from sayd.admis_resul_umag_psu_2023 where rut_ins like '%20970390%' or rut_ins like '%20939415%' or rut_ins like '%20346529%'


SELECT PROM_LM, rut_ins FROM sayd.admis_resul_umag_psu_2023 where prom_lm > 9800

SELECT PROM_LM FROM sayd.admis_resul_umag_psu_2022
-- PARA COMPARAR CON LAS SUMAS DEL CSV QUE SE BAJA DEL DEMRE
/*SELECT SUM(prom_nem) AS suma_promedio_nem,SUM(CAST(prom_lm AS INT)) AS suma_promedio_lm 
FROM   admis_resul_umag_psu_2022*/

-- PARA COMPARAR CON LAS SUMAS DEL CSV QUE SE BAJA DEL DEMRE
SELECT SUM(prom_nem) AS suma_promedio_nem,
SUM(ptje_nem) AS suma_puntaje_nem,
SUM(CAST(PROM_lm AS INT)) AS suma_promedio_lm,
SUM(punt_ranking) AS suma_puntaje_ranking,
SUM(HABILITA_PEDAGOGIA) AS suma_habilita_pedagogia
FROM   sayd.admis_resul_umag_psu_2023

select SUM(PROMEDIO_CM_MAX) from archivoC2023_oficial 


SELECT * FROM sayd.admis_resul_umag_psu_2023

/*
ALTER TABLE dbo.archivoC2023_oficial ALTER COLUMN PROMEDIO_CM_MAX int
ALTER TABLE dbo.archivoC2023_oficial ALTER COLUMN PROMEDIO_CM_MAX decimal(10,2)


UPDATE dbo.archivoC2023_oficial
set PROMEDIO_CM_MAX =
CASE
     WHEN PROMEDIO_CM_MAX<1000 and PROMEDIO_CM_MAX>100 THEN PROMEDIO_CM_MAX*10
     ELSE PROMEDIO_CM_MAX
end

ALTER TABLE dbo.archivoC2023_oficial ALTER COLUMN PROMEDIO_CM_MAX int --después del cálculo a varchar(159)--
ALTER TABLE dbo.archivoC2023_oficial ALTER COLUMN PROMEDIO_CM_MAX varchar(159) --después del cálculo a varchar(159)

*/
select SUM(CAST(PROMEDIO_CM_MAX AS int)) from dbo.archivoC2023_oficial -- 286241 filas


select top 100 * from sayd.admis_resul_umag_psu_2023
select top 100 * from sayd.admis_resul_umag_psu_2022

--select * from sayd.admis_resul_umag_psu_2023 where rut_ins like '%21631826%'

 select * from 
 (SELECT count(rut_ins) as contador, rut_ins  FROM sayd.admis_resul_umag_psu_2023 group by rut_ins) a
  where a.contador > 1
  

/*fin archivoB2023_oficial y archivoC2023_oficial*/




-------------------------------------------------------------------------------------

/*archivoE2023_oficial, archivoE2023_bea_oficial y archivoE2023_pace_oficial en admin_post_umag_psu, admin_post_umag_psu_bea y admin_post_umag_psu_pace*/

select * from dbo.archivoE2023_oficial -- 932 filas
--delete from dbo.archivoE2023_oficial


select * from sayd.admin_post_umag_psu order by id_admin_post

select * from sayd.admin_post_umag_psu where ano_proc=2022

select * from sayd.admin_post_umag_psu where ano_proc=2023

select * from sayd.admin_post_umag_psu where ano_proc=2023  ORDER BY punt_pond
select * from sayd.admin_post_umag_psu where ano_proc=2023  ORDER BY prom_notas
select * from sayd.admin_post_umag_psu where ano_proc=2023  ORDER BY prom_psu

select SUM(punt_pond) from sayd.admin_post_umag_psu where ano_proc=2023  
select SUM(prom_notas) from sayd.admin_post_umag_psu where ano_proc=2023  
select SUM(prom_psu) from sayd.admin_post_umag_psu where ano_proc=2023 


select * from sayd.admin_post_umag_psu where ano_proc=2023 
--delete from sayd.admin_post_umag_psu where ano_proc=2023
select * from sayd.admin_post_umag_psu_pace where ano_proc=2023 
--delete from sayd.admin_post_umag_psu_pace where ano_proc=2023

--CONSULTA QUE AGREGA QUE ADMIN_POST SIN PACE
INSERT INTO sayd.admin_post_umag_psu
([tipo_iden], [rut_ins], [ano_proc], [paterno], [materno], [nombres], [nacionalidad], [sexo], [preferencia], [cod_car], [est_post], 
[punt_pond], [lugar], [sit_egr_educ], [local_educ], [unid_educ], [cod_rama], [grup_dep_col], [cod_region], [cod_prov], [ano_egre], 
[prom_notas], [punt_nem], [lyc], [mat], [mat2], [hycs], [cs], [prom_psu], [fec_nac], [ing_brut_fam], [salud], [rut_padre], [rut_madre], 
[domicilio], [email_ins], [folio_tp], [repostula], [tele_ori], [ciudad], [cod_region_dom], [BEA], [modulo_ciencias], [pond_ano_acad],
[direccion_actual], [telefono_actual], [punt_ranking], [rut_original],[PUBLICA_NOMBRE_SOCIAL],[NOMBRE_SOCIAL],[PUEBLO_ETNIA_DATOS],
[CODIGO_ETNIA], [P_50], [P_60])
SELECT  E.TIPO_IDENTIFICACION AS tipo_iden ,
        CASE WHEN E.TIPO_IDENTIFICACION = 'C'
             THEN E.NUMERO_DOCUMENTO + '-' + E.DV
             ELSE E.NUMERO_DOCUMENTO
        END AS rut_ins ,
        E.ANYO_PROCESO AS ano_proc ,
        E.PRIMER_APELLIDO AS paterno ,
        E.SEGUNDO_APELLIDO AS materno ,
        E.NOMBRES AS nombres ,
        E.NACIONALIDAD AS nacionalidad ,
        CASE WHEN E.SEXO = '1' THEN 'M'
             ELSE 'F'
        END AS sexo ,
        E.PREFERENCIA AS preferencia ,
        E.CODIGO AS cod_car ,
        E.ESTADO_DE_LA_POSTULACION AS est_post ,
        CASE WHEN LEN(E.PUNTAJE_PONDERADO) = 6
             THEN REPLACE(E.PUNTAJE_PONDERADO, ',', '')
             WHEN LEN(E.PUNTAJE_PONDERADO) = 5
             THEN REPLACE(E.PUNTAJE_PONDERADO, ',', '') + '0'
              WHEN LEN(E.PUNTAJE_PONDERADO) = 3
             THEN REPLACE(E.PUNTAJE_PONDERADO, ',', '') + '00'
        END AS punt_pond ,
        E.LUGAR_EN_LA_LISTA AS lugar ,
        E.SIT_EGRESO_EDUC AS sit_egr_educ ,
        CONVERT(INT,E.LOCAL_EDUCACIONAL) AS local_educ ,
        CONVERT(INT,E.UNIDAD_EDUCATIVA) AS unid_educ ,
        E.RAMA_EDUCACIONAL AS cod_rama,
        CONVERT(INT,E.GRUPO_DEPENDENCIA) AS grup_del_col,
        CONVERT(INT,E.CODIGO_REGION) AS cod_region,
        CONVERT(INT,E.CODIGO_PROVINCIA) AS cod_prov,
        CONVERT(INT,E.ANYO_EGRESO) AS ano_egre,
        CASE WHEN
LEN(E.PROMEDIO_NOTAS)=4 THEN REPLACE(E.PROMEDIO_NOTAS,',','')
when
LEN(E.PROMEDIO_NOTAS)=3 THEN REPLACE(E.PROMEDIO_NOTAS,',','')+'0'
when
LEN(E.PROMEDIO_NOTAS)=1 THEN REPLACE(E.PROMEDIO_NOTAS,',','')+'00'
        END AS prom_notas,
        E.PTJE_NEM AS punt_nem,
        /*E.LENG_Y_COM AS lyc*/ /*E.COMP_O_LENG AS lyc*/ /*E.COMP_LECT AS lyc*/  E.CLEC_MAX AS lyc,
        E.MATE_M1_MAX AS mat,
        E.MATE_M2_MAX AS mat2,
        E.HCSO_MAX AS hycs,
        E.CIEN_MAX AS cs,
        CASE
/*WHEN LEN(E.PROMLM)=3 THEN E.PROMLM+'0'
WHEN LEN(E.PROMLM)=5 THEN REPLACE(E.PROMLM,',','')*/
/*WHEN LEN(E.PROMEDIO)=3 THEN E.PROMEDIO+'0'
WHEN LEN(E.PROMEDIO)=5 THEN REPLACE(E.PROMEDIO,',','')
        END AS prom_psu*/
WHEN LEN(E.PROMEDIO_CM_MAX)=3 THEN E.PROMEDIO_CM_MAX+'0'
WHEN LEN(E.PROMEDIO_CM_MAX)=5 THEN REPLACE(E.PROMEDIO_CM_MAX,',','')
        END AS prom_psu,
        CAST(SUBSTRING(E.FECHA_NACIMIENTO,CHARINDEX('.',
E.FECHA_NACIMIENTO)+5,8) + '-' +
SUBSTRING(E.FECHA_NACIMIENTO,CHARINDEX('.', E.FECHA_NACIMIENTO)+3,2) + '-' +
SUBSTRING(E.FECHA_NACIMIENTO,CHARINDEX('.', E.FECHA_NACIMIENTO)+1,2) AS
DATE )AS fec_nac,
/*E.ING_BRUTO_FAMILIAR AS ing_brut_fam,*/ E.INGRESO_PERCAPITA_GRUPO_FA AS ing_brut_fam,
null AS salud,
null AS rut_padre,
NULL AS rut_madre,
        /*E.CALLE + ' NRO. ' + E.NUMERO  + ' ' + E.BLOCK + ' ' + E.DEPARTAMENTO + ' ' + E.VILLA_POBLACION AS domicilio*/
        E.CALLE + ' NRO. ' + E.NUMERO  + ' ' + ' ' + ' ' + E.DEPARTAMENTO + ' ' + '' AS domicilio,
        E.EMAIL AS email_ins,
        E.NRO_TARJ_MATRICULA AS folio_tp,
        0 AS repostula,
        CONVERT(BIGINT,E.NRO_DE_TELEFONO) AS tele_ori,
        /*E.CIUDAD AS ciudad*/ '' AS ciudad,
        CONVERT(INT,E.CODIGO_REGION_D) AS cod_region_dom,
        E.BEA,
        /*E.MODULO AS modulo_cs*/ E.MODULO_MAX AS modulo_cs,
        /*E.POND_ANYO_ACAD AS pond_ano_acad*/ null as pond_ano_acad,
        NULL AS direcion_actual,
        E.NUMERO_DE_CELULAR AS telefono_actual,
        CONVERT(INT,E.PTJE_RANKING) AS punt_ranking,
        E.NUMERO_DOCUMENTO AS rut_original,
        E.PUBLICA_NOMBRE_SOCIAL as PUBLICA_NOMBRE_SOCIAL,
        E.NOMBRE_SOCIAL as NOMBRE_SOCIAL,
        E.PUEBLO_ETNIA_DATOS as PUEBLO_ETNIA_DATOS,
        E.CODIGO_ETNIA as CODIGO_ETNIA,
        E.P_50 as P_50,
        E.P_60 as P_60
FROM    archivoE2023_oficial E 







--archivo E PACE POSTULACIONES EFECTIVAS A LA UNIVERSIDAD DE PACE PACE PACE

select * from dbo.archivoE2023_pace_oficial 
select * from dbo.archivoE2023_oficial 

select *,PUNTAJE_PONDERADO, CASE 
			when PUNTAJE_PONDERADO > 999
			THEN PUNTAJE_PONDERADO * 10
			WHEN LEN(PUNTAJE_PONDERADO) = 8
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') 
             WHEN LEN(PUNTAJE_PONDERADO) = 7
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '0'
              WHEN LEN(PUNTAJE_PONDERADO) = 6
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '00'
             WHEN LEN(PUNTAJE_PONDERADO) = 5
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '000'
             WHEN LEN(PUNTAJE_PONDERADO) = 3
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '0000'
        END AS punt_pond from dbo.archivoE2023_pace_oficial

select * from admin_post_umag_psu_pace where ano_proc=2023
select * from dbo.archivoE2023_pace_oficial -- 33 filas
--delete from dbo.archivoE2023_pace_oficial
DELETE from admin_post_umag_psu_pace where ano_proc=2023
 
 SELECT * FROM Information_Schema.Columns WHERE TABLE_NAME = 'admin_post_umag_psu_pace'

insert into sayd.admin_post_umag_psu_pace (/*id_admin_post,*/ tipo_iden, rut_ins, ano_proc, paterno, materno, nombres
, nacionalidad, sexo, preferencia, cod_Car, est_post, punt_pond, lugar, pace, sit_egr_educ, local_educ, unid_educ, rbd, cod_rama,
grup_dep_col, cod_region, cod_prov, cod_comuna, ano_egre, prom_notas, habilita_pedagogia, punt_nem, punt_ranking, lyc, mat, mat2, hycs, cs,
modulo_cs, prom_lm, percentil_lm, fec_nac, ing_brut_fam, salud, rut_padre, rut_madre, calle, numero, block, departamento,
villa_poblacion, codigo_region, codigo_provincia, codigo_comuna, nombre_provincia, nombre_comuna, ciudad, nro_telefono, nro_celular,
email_ins, nro_tarjeta_matricula, cod_inst_edu_sup, rut_original, repostula, pace_con_bea,PUBLICA_NOMBRE_SOCIAL,NOMBRE_SOCIAL,PUEBLO_ETNIA_DATOS,
CODIGO_ETNIA,P_50,P_60)
(select /*0,*/ TIPO_IDENTIFICACION
,CASE
    WHEN TIPO_IDENTIFICACION = 'C'
     THEN NUMERO_DOCUMENTO + '-' + DV
     ELSE NUMERO_DOCUMENTO
     END AS rut_ins,ANYO_PROCESO,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRES,NACIONALIDAD,
     CASE
    WHEN SEXO = 1
     THEN 'M'
     ELSE 'F'
     END AS sexo,PREFERENCIA,CODIGO,ESTADO_DE_LA_POSTULACION,
     CASE WHEN LEN(PUNTAJE_PONDERADO) = 8
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '')
             WHEN LEN(PUNTAJE_PONDERADO) = 7
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '0'
              WHEN LEN(PUNTAJE_PONDERADO) = 6
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '00'
             WHEN LEN(PUNTAJE_PONDERADO) = 5
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '000'
             WHEN LEN(PUNTAJE_PONDERADO) = 3
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '0000'
        END AS punt_pond,LUGAR_EN_LA_LISTA,'PACE',SIT_EGRESO_EDUC,LOCAL_EDUCACIONAL,UNIDAD_EDUCATIVA,RBD,RAMA_EDUCACIONAL,
        GRUPO_DEPENDENCIA,CODIGO_REGION,CODIGO_PROVINCIA,CODIGO_COMUNA,ANYO_EGRESO,
CASE WHEN
LEN(PROMEDIO_NOTAS)=4 THEN REPLACE(PROMEDIO_NOTAS,',','')
when
LEN(PROMEDIO_NOTAS)=3 THEN REPLACE(PROMEDIO_NOTAS,',','')+'0'
when
LEN(PROMEDIO_NOTAS)=1 THEN REPLACE(PROMEDIO_NOTAS,',','')+'00'
        END AS prom_notas,PORC_SUP_NOTAS,PTJE_NEM,PTJE_RANKING,CLEC_ACTUAL_REGULAR,M1_ACTUAL_REGULAR,M2_ACTUAL_REGULAR,
        HCSO_ACTUAL_REGULAR,CIEN_ACTUAL_REGULAR,MODULO_ACTUAL_REGULAR,        
        CASE
 
WHEN LEN(PROMEDIO_CM)=3 THEN PROMEDIO_CM+'0'
WHEN LEN(PROMEDIO_CM)=5 THEN REPLACE(PROMEDIO_CM,',','')
        END AS prom_psu,NULL,
        CAST(SUBSTRING(FECHA_NACIMIENTO,CHARINDEX('.', FECHA_NACIMIENTO)+5,8) + '-' + 
SUBSTRING(FECHA_NACIMIENTO,CHARINDEX('.', FECHA_NACIMIENTO)+3,2) + '-' +
SUBSTRING(FECHA_NACIMIENTO,CHARINDEX('.', FECHA_NACIMIENTO)+1,2) AS DATE )AS fecha_nac,'','','','',CALLE,NUMERO,NULL,
DEPARTAMENTO,NULL,CODIGO_REGION_D,NULL,CODIGO_COMUNA_D,NULL,NOMBRE_COMUNA_D,NULL,NRO_DE_TELEFONO,NUMERO_DE_CELULAR,EMAIL,
NRO_TARJ_MATRICULA,'',
CASE
    WHEN TIPO_IDENTIFICACION = 'C'
     THEN '00' + NUMERO_DOCUMENTO + DV
     ELSE NUMERO_DOCUMENTO
     END AS rut_original,'',BEA,PUBLICA_NOMBRE_SOCIAL,NOMBRE_SOCIAL,PUEBLO_ETNIA_DATOS,CODIGO_ETNIA,P_50,P_60
from dbo.archivoE2023_pace_oficial)



------------------------------------------------



select * from admin_post_umag_psu_pace

----------------------------------------------------
select * from dbo.archivoE2023_bea_oficial -- 0 fila
--delete from dbo.archivoE2023_bea_oficial

insert into sayd.admin_post_umag_psu_bea (tipo_iden, rut_ins, ano_proc, paterno, materno, nombres
, nacionalidad, sexo, preferencia,cod_car,est_post,punt_pond,lugar,sit_egr_educ,local_educ,unid_educ,cod_rama,grup_dep_col,cod_region,cod_prov,ano_egre,
prom_notas, punt_nem, lyc, mat, mat2, hycs,cs, prom_psu, fec_nac, ing_brut_fam, salud, rut_padre, rut_madre, domicilio, email_ins, folio_tp, repostula
, tele_ori, ciudad, cod_region_dom, BEA, modulo_ciencias, pond_ano_acad, direccion_actual, telefono_actual, punt_ranking, 
PUBLICA_NOMBRE_SOCIAL,NOMBRE_SOCIAL,PUEBLO_ETNIA_DATOS,CODIGO_ETNIA, P_50, P_60)

(select /*0,*/ TIPO_IDENTIFICACION, 
CASE
    WHEN TIPO_IDENTIFICACION = 'C'
     THEN NUMERO_DOCUMENTO + '-' + DV
     ELSE NUMERO_DOCUMENTO
     END AS rut_ins,
 ANYO_PROCESO, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRES, NACIONALIDAD, 
 CASE
    WHEN SEXO = 1
     THEN 'M'
     ELSE 'F'
     END AS sexo, 
PREFERENCIA, CODIGO, ESTADO_DE_LA_POSTULACION, 

/*PUNTAJE_PONDERADO*10000*/

CASE WHEN LEN(PUNTAJE_PONDERADO) = 8
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '')
             WHEN LEN(PUNTAJE_PONDERADO) = 7
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '0'
              WHEN LEN(PUNTAJE_PONDERADO) = 6
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '00'
             WHEN LEN(PUNTAJE_PONDERADO) = 5
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '000'
             WHEN LEN(PUNTAJE_PONDERADO) = 3
             THEN REPLACE(PUNTAJE_PONDERADO, ',', '') + '0000'
        END AS punt_pond 

, LUGAR_EN_LA_LISTA, SIT_EGRESO_EDUC, LOCAL_EDUCACIONAL,
UNIDAD_EDUCATIVA, RAMA_EDUCACIONAL, GRUPO_DEPENDENCIA, CODIGO_REGION, CODIGO_PROVINCIA, ANYO_EGRESO,
/*PROMEDIO_NOTAS*100*/
CASE WHEN
LEN(PROMEDIO_NOTAS)=4 THEN REPLACE(PROMEDIO_NOTAS,',','')
when
LEN(PROMEDIO_NOTAS)=3 THEN REPLACE(PROMEDIO_NOTAS,',','')+'0'
when
LEN(PROMEDIO_NOTAS)=1 THEN REPLACE(PROMEDIO_NOTAS,',','')+'00'
        END AS prom_notas
        , PTJE_NEM, /*LENG_Y_COM*/ /*COMP_O_LENG*/ /*COMP_LECT*/ CLEC_ACTUAL_REGULAR, /*MATEMATICA*/ M1_ACTUAL_REGULAR, 
        M2_ACTUAL_REGULAR ,
        /*HIST_CS_SOC*/ HCSO_ACTUAL_REGULAR, /*CIENCIAS*/ CIEN_ACTUAL_REGULAR,  /*PROMLM*10*/
        CASE
/*WHEN LEN(PROMLM)=3 THEN PROMLM+'0'
WHEN LEN(PROMLM)=5 THEN REPLACE(PROMLM,',','')
        END AS prom_psu*/
/*WHEN LEN(PROMEDIO)=3 THEN PROMEDIO+'0'
WHEN LEN(PROMEDIO)=5 THEN REPLACE(PROMEDIO,',','')
        END AS prom_psu*/
 WHEN LEN(PROMEDIO_CM)=3 THEN PROMEDIO_CM+'0'
WHEN LEN(PROMEDIO_CM)=5 THEN REPLACE(PROMEDIO_CM,',','')
        END AS prom_psu       
        , 
CAST(SUBSTRING(FECHA_NACIMIENTO,CHARINDEX('.', FECHA_NACIMIENTO)+5,8) + '-' + 
SUBSTRING(FECHA_NACIMIENTO,CHARINDEX('.', FECHA_NACIMIENTO)+3,2) + '-' +
SUBSTRING(FECHA_NACIMIENTO,CHARINDEX('.', FECHA_NACIMIENTO)+1,2) AS DATE )AS fecha_nac,
/*E.ING_BRUTO_FAMILIAR AS ing_brut_fam,*/ /*INGRESO_PERCAPITA_GRUPO_FA AS ing_brut_fam*/ NULL,
null AS salud,
null AS rut_padre,
NULL AS rut_madre,
        CALLE + ' NRO. ' + NUMERO  + ' ' + /*BLOCK*/ ' ' + ' ' + DEPARTAMENTO + ' ' + /*VILLA_POBLACION*/ ' ' AS domicilio,
        EMAIL AS email_ins,
        NRO_TARJ_MATRICULA AS folio_tp,
        0 AS repostula,
        CONVERT(BIGINT,NRO_DE_TELEFONO) AS tele_ori,
        /*CIUDAD AS ciudad*/ '' as ciudad,
        CONVERT(INT,CODIGO_REGION_D) AS cod_region_dom,
        BEA,
        /*MODULO AS modulo_cs*/ MODULO_ACTUAL_REGULAR AS modulo_cs,
        /*POND_ANYO_ACAD AS pond_ano_acad*/ NULL AS pond_ano_acad,
        NULL AS direcion_actual,
        NUMERO_DE_CELULAR AS telefono_actual,
        CONVERT(INT,PTJE_RANKING) AS punt_ranking,
        PUBLICA_NOMBRE_SOCIAL as PUBLICA_NOMBRE_SOCIAL,
        NOMBRE_SOCIAL as NOMBRE_SOCIAL,
        PUEBLO_ETNIA_DATOS as PUEBLO_ETNIA_DATOS,
        CODIGO_ETNIA as CODIGO_ETNIA,
        P_50 as P_50,
        P_60 as P_60
from dbo.archivoE2023_bea_oficial)







select * from sayd.admin_post_umag_psu where ano_proc=2023  ORDER BY punt_pond
select * from sayd.admin_post_umag_psu where ano_proc=2023  ORDER BY prom_notas
select * from sayd.admin_post_umag_psu where ano_proc=2023  ORDER BY prom_psu


select SUM(punt_pond) from sayd.admin_post_umag_psu where ano_proc=2023  
select SUM(prom_notas) from sayd.admin_post_umag_psu where ano_proc=2023  
select SUM(prom_psu) from sayd.admin_post_umag_psu where ano_proc=2023  
select SUM(CODIGO_ETNIA) from sayd.admin_post_umag_psu where ano_proc=2023 

select * from sayd.admin_post_umag_psu_pace where ano_proc=2023  ORDER BY punt_pond
select * from sayd.admin_post_umag_psu_pace where ano_proc=2023  ORDER BY prom_notas
select * from sayd.admin_post_umag_psu_pace where ano_proc=2023  ORDER BY prom_lm

select * from sayd.admin_post_umag_psu_pace where ano_proc=2022  ORDER BY punt_pond
select * from dbo.archivoE_pace_2022
select * from dbo.archivoE2023_pace_oficial

select * from sayd.admin_post_umag_psu_pace where ano_proc=2023 order by punt_pond

select SUM(punt_pond) from sayd.admin_post_umag_psu_pace where ano_proc=2023  
select SUM(prom_notas) from sayd.admin_post_umag_psu_pace where ano_proc=2023  
select SUM(prom_lm) from sayd.admin_post_umag_psu_pace where ano_proc=2023  
select SUM(CODIGO_ETNIA) from sayd.admin_post_umag_psu_pace where ano_proc=2023

select * from sayd.admin_post_umag_psu_bea where ano_proc=2023  ORDER BY punt_pond
select * from sayd.admin_post_umag_psu_bea where ano_proc=2023  ORDER BY prom_notas
select * from sayd.admin_post_umag_psu_bea where ano_proc=2023  ORDER BY prom_psu

select * from sayd.admin_post_umag_psu_pace
select * from sayd.admin_post_umag_psu_bea
select * from sayd.admin_post_umag_psu

select SUM(punt_pond) from sayd.admin_post_umag_psu_bea where ano_proc=2023  
select SUM(prom_notas) from sayd.admin_post_umag_psu_bea where ano_proc=2023  
select SUM(prom_psu) from sayd.admin_post_umag_psu_bea where ano_proc=2023  
select SUM(CODIGO_ETNIA) from sayd.admin_post_umag_psu_bea where ano_proc=2023


/*fin archivoE2023_oficial, archivoE2023_bea_oficial y archivoE2023_pace_oficial*/

select * from sayd.admin_post_umag_psu_pace where ano_proc=2023
select * from sayd.admin_post_umag_psu_pace where ano_proc=2022

select * from sayd.admin_post_umag_psu_bea  where ano_proc=2023
select * from sayd.admin_post_umag_psu_bea where ano_proc=2016

select * from sayd.admin_post_umag_psu  where ano_proc=2023
select * from sayd.admin_post_umag_psu  where ano_proc=2022

--------------------------------------------------------------------------------------
/* inicio archivoH2023_oficial*/
--INSCRITOS PERTENECIENTES A PUEBLOS ORIGINARIOS

select * from dbo.archivoH2023_oficial
--delete from dbo.archivoH2023_oficial

select SUM(CONVERT(INT,CODIGO_ETNIA)) from dbo.archivoH2023_oficial where ANYO_PROCESO='2023'

select * from sayd.pueblos_originarios_2023_03012023
select * from sayd.pueblos_originarios_2023
--delete from sayd.pueblos_originarios_2023

select SUM(CONVERT(INT,CODIGO_ETNIA)) from sayd.pueblos_originarios_2023 


/* fin archivoH2023_oficial*/
--------------------------------------------------------------------------------------
/* inicio archivoI2023_oficial*/
--INSCRITOS PERTENECIENTES AL 30% SUPERIOR NOTAS

select * from dbo.archivoI2023_oficial
--delete from dbo.archivoI2023_oficial

select SUM(PORC_SUP_NOTAS) from dbo.archivoI2023_oficial where ANYO_PROCESO='2023'

select * from sayd.superior_notas_2023_03012023
select * from sayd.superior_notas_2023
--delete from sayd.superior_notas_2023

select SUM(CONVERT(int,CONVERT(VARCHAR,REGION))) from sayd.superior_notas_2023
select SUM(CONVERT(int,CONVERT(VARCHAR,PORC_SUP_NOTAS))) from sayd.superior_notas_2023


/* fin archivoI2023_oficial*/
--------------------------------------------------------------------------------------

select * from dbo.archivoE2023_oficial 
select * from dbo.archivoE2023_bea_oficial 
select * from dbo.archivoE2023_pace_oficial 

--select  numero_documento, FECHA_NACIMIENTO from (select *, LEN(FECHA_NACIMIENTO) AS long_fecha_nac from dbo.archivoE2023_bea_oficial) as a where long_fecha_nac=7

--update dbo.archivoE2023_bea_oficial set FECHA_NACIMIENTO = '0' + FECHA_NACIMIENTO where numero_documento in ('21522111')



SELECT * FROM SAYD.admin_post_umag_psu WHERE ano_proc=2023
SELECT * FROM SAYD.admin_post_umag_psu_PACE WHERE ano_proc=2023
SELECT * FROM SAYD.admin_post_umag_psu_BEA WHERE ano_proc=2023
