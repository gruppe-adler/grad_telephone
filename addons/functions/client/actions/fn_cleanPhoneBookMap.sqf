{ ctrlDelete _x; } forEach (player getVariable ["_phoneList",[]]); 
{ deleteMarkerLocal _x; } forEach (player getVariable ["_markerList", []]);
deleteMarkerLocal "mrk_PhoneSelect";