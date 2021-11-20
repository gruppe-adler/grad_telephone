class grad_telephone_rscKeypad {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_telephone_rscKeypad', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_telephone_rscKeypad', controlNull];";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class keypad_back: grad_telephone_RscPicture
            {
               idc = 4000;
               text = "x\grad_telephone\addons\main\data\keypad_init.paa";
               x = GRAD_TELEPHONE_100W/2 - 0.5;
               y = GRAD_TELEPHONE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class keypad_front: grad_telephone_RscPicture
            {
               idc = 5000;
               text = "x\grad_telephone\addons\main\data\keypad_1.paa";
               x = GRAD_TELEPHONE_100W/2 - 0.5;
               y = GRAD_TELEPHONE_100H/2 - 0.5;
               w = 1;
               h = 1;
               show = 0;
             };
    };
};