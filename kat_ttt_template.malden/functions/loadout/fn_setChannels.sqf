#include "script_component.hpp"
/*
 * Author: Sinus
 * Sets the TFAR radio channels based on group name and loadout name for the player where the function is executed.
 * Waits up to 30s for a shortwave / longrange radio, if no radio present already, then returns without doing anything.
 *
 * Arguments:
 * 0: LoadoutName <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["NATO_SQL"] call KAT_template_fnc_setChannels;
 *
 * Public: No
 */

params [
    ["_loadoutName", "", [""]]
];

[{call TFAR_fnc_haveSWRadio}, {
    params ["_loadoutName"];

    switch (groupId (group player)) do {
        case "Jupiter": {
            [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;
        };
        case "Mars": {
            [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setSwChannel;
        };
        case "Deimos": {
            [(call TFAR_fnc_activeSwRadio), 2] call TFAR_fnc_setSwChannel;
        };
        case "Phobos": {
            [(call TFAR_fnc_activeSwRadio), 3] call TFAR_fnc_setSwChannel;
        };
        case "Vulkan": {
            [(call TFAR_fnc_activeSwRadio), 4] call TFAR_fnc_setSwChannel;
        };
        case "Diana": {
            [(call TFAR_fnc_activeSwRadio), 5] call TFAR_fnc_setSwChannel;
        };
        case "Zeus": {
            [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;
            [(call TFAR_fnc_activeSwRadio), "59"] call TFAR_fnc_setSwFrequency;
        };
        default {
            [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;
        };
    };
}, [_loadoutName], 30] call CBA_fnc_waitUntilAndExecute;


[{call TFAR_fnc_haveLRRadio}, {
    params ["_loadoutName"];

    [(call TFAR_fnc_activeLRRadio), 1] call TFAR_fnc_setLRChannel;

    if (_loadoutName in ["NATO_LOG_LEAD"]) then {
        [(call TFAR_fnc_activeLRRadio), 7] call TFAR_fnc_setLRChannel;
    };

    if (_loadoutName in ["NATO_JFO"]) then {
        [(call TFAR_fnc_activeLRRadio), 6] call TFAR_fnc_setLRChannel;
    };
}, [_loadoutName], 30] call CBA_fnc_waitUntilAndExecute;
