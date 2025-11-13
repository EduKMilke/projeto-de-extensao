if _a=false{
	if col=false{
if place_meeting(x,y,obj_pla){
	col=true
	_a=true
}}

if _a=true{
depth=2
vspd-=3
y+=vspd
alarm[0]=room_speed*0.5
_a=false	
}
	
}

if col==false{
y= y+sin(temp*0.05)*0.4

temp++
}
if seg=true{
if instance_exists(obj_por){
x=lerp(x,obj_por.x,0.02)
y=lerp(y,obj_por.y,0.02)
}
} 
if place_meeting(x,y,obj_por){
	image_speed=1
if _b=false{
alarm[1]=room_speed*0.8
_b=true
}
}

