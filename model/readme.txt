This wheeled inverted pendulum model consists of 2 wheels, 1 mass ball, and 1 mass-less bar that connects the wheels and the mass ball.

The necessary parameters of the model are listed in "parameter.m" dokument, please run this skript before running the model simulation.  

"model.slx" includes the wheeled inverted pendulum model built with Simscape (for more information about this toolbox please see: https://www.mathworks.com/products/simmechanics.html). The model is packaged in the subsystem block named 'wheeled inverted pendulum'.  The input of the system is the torque applyed in the wheels, the output of the system are the rotary angle and angular velocity of the wheel and the bar. The output information of the system is necessary to the feedback controller, and the control input can be directly given to the input of the system.

The initial condition of the model can be set by changing the parameter "initial_angle" in "parameter.m".