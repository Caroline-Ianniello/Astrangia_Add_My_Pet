%PARS INIT - SYM
function [par, metaPar, txtPar] = pars_init_Astrangia_poculata_sym(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 14585.3437;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.48337;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; %0
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; %0
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; %0
par.v = 0.02;            free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
%par.v = 0.023, 0.2967;       free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.79918;       free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; %0
par.p_M = 2;        free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; %150
par.p_T = 0;        free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; %0
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maintenance rate coefficient'; %0
par.E_G = 2000;        free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
%par.E_G = 2616.2542;        free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 9.998e-12; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; %9.998e-12
par.E_Hp = 6;      free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.003e-15;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; %0

%% other parameters 
par.T_AH = 36652.72 ;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for upper boundary'; 
par.T_H = 302.35;       free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'upper boundary tolerance range'; %0
%par.Wd0 = 0.005;        free.Wd0   = 0;   units.Wd0 = 'g';
%label.Wd0 = 'initial dry weight in tW data'; %0
par.del_M = 0.0057001;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for larvae'; 
par.del_W = 1;          free.del_W = 0;   units.del_W = '-';        label.del_W = 'dry - ash free dry weight ratio'; %0
par.del_Y = 0.015348;   free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.f = 0.7;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; %0
%par.f_tW = 1;         free.f_tW  = 0;   units.f_tW = '-';         label.f_tW = 'scaled functional response for tW data'; %0 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.01;         free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.01;         free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 


%% Pack output 
txtPar.units = units; 
txtPar.label = label; 
par.free = free;


%from the arrhenius correction, external file
% T_A  =        12978.74 
% T_H  =          302.35 
% T_AH =        36652.72 
% mu   =          273.82 
