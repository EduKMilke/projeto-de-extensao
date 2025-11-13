if file_exists("save.sav"){
ini_open("save.sav")
global.room=ini_read_real("room_nm","n_room",0)

room_goto(global.room+1)
global.vidpla=true
ini_close()
}