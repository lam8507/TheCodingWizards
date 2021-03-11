% Statistical chi square test of independence to test relationship between
% 'mental_illness' and 'threat_level'

T = readtable('fatal-police-shootings-data.csv');
% Like the other statistical test (between race and flee), we downloaded the chi2ind function
% The chi square test was also appropriate for this analysis
mental_illness = T(:, 11);
threat_level = T(:, 12);

mental_ill_string = string(table2cell(mental_illness));
threat_level_string = string(table2cell(threat_level));

mentalill_attack = 0; % initializing variables
notmentalill_attack = 0;
mentalill_other = 0;
notmentalill_other = 0;
% Finding correlation between mental illness and threat level
% Using a for loop to find how many times signs of mental illness and
% threat level relate 
for k = 1:length(mental_ill_string)
    if mental_ill_string(k) == "True" && threat_level_string(k) == "attack"
        mentalill_attack = mentalill_attack + 1;
    elseif mental_ill_string(k) == "False" && threat_level_string(k) == "attack"
        notmentalill_attack = notmentalill_attack + 1;
    elseif mental_ill_string(k) == "True" && threat_level_string(k) ~= "attack"
mentalill_other = mentalill_other + 1;
    elseif mental_ill_string(k) == "False" && threat_level_string(k) ~= "attack"
       notmentalill_other = notmentalill_other + 1;
    end
end
 
mentalill_attack_other = vertcat(mentalill_attack, mentalill_other);
notmentalill_attack_other = vertcat(notmentalill_attack, notmentalill_other);
[h, chi, p] = chi2ind([mentalill_attack_other, notmentalill_attack_other], 0.05);
% Because our p-value was less than our pre-chosen significance level of 0.05, we rejected the null hypothesis and concluded that there was an association between whether the victim had shown signs of mental illness and whether they attacked the officer.
% The results showed statistical significance between these variables. 
% Written by Michelle and pair programmed with Laurel (took turns)
% Time taken: 2 hours total
