/*
* Respawn script by Quad and MrTimn
*
* notifies the player how many respawns are left
* deducts 1 respawn ticket from the variable 'respawns' (declared in the 'init.sqf')
* if there were 0 tickets left when the player was killed, respawn is disabled
*/

if (isNil "respawns") exitWith {};

if (respawns <= 0) then {
    Hint "No more respawns";
} else {
    Hint format ["Respawns left: %1",respawns ];
};


if (respawns <= 0) then {
     // Disable respawns for player
     ["disable",uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlRoleList",2,"Your side has run out of respawns!"] call BIS_fnc_showRespawnMenuDisableItem;
     // Wait 10 seconds in case there is someone still respawning
    sleep 10;
     // If everyone is dead end the mission with a "MISSION FAILED"
     if ({alive _x} count playableUnits == 0) then {
        ["EveryoneLost"] remoteExecCall ["BIS_fnc_endMissionServer",0];
     };
};