% Statistical chi square test of independence to test relationship between 'race' and 'flee'

% Reading data downloaded from GitHub
T = readtable('fatal-police-shootings-data.csv');
% We will focus our analysis on race and fleeing

% We used a chi squre test of independence because of our nominal categorical variables
% Writing the code: Michelle and Laurel, 10 hours
% Debugging the code: Michelle and Laurel, 10 hours
% Collaborated with Pair Programming

% To do this, we needed to download a chi2ind function, which we discovered and learned out ourselves
% We accessed online resources to learn about statistical functions in MatLab
% Also, we reviewed which statistical tests would be appropriate for our analysis
race = T(:, 8); % Extracting the variables needed from readtable
flee = T(:, 13);
racecell = table2cell(race); % Converting to cell
fleecell = table2cell(flee);
race_string = string(racecell);
flee_string = string(fleecell);

% Using a for loop and if statement to determine counts of race separated into 'Black' or 'Other'
for ii = 1:length(race_string) 
    if race_string(ii) ~= "B";
race_string(ii) = "O";
    end
end

% Using a for loop and if statement to determine counts of fleeing status separated into 'Not fleeing' and 'fleeing'
for jj = 1:length(flee_string) 
    if flee_string(jj) ~= "Not fleeing";
 flee_string(jj) = "fleeing";
    end
end
  
% Finding how many times 'B' and 'fleeing' line up, etc:
black_flee = 0; % Setting counts equal to 0 first
other_flee = 0;
black_not_flee = 0;
other_not_flee = 0;
for k = 1:length(flee_string) % Using a for loop and if statements to count for groups we are interested in
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

% Performing the statistical analysis

% Our null hypothesis was that race was independent of whether a victim had fled from the cops. 
% Our alternate hypothesis was that race was not independent of whether a victim had fled from the cops. 
black_flee_nf = vertcat(black_flee, black_not_flee)
other_flee_nf = vertcat(other_flee, other_not_flee)
[h, chi, p] = chi2ind([black_flee_nf, other_flee_nf], 0.05);
% Setting alpha value equal to 0.05, the probability of finding the observed, or more extreme, results when the null hypothesis (H0) is true
% We conducted a chi square test and received a test statistic value of 21.6156. 
% This translated into a p-value of less than 0.05.
% We concluded there was an association between the victim’s race and whether they fled from the cops

