params ["_selectedNumber"];

switch (_selectedNumber) do { 

    case 1 : {  
        [[0.15, 0.2] call BIS_fnc_randomNum, 0.55, 50, 1] call grad_telephone_fnc_rotarySetAngle;
    }; 

    case 2 : {  
        [[0.15, 0.25] call BIS_fnc_randomNum, 0.70, 80, 2] call grad_telephone_fnc_rotarySetAngle;
    };

    case 3 : {  
        [[0.2, 0.3] call BIS_fnc_randomNum, 0.75, 110, 3] call grad_telephone_fnc_rotarySetAngle;
    };

    case 4 : {  
        [[0.30, 0.4] call BIS_fnc_randomNum, 0.85, 140, 4] call grad_telephone_fnc_rotarySetAngle;
    };

    case 5 : {  
        [[0.45, 0.5] call BIS_fnc_randomNum, 1.08, 170, 5] call grad_telephone_fnc_rotarySetAngle;
    };

    case 6 : {  
        [[0.50, 0.6] call BIS_fnc_randomNum, 1.15, 200, 6] call grad_telephone_fnc_rotarySetAngle;
    };

    case 7 : {  
        [[0.55, 0.7] call BIS_fnc_randomNum, 1.3, 230, 7] call grad_telephone_fnc_rotarySetAngle;
    };

    case 8 : {  
        [[0.6, 0.8] call BIS_fnc_randomNum, 1.35, 260, 8] call grad_telephone_fnc_rotarySetAngle;
    };

    case 9 : {  
        [[0.65, 0.9] call BIS_fnc_randomNum, 1.4, 290, 9] call grad_telephone_fnc_rotarySetAngle;
    };

     case 0: {  
        [[0.7, 0.95] call BIS_fnc_randomNum, 1.55, 320, 0] call grad_telephone_fnc_rotarySetAngle;
    }; 

    default {  /*...code...*/ }; 
};