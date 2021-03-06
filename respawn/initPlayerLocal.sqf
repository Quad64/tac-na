/*
* Respawn JIP script by Quad and MrTimn
*
* Checks if "respawns" has been defined and exits if it has not
* notifies the player how many respawns are left
* if there were 0 tickets left respawn is disabled
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
