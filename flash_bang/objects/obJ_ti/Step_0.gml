//objeto criado para criar sombras
instance_create_layer(x,y,"Instances",obj_esc)
if place_meeting(x,y,obj_piso) or  place_meeting(x,y,obj_por) or x>room_width or  x=-1 or y>room_height or y=-1
{
instance_destroy(self)	
}