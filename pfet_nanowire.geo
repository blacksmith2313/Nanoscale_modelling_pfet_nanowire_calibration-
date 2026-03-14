// dimensions in nm 

D = 20; // diameter of the nanowire
Lg = 150; // length of the channel
L_ext = 36; // length of source and drain  
L_ext1 = 4; // length of the overlap between the source/drain and gate oxide 
L_ox = 158; // length of oxides
t_ox1 = 2; // thickness of GeOx
t_ox2 = 9; // thickness of TiN/Al2O3 

mc_c = 0.5; // meshing charac at the channel 
mc = 1; // meshing characteristic length at general interfaces
mc_g = 5; // characteristic length at gate contact
mc_e = 4; // characteristic length at the sides
mc_eg = 3; // extra meshing param for gate 

// defining the points for gmsh
// here the convention is that the source channel interface is y = 0
// all the point notations are based of the point_schematic.png file 

Point(1) = {0, -L_ext, 0, mc_e}; 
Point(2) = {0, -L_ext1, 0, mc};
Point(3) = {0, 0, 0, mc_c};
Point(4) = {-t_ox1, -L_ext1, 0, mc_eg};
Point(5) = {-t_ox1-t_ox2, -L_ext1, 0, mc_g};
Point(6) = {-t_ox1-t_ox2, L_ox-L_ext1, 0, mc_g};
Point(7) = {-t_ox1, L_ox-L_ext1, 0, mc_eg};
Point(8) = {0, L_ox-2*L_ext1, 0, mc_c};
Point(9) = {0, L_ox-L_ext1, 0, mc};
Point(10) = {0, L_ox-2*L_ext1+L_ext, 0, mc_e};
Point(11) = {D, L_ox-2*L_ext1+L_ext, 0, mc_e};
Point(12) = {D, L_ox-L_ext1, 0, mc};
Point(13) = {D, L_ox-2*L_ext1, 0, mc_c};
Point(14) = {D+t_ox1, L_ox-L_ext1, 0, mc_eg};
Point(15) = {D+t_ox1+t_ox2, L_ox-L_ext1, 0, mc_g};
Point(16) = {D+t_ox1+t_ox2, -L_ext1, 0, mc_g};
Point(17) = {D+t_ox1, -L_ext1, 0, mc_eg};
Point(18) = {D, 0, 0, mc_c};
Point(19) = {D, -L_ext1, 0, mc};
Point(20) = {D, -L_ext, 0, mc_e};
Point(21) = {D/2, L_ox-2*L_ext1, 0, mc_eg}; // these two are for increasing the courseness
Point(22) = {D/2, 0, 0, mc_eg}; // of the mess at the middle of the channel 
// right now the meshing is too dense in the channel region. 
// we will have to make the whole geo file again to change that
// we'll do it later


//+
Line(1) = {1, 2};
//+
Line(2) = {4, 2};
//+
Line(3) = {2, 3};
//+
Line(4) = {5, 4};
//+
Line(5) = {20, 20};
//+
Line(6) = {20, 1};
//+
Line(7) = {19, 20};
//+
Line(8) = {17, 16};
//+
Line(9) = {19, 17};
//+
Line(10) = {18, 19};
//+
Line(11) = {16, 15};
//+
Line(12) = {15, 14};
//+
Line(13) = {14, 12};
//+
Line(14) = {12, 13};
//+
Line(15) = {14, 17};
//+
Line(16) = {13, 18};
//+
Line(17) = {8, 13};
//+
Line(18) = {6, 7};
//+
Line(19) = {7, 9};
//+
Line(20) = {9, 8};
//+
Line(21) = {8, 8};
//+
Line(22) = {8, 3};
//+
Line(23) = {7, 4};
//+
Line(24) = {6, 6};
//+
Line(25) = {6, 6};
//+
Line(26) = {6, 5};
//+
Line(27) = {11, 12};
//+
Line(28) = {10, 11};
//+
Line(29) = {10, 9};
//+
Line(30) = {3, 18};

//+ Oxide_gate
Curve Loop(1) = {26, 4, -23, -18};
Plane Surface(1) = {1};

//+ Oxide_interface
Curve Loop(2) = {19, 20, 22, -3, -2, -23};
Plane Surface(2) = {2};

//+ Source
Curve Loop(3) = {30, 10, 7, 6, 1, 3};
Plane Surface(3) = {3};

//+ Channel
Curve Loop(4) = {22, 30, -16, -17};
Plane Surface(4) = {4};

//+ Drain
Curve Loop(5) = {20, 17, -14, -27, -28, 29};
Plane Surface(5) = {5};

//+ Oxide_interface
Curve Loop(6) = {13, 14, 16, 10, 9, -15};
Plane Surface(6) = {6};

//+ Oxide_gate
Curve Loop(7) = {8, 11, 12, 15};
Plane Surface(7) = {7};


//+ Gate Contact 
Physical Curve(1000000) = {26,11};

//+ Source Contact
Physical Curve(3000000) = {1,7};

//+ Drain Contact
Physical Curve(4000000) = {27,29};

//+ Gate Oxide
Physical Surface("Oxide_gate") = {1,7};
Physical Surface("Oxide_interface") = {2,6};

//+ Source Region
Physical Surface("source") = {3};

//+ Channel Region
Physical Surface("Channel") = {4};

//+ Drain Region
Physical Surface("Drain") = {5};

