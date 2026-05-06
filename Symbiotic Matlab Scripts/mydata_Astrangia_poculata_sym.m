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
6, 105.5473096;
6, 46.67758278;
6, 50.61793923;
6, 66.99233667;
6, 29.99531251;
6, 43.78205483;
6, 39.99547112;
9, 80.44139047;
9, 26.71482287;
9, 22.84591611;
9, 72.05611898;
9, 87.97157739;
9, 150.8956656;
9, 90.0915833;
9, 42.37810829;
12, 23.56294065;
12, 2.632650334;
12, 128.6901104;
12, 86.45112858;
12, 63.5581013;
12, 126.6792769;
12, 4.50368925;
12, 26.20996732;
15, 15.142842;
15, 123.3666869;
15, 189.4472402;
15, 98.69995451;
15, 57.82398714;
15, 82.7541742;
15, 66.0184719;
15, 5.390003523;
18, 71.32664508;
18, 87.48983533;
18, 222.89678;
18, 196.5089039;
18, 270.9629509;
18, 180.4513628;
18, 118.9372078;
18, 232.1670226;
22, 310.9572105;
22, 319.2749706;
22, 483.6534677;
22, 156.1898641;
22, 353.63355;
22, 430.9803645;
22, 353.3730246;
22, 460.58756;
26, 406.1587457;
26, 355.7429593;
26, 636.7961976;
26, 216.9923502;
26, 413.7867018;
26, 647.20812;
26, 428.9176142;
26, 501.2543247;
29, 419.0610974;
29, 418.9503018;
29, 877.8176562;
29, 238.6675538;
29, 470.8024726;
29, 521.6962754;
29, 399.9116328;
29, 711.6360905;
32, 292.3506347;
32, 260.0570464;
32, 501.2088165;
32, 270.5266462;
32, 344.8756144;
32, 387.2554438;
32, 309.4467441;
32, 413.5046052];
TJO(:,2)=TJO(:,2)*24; % convert hourly to daily rate
data.TJO = TJO;
units.TJO = {'°C', 'µmol O2/g dry mass/d'}; 
label.TJO = {'Temperature', 'O_2 consumption per g dry weight per day'};
bibkey.TJO = 'Aichelman et al. 2019';
comment.TJO = 'Extrapolated from Aichelman et al. 2019, Sym only'
weight.TJO= 0.121; units.weight.TJO = {'g'};  label.weight.TJO= {'dry weight, assuming a polyp number of 50 from weight per polyp from my experiment day 0 values'}; 
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
auxData.weight = weight;
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
