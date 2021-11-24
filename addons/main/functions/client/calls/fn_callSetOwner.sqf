params ["_player", "_object"];

_object setVariable ["grad_telephone_phoneOwner", _player, true];

diag_log format ["GRAD TELEPHONE grad_telephone_phoneOwner: set %1 to %2", _object, _player];