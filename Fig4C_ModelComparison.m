%% 01-load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig4');

ModelGoF=num(15:20,2:135);
for aa=1:size(CurrR2,1)
CurrR2=ModelGoF(aa,:);
CurrR2(CurrR2<0)=0;
MeandataOut(count)=mean(CurrR2);
StdDataOut(count)=std(CurrR2)./sqrt(length(CurrR2));
end
MeanAdjEV=num(22,1:6);
%% 02-plot 
figure(1)
MS=2;
hold off;
cot='k';
cot2=[0.4039    0.0078    0.3686];
errorbar([1:length(MeandataOut)],MeandataOut,StdDataOut,'-','color',cot,'LineWidth',1.5,'Markersize',MS,'Capsize',1);
hold on;
box off;
set(gca,'XTick',[1:1:length(MeandataOut)]);
xlabel('Model');

MeanAdjEV(MeanAdjEV<0)=0;
[AX,hline1,hline2]=plotyy([1:length(MeandataOut)],MeandataOut,[1:length(MeandataOut)],MeanAdjEV);
hlinel.LineWidth=1.5;
set(hline1,'LineStyle','-','marker','.','color',cot);
set(hline2,'LineStyle','-','marker','o','color',cot2);
hline2.LineWidth=1.5;
errorbar([1:length(MeandataOut)],MeandataOut,StdDataOut,'-','color',cot,'LineWidth',1.5,'Markersize',MS);
set(AX(2),'yTick',[0:0.5:1]) 
set(AX(2),'yTicklabel',{'<=0','.5','1'})  
set(AX(1),'yTick',[0.6:0.2:1])  
set(AX(1),'yTickLabel',{'.6','.8','1'})  
set(AX(1),'yLim',[0.6,1.1]) 
set(AX(2),'yLim',[0,1.25]) 
set(AX(1),'Position',[0.1,0.1,0.8,0.8]);
set(AX(2),'Position',[0.1,0.1,0.8,0.8]);
set(AX(1),'YColor',cot);
set(AX(2),'YColor',cot2);
d1=get(AX(1),'ylabel');
set(d1,'string','Goodness of Fit');
d2=get(AX(2),'ylabel');
set(d2,'string','Explained Variance of Features');
set(AX(1),'xLim',[0.2,length(MeandataOut)+0.8]); 
set(AX(2),'xLim',[0.2,length(MeandataOut)+0.8]); 
box off
axis(AX,'square')
set(gca,'FontName',FName);
set(gca,'xticklabel','');


