/*
* Respawn script by Quad and MrTimn
*
* Set the number of respawns you want the players to have
* Give each playable character a MPEventHandler to execute the 'killed.sqf' when they die
* rest of the logic handled in the 'killed.sqf' and 'initPlayerLocal.sqf' files
*/
if (isServer) then {
	// Set for the number of respawns you want the players to have
	respawns = paramsArray select 0;
};

{_x addEventHandler ["killed", "_this execVM 'killed.sqf'"];
	} forEach playableUnits;
