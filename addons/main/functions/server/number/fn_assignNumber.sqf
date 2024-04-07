params ["_object", "_number", "_hasPublicPhoneBookEntry"];

// get all existing numbers
private _currentNumbers = missionNamespace getVariable ['GRAD_TELEPHONE_ALLNUMBERS', []];

if (_number == "none") then {
    _number = [_currentNumbers] call grad_telephone_fnc_generatePhoneNumber;
};

// find possible duplicate - numbers can have multiple assigned objects (first pick up takes the call)
private _path = [_currentNumbers, _number] call BIS_fnc_findNestedElement;
_path params ["_selector"];

// add new entry or edit existing number entry
if (count _path < 1) then {
    _currentNumbers pushback [_number, [_object]];
    diag_log format ["adding %1 to phonebook", _number];

} else {
    private _existingObjects = _currentNumbers select _selector select 1;
    _existingObjects pushBackUnique _object;
    _currentNumbers set [_selector, [_number, _existingObjects]];
};
// only one entry in phonebook for each number
if (_hasPublicPhoneBookEntry) then {
    missionNamespace setVariable ["GRAD_TELEPHONE_ALLNUMBERS", _currentNumbers, true];
};


private _currentPhones = missionNamespace getVariable ['GRAD_TELEPHONE_ALLPHONES', []];
_currentPhones pushback _object;
missionNamespace setVariable ["GRAD_TELEPHONE_ALLPHONES", _currentPhones, true];


// [_PHONENUMBERS_HASH, _object, _number] call CBA_fnc_hashSet;
diag_log format ["GRAD-TELEPHONE: assigning %1 to %2", _number, _object];

_object setVariable ["GRAD_TELEPHONE_NUMBER_ASSIGNED", _number, true];
