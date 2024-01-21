clear; clc; close all

%% Get time when output = 0.5 in current parameter
Fparam = ones(1,21);
Simulation_SA;

v = Sav(:,5);
p = Sav(:,13);

blue_fraction =  v./(v+p);

[~,idx] = min(abs(blue_fraction - 0.5));
tHalf0 = tpoint(idx);

tHalf=NaN(2,20);

%% Parameter labels
params = {"k_{influx}","k_{efflux}","T_{efflux}","k_{on}","k_{off}",...
    "T_{on}","\alpha_{ArsB}","\beta_{ArsB}","\alpha_{violacein}",...
    "\beta_{violacein}","\gamma_{XylR}","\alpha_{Flpe}","\beta_{Flpe}",...
    "T_{Flpe}","\alpha_{Cre}","\beta_{Cre}","T_{Cre}","\alpha_{eforRed}",...
    "\beta_{eforRed}","\alpha_{XylR}","\beta_{XylR}"};

%% Multiply each parameter by 2
for u = 1:21

    Fparam = ones(1,21);
    Fparam(u) = 2;

    Simulation_SA;

    v = Sav(:,5);
    p = Sav(:,13);

    blue_fraction =  v./(v+p);

    [~,idx] = min(abs(blue_fraction - 0.5));
    tHalf(1,u) = tpoint(idx);

end

%% Divide each parameter by 2
for u = 1:21

    Fparam = ones(1,21);
    Fparam(u) = 0.5;

    Simulation_SA;

    v = Sav(:,5);
    p = Sav(:,13);

    blue_fraction =  v./(v+p);

    [~,idx] = min(abs(blue_fraction - 0.5));
    tHalf(2,u) = tpoint(idx);

end

%% Calculate change of time
delta_tHalf = abs(tHalf - tHalf0);

sens_tHalf = sum(delta_tHalf,1);

%% Plot
close all
bar(sens_tHalf)
ylabel('Sensitivity coefficient')
xlabel('Parameter')
xticks(1:21)
xticklabels(params)
xtickangle(-45)
set(gca,'FontSize',14)

%% Get initial concentration where output = 0.5 at 6.12h
cHalf0 = 1.5;

cHalf=NaN(2,21);

%% Multiply each parameter by 2

k = 1;
for w = 0:0.05:3

    for u = 1:21

        Fparam = ones(1,21);
        Fparam(u) = 2;

        Simulation1_SA;

        v = Sav(:,5);
        p = Sav(:,13);

        blue_fraction =  v./(v+p);

        outCol(k,u) = blue_fraction(end);

    end

    k = k+1;
end

[~,idx] = min(abs(outCol - 0.5),[],1);
ww = 0:0.05:3;
cHalf(1,:) = ww(idx);

%% Divide each parameter by 2

k = 1;
for w = 0:0.05:3

    for u = 1:21

        Fparam = ones(1,21);
        Fparam(u) = 0.5;

        Simulation1_SA;

        v = Sav(:,5);
        p = Sav(:,13);

        blue_fraction =  v./(v+p);

        outCol(k,u) = blue_fraction(end);

    end

    k = k+1;
end

[~,idx] = min(abs(outCol - 0.5),[],1);
ww = 0:0.05:3;
cHalf(2,:) = ww(idx);

%% Calculate change of threshold
delta_cHalf = abs(cHalf - cHalf0);

sens_cHalf = sum(delta_cHalf,1);

%% Plot

bar(sens_cHalf)
ylabel('Sensitivity coefficient')
xlabel('Parameter')
xticks(1:21)
xticklabels(1:21)
xticklabels(params)
xtickangle(-45)
set(gca,'FontSize',14)
