params ["_selectedNumber"];

switch (_selectedNumber) do { 

    case 1 : {  
        [0.37, 0.55, 50, 1] call grad_telephone_fnc_rotarySetAngle;
    }; 

    case 2 : {  
        [0.25, 0.70, 80, 2] call grad_telephone_fnc_rotarySetAngle;
    };

    case 3 : {  
        [0.35, 0.75, 110, 3] call grad_telephone_fnc_rotarySetAngle;
    };

    case 4 : {  
        [0.45, 0.85, 140, 4] call grad_telephone_fnc_rotarySetAngle;
    };

    case 5 : {  
        [0.5, 1.08, 170, 5] call grad_telephone_fnc_rotarySetAngle;
    };

    case 6 : {  
        [0.65, 1.15, 200, 6] call grad_telephone_fnc_rotarySetAngle;
    };

    case 7 : {  
        [0.67, 1.3, 230, 7] call grad_telephone_fnc_rotarySetAngle;
    };

    case 8 : {  
        [0.68, 1.35, 260, 8] call grad_telephone_fnc_rotarySetAngle;
    };

    case 9 : {  
        [0.8, 1.4, 290, 9] call grad_telephone_fnc_rotarySetAngle;
    };

     case 0: {  
        [.95, 1.55, 320, 0] call grad_telephone_fnc_rotarySetAngle;
    }; 

    default {  /*...code...*/ }; 
};