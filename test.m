clear;clc;
%% Load Files
parameters
controlinput = load('data/measurement_data/controlinput.mat');
controlinput = controlinput.ans;
mea_acceleration = load('data/measurement_data/mea_acceleration.mat');
mea_acceleration = mea_acceleration.ans;
mea_omega = load('data/measurement_data/mea_omega.mat');
mea_omega = mea_omega.ans;
tilt_angle = load('data/ground_truth/tilt_angle.mat');
tilt_angle = tilt_angle.ans;
tilt_omega = load('data/ground_truth/tilt_omega.mat');
tilt_omega = tilt_omega.ans;
wheel_angle = load('data/ground_truth/wheel_angle.mat');
wheel_angle = wheel_angle.ans;
wheel_omega = load('data/ground_truth/wheel_omega.mat');
wheel_omega = wheel_omega.ans;

int_velo = zeros(1,10001);
int_val = 0;
for i = 1:10001
    int_val = int_val + mea_acceleration(i);
    int_velo(i) = int_val;
end

% figure(1)
% hold on
% plot(mea_acceleration(1,:),mea_acceleration(2,:))
% plot(mea_omega(1,:),mea_omega(2,:))
% plot(tilt_angle(1,:),tilt_angle(2,:))
% plot(tilt_omega(1,:),tilt_omega(2,:))
% plot(wheel_angle(1,:),wheel_angle(2,:))
% plot(wheel_omega(1,:),wheel_omega(2,:))
% legend('ma','mo','ta','to','wa','wo')

%% 
x_filtered = zeros(4,10001);
y_filtered = zeros(2,10001);
x_last = [0.3491,0,0,0.3491]';
C_t = [0,1,0,0;0,0,0,1];
P_last = 0.001 * diag([1, 1, 1, 1]);
Q_t = 1e-3 * diag([0.0001, 0.1, 10, 100]);
R_t = diag([0.02, 0.01]);
for i = 1:10001
    [x_bar,P_bar] = predictionFunction(x_last,controlinput(2,i),P_last,Q_t);
    [x,P] = updateFunction(x_bar, P_bar, R_t, [mea_omega(2,i);mea_acceleration(2,i)*0.15]);
    x_filtered(:,i) = x;
    y_filtered(:,i) = C_t*x;
    x_last = x;
    P_last = P;
end

int_x4 = zeros(1,10001);
int_val = 0;
for i = 1:10001
    int_val = int_val + x_filtered(4,i);
    int_x4(i) = int_val;
end
iint_x4 = zeros(1,10001);
int_val = 0;
for i = 1:10001
    int_val = int_val + int_x4(i);
    iint_x4(i) = int_val;
end

%%
figure(2)
subplot(2,2,1)
hold on
plot(tilt_angle(2,1:8000))
plot(x_filtered(1,1:8000))
legend('ground truth','x(1) ekf')
subplot(2,2,2)
hold on
%plot(mea_omega(2,1:8000))
plot(tilt_omega(2,1:8000))
plot(y_filtered(1,1:8000))
plot(x_filtered(2,1:8000))
%plot(mea_omega(2,:))
%plot(tilt_omega(2,:))
%plot(y_filtered(1,:))
legend('ground truth','y(1) ekf','x(2) ekf')
subplot(2,2,3)
hold on
plot(wheel_angle(2,1:8000))
plot(0.3491+iint_x4(1:8000)/(20000*1.12))
legend('ground truth','x(3) ekf')
subplot(2,2,4)
hold on
%plot(mea_acceleration(2,1:8000))
%plot(wheel_angle(2,1:8000))
%plot(y_filtered(2,1:8000))
plot(wheel_omega(2,1:8000))
plot(x_filtered(3,1:8000)/(0.15*0.15))
%legend('ground truth','y(2) ekf','x(4) ekf')
legend('ground truth','x(4) ekf')