%%% Rate coefficients
% Arsenic flux
k_influx = 10 * Fparam(1); % Arsenic influx [1/h]
k_efflux = 50 * Fparam(2); % Arsenic efflux [1/C*1/h]
T_efflux = 1* Fparam(3);

% Pars promoter
k_on = 50 * Fparam(4); % promoter activation [C/h]
k_off = 5 * Fparam(5); % promoter deactivation [1/h]
T_on = 10 * Fparam(6); % AsI level for half-maximal activation [C]

% ArsB
alpha_A = 3 * Fparam(7); % ArsB expression [1/h]
beta_A = 1 * Fparam(8); % ArsB degradation [1/h]

% violacein
alpha_v = 1 * Fparam(9); % violacein synthesis [C/h]
beta_v = 0.25 * Fparam(10); % violacein decomposition [1/h]
gamma_X = 5 * Fparam(11); % violacein synthesis inhibition by XylR 

% Flpe
alpha_F = 1 * Fparam(12); % Flpe expression [1/C*1/h]
beta_F = 1 * Fparam(13); % Flpe degradation [1/h]

% flpe gene state
TF = 5 * Fparam(14); % Flpe level for half-maximal inversion [C]

% Cre
alpha_C = 1 * Fparam(15); % Cre expression [1/C*1/h]
beta_C = 1 * Fparam(16); % Cre degradation [1/h]

% cre gene state
TC = 5 * Fparam(17); % Cre level for half-maximal inversion [C]

% prodigiosin
alpha_p = 1 * Fparam(18); % prodisiogin synthesis [1/h]
beta_p = 0.25 * Fparam(19); % prodigiosin decomposition [1/h]

% XylR
alpha_X = 3 * Fparam(20); % XylR production [1/h]
beta_X = 1 * Fparam(21); % XylR degradation [1/h]

%% Intialize

% Initial conditions
Tmax=6.12;         % simulation limit [h]      
dt=0.02;        % time step [h]
tpoint=0;       % time point index
RT=0;           % real time at each step
c=1;            % output index
NN=Tmax/dt;     % size of output vectors

% Initial levels (low = 10, high = 100)
Sav = [10^w,   0,   0,   0,    0,   0,     0,    1,  0,     0,   1,...
    0,     0,   0];
%      AsE, AsI, Pars1, ArsB, vio, Pars2, Flpe, GF, Pars3, Cre, GC,...
%   Pars4, pig, XylR     
