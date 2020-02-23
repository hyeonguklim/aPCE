clear;close all;clc

%% load subfuntions
load_path

%% make input data
% set a random seed
rng(0)

% number of random variables
n = 3;

% number of sample data in each variable
n_d = 100;

% sample from uniform distributions
l_b = -pi; % lower bound
u_b = pi; % upper bound
inputs = unifrnd(l_b,u_b,[n n_d]);

%% aPCE
% aPCE order
p = 8;

% number of sets for each PCE order
N_set = 10;

% number of MCS
N_mc = 1e4;

% multiple sets
for i = 1:N_set
    % control random seed
    rng(i)
    
    % MCS samples
    inputs_mc = unifrnd(l_b,u_b,[n N_mc]);
    
    % aPCE
    [c,y] = aPCE(p,inputs,inputs_mc);
    
    % save the coefficients
    C(i,:) = c;
    
    % save MCS output
    Y(i,:) = y;
end

%% exceedance plots
figure();hold on;
for i = 1:N_set
    % control random seed
    rng(i+1000)
    
    % MCS in the exact Ishigami
    Y_mcs = ishigami(unifrnd(l_b,u_b,[n N_mc]));
    
    % empirical cdfs
    [cdf_exact,y_exact] = ecdf(Y_mcs);
    [cdf_apce,y_apce] = ecdf(Y(i,:));
    
    % plots
    f1 = plot(y_exact,1-cdf_exact,'b-','linewidth',1);
    f2 = plot(y_apce,1-cdf_apce,'r--','linewidth',1);
end

% plot setting
set(gca, ...
    'TickLabelInterpreter','latex', ...
    'LineWidth'   , 1         , ...
    'FontSize'    , 15        , ...
    'Box'         , 'on'      , ...
    'TickDir'     , 'in'      , ...
    'TickLength'  , [.01 .01] , ...
    'XMinorTick'  , 'on'      , ...
    'YMinorTick'  , 'on'      , ...
    'XGrid'       , 'on'      , ...
    'YGrid'       , 'on'      , ...
    'YScale'      , 'log'     , ...
    'YTick'       , [1e-5 1e-4 1e-3 1e-2 1e-1 1] , ...
    'XTick'       , [-20 -15 -10 -5 0 5 10 15 20 25] , ...
    'XLim'        , [-20 25]  , ...
    'YLim'        , [1/N_mc 1]);
legend([f1 f2],'MCS',['aPCE (Order= ' num2str(p) ')']);legend boxoff
set(legend,'interpreter','latex','fontsize',15,'location','southwest')
xlabel('$y$','interpreter','latex','fontsize',15)
ylabel('$P(Y>y)$','interpreter','latex','fontsize',15)
set(gcf,'PaperPositionMode','auto')
