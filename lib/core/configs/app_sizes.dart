import 'package:flutter/material.dart';

// General spacing
const double space = 8.0;

// General spacing
double space0 = 0.0;
double spaceXXS = space * 0.25; // 2.0
double spaceXS = space * 0.5; // 4.0
double spaceS = space; // 8.0
double spaceM = space * 2; // 16.0
double spaceL = space * 3; // 24.0
double spaceXL = space * 4; // 32.0
double spaceXXL = space * 6; // 48.0

// Padding
EdgeInsets paddingAll0 = EdgeInsets.all(space0);
EdgeInsets paddingAllXS = EdgeInsets.all(spaceXS);
EdgeInsets paddingAllS = EdgeInsets.all(spaceS);
EdgeInsets paddingAllM = EdgeInsets.all(spaceM);
EdgeInsets paddingAllL = EdgeInsets.all(spaceL);

// Common horizontal paddings
EdgeInsets paddingH0 = EdgeInsets.symmetric(horizontal: space0);
EdgeInsets paddingHS = EdgeInsets.symmetric(horizontal: spaceS);
EdgeInsets paddingHM = EdgeInsets.symmetric(horizontal: spaceM);
EdgeInsets paddingHL = EdgeInsets.symmetric(horizontal: spaceL);
EdgeInsets paddingHXL = EdgeInsets.symmetric(horizontal: spaceXL);

// Common vertical paddings
EdgeInsets paddingV0 = EdgeInsets.symmetric(vertical: space0);
EdgeInsets paddingVXXS = EdgeInsets.symmetric(vertical: spaceXXS);
EdgeInsets paddingVXS = EdgeInsets.symmetric(vertical: spaceXS);
EdgeInsets paddingVS = EdgeInsets.symmetric(vertical: spaceS);
EdgeInsets paddingVM = EdgeInsets.symmetric(vertical: spaceM);
EdgeInsets paddingVL = EdgeInsets.symmetric(vertical: spaceL);

// App edge padding
EdgeInsets appEdgePadding =
    EdgeInsets.symmetric(horizontal: spaceM, vertical: spaceS);

// List item spacing
double listItemSpacing = spaceS;

// Card padding
EdgeInsets cardPadding = EdgeInsets.all(spaceM);

// Section spacing
double sectionSpacing = spaceL;

// Border Radius
double radiusS = 4.0;
double radiusM = 8.0;
double radiusL = 16.0;
double radiusXL = 20.0;
double radiusXXL = 24.0;

// Divider
double dividerThin = 0.5;
double dividerThick = 1.0;

// Icon sizes
double iconXS = 8.0;
double iconS = 16.0;
double iconM = 24.0;
double iconL = 32.0;
double iconXL = 48.0;
double iconXXL = 64.0;

// Text sizes
double textXXS = 10.0;
double textXS = 12.0;
double textS = 14.0;
double textM = 16.0;
double textL = 18.0;
double textXL = 20.0;
double textXXL = 24.0;
double textXXXL = 32.0;
double textXXXXL = 36.0;

// Common widget heights
double appBarHeight = 56.0;
double buttonHeight = 48.0;
double inputFieldHeight = 40.0;

// Spacers
Widget verticalSpaceXXS = SizedBox(height: spaceXXS);
Widget verticalSpaceXS = SizedBox(height: spaceXS);
Widget verticalSpaceS = SizedBox(height: spaceS);
Widget verticalSpaceM = SizedBox(height: spaceM);
Widget verticalSpaceL = SizedBox(height: spaceL);
Widget verticalSpaceXL = SizedBox(height: spaceXL);

Widget horizontalSpaceXXS = SizedBox(width: spaceXXS);
Widget horizontalSpaceXS = SizedBox(width: spaceXS);
Widget horizontalSpaceS = SizedBox(width: spaceS);
Widget horizontalSpaceM = SizedBox(width: spaceM);
Widget horizontalSpaceL = SizedBox(width: spaceL);
Widget horizontalSpaceXL = SizedBox(width: spaceXL);

// Screen height
double screenHeightFull = 1;
double screenHeightHalfPlus = 0.75;
double screenHeightHalf = 0.5;
double screenHeightQuarter = 0.25;
double screenHeightFifth = 0.2;
double screenHeightEighth = 0.125;
double screenHeightTenth = 0.1;
double logoSize = 0.15;

// Screen width
double screenWidthFull = 1;
double screenWidthNineTenth = 0.9;
double screenWidthSeventeenTwentieth = 0.85;
double screenWidthFourFifth = 0.8;
double screenWidthHalfPlus = 0.75;
double screenWidthHalf = 0.5;
double screenWidthQuarter = 0.25;
double screenWidthFifth = 0.2;
double screenWidthEighth = 0.125;
double screenWidthTenth = 0.1;

// Define width device
const double tabletWidth = 1200.0;
const double smallTabletWidth = 600.0;
const double mobileWidth = 480.0;
