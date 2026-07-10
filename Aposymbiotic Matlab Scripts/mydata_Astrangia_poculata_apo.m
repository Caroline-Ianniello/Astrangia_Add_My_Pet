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
metaData.address  = {'Tufts University, Medford MA 01844'};   

metaData.author_mod_1   = {'Taylor Lindsay'};        
metaData.date_mod_1     = [2025 27 05];                           
metaData.email_mod_1    = {'tayrlindsay@gmail.com'};                 
metaData.address_mod_1  = {'Tufts University'}; 


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

data.RQ  = 0.8;   units.RQ  = '-';   label.RQ  = 'Respiratory quotient';    bibkey.RQ  = 'Tremblay et al. 2012';  comment.RQ = "For the temperate coral Cladocora caespitosa"
  
% uni-variate data

% Temperature (°C) vs O2 consumption in original units -- umol O2/cm2/hour NOTE - DEB
% predicts per day, so we will do the conversion below
TJO = [ ...

6	0.194849874
6	0.276815251
6	0.049484621
6	0.050066932
6	0.04705331
6	0.007992441
6	0.12366138
6	0.011152473
9	0.19386449
9	0.021232369
9	0.80253034
9	0.371578282
9	0.193899756
9	0.25520982
9	0.388631625
9	0.279713763
12	0.252273427
12	0.195868222
12	0.409575505
12	0.211211895
12	0.142776738
12	0.174759809
12	0.215242537
12	0.122040697
15	0.080952064
15	0.594019197
15	0.76187957
15	0.688811102
15	0.218008413
15	0.311917593
15	0.505242321
15	0.220629116
18	0.273695188
18	1.035763094
18	1.180497883
18	0.369083503
18	0.519483468
18	0.579621143
18	0.487166843
18	0.010678059
22	0.659681077
22	1.905420041
22	2.036969935
22	0.821638492
22	1.315325557
22	1.127382226
22	1.064572582
22	1.017853467
26	0.745652276
26	1.834411518
26	2.293274434
26	0.919764091
26	1.616443
26	1.056602155
26	0.960785911
26	1.255399453
29	0.672941594
29	2.070548836
29	1.370394038
29	1.002800359
29	0.856438066
29	0.539784699
29	0.945054256
29	0.830153604
32	0.570947806
32	0.947363049
32	0.806157015
32	0.715459106
32	0.959627841
32	0.559503517
32	0.777846575
32	0.489549299
];
TJO(:,2)=TJO(:,2)*24; % convert hourly to daily rate
data.TJO = TJO;
units.TJO = {'°C', 'µmol O2/cm2/d'}; 
label.TJO = {'Temperature', 'O_2 consumption per cm squared per day'};
bibkey.TJO = 'Aichelman et al. 2019';
comment.TJO = 'Dark Respiration, Corrected, From Aichelman et al. 2019, Apo only'
%weight.TJO= 0.114; units.weight.TJO = {'cm2'};  label.weight.TJO= {'dry weight, assuming a polyp number of 50 from weight per polyp from my experiment day 0 values'}; 
area.TJO = 3; units.area.TJO = 'cm2'; label.area.TJO = 'average surface area of apo corals used in respiration assay'; %Average apo SA from Caroline's biomass experiment = 3.339cm2, Average sym SA from Caroline's biomass experiment = 3.026
temp.TJO = C2K(TJO(:,1));  % convert temperature to Kelvin

% Data to inform functional response -- X (food density) and I (irradiance)
X.TJO = 327888; 
 %units.X.TJO = 'Joules';    label.X.TJO = ' X'; 
 %bibkey.X.TJO = 'Extrapolated from Aichelman et al. 2019, Sym only'; 
I.TJO= 1.03e15; 
 %units.I.TJO = 'Irradiance';    label.I.TJO = ' X'; 
 %bibkey.I.TJO = 'Extrapolated from Aichelman et al. 2019, Sym only'; 


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

%adjust pseudodata influence
%weights.psd.p_M = 0;
%weights.psd.v = 10*weights.psd.v;

%% pack auxData and txtData for output
auxData.X= X; auxData.I= I;
%auxData.weight = weight;
auxData.area = area;
auxData.temp = temp;
%auxData.Wd0 = Wd0;
%auxData.temp.Ri = C2K(18.9); %getting rid of reproduction data
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
'howpublished = {\url{https://sites.tufts.edu/astrangia/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
