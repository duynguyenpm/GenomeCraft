clear; close all; clc

% Range of concentration order of magnitude
c1 = 0;
c2 = 3;
concRange = c1:0.025:c2;

% Run simulation in concentration range
sim = cell(1,length(concRange));
idx = 1;
for Fc = concRange

    Simulation_RP
    idx=idx+1;

end

%% Plot color as function of time and concentration
v = [];
p = [];

for i = 1:length(concRange)
    v(i,:) = sim{i}(:,5)';
    p(i,:) = sim{i}(:,13)';
end

blue_fraction = v./(v+p);

% Plot
t = 0:0.02:20;
colmap = [linspace(1,0,255)',zeros(255,1),linspace(0,1,255)'];

close all
f = figure;
im = imagesc(t,concRange,blue_fraction);
colormap(colmap)
set(im, 'AlphaData', ~isnan(blue_fraction))
set(gca,'Color','k','YDir','normal','FontSize',14,'CLim',[0 1])
hold on
contour(t,concRange,blue_fraction,[0.5 0.5],'color','w',...
    'ShowText','on','LabelColor','w');
cb=colorbar;
cb.Label.String="Output colour";
cb.Label.FontSize = 14;
cb.FontSize = 14;
set(cb,'Location','eastoutside')

xlabel('Simulated time (hour)');
ylabel('log([As_{t0}])')
set(gca,'FontSize',14)