true_bodycam = []
for ii = 1:length(bodycam_string)
        if bodycam_string(ii) == "True" 
        
        true_bodycam= [true_bodycam, ii];
        end
end
true_bodycam
