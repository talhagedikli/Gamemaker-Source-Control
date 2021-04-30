/// @description system info

var txt1	= "Slot\n\n";
var txt2	= "Connected\n\n";
var txt3	= "face1\n\n";
var txt4	= "Deadzone L\n\n";
var txt5	= "L Hor\n\n";
var txt6	= "L Ver\n\n";
var txt7	= "Description\n\n";
var xx		= 10;
var yy		= 10;

for (var i = 0; i < 12; i++) {
	txt1 += string(i) + "\n";
	txt2 += gamepad_is_connected(i) ? "yes\n" : "no\n";
	txt3 += string(gamepad_button_check(i, gp_face1)) + "\n";
	txt4 += string_format(gamepad_get_axis_deadzone(i), 0, 2) + "\n";
	txt5 += string_format(gamepad_axis_value(i, gp_axislh), 0, 2) + "\n";
	txt6 += string_format(gamepad_axis_value(i, gp_axislv), 0, 2) + "\n";
	txt7 += gamepad_get_description(i) + "!\n";
}

draw_text(xx,		yy,			"Current Device: " + string(global.gamepad_device));
draw_text(xx,		yy + 30,	txt1);
draw_text(xx + 60,	yy + 30,	txt2);
draw_text(xx + 200,	yy + 30,	txt3);
draw_text(xx + 300,	yy + 30,	txt4);
draw_text(xx + 400,	yy + 30,	txt5);
draw_text(xx + 500,	yy + 30,	txt6);
draw_text(xx + 600,	yy + 30,	txt7);

