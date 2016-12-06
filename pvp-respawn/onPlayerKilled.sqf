/*
*	PVP respawn by Quad
*	Script for handleing custom respawn ticket system. Removes points from the players side
*	every time they are killed. If there are no more points for there side respawns are 
*	dissabled for that side. If there are no more points and everyone on that side is dead
*	the mission is ended stating the other side won.
*
*	@Params
*	blueRespawns
*		Declared in: init.sqf
*		Description: Tracks the number of respawns left for BLUEFOR/west side
*
*	redRespawns
*		Declared in: init.sqf
*		Description: Tracks the number of respawns left for OPFOR/east side
*
*	BlueWin
*		Declared in: init.sqf
*		Description: When called end the mission displaying a message stating that BLUEFOR/west side won
*
*	RedWin
*		Declared in: description.ext
*		Description: When called end the mission displaying a message stating that OPFOR/east side won
*/

// Check if running on a dedicated server/host
if (isServer) {

	if (side player == west) then {
		
		if (blueRespawns >= 0) then {
			[west, 0] call BIS_fnc_removeRespawnPosition;
			
			if (side killer == west) {
				hint format ["%1 team killed %2", name killer, name player];
			}
			else {
				hint format ["%1 killed %2", name killer, name player];
			};
			
			if ({alive _x} west countSide playableUnits == 0) then {
				["RedWin", false] call BIS_fnc_endMission;
			};
		} 
		
		else {
			blueRespawns = blueRespawns - 1;
			
			if (side killer == west) {
				hint format ["%1 team killed %2 \nBLUE lives left: %3", name killer, name player, blueRespawns];
			}
			else {
				hint format ["%1 killed %2 \nBLUE lives left: %3", name killer, name player, blueRespawns];
			};
		};
	} 
	
	else {
		
		if (redRespawns >= 0) then {
			[east, 0] call BIS_fnc_removeRespawnPosition;
			
			if (side killer == east) {
				hint format ["%1 team killed %2", name killer, name player];
			}
			else {
				hint format ["%1 killed %2", name killer, name player];
			};
			
			if ({alive _x} west countSide playableUnits == 0) then {
				["BlueWin", true] call BIS_fnc_endMission;
			};
		} 
		
		else {
			redRespawns = redRespawns - 1;
			
			if (side killer == west) {
				hint format ["%1 team killed %2 \nBLUE lives left: %3", name killer, name player, blueRespawns];
			} 
			
			else {
				hint format ["%1 killed %2 \nBLUE lives left: %3", name killer, name player, blueRespawns];
			};
		};
	};
};
