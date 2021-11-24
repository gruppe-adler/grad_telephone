[
  player,
  player,
  "x\grad_telephone\addons\main\data\ico_phone.paa",
  "grad_telephone_action_hookShow",
  localize "STR_grad_telephone_hookShow", "'#11FF11'",
  grad_telephone_fnc_hookShowCalls,
  { player getVariable ['grad_telephone_canHook', false] }
] call GRAD_telephone_fnc_addActionGeneral;

[
  player,
  player,
  "x\grad_telephone\addons\main\data\ico_phone.paa",
  "grad_telephone_action_hookEnd",
  localize "STR_grad_telephone_hookEnd", "'#FF1111'",
  grad_telephone_fnc_hookEnd,
  { player getVariable ['grad_telephone_hooking', false] }
] call GRAD_telephone_fnc_addActionGeneral;
