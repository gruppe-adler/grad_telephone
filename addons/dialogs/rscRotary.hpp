class grad_telephone_rscRotary {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_telephone_rscRotary', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_telephone_rscRotary', controlNull];";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class rotary_back: grad_telephone_RscPicture
            {
               idc = 4000;
               text = "grad_telephone\addons\data\rotary_back.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_front: grad_telephone_RscPicture
            {
               idc = 5000;
               text = "grad_telephone\addons\data\rotary_front.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_ping: grad_telephone_RscPicture
            {
               idc = -1;
               text = "grad_telephone\addons\data\rotary_ping.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
             };
    };
};