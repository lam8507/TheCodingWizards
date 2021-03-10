<<<<<<< HEAD
T = readtable('fatal-police-shootings.csv')
race = T(:, 8);
=======
% this is a chi test conducted by Michelle
% to do this Laurel pair programmed with me to download a chi2ind function
race = T(:, 8); % extracted from readtable
>>>>>>> 53559f39f2d79def5ad54b443132610f27276b60
flee = T(:, 13);
racecell = table2cell(race); % converting to cell
fleecell = table2cell(flee);
race_string = string(racecell);
flee_string = string(fleecell);


<<<<<<< HEAD
for ii = 1:length(race_string)
=======
for ii = 1:length(race_string) 
>>>>>>> 53559f39f2d79def5ad54b443132610f27276b60
    if race_string(ii) ~= "B";
race_string(ii) = "O";
    end
end

<<<<<<< HEAD
for jj = 1:length(flee_string)
=======
for jj = 1:length(flee_string) 
>>>>>>> 53559f39f2d79def5ad54b443132610f27276b60
    if flee_string(jj) ~= "Not fleeing";
 flee_string(jj) = "fleeing";
    end
end
  
%find how many times 'B' and 'fleeing' line up, etc:
black_flee = 0;
other_flee = 0;
black_not_flee = 0;
other_not_flee = 0;
for k = 1:length(T)
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

black_flee_nf = vertcat(black_flee, black_not_flee)
other_flee_nf = vertcat(other_flee, other_not_flee)
[h, chi, p] = chi2ind([black_flee_nf, other_flee_nf], 0.05);


