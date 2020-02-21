% clear;close all

function [C,raw_mom]=aPCE_coef(po,x)

% input
% po  = polynomial order
% x   = data (1 column)
%
% outpout
% C      = coefficients of a polynomial (highest to lowest)
% ns   = norm square of polynomial of order po

% %example
% x  = importdata('A_max.mat'); % A_max
% x  = datasample(x,1000); % bootsampling (replacement)
% po = 1;

% % normalization
% X= ( x-mean(x) ) / std(x);

% % k-th central moments
% kcm = zeros(1,2*po);
% for cm = 0:2*po-1
%     kcm(cm+1) = mean((x - mean(x)).^cm);
% end
% % kcm(2) = 0;
% 
% % k-th raw moments of normalized variable
% krm = zeros(1,2*po);
% for rm = 0:2*po-1
%     krm(rm+1) =  kcm(rm+1)*kcm(3)^(-rm/2);
% end

% % k-th raw moments of normalized variable
% krm = zeros(1,2*po);
% for rm = 0:2*po-1
%     krm(rm+1) =  mean( X.^rm);
% end


% % pdf
% xpts=min(x): (max(x)-min(x))/999 :max(x);
% [x_pdf,xi] = ksdensity(x,xpts);
% % plot(xi,x_pdf);hold on
% % h=histogram(x,'normalization','pdf');

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
% % determine the norm square
% dx = (max(x)-min(x))/999;
% ns = sum (( polyval( C,xi(1:end-1) ).^2 ).*x_pdf(1:end-1).*dx);



