params ["_button"];

_button ctrlEnable false;

if ([player, player] call grad_telephone_fnc_conditionAccept) exitWith {
    [player] call grad_telephone_fnc_callAccept;
};

if ([player, player] call grad_telephone_fnc_conditionEnd) exitWith {
    private _state = player getVariable ['grad_telephone_phoneStatus', 'idle'];
    [player, _state] call grad_telephone_fnc_callEnd;
};
