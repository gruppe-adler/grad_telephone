params ["_player", "_object"];

private _phonebookplayer = player getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []];
_phonebookplayer pushBackUnique (_object getVariable ["GRAD_TELEPHONE_NUMBER_ASSIGNED", "not_assigned"]);

_player setVariable ["GRAD_TELEPHONE_ALLNUMBERS", _phonebookplayer, true];
