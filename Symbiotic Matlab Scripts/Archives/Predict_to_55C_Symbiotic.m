% --------- BEGIN SCRIPT ---------

T_query = (6:1:85)';   % °C

% ==== SYMBIOTIC ==== 
try
    load('results_Astrangia_poculata_sym.mat');
    [data, auxData, ~, ~, ~] = mydata_Astrangia_poculata_sym();
    EJO_ext_sym = zeros(length(T_query),1);

    for i = 1:length(T_query)
        new_data = data;
        new_auxData = auxData;
        new_data.TJO = [T_query(i), 0];
        new_auxData.temp.TJO = T_query(i) + 273.15;
        [prdData_sym, ~] = predict_Astrangia_poculata_sym(par, new_data, new_auxData);
        EJO_ext_sym(i) = prdData_sym.TJO;
    end

    idx_sym = find(EJO_ext_sym < 0, 1, 'first');
    if ~isempty(idx_sym)
        fprintf('\n[Symbiotic] Respiration crosses zero at %.1f°C\n', T_query(idx_sym));
    else
        fprintf('\n[Symbiotic] Respiration does not cross zero up to 85°C\n');
    end
catch ME
    disp('Could not complete SYMBIOTIC prediction. Make sure all files exist.');
    disp(ME.message);
    EJO_ext_sym = nan(size(T_query));
end

% ==== APOSYMBIOTIC ====
try
    load('results_Astrangia_poculata_apo.mat');
    [data_apo, auxData_apo, ~, ~, ~] = mydata_Astrangia_poculata_apo();
    EJO_ext_apo = zeros(length(T_query),1);

    for i = 1:length(T_query)
        new_data = data_apo;
        new_auxData = auxData_apo;
        new_data.TJO = [T_query(i), 0];
        new_auxData.temp.TJO = T_query(i) + 273.15;
        [prdData_apo, ~] = predict_Astrangia_poculata_apo(par, new_data, new_auxData);
        EJO_ext_apo(i) = prdData_apo.TJO;
    end

    idx_apo = find(EJO_ext_apo < 0, 1, 'first');
    if ~isempty(idx_apo)
        fprintf('[Aposymbiotic] Respiration crosses zero at %.1f°C\n\n', T_query(idx_apo));
    else
        fprintf('[Aposymbiotic] Respiration does not cross zero up to 85°C\n\n');
    end
catch ME
    disp('Could not complete APOSYMBIOTIC prediction. Make sure all files exist.');
    disp(ME.message);
    EJO_ext_apo = nan(size(T_query));
end

% ==== PLOT BOTH CURVES ====
figure; hold on;
plot(T_query, EJO_ext_sym, '-g', 'LineWidth',2);
plot(T_query, EJO_ext_apo, '-r', 'LineWidth',2);
yline(0, 'k--', 'Zero Respiration');
xlabel('Temperature (°C)');
ylabel('Predicted Resp (\mu mol O_2/g/d)');
title('Extended Respiration vs. Temperature');
legend({'Symbiotic','Aposymbiotic','Zero Resp'}, 'Location','Best');
grid on;


% === EXPORT combined to CSV ===
T_vals = repmat(T_query,2,1); 
Preds = [EJO_ext_sym; EJO_ext_apo];
Sym_state = [repmat("Symbiotic",numel(T_query),1); repmat("Aposymbiotic",numel(T_query),1)];
TJO_table = table(T_vals, Preds, Sym_state, ...
  'VariableNames', {'temperature_C','resp_pred_umolO2_gd', 'symbiotic_state'});
writetable(TJO_table, '/Users/carolineianniello/DEB/Astrangia_Add_My_Pet/Results/TJO_predictions_to_85C_APO_and_SYM.csv');
% --------- END SCRIPT -----------