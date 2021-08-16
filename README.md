# Segway
Design a PID controller in simulink to balance the segway and the output of the PID controller is thetorque to be applied to the segway model.

Design a linear controller to balance the segway and test your controller under different initial conditions.

Implement  the  Extended  Kalman  Filter  using  the  input  and  measurement  data,  choose  the  processnoise covariance, measurement noise   covariance, and the initial state estimate by ourself.

Design  an  output  feedback  controller,  using  EKF  for  state  estimation,  and  using  the  state-feedbackcontroller to map the estimated   state to the control input.

The model folder contains two model.slx, file model.clx is for condition 1 and 2, the model_ctrl.slx is for condition 3 and 4.
The parameters.m contains all of the parameters about segway system.

Folder Controller contains controller for 1 and 2.

Folder EKF contains ekf code and design controller for 3 and 4.
