/*
	server
*/

// generates unique number for object

/*
*
* author: nomisum
* generates random phone number but not one from the given array
*
*/
#include "..\..\..\config.hpp"

params ["_phoneList"];


private _result = [];

// check if generated number already exists
while {true} do {

	private _phonePrefixCurrent = [str (selectRandom _NUMBER_PREFIXES)] call grad_telephone_fnc_extractNumberFromPrefix;
	private _phoneBaseNumber = [_NUMBER_LENGTH select 0, _NUMBER_LENGTH select 1] call grad_telephone_fnc_generateBaseNumber;

	_result = _phonePrefixCurrent + _phoneBaseNumber;

	if (_phoneList find _result == -1) exitWith {};

    systemChat format ["exiting with %1 ", _result];
};

private _endResult = "";

if (_DEBUG_MODE) then { diag_log format ["generatePhoneNumber: %1", _result]; };

{
  _endResult = _endResult + str _x;
} forEach _result;

// systemChat format ["endresult is %1 ", _endResult];

_endResult
