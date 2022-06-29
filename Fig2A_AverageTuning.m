%% 01-set pathway and load data
% Dirname='..\Code files';
Dirname='D:\通行证\投搞材料\Cell Reports 2022.01.20\20220628四审提交材料\Final files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig2');
NormRepP(1,:)=num(2,1:10);
NormRepP(2,:)=num(5,1:10);
NormRepA(1,:)=num(3,1:10);
NormRepA(2,:)=num(6,1:10);
NormstdP(1,:)=num(2,13:22);
NormstdP(2,:)=num(5,13:22);
NormstdA(1,:)=num(3,13:22);
NormstdA(2,:)=num(6,13:22);
Meanxx=[0.03,0.06,0.13,0.28,0.59,1.2,2.6,5.4,11,24];
%% 02-plot tunings
MS=4;
FName='Arial';
sizeval=3;
Y_lim=[-0.04,1.01];
site={1,2};
figure(1)
hold off
Patype={'c','b'};
Anuype={'m','r'};
count=0;
for aa=1:length(site)
    count=count+1;
    global x_input y_patch y_annulus
    x_input=Meanxx;
    currsite=site{aa};
    y_patch=NormRepP(currsite,:);
    y_annulus=NormRepA(currsite,:);
    stdP=NormstdP(currsite,:);
    stdA=NormstdA(currsite,:);
    RawReP(aa,:)=y_patch;
    RawReA(aa,:)=y_annulus;
    subplot(132);
    maxpos=find(y_patch==max(y_patch));
    if aa==1
        errorbar(x_input,y_patch,stdP,'.','color','b','LineWidth',0.5);hold on;
        plot(x_input,y_patch,'o-','color','b','MarkerFacecolor','b','Markersize',MS);
    else
        errorbar(x_input,y_patch,stdP,'.','color','r','LineWidth',0.5);hold on;
        plot(x_input,y_patch,'o-','color','r','MarkerFacecolor','r','Markersize',MS);
    end
    hold on;
    set(gca,'XScale','log');
    axis square;
    set(gca,'YTick',[0:0.5:Y_lim(2)]);
    set(gca,'XTick',[0.1,10^0,10]);
    set(gca,'XTickLabel',[0.1,1,10]);
    ylim([Y_lim(1),Y_lim(2)]);
    set(gca,'FontSize',7)
    box off
    xlim([min(x_input),max(x_input)]);
   
    xlabel(' Diameter (°)')
    hold on;ylabel('Normalized Response')
    set(gca,'XScale','log');
    title('Patch Tuning');
    set(gca,'FontName',FName);
    
    subplot(131);
    maxpos=find(y_patch==max(y_patch));
    if aa==1
        errorbar(x_input,y_patch,stdP,'.','color','b','LineWidth',0.5);hold on;
        plot(x_input,y_patch,'o-','color','b','MarkerFacecolor','b','Markersize',MS);
        plot(x_input(maxpos:end),ones(1,length(x_input(maxpos:end)))*y_patch(end),'b--');
        plot(x_input(maxpos:end),ones(1,length(x_input(maxpos:end)))*max(y_patch),'b--');
    else
        errorbar(x_input,y_patch,stdP,'.','color','r','LineWidth',0.5);hold on;
        plot(x_input,y_patch,'o-','color','r','MarkerFacecolor','r','Markersize',MS);
        plot(x_input(maxpos:end),ones(1,length(x_input(maxpos:end)))*y_patch(end),'r--');
    end
    hold on;ylabel('Normalized Response')
    set(gca,'XScale','log');
    axis square;
    set(gca,'YTick',[0:0.5:Y_lim(2)]);
    set(gca,'XTick',[0.1,10^0,10]);
    set(gca,'XTickLabel',[0.1,1,10]);    xlabel(' Diameter (°)')
    ylim([Y_lim(1),Y_lim(2)]);    xlim([min(x_input),max(x_input)]);
    set(gca,'FontSize',7)
    box off
    set(gca,'XScale','log');
    title('Patch Tuning');
    set(gca,'FontName',FName);
    
    subplot(133);
    maxpos=find(y_annulus==max(y_annulus));
    if aa==1
        errorbar(x_input,y_annulus,stdA,'.','color','b','LineWidth',0.5);hold on;
        plot(x_input,y_annulus,'o-','color','b','Markersize',MS);
        hold on;
        plot(x_input(1:maxpos),ones(1,length(x_input(1:maxpos)))*(max(y_annulus)),'b--');
        plot(x_input(1:maxpos),ones(1,length(x_input(1:maxpos)))*(y_annulus(1)),'b--');
    else
        errorbar(x_input,y_annulus,stdA,'.','color','r','LineWidth',0.5);hold on;
        plot(x_input,y_annulus,'-o','color','r','Markersize',MS);  
    end
    hold on;
    set(gca,'XScale','log');
    axis square;
    set(gca,'YTick',[0:0.5:Y_lim(2)]);
    set(gca,'XTick',[0.1,10^0,10]);
    set(gca,'XTickLabel',[0.1,1,10]);
    ylim([Y_lim(1),Y_lim(2)]);
    box off
    xlabel(' Diameter (°)')
    set(gca,'FontSize',7)
    xlim([min(x_input),max(x_input)]);
    title('Annulus Tuning');
    set(gca,'FontName',FName);
end
set(gcf,'position',[30,180,500,170])
