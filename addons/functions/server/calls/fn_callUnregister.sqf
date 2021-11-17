params ["_caller", "_receiver"];

// enable deleting from any side
GRAD_TELEPHONE_CALLS_RUNNING deleteAt (GRAD_TELEPHONE_CALLS_RUNNING find [_caller + _receiver]);
GRAD_TELEPHONE_CALLS_RUNNING deleteAt (GRAD_TELEPHONE_CALLS_RUNNING find [_receiver + _caller]);
publicVariable "GRAD_TELEPHONE_CALLS_RUNNING";
