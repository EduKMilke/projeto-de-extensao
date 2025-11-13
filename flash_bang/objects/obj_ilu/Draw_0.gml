if surface_exists(sombra){
surface_set_target(sombra)
draw_set_color(c_black)
draw_set_alpha(.2)
draw_rectangle(0,0,room_width,room_height,false)
draw_set_alpha(1)

gpu_set_blendmode(bm_subtract)// criando uma camada preta pra colocar sombra

if instance_exists(obj_ini){ //criando luz nos inimigos 
var _num =instance_number(obj_ini)
for (var _i =0; _i<_num;_i++){
	var _ini=instance_find(obj_ini,_i)

draw_circle(_ini.x,_ini.y,25,false)

draw_set_alpha(.3)
draw_circle(_ini.x,_ini.y,32+irandom(0.6),false)

draw_set_alpha(1)
}
}
if global.carg>0{
global.atq=true	
}

if (global.atq=true){
if instance_exists(obj_pla) and global.vidpla=true{ //criando luz no player quando ele clica enter e tendo carga

if keyboard_check_pressed(vk_enter){

	if a=true{ 
		global.carg-=1
if global.carg<=0{
global.carg=0
global.atq=false
}

draw_circle(obj_pla.x,obj_pla.y,60,false)
draw_set_alpha(.5)
draw_circle(obj_pla.x,obj_pla.y,120+irandom(0.6),false)

a=false
alarm[0]=room_speed*2

	}
	
}}}

if instance_exists(obj_luz){ //criando luz nos inimigos 
var _num =instance_number(obj_luz)
  gpu_set_blendmode(bm_add)
for (var _i =0; _i<_num;_i++){

	var _ini=instance_find(obj_luz,_i)
		draw_set_color(_ini.cor_draw)
		draw_set_alpha(0.3)
draw_circle(_ini.x,_ini.y,10,false)

draw_set_alpha(.1)
draw_circle(_ini.x,_ini.y,16+irandom(1),false)

draw_set_alpha(1)

}
}else{
}
gpu_set_blendmode(bm_normal)
surface_reset_target()
}else{
	sombra=surface_create(room_width,room_height)
}

draw_surface(sombra,0,0)