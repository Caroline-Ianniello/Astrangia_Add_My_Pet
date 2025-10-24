% PREDICT FILE - SYM
function [prdData, info] = predict_Astrangia_poculata_sym(par, data, auxData) %parameters from pars init file...
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); %parscomp reads parameters from pars init file and computes new compound parameters
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData); %pulls the parameters, unpack -- changes the name
  
  %TEMPERATURE
  pars_T = [T_A, T_H, T_AH]; 
    % compute temperature correction factors, for each dataset that includes a rate you have to have some temp sensitivity
  TC = tempcorr(temp.tp, T_ref, pars_T); %CHECK ME
  kT_M = TC * k_M; 
  TC_tp = tempcorr(temp.tp, T_ref, pars_T); %time to puberty
  %TC_tW = tempcorr(temp.tW, T_ref, pars_T);
  %TC_am = tempcorr(temp.am, T_ref, T_A); %life span

  % zero-variate data
  % life cycle
%   pars_tj = [g k l_T v_Hb v_Hj v_Hp]; %pull from parscomp_st()
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); %assuming constant functional response
%   %get_tj simulates from embryo through birth to infinity
  %compute parameters of life stages
    pars_tp = [g k l_T v_Hb v_Hp]; 
  
%New functional response to include food and light
% f_coral = (food.I+food.X) / (K + (food.I+food.X));
%f_coral = (I.TJO+X.TJO) / (K + (I.TJO+X.TJO));
f_coral = (I.TJO+X.TJO) / (1 + (I.TJO+X.TJO));
%but actually I am not going to call it
  % f_coral = (I.tp+X.tp) / (K + (I.tp+X.tp)); %new functional response to include light and food
%f_coral =1;
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);


  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = U_E0 * p_Am;                  % J, initial energy in egg
  V_egg = E0 * w_E/ (mu_E * d_E)/ del_Y^3; % cm^3, volume of egg
  Lw_0= V_egg^(1/3);                 % cm, diameter of egg
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;               % cm, total length at birth at f
%   a_b = t_b/ k_M;                   % d, age at birth  %% DINA: If you need it you should divide by KT_M
 % Wd_b = L_b^3 * d_V * (1 + f_coral * ome);       % dry weight at birth

  
 % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Wd_p = L_p^3*d_V*(1+f*ome);       % g, dry weight at puberty at f
 tT_p = (t_p - t_b)/ kT_M;     % d, time since birth at puberty

 % ultimate
   l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                    % cm, ultimate structural length at f
   Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight, ome converts to wet then * d_V to dry
 
  % reproduction
 % pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
%  pars_R = [kap; kap_R; g; k_J; k_M; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
 % RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
%  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
%  t_m = get_tm_s(pars_tm, f, l_b);  % -, scaled mean life span at T_ref
%   pars_tm = [g; k; v_Hb; v_Hj; v_Hp; h_a/k_M^2; s_G]; 
%   t_m = get_tm_mod('abj', pars_tm, f);  % -, scaled mean life span at T_ref
%  aT_m = t_m/ k_M/ TC;               % d, mean life span at T
  
  % Respiration quotient, assuming ammonia as N-waste (4.55) of DEB3 with nCN = 0
  n = n_HN - 2 * n_HN; % (4.36), Kooy2010
  RQ = 1/ (1 + n_HV/4 - n_OV/2 - n * n_NV/ 4/ n_NN);

  % pack to output (prediction) zero variate
  prdData.tp = tT_p;
%  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  %prdData.Wdp = Wd_p;
  %prdData.Wdi = Wd_i;
  prdData.Lb = Lw_b;
  prdData.RQ = RQ;
  %prdData.Wdb = Wd_b;

  % uni-variate data  

% respiration at different temperatures
pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % parameter vector
p_ref = p_Am * L_m^2; % max assimilation power
%L = (f * p_Am / p_M)^(1/3);  % length at ultimate based on DEB balance, CHECK ME
%L = (Wd_i/ del_W / d_V / (1 + f * w))^(1/3); % structural length from dry weight
L = (weight.TJO/ del_W / d_V / (1 + f * w))^(1/3); % structural length from dry weight %0.2287 is ultimate weight

% % L = (Wd_i / del_W / d_V / (1 + f * w))^(1/3); % structural length from dry weight
pACSJGRD = p_ref * scaled_power(L, f, pars_p, l_b, l_p); % J/d, powers
% Compute mineral fluxes
J_M =  - (n_M \ n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: C, H, O, N
% Convert to µmol O2/d.g dry mass
EJO = -1e6 * J_M(3,:)' ./ weight.TJO; % µmol O2/g dry weight/day
% Apply temperature correction
%TC_TJO = tempcorr(C2K(TJO(:,1)), T_ref, pars_T); %pars_T is the vector of arrhenius parameters
TC_TJO = tempcorr(C2K(TJO(:,1)), T_ref, pars_T); %pars_T is the vector of arrhenius parameters


%   % time-dry weight
%   L_0 = (Wd0.tW/(1+f_tW*ome)/d_V)^(1/3); L_i = f_tW * L_m; %cm,  struct length
%   rT_B = TC_tW * k_M/ 3/ (1 + f_tW/ g);      % 1/d, von Bert growth rate
% 
% %disp(['rT_B = ', num2str(rT_B)]);
% 
%   L = L_i - (L_i - L_0) * exp( - rT_B * tW(:,1));  % cm, struc length, von Bert growth rate
%   EWd = L.^3*(1+f_tW*ome)*d_V; % g, dry weight %f_tW is functional response taking the place of reserve density because it should be equal to reserve density
% 
%  % disp(['L_0 = ', num2str(L_0), ', L_i = ', num2str(L_i)]);


%predict
  prdData.TJO = EJO .* TC_TJO;
   % prdData.tW = EWd;

%save('prdData_export.mat', 'tW', 'prdData', 'data');  % Save time vector and prediction struct
%save('prdData_export.mat', 'tW', 'prdData', 'TJO',  'data'); 

 

