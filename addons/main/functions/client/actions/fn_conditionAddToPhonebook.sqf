params ["_player", "_target"];

_player distance _target < 2 &&
!(_target getVariable ["GRAD_TELEPHONE_NUMBER_ASSIGNED", "not_assigned"]) in ((_player getVariable ['GRAD_TELEPHONE_ALLNUMBERS', []]) + (missionNamespace getVariable ['GRAD_TELEPHONE_ALLNUMBERS', []])) &&
(!(_player getVariable ['grad_telephone_isCalling', false]))
