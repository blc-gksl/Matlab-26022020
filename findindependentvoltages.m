function [m] = findindependentvoltages(cell1,Vl)
 % cell1(the cell that contains elements identity) and its length are used
% as ýnputs to find how many voltages there are
m=0;
 % Scanning cell1 by for loop to find voltages and keeping their numbers in
% 'm' variable
 for i=1:Vl
 if cell1{i}(1)=='V'
  m=m+1;
  end
 end
end

