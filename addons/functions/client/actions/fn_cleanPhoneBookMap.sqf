{ ctrlDelete _x; } forEach (player getVariable ['grad_telephone_phoneList',[]]);
{ deleteMarkerLocal _x; } forEach (player getVariable ['grad_telephone_markerList', []]);
deleteMarkerLocal "mrk_PhoneSelect";
