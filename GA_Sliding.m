% Genetic algorithm - (Application to Sliding mode control algorithm).
% Programmed by: Hong Gia Bao (bao04115@gmail.com)
% Original reference: Huynh Thai Hoang, University of Technology at Ho Chi Minh City.

clc;
clear;
rand('state',sum(100*clock));

%----------------CONSTANTS------------%
Jmin                    = 1e10;
max_generation          = 2e4;
max_stall_generation    = 5e4;
% Stop condition (J<=epsilon, where J is the cost function)
epsilon                 = 0.001;
% Number of individuals in the initial population (number of initial parents)
pop_size                = 500;
% Five chromosomes in an individual (Five values need to be found in the problem)
npar                    = 5; % c1, c2, c3, c4, k
% Range of value of each chromosomes
range                   = [ -1  -1 -1 -1 0;...
    1   1   1   1  1].*100;
dec                     = [2 2 2 2 2].*3/2;
% Number of significant digits in each chromosome
sig                     = [6 6 6 6 6];
cross_prob              = 0.8;
mutate_prob             = 0.2;
elitism                 = 1;
rho                     = 0.02;

%--------------RUNNING GENETIC ALGORITHM-----------%
% Initialize 500 initial parent cases
par                 = Init(pop_size,npar,range);
Terminal            = 0;
generation          = 0;
stall_generation    = 0;

for pop_index=1:pop_size
    % Initialize
    c1  = par(pop_index,1);
    c2  = par(pop_index,2);
    c3  = par(pop_index,3);
    c4  = par(pop_index,4);
    k   = par(pop_index,5);
    sim('Linear_regression_ISMC_CP.slx');
    if length(e1)>9500
        J=e3'*e3;
        if J < Jmin
            Jmin = J;
            c1
            c2
            c3
            c4
            k
            J
        end
        fitness(pop_index)=1/(J+eps);
    else
        J = 10^100;
        fitness(pop_index)=1/(J+eps);
    end
end
[bestfit,bestchrom] = max(fitness);
% The most optimal parental chromosomes
c10 = par(bestchrom,1);
c20 = par(bestchrom,2);
c30 = par(bestchrom,3);
c40 = par(bestchrom,4);
% Due to elitism, it requires having the best parent to
% compare with the following children to find the most optimal
J0 = 1/bestfit+0.001

while ~Terminal
    generation = generation+1;
    disp(['generation #' num2str(generation) ' of maximum ' num2str(max_generation)]);
    % Decimal encoding (chromosomes of individuals)
    pop = Encode_Decimal_Unsigned(par,sig,dec);
    % Linear arrangement of parents (parents with good results have
    % a higher probability of having children, parents with bad results have fewer children or no children)
    parent = Select_Linear_Ranking(pop,fitness,0.2,elitism,bestchrom);
    % Children will be born based on multipoint hybridization
    child = Cross_Twopoint(parent,cross_prob,elitism,bestchrom);
    pop = Mutate_Uniform(child,mutate_prob,elitism,bestchrom);
    par = Decode_Decimal_Unsigned(pop,sig,dec);

    for pop_index=1:pop_size
        c1  = par(pop_index,1);
        c2  = par(pop_index,2);
        c3  = par(pop_index,3);
        c4  = par(pop_index,4);
        k   = par(pop_index,5);
        % Run a simulation to check set of parameter that is optimal
        sim('Linear_regression_ISMC_CP.slx');
        if length(e1)>9500
            J = e3'*e3;
            if J < Jmin
                Jmin = J;
                c1
                c2
                c3
                c4
                k
                J
            end
            fitness(pop_index)=1/(J+eps);
        else
            % If the oscillation only runs until 95 seconds and then stops,
            % it proves that the values of c1, c2, c3, c4, k are not good, no need to continue calculating (set J big).
            J = 10^100;
            fitness(pop_index)=1/(J+eps);
        end
    end
    % Set c1 c2 c3 c4 k makes J smallest, which means bestfit largest
    % will be selected as the optimal individual (best chrome).
    [bestfit(generation),bestchrom]=max(fitness);

    if generation == max_generation
        Terminal = 1;
    elseif generation>1
        if abs(bestfit(generation)-bestfit(generation-1))<epsilon
            stall_generation=stall_generation+1;
            if stall_generation == max_stall_generation, Terminal = 1;
            end
        else
            stall_generation=0;
        end
    end

end

plot(1./bestfit)




