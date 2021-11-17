params ["_caller", "_receiver"];

// enable deleting from any side
_CALLS_RUNNING deleteAt (_CALLS_RUNNING find [_caller + _receiver]);
_CALLS_RUNNING deleteAt (_CALLS_RUNNING find [_receiver + _caller]);
publicVariable "_CALLS_RUNNING";