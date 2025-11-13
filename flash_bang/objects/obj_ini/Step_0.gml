
if morte=false{ //gravidade e colisão e evitar bater na parede e animação de morte
if place_meeting(x+hspd,y,obj_esc) or place_meeting(x+hspd,y,obj_piso) or place_meeting(x+hspd,y,obj_cha) or place_meeting(x,y,obj_ini){
	
 hspd*=-1
}

if place_meeting(x,y+vspd+1,obj_cha) or place_meeting(x,y+vspd+1,obj_piso) {

vspd=0
}else
{
	vspd+=grav
}
if place_meeting(x,y,obj_pla){

global.vidpla=false	

}
}else{
	
if _a=true{
	depth=1
vspd-=3
_a=false
	}else{
vspd+=grav}
}
part_system_position(p_sys,x,y)
if place_meeting(x,y,obj_esc) or place_meeting(x,y,obj_lim_chao){
morte=true

}
x+=hspd
y+=vspd