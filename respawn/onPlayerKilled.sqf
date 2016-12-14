/*
* Respawn script by Quad and MrTimn
*
* notifies the player how many respawns are left
* deducts 1 respawn ticket from the variable 'respawns' (declared in the 'init.sqf')
* if there were 0 tickets left when the player was killed, respawn is disabled
*/


 // Let the player know how many respawns are left
if (respawns <= 0) then {
    Hint "No more respawns";
} else {
    Hint format ["Respawns left: %1",respawns ];
};


// Deduct 1 point from respawns (declared in the 'init.sqf')
respawns = respawns - 1;
// Sync respawns across network
publicVariable "respawns";


if (respawns < 0) then {
     // Disable respawns for west faction
     ["disable",uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlRoleList",2,"Your side has run out of respawns!"] call BIS_fnc_showRespawnMenuDisableItem;
     // Wait 10 seconds in case there is someone still respawning
    sleep 10;
     // If everyone is dead end the mission with a "MISSION FAILED"
     if ({alive _x} count playableUnits == 0) then {
        "EveryoneLost" call BIS_fnc_endMissionServer;
     };
};
