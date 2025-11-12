% MY DATA FILE - APO
function [data, auxData, metaData, txtData, weights] = mydata_Astrangia_poculata_apo

%% set metaData
metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Anthozoa'; 
metaData.order      = 'Scleratinia'; 
metaData.family     = 'Astrangiidae';
metaData.species    = 'Astrangia_poculata'; 
metaData.species_en = 'Northern Star Coral'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'MAN'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'Ci'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(12.77); % K, average in newport
metaData.data_0     = {'ap'; 'am'; 'L0'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 'RQ'}; 
metaData.data_1     = {'L-Wd'; 'L-Wd'; 'L-WN'; 'L-WC'; 't-Ww'; 'L-R'; 'T-ab'; 'T-JO'; 'T-JN'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Caroline Ianniello'; 'Taylor Lindsay'};    
metaData.date_subm = [2025 27 05];              
metaData.email    = {'caroline.ianniello@gmail.com'};            
metaData.address  = {'Boston University, Boston MA 01844'};   

metaData.author_mod_1   = {'Taylor Lindsay'};        
metaData.date_mod_1     = [2025 27 05];                           
metaData.email_mod_1    = {'tayrlindsay@gmail.com'};                 
metaData.address_mod_1  = {'Tufts'}; 


metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 02 15]; 

%% set data
% % guess data
% food.X = 5; units.food.X = 'Joules';    label.food.X = ' X'; bibkey.food.X = 'Guess, 3 years'; 
% food.I= 2; units.food.I = 'Irradiance';    label.food.I = ' X'; bibkey.food.I = 'Guess, 3 years'; 


% X.tp = 5 ; units.X.tp = 'Joules';    label.X.tp = ' X'; bibkey.X.tp = 'Guess, 3 years'; 
%  I.tp = 1 ; units.I.tp = 'Irradiance';    label.I.tp = 'I '; bibkey.I.tp = 'Guess, 3 years'; 
%auxData.K_coral = 1; % half saturation constant is calculated in the
%parscomp_st function

% zero-variate data

data.tp = 1095.75;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Guess, 3 years';
temp.tp = C2K(12.77);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; bibkey.tp = 'Guess';
  comment.tp = '12.77C Average yearly temperature from 2014-2024 from Newport RI buoy';
data.L0  = 0.011;  units.L0  = 'cm';  label.L0  = 'egg diameter';            bibkey.L0  = {'Borbee et al. 2025 in prep'};
data.Lb  = 0.0137;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Ianniello et al., unpublished'; 
  comment.Lb = 'Figure 2';

% data.Wdb  = 0.00013;  units.Wdb  = 'g'; label.Wdb  = 'dry weight at birth'; bibkey.Wdb  = 'Kurihara et al. 2020-- CHANGE ME';
% data.Wdp  = 0.00340615;  units.Wdp  = 'g'; label.Wdp  = 'dry weight at puberty'; bibkey.Wdp  = 'sym fed high light, assuming 5 polyps';
% data.Wdi  = 0.2287;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'apo, assuming 100 polyps, multiplied average INITIAL dry weight of 5 polyp apo corals by 20 for 100 polyps';

data.RQ  = 0.8;   units.RQ  = '-';   label.RQ  = 'Respiratory quotient';    bibkey.RQ  = 'Tremblay et al. 2012';  comment.RQ = "For the temperate coral Cladocora"
  
% uni-variate data

% Temperature (°C) vs O2 consumption (µmol O2/g dry mass/hour) NOTE - DEB
% predicts per day, so we will do the conversion below
TJO = [ ...

6	19.66420121
6	166.9395876
6	59.2210435
6	60.39052924
6	75.67442212
6	192.4256652
6	172.7861558
9	239.8274401
9	13.22993753
9	336.1052175
9	289.0848874
9	402.0965074
9	170.0129009
9	215.3960667
9	350.170274
12	286.1030104
12	228.95373
12	351.7246464
12	3.035129436
12	406.8526639
12	263.1186768
12	324.7421652
12	111.733547
15	286.9770555
15	417.5451697
15	456.0737731
15	403.1286612
15	503.638465
15	348.4136511
15	420.9062908
15	360.5959589
18	276.6483247
18	540.7973423
18	937.9179503
18	297.8642643
18	585.0487858
18	612.2817252
18	670.0962118
18	728.2455448
22	537.7128162
22	1368.940074
22	1456.399285
22	709.8927068
22	1156.169919
22	960.5245702
22	978.2117356
22	1112.902343
26	732.6590645
26	1377.668234
26	1697.817975
26	1058.135887
26	1768.965416
26	1033.641625
26	885.6499734
26	1311.037547
29	693.7837517
29	1735.806933
29	1248.763238
29	932.0668103
29	1272.957927
29	798.8639752
29	993.518862
29	754.5606259
32	617.3298738
32	887.4666999
32	821.7703384
32	842.2725619
32	831.3939647
32	772.5292012
32	761.0995553
32	620.9243022
];
TJO(:,2)=TJO(:,2)*24; % convert hourly to daily rate
data.TJO = TJO;
units.TJO = {'°C', 'µmol O2/g dry mass/d'}; 
label.TJO = {'Temperature', 'O_2 consumption per g dry weight per day'};
bibkey.TJO = 'Aichelman et al. 2019';
comment.TJO = 'Extrapolated from Aichelman et al. 2019, Apo only'
weight.TJO= 0.114; units.weight.TJO = {'g'};  label.weight.TJO= {'dry weight, assuming a polyp number of 50 from weight per polyp from my experiment day 0 values'}; 
temp.TJO = C2K(TJO(:,1));  % convert temperature to Kelvin

% Data to inform functional response -- X (food density) and I (irradiance)
X.TJO = 327888; 
 %units.X.TJO = 'Joules';    label.X.TJO = ' X'; 
 %bibkey.X.TJO = 'Extrapolated from Aichelman et al. 2019, Sym only'; 
I.TJO= 1.03e15; 
 %units.I.TJO = 'Irradiance';    label.I.TJO = ' X'; 
 %bibkey.I.TJO = 'Extrapolated from Aichelman et al. 2019, Sym only'; 

% % uni-variate data
% % time-dry weight
% data.tW = [ ... % time (d), % dry weight
% 0	0.0051
% 0	0.0281
% 0	0.0175
% 0	0.0215
% 0	0.0105
% 0	0.0111
% 0	0.0159
% 0	0.0058
% 0	0.0129
% 0	0.003
% 0	0.0087
% 0	0.0139
% 0	0.0082
% 0	0.0102
% 0	0.0141
% 0	0.0087
% 0	0.0106
% 0	0.009
% 0	0.0063
% 0	0.0076
% 30	0.0081
% 30	0.0066
% 30	0.0029
% 30	0.0177
% 30	0.008
% 30	0.0049
% 30	0.0049
% 30	0.0108
% 30	0.0043
% 30	0.0029
% 30	0.0056
% 30	0.005
% 30	0.0037
% 30	0.0066
% 30	0.0061
% 30	0.0052
% 30	0.0078
% 30	0.0048
% 30	0.0159
% 30	0.0028
% 30	0.0061
% 60	0.0055
% 60	0.0059
% 60	0.0048
% 60	0.0041
% 60	0.0026
% 60	0.0043
% 60	0.0028
% 60	0.0076
% 60	0.005
% 60	0.0057
% 60	0.0117
% 60	0.0063
% 60	0.0031
% 60	0.0018
% 60	0.0075
% 60	0.0051
% 60	0.0031
% 60	0.0086
% 60	0.0033
% 90	0.0075
% 90	0.0074
% 90	0.0102
% 90	0.0082
% 90	0.008
% 90	0.0078
% 90	0.0081
% 90	0.0037
% 90	0.003
% 90	0.0058
% 90	0.0206
% 90	0.0043
% 90	0.0061
% 90	0.0039
% 90	0.0148
% 90	0.0124
% 90	0.004
% 90	0.0047
% 90	0.0042
% 90	0.0086
% ];
% %0	0.0275
% %data.tW(:,2) = 19.2+0.01*data.tW(:,2); % convert % change in mass to mass 
% units.tW  = {'d', 'g'};  label.tW = {'time', 'dry weight'};  
% temp.tW   = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
% Wd0.tW   = mean(data.tW(1:20,2));  units.Wd0.tW = 'g'; label.Wd0.tW = 'mean initial weight';
% %Wd0.tW   = 0.005;  units.Wd0.tW = 'g'; label.Wd0.tW = 'mean initial weight';
% bibkey.tW = 'Ianniello et al. in prep';
% comment.tW = 'Fed once every 5 days. Data taken from every light level. Biomass from entire slurry';
% 
% metaData.grp.sets = {{'tW'}};
% metaData.grp.label = {'Dry weight over time'};


%% set weights for all real data
%1 is the normal!
weights = setweights(data, []);
weights.tp = 5*weights.tp; 
weights.L0 = 5*weights.L0;
weights.Lb = 5*weights.Lb; 
weights.TJO=5*weights.TJO; %does not affect the regular run but does
%impact estimation procedure

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.X= X; auxData.I= I;
auxData.weight = weight;
auxData.temp = temp;
%auxData.Wd0 = Wd0;
%auxData.temp.Ri = C2K(18.9); %getting rid of reproudction data
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;




%% Facts
F1 = 'xx';
metaData.bibkey.F1 = 'xx'; 
F2 = 'xx';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://sites.bu.edu/astrangia/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
