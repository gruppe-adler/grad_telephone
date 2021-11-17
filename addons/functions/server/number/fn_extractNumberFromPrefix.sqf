params ["_string"];
private _result = [];

private _splittedString = _string splitString "";

{
	_result = _result + [parseNumber _x];	  
} forEach _splittedString;

diag_log format ["grad-landline: splitting number to %1", _result];

_result