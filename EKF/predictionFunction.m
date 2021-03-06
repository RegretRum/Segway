function [x_priori, P_priori] = predictionFunction(x, u, P, Q)
% x(k|k+1)
x_priori = x + [ ...
    x(2) / 1000; ...
    -(80 * u - 9 * x(2)^2 * sind(2*x(1))) / (9000 * (cosd(2*x(1)-3))); ...
    x(4) / 1000; ...
    -(9 * sind(x(1)) * x(2)^2 - 20 * u * cosd(x(1))^2 - 20 * u * cosd(x(1)) + 40 * u) / (1350 * (cosd(x(1))^2 - 2)), ...
    ];

% Fk
F_x = [1, 1 / 1000, 0, 0; ...
    -(80 * u * sind(2*x(1)) + 27 * x(2)^2 * cosd(2*x(1)) - 9 * x(2)^2) / (4500 * (cosd(2*x(1)) - 3)^2), (500 * cosd(2*x(1)) + x(2) * sind(2*x(1)) - 1500) / (500 * (cosd(2*x(1)) - 3)), 0, 0; ...
    0, 0, 1, 1 / 1000; ...
    (9 * x(2)^2 * cosd(x(1))^3 + 20 * u * sind(x(1)) * cosd(x(1))^2 + 40 * u * sind(x(1))) / (1350 * (cosd(x(1))^2 - 2)^2), (x(2) * sind(x(1))) / (75 * (sind(x(1))^2 + 1)), 0, 1];

% P(k|k+1)
P_priori = F_x * P * F_x' + Q;
end
