close all; clear all;

%% load experimental data

filename = (['../Experiment/ExpVelo_90um_185um_30mW.mat']);

load(filename);  
    
X = MessData{1};
Y = MessData{2};
Z = MessData{3};
U = MessData{4};
V = MessData{5};
W = MessData{6};


%% plot 

UW = sqrt(U.^2+W.^2);

scale = 7/100;
s=1.5;
fontsize = 20;

f1 = figure(1);
pcolor(X,Z,UW);
hold on
quiver(X,Z,U,W,s,'black','LineWidth',1.5,'MarkerSize',1);

shading flat ;
shading interp ; 
yticks([0 50 100 150 185]);
cb = colorbar('vert');
set(gca,'TickLabelInterpreter','Latex','Fontsize',fontsize);
xlabel('$\rm{x~in~\mu m}$','Interpreter','Latex','FontSize',fontsize);
ylabel('$\rm{z~in~\mu m}$','Interpreter','Latex','FontSize',fontsize);
zlab = get(cb,'ylabel');
set(zlab,'String','$\rm{u_{tr}~in~\mu m/s}$','Interpreter','Latex','FontSize',fontsize) ; 

set(f1,'Units','centimeters','Position', [5, 5, scale*500, scale*185]);
