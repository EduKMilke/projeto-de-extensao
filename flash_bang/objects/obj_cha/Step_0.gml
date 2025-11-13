//chao que tem sombra
// usar flsh
if instance_exists(obj_ilu){
if obj_ilu.a=true{
	if global.atq=true{
if keyboard_check_pressed(vk_enter){
	instance_destroy(obj_esc)
	if (instance_exists(obj_pla))

{// criar um objeto que cirara a sombra angulo e direção
	
    var _x_cha = x;
   var _y_cha = y;
  var _x_pla = obj_pla.x;
   var _y_pla = obj_pla.y;

   var _angulo_direto = point_direction(_x_cha, _y_cha, _x_pla, _y_pla);
   var _angulo_tiro = (_angulo_direto + 180) mod 360;
    var _velocidade_tiro = 10;
   var _direcao_x = lengthdir_x(_velocidade_tiro*2, _angulo_tiro);
    var _direcao_y = lengthdir_y(_velocidade_tiro*2, _angulo_tiro);
    var _tiro = instance_create_layer(_x_cha, _y_cha, "Instances",obJ_ti);
  (_tiro. speed) = _velocidade_tiro;
   _tiro.direction = _angulo_tiro;
   _tiro.hspeed = _direcao_x;
   _tiro.vspeed = _direcao_y;


}
}
}}}else{
instance_create_layer(x,y,"Instances",obj_ilu)	//pra funcionar presica exisitir obj_ilu
}