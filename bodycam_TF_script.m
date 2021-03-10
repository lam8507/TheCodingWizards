
bodycamcell = table2cell(body_cam);
bodycam_string = string(bodycamcell);
false_bodycam = []
for ii = 1:length(bodycam_string)
        if bodycam_string(ii) == "False" 
        
        false_bodycam= [false_bodycam, ii];
        end
end
