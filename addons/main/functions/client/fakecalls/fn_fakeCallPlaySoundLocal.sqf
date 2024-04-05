params ["_phone", "_sound"];

private _soundObject = _phone say3D [_sound, 5];
diag_log format ["Debug: fakeCallPlaySound - playing fake 3d sound locally"];

[{
	params ["_phone", "_soundObject"];

	!([_phone, "calling"] call grad_telephone_fnc_callGetStatus)
},{
	params ["_phone", "_soundObject"];

	diag_log format ["Debug: fakeCallPlaySoundLocal - deleted sound at %1 ", _phone];

	if (!isNull _soundObject) then {
		deleteVehicle _soundObject;
	};
}, [_phone, _soundObject]] call CBA_fnc_waitUntilAndExecute;
