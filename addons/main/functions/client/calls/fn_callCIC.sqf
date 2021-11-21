params ["_target"];

private _targetNumber = _target getVariable ['grad_telephone_directConnect', "all"];
private _allPhones = missionNamespace getVariable ['GRAD_TELEPHONE_ALLPHONES', []];
private _targetPhone = objNull;
{
    private _phoneNumber = _x getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', "all"];
    if (_targetNumber == _phoneNumber) exitWith {
        _targetPhone = _x;
    };
} forEach _allPhones;

[_target, [_targetPhone]] call grad_telephone_fnc_callStart;
