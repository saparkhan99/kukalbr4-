function main()
    % Initial guess
    zg = zeros(6, 1); % Adjust the size based on the number of unknowns

    % Solve the system of equations
    z = fsolve(@myFunction, zg);
    z = deg2rad(z)

    % Initial guess
    wx = 0;
    wy = 0;
    wz = -1;
    t6_sin = (-1)*(wy*(sin(z(5))*(cos(z(1))*cos(z(3)) - cos(z(2))*sin(z(1))*sin(z(3))) + cos(z(5))*(cos(z(4))*(cos(z(1))*sin(z(3)) + cos(z(2))*cos(z(3))*sin(z(1))) - sin(z(1))*sin(z(2))*sin(z(4)))) - wx*(sin(z(5))*(cos(z(3))*sin(z(1)) + cos(z(1))*cos(z(2))*sin(z(3))) + cos(z(5))*(cos(z(4))*(sin(z(1))*sin(z(3)) - cos(z(1))*cos(z(2))*cos(z(3))) + cos(z(1))*sin(z(2))*sin(z(4)))) + wz*(cos(z(5))*(cos(z(2))*sin(z(4)) + cos(z(3))*cos(z(4))*sin(z(2))) - sin(z(2))*sin(z(3))*sin(z(5))));
    t6_cos = wx*(sin(z(4))*(sin(z(1))*sin(z(3)) - cos(z(1))*cos(z(2))*cos(z(3))) - cos(z(1))*cos(z(4))*sin(z(2))) - wy*(sin(z(4))*(cos(z(1))*sin(z(3)) + cos(z(2))*cos(z(3))*sin(z(1))) + cos(z(4))*sin(z(1))*sin(z(2))) + wz*(cos(z(2))*cos(z(4)) - cos(z(3))*sin(z(2))*sin(z(4)));
    
    theta_6 = rad2deg((atan2(t6_sin, t6_cos)))

    


    % Display the solution
    disp('Solution:');
    disp(rad2deg(z));
end

function F = myFunction(z)
    syms t1 t2 t3 t4 t5 t6 vx vy vz qx qy d0 d1 d2 d3 d4 d5
    qz = sym('qz');

    % Extract variables from the input vector
    t1 = z(1);
    t2 = z(2);
    t3 = z(3);
    t4 = z(4);
    t5 = z(5);
    t6 = z(6);

    % Convert angles to radians
    t1_rad = deg2rad(t1);
    t2_rad = deg2rad(t2);
    t3_rad = deg2rad(t3);
    t4_rad = deg2rad(t4);
    t5_rad = deg2rad(t5);
    t6_rad = deg2rad(t6);

    % Your system of equations
    F(1) = vx*cos(t1_rad) + vy*sin(t1_rad) - (sin(t5_rad)*(sin(t2_rad)*sin(t4_rad)-cos(t2_rad)*cos(t3_rad)*cos(t4_rad))-cos(t2_rad)*cos(t5_rad)*sin(t3_rad));
    F(2) = vy*cos(t1_rad) - vx*sin(t1_rad) - (cos(t3_rad)*cos(t5_rad)-cos(t5_rad)*sin(t3_rad)*sin(t5_rad));
    F(3) = vz - (-sin(t5_rad)*(cos(t2_rad)*sin(t4_rad)-sin(t2_rad)*cos(t3_rad)*cos(t4_rad))-sin(t2_rad)*cos(t5_rad)*sin(t3_rad));

    F(4) = qx*cos(t1_rad) + qy*sin(t1_rad) - (-sin(t2_rad)*(d2+d3)-cos(t4_rad)*sin(t2_rad)*(d4+d5)-cos(t2_rad)*cos(t3_rad)*sin(t4_rad)*(d4+d5));
    F(5) = qy*cos(t1_rad) - qx*sin(t1_rad) - (-sin(t3_rad)*sin(t4_rad)*(d4+d5));
    F(6) = qz - (d0+d1+cos(t2_rad)*(d2+d3)+cos(t4_rad)*cos(t2_rad)*(d4+d5)-sin(t2_rad)*cos(t3_rad)*sin(t4_rad)*(d4+d5));

    % Substitute values for variables before converting to double
    F = subs(F, {vx, vy, vz, qx, qy, qz, d0, d1, d2, d3, d4, d5}, {0, -1, 0, 0.6, 0.1, 0.2+0.078, 0.051, 0.19998, 0.20002, 0.2, 0.2, 0.19});
    % Convert F to a double array
    F = double(F);
end

