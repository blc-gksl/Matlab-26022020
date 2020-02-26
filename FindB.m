function [B] = FindB(NAME,n,m)
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
% making B matrix's structure by using zeros function
B=zeros(n,m);
% B matrix's columns define voltages=> not to mix voltages a parameter is created
parameter=0;
% scanning cell1 to find element 'V' by for loop
for i=1:Vl
    if cell1{i}(1)=='V'
       % detect voltages and assign its nodes and value and increasing the
      % parameter for every V to know how many voltages we have and to assign to columns 
       parameter=parameter+1;
       x=cell2(i);
       y=cell3(i);
       z=cell4(i);
       % to reshape matrix B using two for loops (n*m matrix)
     for j=1:n
     for k=1:m
         if (k==parameter)
             % using z to find negative and positive terminal nodes of the voltage
            % correctly
             % The B matrix is an nxm matrix with only 0, 1 and -1 elements.
            % Each location in the matrix corresponds to a particular voltage source(first dimension)
            % or a node (second dimension).  If the positive terminal of the ith
            % voltage source is connected to node k, then the element (i,k) in the B matrix is a 1.
            % If the negative terminal of the its voltage source is connected to node k,
            %then the element (i,k) in the B matrix is a -1.  Otherwise,
            %elements of the B matrix are zero. (reference[1])
           if(z>0)
               if j==x
               B(j,k)=-1;
               else if j==y
               B(j,k)=1;
                   end
               end
          else if z<0
              if(j==x)
              B(j,k)=1;
              else if j==y
              B(j,k)=-1;
              end
              end
          end
          end
         end
     end
     end
    end
end
end