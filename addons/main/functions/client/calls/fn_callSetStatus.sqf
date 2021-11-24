params ["_object", "_status"];

_object setVariable ["grad_telephone_phoneStatus", _status, true];

diag_log format ["GRAD TELEPHONE grad_telephone_phoneStatus: set %1 to %2", _object, _status];