#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_LISTBOX 5

#define ST_PICTURE 48
#define CT_MAP_MAIN 101

#define ST_LEFT           0x00
#define ST_CENTER         0x02
#define ST_MULTI 0x10

#define ST_KEEP_ASPECT_RATIO  0x800

#define CT_STRUCTURED_TEXT          13
#define ST_LEFT                     0x00

#define GRAD_TELEPHONE_100H             safeZoneH
#define GRAD_TELEPHONE_100W             safeZoneX + safeZoneW
#define GRAD_COLUMN_COUNT              10
#define GRAD_COLUMN_W                  GRAD_TELEPHONE_100W/GRAD_COLUMN_COUNT
#define GRAD_ROW_COUNT                 20
#define GRAD_ROW_H                     (safeZoneY + GRAD_TELEPHONE_100H)/GRAD_ROW_COUNT

#define GRAD_TELEPHONE_PHONEBOOK_X      GRAD_COLUMN_W // single column padding
#define GRAD_TELEPHONE_PHONEBOOK_Y      GRAD_ROW_H*2 + safeZoneY
#define GRAD_TELEPHONE_PHONEBOOK_W      GRAD_COLUMN_W*4
#define GRAD_TELEPHONE_PHONEBOOK_H      GRAD_ROW_H*16

class grad_telephone_RscPicture
{
 type = CT_STATIC;
 idc = -1;
 style = 48 + 0x800;
 colorBackground[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 font = "TahomaB";
 sizeEx = 0;
 lineSpacing = 0;
 text = "";
 fixedWidth = 0;
 shadow = 0;
};

class grad_telephone_RscButton
{
  type = CT_BUTTON;
  text = "";
  colorText[] = {1,1,1,.9};
  colorDisabled[] = {0.4,0.4,0.4,1};
  colorBackground[] = {0,0,0,1};
  colorBackgroundDisabled[] = {0,0.0,0};
  colorBackgroundActive[] = {0,0,0,1};
  colorFocused[] ={0,0,0,0.7};
  colorShadow[] = {0,0,0,0};
  colorBorder[] = {0,0,0,0};
  soundEnter[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.09,1};
  soundPush[] = {"\A3\ui_f\data\sound\CfgNotifications\taskCreated",0.0,0};
  soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.07,1};
  soundEscape[] = {"\A3\ui_f\data\sound\ReadOut\ReadoutHideClick1",0.09,1};
  style = 2; //2
  x = 0;
  y = 0;
  w = 0.055589;
  h = 0.039216;
  shadow = 2;
  font = "RobotoCondensed";
  sizeEx = 0.03921;
  offsetX = 0.003;
  offsetY = 0.003;
  offsetPressedX = 0.0;
  offsetPressedY = 0.002;
  borderSize = 0;
  period = 0;
};

class grad_telephone_RscStructuredText {
    idc = -1;
    access = 0;
    type = CT_STRUCTURED_TEXT;
    style = 0;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    colorText[] = { 1 , 1 , 1 , 1 };
    colorBackground[] = {0,0,0,0.4};
    class Attributes {
        font = "RobotoCondensed";
        color = "#e0d8a6";
        align = "left";
        shadow = 0;
    };
    text = "";
    size = 0.03921;
    shadow = 2;
};


class grad_telephone_RscListBox
{ 
  idc = -1;
  type = CT_LISTBOX;
  style = ST_LEFT;
  w = 0.4;
  h = 0.4;
  rowHeight = 0.2;
  colorText[] = {1, 1, 1, 1};
  colorDisabled[] = {1, 1, 1, 0.25};
  colorScrollbar[] = {1, 0, 0, 0};
  colorSelect[] = {0, 0, 0, 1};
  colorSelect2[] = {0, 0, 0, 1};
  colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
  colorSelectBackground2[] = {0.95, 0.95, 0.95, 0.5};
  colorBackground[] = {0, 0, 0, 0.4};
  soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09, 1};
  autoScrollSpeed = -1;
  autoScrollDelay = 5;
  autoScrollRewind = 0;
  arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
  arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
  colorPicture[] = {1, 1, 1, 1};
  colorPictureSelected[] = {1, 1, 1, 1};
  colorPictudeDisabled[] = {1, 1, 1, 0.25};
  tooltipColorText[] = {1, 1, 1, 1};
  tooltipColorBox[] = {1, 1, 1, 1};
  tooltipColorShade[] = {0, 0, 0, 0.65};
  font = "RobotoCondensed";
  sizeEx = 0.055;
  shadow = 0;
  colorShadow[] = {0, 0, 0, 0.5};
  period = 0.8;
  maxHistoryDelay = 1;
  colorPictureDisabled[] = {1, 1, 1, 1};

  class ListScrollBar
  {
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
  };
};


class grad_telephone_RscMapControl
{
  idc = -1;
  type = CT_MAP_MAIN;
  style = ST_PICTURE;

  x = 0.10;
  y = 0.10;
  w = 0.80;
  h = 0.60;

    widthRailWay = 1;
    moveOnEdges = 0;
     shadow = 1;
     ptsPerSquareSea = 5;
     ptsPerSquareTxt = 3;
     ptsPerSquareCLn = 10;
     ptsPerSquareExp = 10;
     ptsPerSquareCost = 10;
     ptsPerSquareFor = 9;
     ptsPerSquareForEdge = 9;
     ptsPerSquareRoad = 6;
     ptsPerSquareObj = 9;
     showCountourInterval = 1;
     scaleMin = 0.001;
     scaleMax = 1.0;
     scaleDefault = 0.16;
     maxSatelliteAlpha = 0;
     alphaFadeStartScale = 0.35;
     alphaFadeEndScale = 0.4;
     colorBackground[] = {0.969,0.957,0.949,1.0};
     colorSea[] = {0.467,0.631,0.851,0.5};
     colorForest[] = {0.624,0.78,0.388,0.5};
     colorForestBorder[] = {0.0,0.0,0.0,0.0};
     colorRocks[] = {0.0,0.0,0.0,0.3};
     colorRocksBorder[] = {0.0,0.0,0.0,0.0};
     colorLevels[] = {0.286,0.177,0.094,0.5};
     colorMainCountlines[] = {0.572,0.354,0.188,0.5};
     colorCountlines[] = {0.572,0.354,0.188,0.25};
     colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
     colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
     colorPowerLines[] = {0.1,0.1,0.1,1.0};
     colorRailWay[] = {0.8,0.2,0.0,1.0};
     colorNames[] = {0.1,0.1,0.1,0.9};
     colorInactive[] = {1.0,1.0,1.0,0.5};
     colorOutside[] = {0.0,0.0,0.0,1.0};
     colorTracks[] = {0.84,0.76,0.65,0.15};
     colorTracksFill[] = {0.84,0.76,0.65,1.0};
     colorRoads[] = {0.7,0.7,0.7,1.0};
     colorRoadsFill[] = {1.0,1.0,1.0,1.0};
     colorMainRoads[] = {0.9,0.5,0.3,1.0};
     colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
     colorGrid[] = {0.1,0.1,0.1,0.6};
     colorGridMap[] = {0.1,0.1,0.1,0.6};
     fontLabel = "PuristaMedium";
     sizeExLabel = "(               (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
     fontGrid = "TahomaB";
     sizeExGrid = 0.02;
     fontUnits = "TahomaB";
     sizeExUnits = "(               (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
     fontNames = "PuristaMedium";
     sizeExNames = "(               (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
     fontInfo = "PuristaMedium";
     sizeExInfo = "(               (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
     fontLevel = "TahomaB";
     sizeExLevel = 0.02;

     colorText[] = {1,1,1,1.0};
     font = "PuristaMedium";
     text = "#(argb,8,8,3)color(1,1,1,1)";
     SizeEx = "(               (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
     //size = "(               (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

     class Legend
     {
          x = "SafeZoneX +                          (               ((safezoneW / safezoneH) min 1.2) / 40)";
          y = "SafeZoneY + safezoneH - 4.5 *                          (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          w = "10 *                          (               ((safezoneW / safezoneH) min 1.2) / 40)";
          h = "3.5 *                          (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
          font = "PuristaMedium";
          sizeEx = "(               (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
          colorBackground[] = {1,1,1,0.5};
          color[] = {0,0,0,1};
     };
     class Task
     {
          icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
          iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
          iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
          iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
          iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
          color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
          colorCreated[] = {1,1,1,1};
          colorCanceled[] = {0.7,0.7,0.7,1};
          colorDone[] = {0.7,1,0.3,1};
          colorFailed[] = {1,0.3,0.2,1};
          size = 27;
          importance = 1;
          coefMin = 1;
          coefMax = 1;
     };
     class Waypoint
     {
          icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
          color[] = {0,0,0,1};
          size = 27;
          importance = 1;
          coefMin = 1;
          coefMax = 1;
     };
     class WaypointCompleted
     {
          icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
          color[] = {0,0,0,1};
          size = 27;
          importance = 1;
          coefMin = 1;
          coefMax = 1;
     };
     class CustomMark
     {
          icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
          size = 24;
          importance = 1;
          coefMin = 1;
          coefMax = 1;
          color[] = {0,0,0,1};
     };
     class Command
     {
          icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
          size = 18;
          importance = 1;
          coefMin = 1;
          coefMax = 1;
          color[] = {1,1,1,1};
     };
     class Bush
     {
          icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
          color[] = {0.45,0.64,0.33,0.4};
          size = "14/2";
          importance = "0.2 * 14 * 0.05 * 0.05";
          coefMin = 0.25;
          coefMax = 4;
     };
     class Rock
     {
          icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
          color[] = {0.1,0.1,0.1,0.8};
          size = 12;
          importance = "0.5 * 12 * 0.05";
          coefMin = 0.25;
          coefMax = 4;
     };
     class SmallTree
     {
          icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
          color[] = {0.45,0.64,0.33,0.4};
          size = 12;
          importance = "0.6 * 12 * 0.05";
          coefMin = 0.25;
          coefMax = 4;
     };
     class Tree
     {
          icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
          color[] = {0.45,0.64,0.33,0.4};
          size = 12;
          importance = "0.9 * 16 * 0.05";
          coefMin = 0.25;
          coefMax = 4;
     };
     class busstop
     {
          icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class fuelstation
     {
          icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class hospital
     {
          icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class church
     {
          icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class lighthouse
     {
          icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class power
     {
          icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class powersolar
     {
          icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class powerwave
     {
          icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class powerwind
     {
          icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class quay
     {
          icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class shipwreck
     {
          icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class transmitter
     {
          icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class watertower
     {
          icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {1,1,1,1};
     };
     class Cross
     {
          icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {0,0,0,1};
     };
     class Chapel
     {
          icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
          size = 24;
          importance = 1;
          coefMin = 0.85;
          coefMax = 1.0;
          color[] = {0,0,0,1};
     };
     class Bunker
     {
          icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
          size = 14;
          importance = "1.5 * 14 * 0.05";
          coefMin = 0.25;
          coefMax = 4;
          color[] = {0,0,0,1};
     };
     class Fortress
     {
          icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
          size = 16;
          importance = "2 * 16 * 0.05";
          coefMin = 0.25;
          coefMax = 4;
          color[] = {0,0,0,1};
     };
     class Fountain
     {
          icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
          size = 11;
          importance = "1 * 12 * 0.05";
          coefMin = 0.25;
          coefMax = 4;
          color[] = {0,0,0,1};
     };
     class Ruin
     {
          icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
          size = 16;
          importance = "1.2 * 16 * 0.05";
          coefMin = 1;
          coefMax = 4;
          color[] = {0,0,0,1};
     };
     class Stack
     {
          icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
          size = 20;
          importance = "2 * 16 * 0.05";
          coefMin = 0.9;
          coefMax = 4;
          color[] = {0,0,0,1};
     };
     class Tourism
     {
          icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
          size = 16;
          importance = "1 * 16 * 0.05";
          coefMin = 0.7;
          coefMax = 4;
          color[] = {0,0,0,1};
     };
     class ViewTower
     {
          icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
          size = 16;
          importance = "2.5 * 16 * 0.05";
          coefMin = 0.5;
          coefMax = 4;
          color[] = {0,0,0,1};
     };

     class ActiveMarker
     {
          //icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
          size = 24;
          importance = 1;
          coefMin = 1;
          coefMax = 1;
          color[] = {0,0,0,1};
     };
    class LineMarker 
    { 
        lineDistanceMin = 3e-005; 
        lineLengthMin = 5; 
        lineWidthThick = 0.014; 
        lineWidthThin = 0.008; 
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)"; 
    };
};