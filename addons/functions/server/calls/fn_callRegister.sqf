params ["_caller", "_receiver"];

_CALLS_RUNNING pushBack [_caller, _receiver];
publicVariable "_CALLS_RUNNING";