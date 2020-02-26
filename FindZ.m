function [Z] = FindZ(NAME,n,m)
 % Get folder and scan it to transfer in a cell array
% separate part of the main cell array as smaller and usable arrays
% respectively string cell array,integer column vector, integer column vector,float column vector
% finding length of the cell1(the others are the same)
folder=fopen(NAME,'r');
cell=textscan(folder,'%s %d %d %f');
fclose(folder);
cell1=cell{1};
cell2=cell{2};
cell3=cell{3};
cell4=cell{4};
Vl=length(cell1);
% defining structure of one dimension array I and E,which form Z(Z=[I;E]), by zeros functions
I=zeros(n,1);
E=zeros(m,1);
 % to find I and E we need value of currents and voltages and where they
% connect nodes 
% Again to find that we scan the cell1 function by for loops and find 'I'
% and 'V' and assign their values to I and E arrays
for i=1:Vl
     if cell1{i}(1)=='I'
        x=cell2(i);
        y=cell3(i);
        z=cell4(i);
        % after that we only need one for loop to find I's value because I
        % is one dimensional,one column, and its value is the current
        % source's value itself
        for j=1:n
            if j==y
            I(j,1)=I(j,1)+z;
            end
            if j==x
            I(j,1)=I(j,1)-z;
            end
        end             
     end
     if cell1{i}(1)=='V'
        k=cell1{i}(2);
        k=str2num(k);
        l=cell4(i);
        % after that we only need one for loop to find E's value also
        % because E ,too,is one dimensional,one column, and its value is
        % the voltage source's value itself
        for j=1:m
            if j==k
            E(j,1)=abs(l);
            end
        end             
     end
end
    % forming Z from I and E (referance[1])
    Z=[I;E];
end