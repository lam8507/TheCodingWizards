% this was also done by Michelle and pair programmed with Laurel
% the goal was to find a relationship between threat level and mentall illness
mental_illness = T(:, 11);
threat_level = T(:, 12);

mental_ill_string = string(table2cell(mental_illness));
threat_level_string = string(table2cell(threat_level));

mentalill_attack = 0;
notmentalill_attack = 0;
mentalill_other = 0;
notmentalill_other = 0;

for k = 1:length(T)
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
