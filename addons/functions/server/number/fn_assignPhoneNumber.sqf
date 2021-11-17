/*
 deprecated
*/

/*
params ["_object", "_number"];

private _newNumber = [_ALLNUMBERS] call grad_telephone_fnc_generatePhoneNumber;

if (_number != "none") then {
    _newNumber = _number;
};

// store in simple array for easy access above
private _currentNumbers = missionNamespace getVariable ['grad_telephone_ALLNUMBERS", []];
_currentNumbers pushback [_object, _newNumber];
missionNamespace setVariable ["_ALLNUMBERS", _currentNumbers, true];


private _currentPhones = missionNamespace getVariable ['grad_telephone_ALLPHONES", []];
_currentPhones pushback _object;
missionNamespace setVariable ["_ALLPHONES", _currentPhones, true];


// [_PHONENUMBERS_HASH, _object, _newNumber] call CBA_fnc_hashSet;
diag_log format ["GRAD-LANDLINE: assigning %1 to %2", _newNumber, _object];

_object setVariable ["_NUMBER_ASSIGNED", _newNumber, true];

*/
