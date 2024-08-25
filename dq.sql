create database dq;

create table dq.tareLoad engine = ReplacingMergeTree order by dt_hour as
select toStartOfHour(dt) dt_hour
     , count() cnt
     , uniq(tare_id) uniq_tare
     , countIf(is_load, is_load=1) count_tare_load
     , countIf(is_load, is_load=0) count_tare_unload
     , uniq(tare_sticker) uniq_sticker
     , countIf(tare_type, tare_type='CON') count_type_con
     , countIf(tare_type, tare_type='TBX') count_type_tbx
     , uniq(licence_plate) uniq_car
from default.tareLoad_1
group by dt_hour
order by dt_hour;
