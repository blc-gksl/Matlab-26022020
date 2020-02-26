function [nodenumber] = findnodenumber(NAME)
% transfering info from the file to folder named file to scan
folder = fopen(NAME,'r');
 % scanning whole folder just with textscan function and placing it in a cell
% named cell array
cell = textscan(folder,'%s %d %d %f');
fclose(folder);
 % both cell{2} and cell{3} give us nodes and for same element cell{2} <
% cell{3} so maximun number of cell{3} will give us node number
nodenumber = max(cell{3});
end

