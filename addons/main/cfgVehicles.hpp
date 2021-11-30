class CfgVehicles
  {
  class Items_base_F;
  class GRAD_telephone_item_phonebook: Items_base_F
  {
    author = "nomisum";
    mapSize = 0.24;
    editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_File1_F.jpg";
    scope = 2;
    scopeCurator = 2;
    displayName = "Phone Book";
    model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
    icon = "iconObject_2x3";
    editorSubcategory = "EdSubcat_Office";
    hiddenSelections[] = {"camo"};
    hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.835294,0,0,0.0,ca)"};
  };

  class Rope;
  class GRAD_telephone_ropeCable : Rope
  {
    maxRelLenght = 1.1; // max relative length
    maxExtraLenght = 0;  // max absolute length
    springFactor = 1;         // higher == less stretchy rope
    segmentType = "grad_telephone_ropeSegment";  // reference to CfgNonAIVehicles' class
    torqueFactor = 0.5;
    dampingFactor[] = {1.0,2.5,1.0};
    model = "x\grad_telephone\addons\main\data\tfar_wire.p3d";
  };

  class Helicopter_Base_F;
  class GRAD_telephone_cableHelper: Helicopter_Base_F {
        scope = 1;
        displayName = "GRAD Telephone Cable Helper";
        model = "\A3\Weapons_f\empty";
        damageEffect = "";
        destrType = "";
        class ACE_Actions {};
        class ACE_SelfActions {};
        class HitPoints {};
        class Turrets {};
        class TransportItems {};
    };
};

class CfgNonAIVehicles
{
  class grad_telephone_ropeSegment
  {
    scope = 2;
    displayName = "";
    simulation = "ropesegment";
    autocenter = 0;
    animated = 0;
    model = "x\grad_telephone\addons\main\data\tfar_wire.p3d";
  };
};