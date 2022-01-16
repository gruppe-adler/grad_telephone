params ["_caller", "_receiver"];

GRAD_TELEPHONE_CALLS_RUNNING = missionNamespace getVariable ["GRAD_TELEPHONE_CALLS_RUNNING", []];


// enable deleting from any side
GRAD_TELEPHONE_CALLS_RUNNING deleteAt (GRAD_TELEPHONE_CALLS_RUNNING find [_caller + _receiver]);
GRAD_TELEPHONE_CALLS_RUNNING deleteAt (GRAD_TELEPHONE_CALLS_RUNNING find [_receiver + _caller]);
missionNamespace setVariable ["GRAD_TELEPHONE_CALLS_RUNNING", true, true];
