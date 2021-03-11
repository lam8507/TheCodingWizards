% This code was based upon Michelle and Laurel's chi square test code

% Sarah made this code from her own Matlab script but when collaborating, we needed help getting the visualization to show both 'not flee' and 'flee'
% (specifically in AppDesigner)
% We approached the TAs during Office Hours for help
% Writing the code: Sarah, 2 hours
% Debugging the code: Laurel, 1 hour
% Collaborated in Pair Programming

% Reading data downloaded from GitHub
T = readtable('fatal-police-shootings-data.csv');
race = T(:,8); % Extracting variables to use in analysis: race and flee
flee = T(:,13);

% Converting to the format we need for analysis
racecell = table2cell(race);
fleecell = table2cell(flee);
race_string = string(racecell);
flee_string = string(fleecell);

% Using a for loop and if statements to count values for each of the categories we're interested in
% (For more information, see chi square test code comments from before
for ii = 1:length(race_string)
   if race_string(ii) ~= "B";
      race_string(ii) = "O";
     end
end
black_flee = 0;
other_flee = 0;
black_not_flee = 0;
other_not_flee = 0;
    for k = 1:length(flee_string)
       if flee_string(k) == "fleeing" && race_string(k) == "B"
          black_flee = black_flee + 1;
          elseif flee_string(k) == "fleeing" && race_string(k) == "O"
             other_flee = other_flee + 1;
          elseif flee_string(k) == "Not fleeing" && race_string(k) == "B"
          black_not_flee = black_not_flee + 1;
    elseif flee_string(k) == "Not fleeing" && race_string(k) == "O"
             other_not_flee = other_not_flee + 1;
   end
 end
 
% Bar chart visualization for Black people fleeing vs Other people fleeing
x = categorical({'Black', 'Other'});
yes_flee = vertcat(black_flee, other_flee);
not_flee = vertcat(black_not_flee, other_not_flee);
y = horzcat(yes_flee, not_flee);
bar(x,y)
legend('Flee', 'Not Flee')
title('Flee vs Not Fleeing Comparison')

% The difference between fleeing and not fleeing is larger in ‘Other’ races than in Black people. 
% This could indicate that no matter their status of ‘fleeing’ or ‘not fleeing,’ they could be viewed as a threat and shot regardless.
