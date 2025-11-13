if keyboard_check_pressed(ord("R")){
room_restart()	
global.vidpla=true
global.carg=2
}

if global.vidpla=true{

xmove=keyboard_check(ord("D"))-keyboard_check(ord("A"))
hspd=xmove*spd

if a=true{
if (xmove!=0) {
    sprite_index=spr_plaand 
    image_speed=1
	alarm[2]=room_speed*2
	para=false
	}
else{ 
    sprite_index=spr_pla;
	image_speed=0
	
	if para=true{
        image_speed=1
    }else{
        image_index=0
    }
}}

if place_meeting(x+hspd,y,obj_esc) || place_meeting(x+hspd,y,obj_cha) || place_meeting(x+hspd,y,obj_piso) {
    while !place_meeting(x+sign(hspd), y, obj_esc) && !place_meeting(x+sign(hspd), y, obj_cha) && !place_meeting(x+sign(hspd), y, obj_piso) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

if place_meeting(x,y+vspd,obj_esc) || place_meeting(x,y+vspd,obj_cha) || place_meeting(x,y+vspd,obj_piso){
    var vdir = sign(vspd);
    while !place_meeting(x, y + vdir, obj_esc) && !place_meeting(x, y + vdir, obj_cha) && !place_meeting(x, y + vdir, obj_piso) {
        y += vdir;
    }
    vspd = 0;
}
y += vspd;

if place_meeting(x,y+1,obj_esc) || place_meeting(x,y+1,obj_cha) || place_meeting(x,y+1,obj_piso) {
    if keyboard_check(ord("W")) {
        vspd = pulo	
    }
} else {
	vspd += grav	
}

if xmove>0{
image_xscale=1	
}
if xmove<0{
image_xscale=-1	
}}
else{
		
vspd+=grav
	if morte=true{

		alarm[0]=room_speed*2
sprite_index=spr_plamor
		depth=1
	vspd=0
	hspd=0
	morte=false
	vspd+=pulo
	} 
	
    x+=hspd
    y+=vspd
	
	}

if keyboard_check_pressed(vk_enter){
	
if obj_ilu.a=true{
		if global.vidpla=false{
return
}
	sprite_index=spr_plachar
alarm[1]=room_speed*0.2
a=false
}}