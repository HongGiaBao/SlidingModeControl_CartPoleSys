% SIMULATION - LINEAR-REGRESSION-BASED INCREMENTAL SLIDING MODE CONTROL FOR CART POLE SYSTEM
% Programmed by: Hong Gia Bao (bao04115@gmail.com).

% Initialize constants for the ISMC_CP simulation
clear all;
clc;
close all;
%% Define constant
%--------------SLIDING MODE CONTROL CONSTANTS------------%
c1      = 232.9210;
c2      = 254.5590;
c3      = -910.3660;
c4      = -279.9920;

%-------------LINEAR REGRESSIONS CONSTANTS SETUP-----------%
x_1      = 30;
x_2      = 15;
x_3      = 8;
x_4      = 7;
x_5      = 6;
x_6      = 5;
x_7      = 4;
x_8      = 3;
x_9      = 2;
x_10     = 0;

%-------------INITIAL CONDITIONS AND PERIOD OF PREDEFINED TRAJECTORY---------%
period  = 20;
x1_init = 0;
x2_init = 0.1;
x3_init = 0.2;
x4_init = 0;

%--------OTHER CONSTANTS-------%
k       = 150;
T       = 0.01;
to      = 0.02;
K       = 800;
A       = to + T/2;
B       = to - T/2;

%% Run simulation
sim('Linear_regression_ISMC_CP.slx');

% Plot the results - Cart position and theta
figure;
t = cartPosition.time;
cartPosition = cartPosition.Data;
referenceTraj = referenceTrajectory.Data;
subplot(2,1,1)
plot(t, cartPosition);
hold on
plot(t, referenceTraj);
t = theta.time;
theta = theta.Data;
subplot(2,1,2)
plot(t, theta)