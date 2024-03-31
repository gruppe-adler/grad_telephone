params ["_player", "_object"];

private _phonebookplayer = _player getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []];
_phonebookplayer pushBackUnique [(_object getVariable ["GRAD_TELEPHONE_NUMBER_ASSIGNED", "not_assigned"]), [_object]];

_player setVariable ["GRAD_TELEPHONE_ALLNUMBERS", _phonebookplayer, true];
