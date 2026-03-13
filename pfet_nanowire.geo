// dimensions in nm 

D = 20; // diameter of the nanowire
Lg = 150; // length of the channel
L_ext = 36; // length of source and drain  
L_ext1 = 4; // length of the overlap between the source/drain and gate oxide 
L_ox = 158; // length of oxides
t_ox1 = 2; // thickness of GeOx
t_ox2 = 9; // thickness of TiN/Al2O3 

mc = 2; // meshing characteristic length at the source/channel and drain/channel interface
mc_c = 1; // characteristic length at oxide channel interface 

// defining the points for gmsh
// here the convention is that the source channel interface is y = 0
// all the point notations are based of the point_schematic.png file 

Point(1) = {0, -L_ext, 0, mc}; 
Point(2) = {0, -L_ext1, 0, mc};
Point(3) = {0, 0, 0, mc};
Point(4) = {-t_ox1, -L_ext1, 0, mc};
Point(5) = {-t_ox1-t_ox2, -L_ext1, 0, mc};
Point(6) = {-t_ox1-t_ox2, L_ox-L_ext1, 0, mc};
Point(7) = {-t_ox1, L_ox-L_ext1, 0, mc};
Point(8) = {0, L_ox-2*L_ext1, 0, mc};
Point(9) = {0, L_ox-L_ext1, 0, mc};
Point(10) = {0, L_ox-2*L_ext1+L_ext, 0, mc};
Point(11) = {D, L_ox-2*L_ext1+L_ext, 0, mc};
Point(12) = {D, L_ox-L_ext1, 0, mc};
Point(13) = {D, L_ox-2*L_ext1, 0, mc};
Point(14) = {D+t_ox1, L_ox-L_ext1, 0, mc};
Point(15) = {D+t_ox1+t_ox2, L_ox-L_ext1, 0, mc};
Point(16) = {D+t_ox1+t_ox2, -L_ext1, 0, mc};
Point(17) = {D+t_ox1, -L_ext1, 0, mc};
Point(18) = {D, 0, 0, mc};
Point(19) = {D, -L_ext1, 0, mc};
Point(20) = {D, -L_ext, 0, mc};


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
