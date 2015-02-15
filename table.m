%Author: tmozvat and mozvat
%Basic example of a table in MATLAB

clc;
clear;

%Data table example
A1 = zeros(1,11); A1(1,1) = 0.5; A1(1,2) = 1;
A2 = zeros(1,11); A2(1,1) = (sqrt(3)/2);
A3 = zeros(1,11); A3(1,1) = -0.5; A3(1,3) = 0.5; A3(1,4) = 1;
A4 = zeros(1,11); A4(1,1) = (-sqrt(3)/2); A4(1,3) = (-sqrt(3)/2);
A5 = zeros(1,11); A5(1,2) = -1; A5(1,3) = -0.5; A5(1,5) = 0.5; A5(1,6) = 1;
A6 = zeros(1,11); A6(1,3) = (sqrt(3)/2); A6(1,5) = (sqrt(3)/2);
A7 = zeros(1,11); A7(1,4) = -1; A7(1,5) = -0.5; A7(1,7) = 0.5; A7(1,8) = 1;
A8 = zeros(1,11); A8(1,5) = (-sqrt(3)/2); A8(1,7) = (-sqrt(3)/2);
A9 = zeros(1,11); A9(1,6) = -1; A9(1,7) = -0.5; A9(1,9) = 0.5; A9(1,10) = 1;
A10 = zeros(1,11); A10(1,7) = (sqrt(3)/2); A10(1,9) = (sqrt(3)/2);
A11 = zeros(1,11); A11(1,8) = -1; A11(1,9) = -0.5; A11(1,11) = 0.5;

A = [A1; A2; A3; A4; A5; A6; A7; A8; A9; A10; A11];
b = [0 -6 0 0 0 5 0 0 0 8 0]';
zeros = zeros(11,1);
x = A\b;
rowVector = x';

% Loop through each member to determine force and set each data array: members, forces, values.
for iCTR = 1:length(rowVector);   
    if (rowVector(iCTR) > 0);
        force = 'Tensile';
    elseif (rowVector(iCTR) < 0);
        force = 'Compressive';
    end
    members(iCTR) = iCTR;
    forces{iCTR} = force;
    values(iCTR) = rowVector(iCTR);
end

% define table's data elements
t = table(members',forces',values');
% display table after setting column names.
t.Properties.VariableNames = {'MemberNum' 'ForceType' 'Value'}




