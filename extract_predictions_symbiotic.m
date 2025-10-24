function extract_predictions()
  species = 'Astrangia_poculata_sym';

  % Load results and data
  load(['results_', species, '.mat']);  % loads par, metaPar, txtPar, etc.
  [data, auxData, ~, ~, ~] = feval(['mydata_', species]);
  [prdData, ~] = feval(['predict_', species], par, data, auxData);
  % 
  % % Extract tW data
  % if isfield(data, 'tW') && isfield(prdData, 'tW')
  %   tW_obs = data.tW(:,1);           % time
  %   Wd_obs = data.tW(:,2);           % observed dry weight
  %   Wd_pred = prdData.tW(:);         % predicted dry weight
  % 
  %   tW_table = table(tW_obs, Wd_obs, Wd_pred, ...
  %                    'VariableNames', {'time', 'weight_obs', 'weight_pred'});
  %   writetable(tW_table, 'tW_predictions.csv');
  % else
  %   warning('Missing tW data or prediction.');
  % end

  % Extract TJO data
  if isfield(data, 'TJO') && isfield(prdData, 'TJO')
    T_obs = data.TJO(:,1);           % temperature
    R_obs = data.TJO(:,2);           % observed O2 consumption
    R_pred = prdData.TJO(:);         % predicted O2 consumption

    TJO_table = table(T_obs, R_obs, R_pred, ...
                      'VariableNames', {'temperature', 'resp_obs', 'resp_pred'});
    writetable(TJO_table, 'TJO_predictions.csv');
  else
    warning('Missing TJO data or prediction.');
  end

  disp('Predictions successfully exported to CSV.');
end
