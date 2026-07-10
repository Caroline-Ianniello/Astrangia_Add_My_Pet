
clear all
close all

% Load the CSV file as a table
data = readtable('/Users/carolineianniello/DEB/Astrangia_Add_My_Pet/Raw_Data/APO_Aichelman_oxygen_dry_weight_R_corrected.csv');
gdjepdf = './slike/';

% Extract variables from the table
T = data.temperature_K;                    % Temperature in Kelvin
resp_per_cm2 = data.Rdark_umol_cm2_hr_corr_abs_value;  % Oxygen consumption rate per surface area



Tref = 20 + 273.15;
%Extract mu 
mu=1.12;          % Ran first iteration with mu=1.0 as a starting point. Then Optimization indicated mu=1.6, next iteration 1.12, then it stabilized at 1.12. So proceeded with that value as a start value.
Tinit = [8000;  310;  10000; mu]; % T_A,  T_H,  T_AH, mu  

% optimization
%---------------------------------------------
options = optimset('Display','iter','PlotFcns',@optimplotfval, 'MaxFunEvals', 2500);
fun = @(pars_T)LossTempCorr(T, resp_per_cm2, Tref, pars_T);

[pars_T,fval,exitflag,output] = fminsearch(fun, Tinit, options);

% figure
%---------------------------------------------

Tp = (0:0.1:45) + 273.15;
p = TempCorr(Tp, Tref, pars_T); %draw the function

Tp = Tp(:);  % column vector
p = p(:);    % column vector

figure;
h1 = plot(T - 273.15, resp_per_cm2, '.r'); hold on;
h2 = plot(Tp - 273.15, p, '-b');

% Tp = (0:0.1:45) + 273.15;
% p = TempCorr(Tp, Tref, pars_T);  % predicted for temperatures Tp in Kelvin
% 
% figure;
% h1 = plot(T - 273.15, O2Rate_WWscaled_NEW, '.r'); hold on;    % Plot data (in Celsius)
% h2 = plot(Tp - 273.15, p, '-b');                             % Plot model fit (in Celsius)
% % set(gca, 'Ylim', [0 1.4], 'Xlim', [0 45]);
% title('ALL');

% print parameters
%---------------------------------------------
fprintf(1, 'T_A  = %15.2f \n', pars_T(1));
%fprintf(1, 'T_L  = %15.2f \n', pars_T(2));
fprintf(1, 'T_H  = %15.2f \n', pars_T(2));
%fprintf(1, 'T_AL = %15.2f \n', pars_T(4));
fprintf(1, 'T_AH = %15.2f \n', pars_T(3));
fprintf(1, 'mu   = %15.2f \n', pars_T(4));

% save figure (uncomment if you want to save)
%---------------------------------------------
% set(gcf, 'PaperPositionMode', 'auto');
% print('-djpeg', '-r300', [gdjepdf, 'Arrhenius_temp_ALL.jpg']);


%%%%%%%%%


% 
% else % pars_T(2) > T_ref  % This means the second parameter is an upper temperature boundary (T_H)
% 
%   T_H  = pars_T(2);  % Define the upper temperature boundary (temperature above which high-temp torpor occurs)
%   T_AH = pars_T(3);  % Arrhenius temperature for the high-temperature boundary (controls steepness of rate decline above T_H)
% 
%   % Calculate s_H_ratio:
%   % This is a ratio that modifies the Arrhenius factor to model the **decrease in physiological rates at temperatures above the upper boundary T_H**.
%   % It's computed as the ratio of two sigmoidal terms involving exponential functions:
%   % - numerator corresponds to the value at the reference temperature T_ref
%   % - denominator corresponds to the value at the actual temperature T
% 
%   s_H_ratio = (1 + exp(T_AH / T_H - T_AH ./ T_ref)) ./ ...  % numerator: at reference temperature
%               (1 + exp(T_AH / T_H - T_AH ./ T));          % denominator: at current temperature
% 
%   % Final temperature correction factor (TC):
%   % Multiply the base Arrhenius factor s_A by s_H_ratio **only** if the actual temperature T is greater or equal to the reference T_ref.
%   % If T < T_ref, then no high-temp correction applies, so just use s_A.
% 
%   TC = s_A .* ( (T >= T_ref) .* s_H_ratio + (T < T_ref) );
%   % Explanation:
%   % - For T >= T_ref, multiply s_A by s_H_ratio (adjusted factor accounting for rate decrease near/above T_H)
%   % - For T < T_ref, use s_A as is (no rate suppression at lower temps)
% 
% end

