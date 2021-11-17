class _rscRotary {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['_rscRotary', _this select 0];";
    onUnload = "uiNamespace setVariable ['_rscRotary', controlNull];";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class rotary_back: _RscPicture
            {
               idc = 4000;
               text = "grad-landline\data\rotary_back.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_front: _RscPicture
            {
               idc = 5000;
               text = "grad-landline\data\rotary_front.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_ping: _RscPicture
            {
               idc = -1;
               text = "grad-landline\data\rotary_ping.paa";
               x = _100W/2 - 0.5;
               y = _100H/2 - 0.5;
               w = 1;
               h = 1;
             };
    };
};