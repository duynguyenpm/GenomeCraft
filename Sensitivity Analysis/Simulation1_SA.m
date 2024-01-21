% clearvars except sim c1 c2 Fc;
% close all;

%% Simulation

% Get parameters===========================================================
ParameterSetting1_SA;

% Run simulation===========================================================
while RT<(Tmax-dt)

    % Define time step-----------------------------------------------------
    c = c+1;
    RT = RT+dt;
    
    % Get concentrations from previous time step---------------------------
    z = [Sav(c-1,:)];
   
    AsE = z(1);   AsI = z(2);   Pars1 = z(3);   ArsB = z(4);    vio = z(5);
    Pars2 = z(6); Flpe = z(7);  GF = z(8);      Pars3 = z(9);   Cre = z(10);
    GC = z(11);   Pars4 = z(12);pig = z(13);    XylR = z(14);
    
    % DDEs------------------------------------------------------------------
    
    % Extracellular arsenic
    dAsE_dt = -k_influx*AsE + k_efflux*ArsB*(AsI/(AsI+T_efflux)) ;
    % Intracellular arsenic
    dAsI_dt = k_influx*AsE - k_efflux*ArsB*(AsI/(AsI+T_efflux)) ;
    % Pars1 activity
    dPars1_dt = k_on*(AsI/(AsI+T_on)) - k_off*Pars1;
    % ArsB level
    dArsB_dt = alpha_A*Pars1 - beta_A*ArsB;
    % violacein level
    dvio_dt = alpha_v*(Pars1/(1+gamma_X*XylR)) - beta_v*vio;
    % Pars2 activity
    dPars2_dt = k_on*(AsI/(AsI+T_on)) - k_off*Pars2;
    % Flpe level
    dFlpe_dt = alpha_F*Pars2*GF - beta_F*Flpe;
    % flpe gene state
    dGF_dt = -Flpe/(Flpe+TF);
    % Pars3 activity
    dPars3_dt = k_on*(AsI/(AsI+T_on))*(1-GF) - k_off*Pars3;
    % Cre level
    dCre_dt = alpha_C*Pars3*GC - beta_C*Cre;
    % cre gene state
    dGC_dt = -Cre/(Cre+TC);
    % Pars4 activity
    dPars4_dt = k_on*(AsI/(AsI+T_on))*(1-GC) - k_off*Pars4;
    % progidiosin level
    dpig_dt = alpha_p*Pars4 - beta_p*pig; 
    % XylR level
    dXylR_dt = alpha_X*Pars4 - beta_X*XylR;
        
    % Update new concentrations--------------------------------------------
    Sav(c,1) = Sav(c-1,1) + dt*dAsE_dt;
    Sav(c,2) = Sav(c-1,2) + dt*dAsI_dt;
    Sav(c,3) = Sav(c-1,3) + dt*dPars1_dt;
    Sav(c,4) = Sav(c-1,4) + dt*dArsB_dt;
    Sav(c,5) = Sav(c-1,5) + dt*dvio_dt;
    Sav(c,6) = Sav(c-1,6) + dt*dPars2_dt;
    Sav(c,7) = Sav(c-1,7) + dt*dFlpe_dt;
    Sav(c,8) = Sav(c-1,8) + dt*dGF_dt;
    Sav(c,9) = Sav(c-1,9) + dt*dPars3_dt;
    Sav(c,10) = Sav(c-1,10) + dt*dCre_dt;
    Sav(c,11) = Sav(c-1,11) + dt*dGC_dt;
    Sav(c,12) = Sav(c-1,12) + dt*dPars4_dt;
    Sav(c,13) = Sav(c-1,13) + dt*dpig_dt;
    Sav(c,14) = Sav(c-1,14) + dt*dXylR_dt;
    
    Sav(Sav<0) = 0; % Prevent negatives
    
    % Update time point----------------------------------------------------
    tpoint(c) = tpoint(c-1)+dt;    
    
end
