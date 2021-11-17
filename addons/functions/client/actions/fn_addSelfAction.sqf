player addAction [
    "Show Calls",
    {
         [] call _fnc_hookShowCalls;
    },
    [],1.5,true,true,"",
    "player getVariable ['_canHook', false]"
];


player addAction [
    "End Hooking",
    {
         [] call _fnc_hookEnd;
    },
    [],1.5,true,true,"",
    "player getVariable ['_hooking', false]"
];