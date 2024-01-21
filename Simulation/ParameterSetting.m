%% Rate coefficients
% Arsenic flux
k_influx = 10; % Arsenic influx [1/h]
k_efflux = 50; % Arsenic efflux [1/C*1/h]
T_efflux = 1; % AsI level for half-maximal arsenic efflux [C]

% Pars promoter
k_on = 50; % promoter activation [C/h]
k_off = 5; % promoter deactivation [1/h]
T_on = 10; % AsI level for half-maximal activation [C]

% ArsB
alpha_A = 3; % ArsB expression [1/h]
beta_A = 1; % ArsB degradation [1/h]

% violacein
alpha_v = 1; % violacein synthesis [C/h]
beta_v = 0.25; % violacein decomposition [1/h]
gamma_X = 5; % violacein synthesis inhibition by XylR 

% Flpe
alpha_F = 1; % Flpe expression [1/C*1/h]
beta_F = 1; % Flpe degradation [1/h]

% flpe gene state
TF = 5; % Flpe level for half-maximal inversion [C]

% Cre
alpha_C = 1; % Cre expression [1/C*1/h]
beta_C = 1; % Cre degradation [1/h]

% cre gene state
TC = 5; % Cre level for half-maximal inversion [C]

% prodigiosin
alpha_p = 1; % prodisiogin synthesis [1/h]
beta_p = 0.25; % violacein decomposition [1/h]

% XylR
alpha_X = 3; % XylR production [1/h]
beta_X = 1; % XylR degradation [1/h]

%% Intialize

% Initial conditions
Tmax=6;         % simulation limit [h]      
dt=0.02;        % time step [h]
tpoint=0;       % time point index
RT=0;           % real time at each step
c=1;            % output index
NN=Tmax/dt;     % size of output vectors

% Initial levels (low = 10, high = 100)
Sav = [10,   0,   0,   0,    0,   0,     0,    1,  0,     0,   1,...
    0,     0,   0];
%      AsE, AsI, Pars1, ArsB, vio, Pars2, Flpe, GF, Pars3, Cre, GC,...
%   Pars4, pig, XylR     
