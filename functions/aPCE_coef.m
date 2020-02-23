function [C,raw_mom]=aPCE_coef(po,x)
% input
% po = polynomial order
% x  = data (1 column)
%
% outpout
% C  = coefficients of a polynomial (highest to lowest)
% ns = norm square of polynomial of order po

% k-th raw moments
krm = zeros(1,2*po);
for rm = 0:2*po-1
    krm(rm+1) =  mean( x.^rm );
end

% form matrices to get the coefficients
A = zeros(po+1,po+1);
for br = 1:po
    A(br,:) = krm(br:br+po);
end
A(end,end) = 1;
B          = zeros(po+1,1);
B(end)     = 1;

% determine coefficients
C = flipud(A^(-1)*B);

if nargout == 2
    raw_mom = krm;
end