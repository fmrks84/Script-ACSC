SELECT *
FROM APAC
WHERE NR_APAC IN
(3321204350662,
 3321204351201,
 3321204351399,
 3321204355766,
 3321204356426)
and cd_fat_sia = 342


select * from dbamv.eve_siasus where cd_apac in (91318)--,91376,91377,91228,91353);

;


delete from dbamv.apac where cd_apac = 90702;
commit;
