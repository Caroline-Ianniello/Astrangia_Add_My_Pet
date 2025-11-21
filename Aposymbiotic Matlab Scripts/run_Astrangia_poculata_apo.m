close all; 0
global pets 

pets = {'Astrangia_poculata_apo'}; 
check_my_pet(pets); 

estim_options('default'); 
estim_options('max_step_number', 5e2); 
estim_options('max_fun_evals', 5e3); 

estim_options('pars_init_method', 1); %2 starts from pars init file, 1 starts from the last run %mat2pars_init to overwrite
estim_options('results_output', 3); 
estim_options('method', 'nm'); %no to simulate straight from pars init, nm to predict

estim_pars;

%no means that it just runs the model from pars init and compares with your data, does not estimate
%change no to nm to do parameter estimation, once parameter set already
%kinda makes sense
% results outputs options:
% 0: only saves data to .mat (no printing to html or screen and no figures) - use this for (automatic) continuations
% 1: no saving to .mat file, prints results to html (1) or screen (-1),
% allows you to quickly assess how far off you are
% 2: saves to .mat file, prints results to html (2) or screen (-2)
% 3: like 2 (or -2), but also prints graphs to .png files (default is 3)
% 4: like 3 (or -3), but also prints html with implied traits
% 5: like 3 (or -3), but also prints html with implied traits including related species
% 6: like 5, but also prints html with population traitsamp
