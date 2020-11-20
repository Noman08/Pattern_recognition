% Task 3: Print a 3D cell array
function printcell (c)

for i=1:size(c,3)
    fprintf ("\n%-15s %15s %15s %15s %15s\n", c{1,1:size(c,2),i})
    for j=2:size(c,1)
        fprintf ("%-15s %12.4f    %12.4f    %12.4f    %12.4f\n", c{j,1:size(c,2),i})
    end
    fprintf("\n");
end
