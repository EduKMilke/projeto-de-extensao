y= y+sin(temp*0.05)*0.4

temp++
if place_meeting(x,y,obj_pla){
global.carg+=1
instance_destroy(self)
}