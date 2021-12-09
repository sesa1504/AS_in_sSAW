close all; clear all; clc;

%% load experimental data

filename = (['../Experiment/ExpVelo_90um_185um_30mW.mat']);

load(filename);  
    
X = MessData{1};
Y = MessData{2};
Z = MessData{3};
U = MessData{4};
V = MessData{5};
W = MessData{6};

UW = sqrt(U.^2+W.^2);

%% load numerical data

filename = (['../Simulation/NumVelo_90um_185um_30mW.mat']);

load(filename);  
    
X_num = NumData{1};
Z_num = NumData{2};
U_num = NumData{3};
V_num = NumData{4};
Up_num = NumData{5};


%% interpolation on new grid

finer = 1;   % factor for finer mesh 

num_x = length(UW(:,1));
num_z = length(UW(1,:));

num_elemX = ceil(finer * num_x);
num_elemZ = ceil(finer * num_z);

[X_fineM,Z_fineM,UW_fineM] = finergrid(X,Z,UW,num_elemX,num_elemZ);

[X_fineN,Z_fineN,UW_fineN] = finergrid(X_num,Z_num,Up_num,num_elemX,num_elemZ);


%% 2D cross correlation


interpolate = true;
    
[Korrelation,Corr_max,shiftx,shifty] = CrossCorr2D(UW_fineN,UW_fineM,interpolate);

say = ['The correlation coefficient amounts to ',num2str(Corr_max),'.'];
disp(say);
