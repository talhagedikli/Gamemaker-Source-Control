#region// Camera
#macro VIEW		view_camera[0]
#macro GUI_W	display_get_gui_width()
#macro GUI_H	display_get_gui_height()

#macro CAM_W	camera_get_view_width(VIEW)
#macro CAM_H	camera_get_view_height(VIEW)

#macro CAM_X	camera_get_view_x(VIEW)
#macro CAM_Y	camera_get_view_y(VIEW)

#macro APP_W	surface_get_width(application_surface)
#macro APP_H	surface_get_height(application_surface)
#endregion