params ["_button"];

_button ctrlEnable false;

if ([player, player] call grad_telephone_fnc_conditionAccept) exitWith {
    [player] call grad_telephone_fnc_callAccept;
};

if ([player, player] call grad_telephone_fnc_conditionEnd) exitWith {
    [player, objNull] call grad_telephone_fnc_callEnd; // todo replace objnull with phone
};
