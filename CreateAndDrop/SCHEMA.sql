/*CERATE SCHEMA<模式名>AUTHORIZATION<用户名>
DROP SCHEMA<模式名><CASCADE|RESTRICT>*/

CREATE SCHEMA S-T AUTHORIZATION WANG
DROP SCHEMA S-T CASCADE

/*CASCADE(级联)：删除该模式中所有数据库对象 RESRICT(限制)：若该模式没有任何下属数据库对象才执行删除*/