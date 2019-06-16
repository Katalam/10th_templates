#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Joint Fires Observer
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "SERGEANT";

/** CLOTHING */
_player forceAddUniform UNIFORM_YELLOW;
_player addVest VEST_YELLOW;
_player addHeadgear HELMET_4;

/** COMMS */
_player addBackpackGlobal "TFAR_rt1523g_rhs";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";

for "_i" from 1 to 2 do {
    _player addItemToVest "ACE_CableTie";
};
_player addItemToVest "ACE_MapTools";
_player addItemToBackpack "Laserbatteries";
_player addItemToBackpack "Laserdesignator";

/** MEDICAL */
MEDICAL_RFM;

/** THROWABLES */
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 2 do {
    _player addItemToVest "MiniGrenade";
};

/** PRIMARY */
_player addWeapon WEAPON_UGL;
WEAPON_UGL_STUFF apply {_player addWeaponItem [WEAPON_UGL, _x]};

for "_i" from 1 to 7 do {
    _player addItemToVest WEAPON_RFM_AMMO;
};

for "_i" from 1 to 4 do {
    _player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
};
for "_i" from 1 to 2 do {
    _player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
    _player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
        _player addWeapon "ACE_VectorDay";
        _player addPrimaryWeaponItem "acc_flashlight";
        _player addItemToUniform "ACE_Flashlight_KSF1";
        _player addItemToUniform "ACE_HandFlare_Yellow";
    };
    case 2: {
        _player addWeapon "ACE_Vector";
        _player addPrimaryWeaponItem "acc_pointer_IR";
        _player addItemToUniform "ACE_Flashlight_KSF1";
        _player linkItem "ACE_NVG_Wide";
        _player addItemToUniform "ACE_IR_Strobe_Item";
    };
    default {
        _player addWeapon "ACE_VectorDay";
        _player addItemToUniform "SmokeShellOrange";
    };
};

/** SIDEARM */
_player addItemToUniform WEAPON_HGUN_AMMO;
_player addWeapon WEAPON_HGUN;
_player addItemToUniform WEAPON_HGUN_AMMO;

[_player, "KAT_JFO"] call BIS_fnc_setUnitInsignia;

true;