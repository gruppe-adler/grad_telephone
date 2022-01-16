params ["_caller", "_receiver"];

GRAD_TELEPHONE_CALLS_RUNNING = missionNamespace getVariable ["GRAD_TELEPHONE_CALLS_RUNNING", []];
GRAD_TELEPHONE_CALLS_RUNNING pushBack [_caller, _receiver];
missionNamespace setVariable ["GRAD_TELEPHONE_CALLS_RUNNING", true, true];
