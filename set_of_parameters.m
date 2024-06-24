
function [para] = set_of_parameters(set)

    %---------------SYSTEM PARAMETERS CONSTANTS-------------%
    mCart   = 0.39;
    m       = 0.23;
    l       = 480*10^-3;
    a       = 240*10^-3;
    g       = 9.81;
    I       = 1/12*(m^2 + 0.003^2);
    Kb      = 0.053;
    Kt      = 0.053;
    Rm      = 2.7;
    Jm      = 0.00004757719385720;
    Cm      = 7.636116758110123e-05;
    Radius  = 0.015;
    k1      = Kb/Rm/Radius; 
    k2      = (Kb*Kb/Rm + Cm)/Radius^2; 
    k3      = Jm/Radius^2;    
    para    = [mCart m l a g I Kb Kt Rm Jm Cm Radius k1 k2 k3];
    