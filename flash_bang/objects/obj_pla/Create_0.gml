xmove=0
ymove=0
spd=2
hspd=0
vspd=0
grav=0.2
pulo=-5
morte=true
a=true
para=false
if !instance_exists(obj_cont){
		instance_create_layer(x,y,"Instances",obj_cont)
}
if !instance_exists(obj_save){
		instance_create_layer(x,y,"Instances",obj_save)
}

if !instance_exists(obj_ilu){
	instance_create_layer(x,y,"Instances",obj_ilu)
}


