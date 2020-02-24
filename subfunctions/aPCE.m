function [c,y] = aPCE(po,input,input_mc)
% input: number of variables (raw) x number of data (column)

% number of random variables
[nrv,~] = size(input);

% multi index
alpha = multi_index(nrv,po);

% number of samples to make an aPCE model
ns_param = 2;
num_pol_term = length(alpha); % number of polynomial basis functions
ns = ns_param*num_pol_term;
    
% allocate input
x1 = input(1,:);
x2 = input(2,:);
x3 = input(3,:);

% training samples
% inputs
x1_sample = datasample(input(1,:),ns,'Replace',true);
x2_sample = datasample(input(2,:),ns,'Replace',true);
x3_sample = datasample(input(3,:),ns,'Replace',true);

% output
y_sample = ishigami([x1_sample;x2_sample;x3_sample]);
y_sample = y_sample';

% MCS samples
x1_mc = input_mc(1,:);
x2_mc = input_mc(2,:);
x3_mc = input_mc(3,:);

% coefficients of polynomial basis functions
for cp = 0:po
    c1 = aPCE_coef(cp,x1);
    c2 = aPCE_coef(cp,x2);
    c3 = aPCE_coef(cp,x3);
    Psi1(cp+1,:) = polyval(c1,x1_sample);
    Psi2(cp+1,:) = polyval(c2,x2_sample);
    Psi3(cp+1,:) = polyval(c3,x3_sample);
    Psi1_mc(cp+1,:) = polyval(c1,x1_mc);
    Psi2_mc(cp+1,:) = polyval(c2,x2_mc);
    Psi3_mc(cp+1,:) = polyval(c3,x3_mc);
end

% multivariate polynomial function
for j = 1:num_pol_term
    Psi(:,j) = Psi1( alpha(j,1)+1,: ).*Psi2( alpha(j,2)+1,: ).*Psi3( alpha(j,3)+1,: );
    Psi_mc(:,j) = Psi1_mc( alpha(j,1)+1,: ).*Psi2_mc( alpha(j,2)+1,: ).*Psi3_mc( alpha(j,3)+1,: );
end

% PCE coefficients by ordinary least square
c = double( lscov(Psi, y_sample) );

% MCS
y = Psi_mc*c;
end