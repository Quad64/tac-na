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
		[west, 0] call BIS_fnc_removeRespawnPosition;
		// Force player into Task Force Radio spectator
		[player, true] call TFAR_fnc_forceSpectator;
	} else {
		// Deduct 1 point from respawns (declared in the 'init.sqf')
		respawns = respawns - 1;
	};
};
