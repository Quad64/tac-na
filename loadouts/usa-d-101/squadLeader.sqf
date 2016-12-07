if (isDedicated) exitWith {};
if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; };

_unit = _this select 0;
If (local _unit) then {

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "rhs_uniform_cu_ocp_101st";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhsusf_ANPVS_14";
_unit addItemToUniform "Chemlight_red";
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_epinephrine";
_unit addVest "rhsusf_spcs_ocp_rifleman";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
_unit addItemToVest "rhs_mag_m18_yellow";
_unit addItemToVest "rhs_mag_m18_purple";
_unit addItemToVest "rhs_mag_mk84";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
_unit addItemToVest "Chemlight_red";
_unit addItemToVest "Chemlight_green";
_unit addBackpack "tf_rt1523g_rhs";
_unit addHeadgear "rhsusf_ach_helmet_headset_ess_ocp";

comment "Add weapons";
_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_top";
_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

};

if(true) exitWith{};
