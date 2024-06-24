# SIMULATION - LINEAR-REGRESSION-BASED INCREMENTAL SLIDING MODE CONTROL FOR CART POLE SYSTEM
# Author: Hong Gia Bao 
# mail: bao04115@gmail.com

### Introduction
Thank you very much for taking the time to check my work.
This is one of the projects that I have done in my Bachelor's degree time, which is my thesis later on. This is an interesting work. It can be applied to various kinds of underactuated systems, not just CART AND POLE SYSTEMS, by using other equations of motion according to specified systems. 
Furthermore, it should be noted that this work is conducted with references to lots of previous works such as Genetic algorithm (GA), Identification system parameters, Euler-Larange modeling approach, etc.
Finally, this work uses MATLAB/Simulink programming language. This is the revised version (Note: The GA cannot be directly applied in this revision, if you want to use it, please refer to the work of Huynh Thai Hoang and our one).

### Project description
This work is conducted with the following steps:
1.  Finding the equation of motion of the Cart and pole system using Newton's 2nd rule or Euler-Larange approaches. 
2.  Construct the sliding surfaces, and find the control input according to the Incremental sliding mode control (ISMC) algorithm.
3.  Program MATLAB/Simulink with the equation of motion and ISMC based on steps 1 and 2.
4.  Running the GA with the Simulink code above to collect the bet suit set of Sliding surface coefficients. (In this revised version, if you want to run it, please re-program and work on your own based on our provided one.)
    Obtained: c1, c2, c3, c4, k.
5.  Use the obtained coefficients to run the Simulink and plot the results by running `running_simulation_LinearRegressiomISMCCP.m`.

Here are some potential future works that could be employed to improve and enhance the results:

1.  Running with other underactuated systems. 
2.  Based on our code, you can learn from that and develop with your requirements and functionality.
3.  Robustness: Play with input disturbances and uncertainties.

### Prerequisites and Usage
Before running the scripts, ensure you have the following dependencies installed:

1.  MATLAB 2016 or above.

### Running the code
With Genetic Algorithm, make sure you understand the approach and modify the code yourself to obtain the set of coefficients.
With our Simulink, we have provided one set of ISMC coefficients. Hence, to run the code, easily run `running_simulation_LinearRegressiomISMCCP.m`.

### Evaluation
I built this program many years ago, thus, problems can happen or it's not as effective as you expected. It should be noted here that this code is public to share knowledge, not the best one.

!!! (If you are Vietnamese) Please refer to `Do_An_TN.pdf` for the detailed algorithm explanation, evaluation, and suggested enhanced methods (Sorry I cannot provide the English version this time).

If there is any problem in running this project, please contact the author by email: bao04115@gmail.com. Thank you very much!

## Copyright
All rights reserved by Hong Gia Bao, 2024.
