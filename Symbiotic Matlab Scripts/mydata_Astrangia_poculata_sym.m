% MY DATA FILE - SYM
function [data, auxData, metaData, txtData, weights] = mydata_Astrangia_poculata_sym

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
metaData.address  = {'Tufts University, Medford MA'};   

metaData.author_mod_1   = {'Taylor Lindsay'};        
metaData.date_mod_1     = [2025 27 05];                           
metaData.email_mod_1    = {'tayrlindsay@gmail.com'};                 
metaData.address_mod_1  = {'Tufts University, Medford MA'}; 


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
data.Lb  = 0.0137;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Borbee et al. 2025 in prep'; 
  comment.Lb = 'Figure 2';

% data.Wdb  = 0.00013;  units.Wdb  = 'g'; label.Wdb  = 'dry weight at birth'; bibkey.Wdb  = 'Kurihara et al. 2020';
% data.Wdp  = 0.00340615;  units.Wdp  = 'g'; label.Wdp  = 'dry weight at puberty'; bibkey.Wdp  = 'sym fed high light, assuming 5 polyps';
% data.Wdi  = 0.2287;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'apo, assuming 100 polyps, multiplied average INITIAL dry weight of 5 polyp apo corals by 20 for 100 polyps';

data.RQ  = 0.8;   units.RQ  = '-';   label.RQ  = 'Respiratory quotient';    bibkey.RQ  = 'Tremblay et al. 2012';  comment.RQ = "For the temperate coral Cladocora"
  
% uni-variate data

% Temperature (°C) vs O2 consumption (µmol O2/g dry mass/hour) NOTE - DEB
% predicts per day, so we will do the conversion below
% Temperature (°C) vs O2 consumption (µmol O2/g dry mass/hour) NOTE - DEB
% predicts per day, so we will do the conversion below
TJO = [ ...
6	0.013954972
6	0.303838992
6	0.389517808
6	0.139793931
6	0.016889065
6	0.179681307
6	0.06441938
6	0.181337515
9	0.250992159
9	0.032995751
9	0.072790881
9	0.503357025
9	0.355655841
9	0.289186982
9	0.188707711
9	0.026539052
12	0.300725335
12	0.025697014
12	0.192931326
12	0.020797649
12	0.100876538
12	0.056264352
12	0.158549302
12	0.130783696
15	0.241604936
15	0.27793461
15	0.232805451
15	0.341343982
15	0.040574438
15	0.032760242
15	0.341152524
15	0.339753983
18	0.429373722
18	0.712960631
18	0.523230198
18	0.424817467
18	0.62729889
18	0.531447082
18	0.046667344
18	0.394949079
22	0.806207614
22	0.987391893
22	1.422895855
22	0.49166755
22	0.776045932
22	1.047890131
22	0.688610684
22	1.020643539
26	0.851290375
26	0.905974207
26	1.26634677
26	0.424420171
26	0.839788893
26	1.31651845
26	0.77275379
26	0.965351567
29	0.884086734
29	1.065038279
29	1.45660482
29	0.120737439
29	0.826089216
29	0.926851982
29	0.596612928
29	1.504285541
32	0.462696906
32	0.472897284
32	0.375901408
32	0.40932977
32	0.570340481
32	1.047985287
32	0.271468108
32	0.733020991];
TJO(:,2)=TJO(:,2)*24; % convert hourly to daily rate
data.TJO = TJO;
units.TJO = {'°C', 'µmol O2/g dry mass/d'}; 
label.TJO = {'Temperature', 'O_2 consumption per g dry weight per day'};
bibkey.TJO = 'Aichelman et al. 2019';
comment.TJO = 'Extrapolated from Aichelman et al. 2019, Sym only'
%weight.TJO= 0.121; units.weight.TJO = {'g'};  label.weight.TJO= {'dry weight, assuming a polyp number of 50 from weight per polyp from my experiment day 0 values'}; 
area.TJO=3.77561; units.area.TJO = {'cm2'};  label.weight.TJO= {'average cm2 from Aichelmans experiment, brown Rhode Island'}; 
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

%% pack auxData and txtData for output
auxData.X= X; auxData.I= I;
%auxData.weight = weight;
auxData.area = area;
auxData.temp = temp;
%auxData.Wd0 = Wd0;
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
%
