class _rscKeypad {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['_rscKeypad', _this select 0];";
    onUnload = "uiNamespace setVariable ['_rscKeypad', controlNull];";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class keypad_back: _RscPicture
            {
               idc = 4000;
               text = "grad-landline\data\keypad_init.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class keypad_front: _RscPicture
            {
               idc = 5000;
               text = "grad-landline\data\keypad_1.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
               show = 0;
             };
    };
};