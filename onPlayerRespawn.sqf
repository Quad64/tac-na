/*
* Respawn script by Quad
*
* Checks if respawns (declared in 'init.sqf') is less than or equal to 0
* if it is then display a hint saying there are no more respawns
* if not then display the current number of respawns
*/

if (isServer) then {
	if (respawns <= 0) then {
		Hint "No more respawns";
	} else {
		Hint format ["Respawns left: %1",respawns ];
	};
};
