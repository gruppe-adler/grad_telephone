player addAction [
    "Show Calls",
    {
         [] call grad_telephone_fnc_hookShowCalls;
    },
    [],1.5,true,true,"",
    "player getVariable ['grad_telephone_canHook', false]"
];


player addAction [
    "End Hooking",
    {
         [] call grad_telephone_fnc_hookEnd;
    },
    [],1.5,true,true,"",
    "player getVariable ['grad_telephone_hooking', false]"
];