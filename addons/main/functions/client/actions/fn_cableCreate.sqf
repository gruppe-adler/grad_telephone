
    private _helper = "GRAD_telephone_cableHelper" createVehicle [0,0,0];
    _helper attachTo [cursorObject, [0,0,1]];

    ropeCreate [_helper, "lefthand", player, [0,0,1], 5, ["", [0,0,-1]],  ["", [0,0,-1]], "GRAD_telephone_ropeCable"];



    ropehelper = "GRAD_telephone_cableHelper" createVehicle [0,0,0];  
    ropehelper setPos (getPos cursorObject);
    myrope = ropeCreate [
        ropehelper, 
        [0,0,1], 
        player, 
        "lefthand", 
        15, 
        ["", [0,0,-1]],  
        ["", [0,0,-1]], 
        "GRAD_telephone_ropeCable"
    ];

    myrope addEventHandler ["RopeBreak", {
        params ["_object1", "_rope", "_object2"];

        _rope say3d "RHS_USF_boltSnap_m240";
    }];