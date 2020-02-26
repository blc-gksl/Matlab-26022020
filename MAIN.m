% that code is written by the help of reference [1]
% referance[1] => http://www.swarthmore.edu/NatSci/echeeve1/Ref/mna/MNA3.html

% getting file name by getinput function and assign NAME variable
NAME=getinput();
% reading folder and transfer contents of it to 'cell' named cell array by
% textscan
folder=fopen(NAME,'r');
cell=textscan(folder,'%s %d %d %f');
fclose(folder);
% making four part 'cell' named cell array respectively:
% a string cell array contains elements identity
% a column vector carrying lower value nodes
% a column vector carrying higher value nodes
% a column vector carrying value of elements
cell1=cell{1};
cell2=cell{2};
cell3=cell{3};
cell4=cell{4};
% finding cell1 length (also equal to column vector's)
Vl=length(cell1);
% finding node numbers
n=findnodenumber(NAME);
% finding how many voltages there are
m=findindependentvoltages(cell1,Vl);
% FÝnding G, B, C, D matrices that form the main matrix the A matrix (reference[1])
G=FindG(NAME,n);
B=FindB(NAME,n,m);
% Because there is no dependent source C equals to B's transpoze
C=B' ;
 % Because there is no dependent source D is a matrix that fulled with
% zeroes
D=zeros(m);
A = [G B;C D];
% finding main conclusion matrix Z matrix (reference[1])
Z=FindZ(NAME,n,m);
% Finding the solution matrix X matrix (reference[1])
% A*X=Z => X=A^(-1)*Z reference[1]
X=(A^-1)*Z;
% the node voltages -the solution-
NODEVOLTAGES=X(1:n)