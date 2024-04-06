params ["_player", "_target"];

(!([_player] call ace_common_fnc_isAwake)) ||
((_player distance _target) > 3)