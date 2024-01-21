% Run modelling code
Simulation
cc = colororder;
colmap = [linspace(1,0,255)',zeros(255,1),linspace(0,1,255)'];

%% Make movie
close all
clearvars -except Sav tpoint cc colmap

% Run as parallel for loop
for i = height(Sav)

    figure
    tile = tiledlayout(3,3,'TileSpacing','compact','Padding','compact');

    % Arsenic concentrations
    nexttile(1,[1 3])
    AsE = Sav(1:i,1);
    hold on
    p1 = plot(tpoint(1:i),AsE(1:i),"color",cc(1,:),"LineWidth",2);
    % p2 = plot(tpoint(i),AsE(i),"o","color",cc(1,:)...
    %     ,"MarkerFaceColor",cc(1,:));

    AsI = Sav(1:i,2);
    p3 = plot(tpoint(1:i),AsI(1:i),"color",cc(2,:),"LineWidth",2);
    % p4 = plot(tpoint(i),AsI(i),"o","color",cc(2,:)...
    %     ,"MarkerFaceColor",cc(2,:));

    set(gca,'FontSize',14)
    legend([p1 p3],{'Extracellular As','Intracellular As'},'Location','eastoutside')

    xlim([0 6])
    ylim([0 100.1])
    yticks(0:50:100)
    ylabel({'Arsenic level'})

    text(6.2,0,'Time (hour)','FontSize',14)

    % Pigment levels
    nexttile(4,[1 3])
    vio = Sav(1:i,5);
    hold on
    p5 = plot(tpoint(1:i),vio(1:i),"color","b","LineWidth",2);
    % p6 = plot(tpoint(i),vio(i),"o","color","b"...
    %     ,"MarkerFaceColor","b");

    pig = Sav(1:i,13);
    p7 = plot(tpoint(1:i),pig(1:i),"color","r","LineWidth",2);
    % p8 = plot(tpoint(i),pig(i),"o","color","r"...
    %     ,"MarkerFaceColor","r");

    set(gca,'FontSize',14)
    legend([p5 p7],{'violacein','eforRed'},'Location','eastoutside')

    xlim([0 6])
    ylim([0 12])
    yticks(0:4:12)
    ylabel({"Pigment level"})

    text(6.2,0,'Time (hour)','FontSize',14)

    % Ethanol extract color

    blue_fraction = vio./(vio+pig);

    nexttile(8,[1 2])
    if  isnan(blue_fraction(i)) || isinf(blue_fraction(i))
        imagesc([1])
        set(gca,'CLim',[0 1])
        colormap(gray)
    else
        imagesc(blue_fraction(i))
        set(gca,'CLim',[0 1])
        colormap(colmap)
    end
    set(gca,'FontSize',14)
    yticks('')
    xticks('')

    text(-0.2,1,"EtOH extract",'FontSize',14)
    text(-0.2,1.2,"colour",'FontSize',14)

end