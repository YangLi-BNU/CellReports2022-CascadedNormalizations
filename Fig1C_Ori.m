%% 01-set pathway and load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig1');
RawOriRe = num(2:13,2:20);
Orixx=[0:20:360];

%% 02-Plot tunings
Max_L=1;
count=0;
minlim=0;maxlim=1;
figure(1)
subplot('position',[0.1,0.1,0.120,0.800]);
hold off;
for ii=1:size(RawOriRe,1)
    PlotRaw=RawOriRe(ii,:);
    hold on;

    if any(ii==[6,7,8])
    plot(Orixx,PlotRaw-(ii-1)*Max_L,'r.-');hold on;
    elseif any(ii==[1:5])
    plot(Orixx,PlotRaw-(ii-1)*Max_L,'b.-');hold on;
    else
    plot(Orixx,PlotRaw-(ii-1)*Max_L,'k.-');hold on;
    end
    plot(Orixx,ones(1,length(Orixx))*(0-(ii-1)*Max_L),'k--');
    if ii==2
        set(gca,'YTick',[-0,-0*Max_L+1]);
        set(gca,'YTicklabel',[0,1]);
    else
        set(gca,'YTick',[-size(RawOriRe,1)*Max_L+1,-size(RawOriRe,1)*Max_L+2]);
        set(gca,'YTicklabel',[ ]);
    end
end
SizeseleOri=220;
plot([SizeseleOri,SizeseleOri],[-(size(RawOriRe,1)-1)-0.2 1],'k--','Linewidth',1);
set(gca,'XTick',[0,180,360]);
set(gca,'XTickLabel',{'0','180','360'});
xlim([min(Orixx) max(Orixx)]);
ylim([-(size(RawOriRe,1)-1)-0.2 1]);
set(gca,'FontSize',7)
xlabel({'Direction (°)'});
pos=axis;
ylabel('Normalized Response','position',[pos(1),pos(3)+6],'Fontsize',8);
box off;
Outyy1=[-4:1:1];Outyyx1=ones(1,length(Outyy1)).*min(Orixx);
Outyyx2=ones(1,length(Outyy1)).*max(Orixx);
Outyy2=[1:-1:-4];
fill([Outyyx1,Outyyx2],[Outyy1,Outyy2],'b','EdgeColor','none')
alpha 0.1
clear Outyy1 Outyy2 Outyyx1 Outyyx2
Outyy1=[-7:1:-4];Outyyx1=ones(1,length(Outyy1)).*min(Orixx);
Outyyx2=ones(1,length(Outyy1)).*max(Orixx);
Outyy2=[-4:-1:-7];
fill([Outyyx1,Outyyx2],[Outyy1,Outyy2],'r','EdgeColor','none')
alpha 0.1
title('Orientation Tuning')




