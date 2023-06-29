params ["_object", "_status"];

if (isNull _object) exitWith {
	diag_log format ["GRAD TELEPHONE grad_telephone_phoneStatus: exit with phone null"];
};

_object setVariable ["grad_telephone_phoneStatus", _status, true];

diag_log format ["GRAD TELEPHONE grad_telephone_phoneStatus: set %1 to %2", _object, _status];