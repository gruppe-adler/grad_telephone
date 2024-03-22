/*

	can be called out of 3DEN init of object:

	[this, false, "123456", "bla", "all", true, [0,0,0], true, true] call grad_telephone_fnc_addPhone;

	* Arguments:
	* Object which will get the phone functionality <object>
	* If the phone is a rotary phone <bool> <optional>
	* Force Number which will be assigned <string> <optional>
	* Force Number which – when set – is the only number automatically called (for one directional phone system) <string> <optional>
  *

*/


params [
  ["_object", objNull],
  ["_isRotary", false],
  ["_number", "none"],
  ["_displayName", "none"],
  ["_canOnlyCallNumber", "all"],
  ["_hasPublicPhoneBookEntry", false],
  ["_phonePosition", [0,0,0]],
  ["_isPhoneBooth", false],
  ["_isFakePhone", false]
];

if (!isServer) exitWith {};
if (isNull _object) exitWith { diag_log format ["grad-telephone: addPhone error: no object"]; };
if (_object getVariable ["grad_telephone_phoneID", -1] > 0) exitWith { diag_log format ["grad-telephone %1: addPhone info: skipping phone, already registered", _object]; };


if (_phonePosition isEqualTo [0,0,0]) then {
   _phonePosition = position _object;
};

private _id = missionNamespace getVariable ['grad_telephone_phoneCount', 0];
_id = _id + 1;
missionNamespace setVariable ["grad_telephone_phoneCount", _id, true];

_object setVariable ["grad_telephone_isPhone", true, true]; // needs to be true for all phones used by grad-telephone
_object setVariable ["grad_telephone_phoneID", _id, true]; // unique ID of this phone, incremental number
_object setVariable ["grad_telephone_isRotary", _isRotary, true]; // toggles rotary dialing
_object setVariable ["grad_telephone_skipDialing", (_canOnlyCallNumber != "all"), true]; // can only call one number without dialing (e.g. Grenzmeldenetz)
_object setVariable ["grad_telephone_hasPublicPhoneBookEntry", _hasPublicPhoneBookEntry, true]; // toggles phone book entry
_object setVariable ["grad_telephone_phonePosition", _phonePosition, true]; // used in phone book map
_object setVariable ["grad_telephone_isPhonebooth", _isPhoneBooth, true]; // used for phone booth mechanics, used for icon on phone book map
_object setVariable ["grad_telephone_displayName", _displayName, true]; // used for name in phone book (WIP)
_object setVariable ["grad_telephone_isFakePhone", _isFakePhone, true]; // used for name in phone book (WIP)
private _hasOffset = _object getVariable ["GRAD_Telephone_phoneCablePlugOffset", [-1,-1,-1]];
if (_hasOffset isEqualTo [-1,-1,-1] ) then {
  _object setVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0], true];
};

// zeus & direct call
if (_canOnlyCallNumber != "all") then {
    _object setVariable ["grad_telephone_directConnect", _canOnlyCallNumber, true];
};

if (isNull (_object getVariable ["GRAD_telephone_phoneModel", objNull])) then {
    private _phoneModel = createSimpleObject ["z\tfar\addons\external_intercom\data\TFAR_handset.p3d", [0,0,0]];
    private _offset = _object getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];
    _phoneModel attachTo [_object, _offset];

    private _cableArray = [_object, _phoneModel] call grad_telephone_fnc_cableCreate;
    _cableArray params ["_cable", "_cableHelper"];
    _object setVariable ["GRAD_telephone_cable", _cable, true];
    _object setVariable ["GRAD_telephone_cableHelper", _cableHelper, true];
    _object setVariable ["GRAD_telephone_phoneModel", _phoneModel, true];
    [_cableHelper] call grad_telephone_fnc_cableBreakEH;
};

[_object, _number] call grad_telephone_fnc_assignNumber;
[_object, "idle"] call grad_telephone_fnc_callSetStatus;


// zeus phone will receive extra action, not here
if (_canOnlyCallNumber != "none") then {
    [_object] remoteExec ["grad_telephone_fnc_addAction", [0,-2] select isDedicated, true];
};
