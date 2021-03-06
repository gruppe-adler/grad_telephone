class CfgMarkers
{
  class Flag;

  class ico_booth: Flag
  {
    scope = 1;
    name = "GRAD TELEPHONE Phone Booth";
    icon = "x\grad_telephone\addons\main\data\ico_booth.paa";
    texture = "x\grad_telephone\addons\main\data\ico_booth.paa";
    color[] = {0, 0, 0, 1}; //Color used for the icon and text
    shadow = 0; //1=Shadow, 0=No shadow
    markerClass = "Locations"; //
    side = 1; //Side ID
    size = 24; //Default icon size
    showEditorMarkerColor = 1; //Whether to show icon color in the editor
  };

  class ico_phone: Flag
  {
    scope = 1; //Accessibility 1=public, 0=private
    name = "GRAD TELEPHONE Phone"; //Name used in the Editor and other UIs
    icon = "x\grad_telephone\addons\main\data\ico_phone.paa"; //Marker icon
    texture = "x\grad_telephone\addons\main\data\ico_phone.paa"; //?
    color[] = {0, 0, 0, 1}; //Color used for the icon and text
    shadow = 0; //1=Shadow, 0=No shadow
    markerClass = "Locations"; //
    side = 1; //Side ID
    size = 24; //Default icon size
    showEditorMarkerColor = 1; //Whether to show icon color in the editor
  };
};
