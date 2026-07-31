%% tempcorr
% computes temperature correction factor

%%
function TC = TempCorr (T, T_ref, pars_T)
  %  Created at 2002/04/09 by Bas Kooijman; modified 2005/01/24, 2016/11/18, 
  %  Dina Lika & Bas Kooijman: 2019/02/26
  
  %% Syntax
  % TC = <../tempcorr.m *tempcorr*> (T, T_ref, pars_T)

  %% Description
  %  Calculates the factor with which physiological rates should be multiplied 
  %    to go from a reference temperature to a given temperature.
  %  The 3-parameter version models low or high temerature torpor, depending the the value of the boudary temparature, relative to the  reference temperatur, the 5-parameter version models both.
  %  The 5- parameter version assumes that the reference temperature is between the lower and upper temperature boundaries.
  %
  % Input
  %
  % * T: vector with temperatures in K
  % * d: measured data of hart rates
  % * T_ref: scalar with reference temperature in K
  % * pars_T: 5-vector with temperature parameters in K and rate mu
  %
  %     T_A, T_L, T_H, T_AL, T_AH, mu    
  %
  % Output:
  %
  % * TL: loss-function value 
  
  
  
  T_A = pars_T(1); % Arrhenius temperature
  s_A = exp(T_A/ T_ref - T_A ./ T);  % Arrhenius factor
    
 % T_L  = pars_T(2);  % Lower temp boundary
  T_H  = pars_T(2);  % Upper temp boundary
  %T_AL = pars_T(4);  % Arrh. temp for lower boundary
  T_AH = pars_T(3);  % Arrh. temp for upper boundary
  
  mu = pars_T(4);     % rate of process at reference temperature
    

    %s_L_ratio = (1 + exp(T_AL/ T_ref - T_AL/ T_L)) ./ ...
	   %         (1 + exp(T_AL ./ T   - T_AL/ T_L));
      s_H_ratio = (1 + exp(T_AH/ T_H - T_AH ./ T_ref)) ./ ...
	              (1 + exp(T_AH/ T_H - T_AH ./ T    ));
      TC = s_A .* ((T >= T_ref) .* s_H_ratio + (T < T_ref));  
    
  TC = TC * mu;
    
    
    
  end