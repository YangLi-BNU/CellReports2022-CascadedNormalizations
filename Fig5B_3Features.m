%% 01-load data
Dirname='..\Code files';
Dirname='D:\通行证\投搞材料\Cell Reports 2022.01.20\20220628四审提交材料\Final files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig5');

SSItype=num(1:4,1:115);
CRFtype=num(5:8,1:115);
CSItype=num(9:12,1:115);

%% 02-plot
ParaName={'Surround Suppression Index','Classical Recpetive Field(°)','Center Suppression Index'};
clear Meandata StdData
Meandata(1,:)=mean(SSItype,2);
Meandata(3,:)=mean(CSItype,2);
Meandata(2,:)=mean(CRFtype,2);
StdData(1,:)=std(SSItype')./sqrt(length(SSItype));
StdData(3,:)=std(CSItype')./sqrt(length(SSItype));
StdData(2,:)=std(CRFtype')./sqrt(length(SSItype));
TypeName={'FF','FF & Sub','FF & Div','Full'};
BarWidth=0.8;
Step=[0.2,0.2,0.2];
YUp=[1,1,1];
YDown=[0,0,0];
colortype2={'k','k','k'};
FontS=8;
MS=2;
tt1s=1.7:0.1:2.3;
tt1d=0:0.02:Meandata(1,3);
tt2d=0:0.02:Meandata(2,3);
figure(1)
site=0;xpos=0.7;
for bb=1:size(Meandata,1)
    site=site+1;
    subplot(1,3,site)
    hold off;
    hSI=bar([1:length(Meandata(bb,:))],Meandata(bb,:),...
        'EdgeColor','k','FaceColor','w','LineWidth',1.5);
    hold on;
    ylim([YDown(bb),YUp(bb)])
    set(hSI,'barwidth',BarWidth);
    errorbar([1:length(Meandata(bb,:))],Meandata(bb,:),StdData(bb,:),'linestyle','none','linewidth',1,'color','k');
    set(gca,'XTick',[1:length(Meandata(bb,:))]);
    set(gca,'XTickLabel',{ });
    if bb==2
        set(gca,'YTick',[YDown(bb),0.2:Step(bb):YUp(bb)]);
    else
        set(gca,'YTick',[YDown(bb):Step(bb):YUp(bb)]);
    end
    xlim([0,length(Meandata(bb,:))+1]);
    axis square;
    ylabel(ParaName{bb});
    set(gca,'FontSize',FontS);
    box off;
    if any(bb==[1])
        plot([1,4],[0.95,0.95],'k-');text(2.5,0.955,{'***'},'Fontsize',7)
        plot([1,2],[0.89,0.89],'k-');text(1.3,0.895,'***','FontSize',7);
        plot([1,3],[0.85,0.85],'k-');text(2,0.855,{'***'},'Fontsize',7)
        plot([2,4],[0.8,0.8],'k-');text(3,0.805,{'***'},'Fontsize',7)
        plot([3,4],[0.72,0.72],'k-');text(3.3,0.725,'***','FontSize',7);
    elseif any(bb==[2])
        plot([1,4],[0.95,0.95],'k-');text(2.5,0.955,{'***'},'Fontsize',7)
        plot([1,2],[0.89,0.89],'k-');text(1.3,0.925,'ns','FontSize',6);
        plot([1,3],[0.85,0.85],'k-');text(2,0.855,{'***'},'Fontsize',7)
        plot([2,4],[0.8,0.8],'k-');text(3,0.805,{'***'},'Fontsize',7)
        plot([3,4],[0.72,0.72],'k-');text(3.3,0.755,'ns','FontSize',6);
    elseif any(bb==[3])
        plot([1,4],[0.95,0.95],'k-');text(2.5,0.955,{'***'},'Fontsize',7)
        plot([1,2],[0.89,0.89],'k-');text(1.3,0.925,'***','FontSize',6);
        plot([1,3],[0.85,0.85],'k-');text(2,0.855,{'ns'},'Fontsize',7)
        plot([2,4],[0.8,0.8],'k-');text(3,0.805,{'***'},'Fontsize',7)
        plot([3,4],[0.72,0.72],'k-');text(3.3,0.755,'***','FontSize',6);
    end
end
set(figure(1),'position',[3,260,666,175])