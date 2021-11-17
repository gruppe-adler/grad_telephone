params ["_button"];

_button ctrlEnable false; 

if ([player, player] call _fnc_conditionAccept) exitWith {
    [player] call _fnc_callAccept;
};

if ([player, player] call _fnc_conditionEnd) exitWith {
    private _state = player getVariable ['_phoneStatus', 'idle']; 
    [player, _state] call _fnc_callEnd;
};
