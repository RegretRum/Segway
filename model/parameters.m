clear all
ground.height = 0.05;
wheel.radius = 0.15;
wheel.width = 0.04;
wheel.mass = 0.5;
wheel.inertia = wheel.mass*wheel.radius^2/2;
ball.radius = 0.05;
ball.mass = 1.5;
bar.length = 1;
bar.radius = 0.01;
friction.coe = 0.7;

initial_angle = 0; %initial tilt angle of the wheeled inverted pendulum model