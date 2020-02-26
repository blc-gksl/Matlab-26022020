function [G] = FindG(NAME,n)
% Get folder and scan it to transfer in a cell array 
folder=fopen(NAME,'r');
cell=textscan(folder,'%s %d %d %f');
fclose(folder);
 % separate part of the main cell array as smaller and usable arrays
% respectively string cell array,integer column vector, integer column vector,float column vector 
cell1=cell{1};
cell2=cell{2};
cell3=cell{3};
cell4=cell{4};
% finding length of the cell1(the others are the same)
Vl=length(cell1);
 % addition will be used to calculate G so first constructing it with zeros
% function and making its variable 'double' to calculate accurate
% conclusion
G=zeros(n,'double');
% scan cell1 array to find resistors with for loop
for i=1:Vl
    if cell1{i}(1)=='R'
        % finding element's nodes and values
        x=cell2(i);
        y=cell3(i);
        z=cell4(i); 
        t=z.^-1 ;
     % forming G row*column by using two for loop
    for j=1:n
    for k=1:n
 % The G matrix is an nxn matrix formed in two steps:
% Each element in the diagonal matrix is equal to the sum of the conductance 
% (one over the resistance) of each element connected to the corresponding node. 
% So the first diagonal element is the sum of conductances connected to node 1,
% the second diagonal element is the sum of conductances connected to node 2, and so on.
% The off diagonal elements are the negative conductance of the element
% connected to the pair of corresponding node.
% Therefore a resistor between nodes 1 and 2 goes into the G matrix at location 
% (1,2) and locations (2,1).[from reference [1]]
        if(j==k && (x==j || y==j))
        G(j,k)=G(j,k)+t;
        else if(j~=k && ((x==j && y==k) || (x==k && y==j)))
        G(j,k)=G(j,k)-t;
            end
    end
    end
    end
end
end
end

