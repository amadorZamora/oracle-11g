--Correccion de ambientes
update dfhr set dfhr_fch_hasta = trunc(sysdate) + 365 where PSTS_CDG = 'EZE';
update dfhr set dfhr_fch_hasta = trunc(sysdate) + 365 where PSTS_CDG = 'BOG';
update dfhr set dfhr_fch_hasta = trunc(sysdate) + 365 where PSTS_CDG = 'MED'; 
update dfhr set dfhr_fch_hasta = trunc(sysdate) + 365 where PSTS_CDG = 'MDE'; 
update dfhr set dfhr_fch_hasta = trunc(sysdate) + 800 where PSTS_CDG = 'GRU' AND DFHR_FCH_DESDE = '16-OCT-16';

--por cambio de zona horaria de miami.
update dfhr set dfhr_vlr = -5 where PSTS_CDG in ('MIA') AND sysdate between DFHR_FCH_DESDE and dfhr_Fch_hasta;
--cambio para correccion de casos DLV IN

update dfhr set dfhr_vlr = -5 where PSTS_CDG in ('LIM') AND sysdate between DFHR_FCH_DESDE and dfhr_Fch_hasta;


insert into dfhr values (3,0,'10-APR-17','LIM','21-MAR-17','21-MAR-18',-5);



COMMIT;
