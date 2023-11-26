%% declarations:
syms a b c d e f g d0 d1 d2 d3 d4 d5 d6 px py pz p0 ux uy uz u0 vx vy vz v0 wx wy wz w0;

A1 = [cos(a), -sin(a), 0, 0 ; sin(a), cos(a), 0, 0; 0,0,1,0; 0,0,0,1]
R1 = [cos(a), -sin(a), 0; sin(a), cos(a), 0; 0,0,1]


A2 = [cos(b), 0, -sin(b), (d0+d1)*sin(b); 0,1,0,0; sin(b), 0, cos(b), (1-cos(b))*(d0+d1); 0,0,0,1]
R2 = [cos(b), 0, -sin(b) ; 0,1,0; sin(b), 0, cos(b)]


A3 = [cos(c), -sin(c), 0, 0 ; sin(c), cos(c), 0, 0; 0,0,1,0; 0,0,0,1]
R3 = [cos(c), -sin(c), 0; sin(c), cos(c), 0; 0,0,1]


A4 = [cos(d), 0, -sin(d), (d0+d1+d2+d3)*sin(d); 0,1,0,0; sin(d), 0, cos(d), (1-cos(d))*(d0+d1+d2+d3); 0,0,0,1]
R4 = [cos(d), 0, -sin(d) ; 0,1,0; sin(d), 0, cos(d)]

A5 = [cos(e), -sin(e), 0, 0 ; sin(e), cos(e), 0, 0; 0,0,1,0; 0,0,0,1]
R5 = [cos(e), -sin(e), 0; sin(e), cos(e), 0; 0,0,1]


A6 = [cos(f), 0, -sin(f), (d0+d1+d2+d3+d4+d5)*sin(f); 0,1,0,0; sin(f), 0, cos(f), (1-cos(f))*(d0+d1+d2+d3+d4+d5); 0,0,0,1]
R6 = [cos(f), 0, -sin(f) ; 0,1,0; sin(f), 0, cos(f)]

A7 = [cos(g), 0, -sin(g), (d0+d1+d2+d3+d4+d5)*sin(g); 0,1,0,0; sin(g), 0, cos(g), (1-cos(g))*(d0+d1+d2+d3+d4+d5); 0,0,0,1]
R7 = [cos(g), 0, -sin(g) ; 0,1,0; sin(g), 0, cos(g)]


A = A1*A2*A3*A4*A5*A6

%% calculation of angle 1 and 2:

left1 = simplify(inv(A1))*[px;py;pz;1]
right1 = simplify(A2*A3*A4*[0;0;d0+d1+d2+d3;1])

%% calculation joint angles 1, 2, 3, 4, and 5:

left2 = simplify(inv(A1))*[qx;qy;qz;1]
right2 = simplify(A2*A3*A4*A5*[0;0;d0+d1+d2+d3+d4+d5;1])


left3 = simplify((R1).'*[vx;vy;vz])
right3 = (R2*R3*R4*R5)*[0;1;0]

%% calculations of joint angle 6:
left3 = simplify((R1*R2*R3*R4*R5).'*[wx;wy;wz])
right3 = (R6)*[0;0;1]


