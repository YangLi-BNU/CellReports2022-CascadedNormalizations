%% 01-set pathway and load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig1');
NormRepP = num(17:28,3:12);
NormstdP = num(17:28,15:24);
NormRepA = num(31:42,3:12);
NormstdA = num(31:42,15:24);
xx=logspace(log10(0.02),log10(10),10);
Sitename={'L2','L2','L3','L3','L4B','L4C\alpha','L4C\alpha','L4C\beta','L5','L5','L6','L6'};
%% 02-Plot tunings
figure(1)
subplot('position',[0.29,0.1,0.120,0.800]);
hold off
Max_L=1;
SizeFont=0.1;MS=2;
for cc=1:size(NormRepP,1)
    if any(cc==[6,7,8])
        errorbar(xx,NormRepP(cc,:)-(cc-1)*Max_L,NormstdP(cc,:),'r.','LineWidth',SizeFont,'CapSize',MS);hold on;
        plot(xx,NormRepP(cc,:)-(cc-1)*Max_L,'r-','LineWidth',1);
    elseif any(cc==[9:12])
        errorbar(xx,NormRepP(cc,:)-(cc-1)*Max_L,NormstdP(cc,:),'k.','LineWidth',SizeFont,'CapSize',MS);hold on;
        plot(xx,NormRepP(cc,:)-(cc-1)*Max_L,'k-','LineWidth',1);
    else
        errorbar(xx,NormRepP(cc,:)-(cc-1)*Max_L,NormstdP(cc,:),'b.','LineWidth',SizeFont,'CapSize',MS);hold on;
        plot(xx,NormRepP(cc,:)-(cc-1)*Max_L,'b-','LineWidth',1);
    end
    plot(xx,ones(1,length(xx))*(0-(cc-1)*Max_L),'k--');
    if cc==size(NormRepP,1)
        set(gca,'YTick',[-size(NormRepP,1)*Max_L+1,-size(NormRepP,1)*Max_L+2]);
        set(gca,'YTicklabel',[ ]);
    end
end
set(gca,'XScale','log');
xlim([min(xx) max(xx)]);
set(gca,'XTick',[0.1,1,10]);
set(gca,'XTickLabel',[0.1,1,10]);
ylim([-(size(NormRepP,1)-1)-0.2 1]);
set(gca,'FontSize',7);
xlabel(' Diameter(°)')
title('Patch Tuning');
box off;
pos=axis;
Outyy1=[-4:1:1];Outyyx1=ones(1,length(Outyy1)).*min(xx);
Outyyx2=ones(1,length(Outyy1)).*max(xx);
Outyy2=[1:-1:-4];
fill([Outyyx1,Outyyx2],[Outyy1,Outyy2],'b','EdgeColor','none')
alpha 0.1
clear Outyy1 Outyy2 Outyyx1 Outyyx2
Outyy1=[-7:1:-4];Outyyx1=ones(1,length(Outyy1)).*min(xx);
Outyyx2=ones(1,length(Outyy1)).*max(xx);
Outyy2=[-4:-1:-7];
fill([Outyyx1,Outyyx2],[Outyy1,Outyy2],'r','EdgeColor','none')
alpha 0.1
clear Outyy1 Outyy2 Outyyx1 Outyyx2
set(gca,'FontName',FName);

subplot('position',[0.48,0.1,0.120,0.800]);
hold off
for cc=1:size(NormRepA,1)
    hold on;
    if any(cc==[6,7,8])
        errorbar(xx,NormRepA(cc,:)-(cc-1)*Max_L,NormstdA(cc,:),'r.','LineWidth',SizeFont,'CapSize',MS);hold on;
        plot(xx,NormRepA(cc,:)-(cc-1)*Max_L,'r-.','LineWidth',1);
    elseif any(cc==[9:12])
        errorbar(xx,NormRepA(cc,:)-(cc-1)*Max_L,NormstdA(cc,:),'k.','LineWidth',SizeFont,'CapSize',MS);hold on;
        plot(xx,NormRepA(cc,:)-(cc-1)*Max_L,'k-.','LineWidth',1);
    else
        errorbar(xx,NormRepA(cc,:)-(cc-1)*Max_L,NormstdA(cc,:),'b.','LineWidth',SizeFont,'CapSize',MS);hold on;
        plot(xx,NormRepA(cc,:)-(cc-1)*Max_L,'b-.','LineWidth',1);
    end
    plot(xx,ones(1,length(xx))*(0-(cc-1)*Max_L),'k--');
    set(gca,'XScale','log');
    if cc==size(NormRepA,1)
        set(gca,'YTick',[-size(NormRepA,1)*Max_L+1,-size(NormRepA,1)*Max_L+2]);
        set(gca,'YTicklabel',[ ]);
    end
end
xlim([min(xx) max(xx)]);
set(gca,'XTick',[0.1,1,10]);
set(gca,'XTickLabel',[0.1,1,10]);
ylim([-(size(NormRepA,1)-1)-0.2 1]);
Outyy1=[-4:1:1];Outyyx1=ones(1,length(Outyy1)).*min(xx);
Outyyx2=ones(1,length(Outyy1)).*max(xx);
Outyy2=[1:-1:-4];
fill([Outyyx1,Outyyx2],[Outyy1,Outyy2],'b','EdgeColor','none')
alpha 0.1
clear Outyy1 Outyy2 Outyyx1 Outyyx2
Outyy1=[-7:1:-4];Outyyx1=ones(1,length(Outyy1)).*min(xx);
Outyyx2=ones(1,length(Outyy1)).*max(xx);
Outyy2=[-4:-1:-7];
fill([Outyyx1,Outyyx2],[Outyy1,Outyy2],'r','EdgeColor','none')
alpha 0.1
title('Annulus Tuning');
set(gca,'FontSize',7);
box off
set(gca,'FontName',FName);
xlabel(' Diameter(°)')

set(gcf,'position',[30,180,440,440])
