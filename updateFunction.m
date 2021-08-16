function [x_next, P_next] = updateFunction(x_priori, P_priori, R, ymeas)
x = x_priori;
H = [x(2); x(4)];
H_x = [0, 1, 0, 0; 0, 0, 0, 1];

% Kalman Gain
K = P_priori * H_x' / (H_x * P_priori * H_x' + R);

% P(k+1) & x(k+1)
P_next = (eye(size(P_priori)) - K * H_x) * P_priori;
x_next = x_priori + K * (ymeas - H);
end
