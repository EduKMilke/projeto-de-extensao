draw_set_font(Font1)
draw_text(180,300+texto_y,"Creditos:\n\nGame design:\nMiguel e Gabriel\n\nArte:\nFrancine,Breno e Eduarda \n\nProgramação:\nEduardo e Davih\n\n\nDebito:\n --- \n\n\nobrigado por jogar")

if (current_time - ultimo_update >= 200) {
    texto_y -= 3;
    ultimo_update = current_time;
}
