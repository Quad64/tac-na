/*
* Respawn script by Quad
*
* Checks if respawns (declared in 'init.sqf') is less than or equal to 0.
* if it is then respawn points are removed for the player faction (in this case west)
* if not then one point is taken from respawns
*/
if (isServer) then {
	if (respawns <= 0) then {
		// Disable respawns for west faction
		["disable",uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlRoleList",2,"Your side has run out of respawns!"] call BIS_fnc_showRespawnMenuDisableItem;
		// Wait 10 seconds in case there is someone still respawning
		sleep 10;
		// If everyone is dead end the mission with a "MISSION FAILED"
		if ({alive _x} count playableUnits == 0) then {
			["EveryoneLost", false] call BIS_fnc_endMission;
		}
	} else {
		// Deduct 1 point from respawns (declared in the 'init.sqf')
		respawns = respawns - 1;
		if (respawns <= 0) then {
			Hint "No more respawns";
		} else {
			sleep 10;
			Hint format ["Respawns left: %1",respawns ];
		};
	};
};
