%% 01-load data
Dirname='..\Code files';
Dirname='D:\通行证\投搞材料\Cell Reports 2022.01.20\20220628四审提交材料\Final files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig5');

SSICont=num(15:18,1:115);
CRFCont=num(19:22,1:115);
CSICont=num(23:26,1:115);

Data(1,:)=mean(SSICont,2);
Stddata(1,:)=std(SSICont,0,2)./sqrt(length(SSICont));
Data(2,:)=nanmean(CRFCont,2);
Stddata(2,:)=nanstd(CRFCont,0,2)./sqrt(length(SSICont));
Data(3,:)=nanmean(CSICont,2);
Stddata(3,:)=nanstd(CSICont,0,2)./sqrt(length(SSICont));

%% 02-plot
TypeName1={'FF','Sub','Div','Sub&Div'};
LabelName=ParaName;
LabelName{2}='\Delta Classical Recpetive Field(°)';
figure(1)
site=0;
xpos=0.7;ypos=-0.1;
FontS=8;colork=1;
for bb=1:size(Data,1)
    site=site+1;
    subplot(1,3,site)
    hold off;
    hSI=bar([1:length(Data(bb,:))],Data(bb,:),'FaceColor',[1,1,1].*colork,'LineWidth',1.5);
    hold on;
    ylim([YDown(bb),YUp(bb)])
    set(hSI,'barwidth',BarWidth);

    if bb==1
        errorbar([1,3,4],Data(bb,[1,3,4]),Stddata(bb,[1,3,4]),'linestyle','none','linewidth',1,'color',[1,1,1].*0);
        errorbar([2],Data(bb,2),Stddata(bb,2),'linestyle','none','linewidth',1,'color',[1,1,1].*0);
    else
        errorbar([1:length(Data(bb,:))],Data(bb,:),Stddata(bb,:),'linestyle','none','linewidth',1,'color',[1,1,1].*0);
    end
    set(gca,'XTick',[1:length(Data(bb,:))]);
    set(gca,'XTickLabel',{ });
    if bb==2
        set(gca,'YTick',[YDown(bb),0.2:Step(bb):YUp(bb)]);
    else
        set(gca,'YTick',[YDown(bb):Step(bb):YUp(bb)]);
    end
    xlim([0.2,length(Meandata(bb,:))+0.9]);
    axis square;
    set(gca,'YTick',[-0.2,0:0.5:1]);
    
    set(gca,'YTickLabel',{'-20',0,'50','100'});
    text(-0.1,1.2,'%','FOntSize',FontS);
    if bb==1
        ylabel('Contribution');
    else
        ylabel(' ');
    end
    set(gca,'FontSize',FontS);
    box off;
    ylim([-0.3,1.5]);
    if bb==3
        text(0.8,1.4,LabelName{bb},'FontSize',FontS-1);
    else
        text(0.5,1.4,LabelName{bb},'FontSize',FontS-1);
    end
    set(gca,'Xcolor','w');
end
set(figure(1),'position',[3,260,666,175])



