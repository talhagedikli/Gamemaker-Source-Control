///@func Match_Begin([stage],[stock],[time],[stamina],[teams],[team_attack])
///@param [stage]
///@param [stock]
///@param [time]
///@param [stamina]
///@param [teams]
///@param [team_attack]

//Match settings
global.match_stage =		argument_count > 0 ? argument[0] : global.match_stage;
global.match_stock =		argument_count > 1 ? argument[1] : global.match_stock;
global.match_time =			argument_count > 2 ? argument[2] : global.match_time;
global.match_stamina =		argument_count > 3 ? argument[3] : global.match_stamina;
global.match_teams =		argument_count > 4 ? argument[4] : global.match_teams;
global.match_team_attack =	argument_count > 5 ? argument[5] : global.match_team_attack;

//Save profiles
Profile_Save_All();

//Stage
room_goto(global.match_stage);