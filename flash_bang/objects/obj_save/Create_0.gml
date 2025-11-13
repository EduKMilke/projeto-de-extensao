if file_exists("save.sav"){
	file_delete("save.sav")
	}

ini_open("save.sav")
ini_write_real("room_nm","n_room",global.room)

ini_close()
