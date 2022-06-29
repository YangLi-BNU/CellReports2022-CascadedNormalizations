%% 01-set path and load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig3');

InRePMean=num(5,1:10);InRePStd=num(5,13:22);
InReAMean=num(6,1:10);InReAStd=num(6,13:22);
OutRePMean=num(2,1:10);OutRePStd=num(2,13:22);
OutReAMean=num(3,1:10);OutReAStd=num(3,13:22);

xx=logspace(log10(0.02),log10(10),10);
FName='Arial';
Lwid=1.5;
MS=4;
BlankIn=21;
BlankOut=5;
%% 02-plot tunings
figure(1)
subplot(211)
colortype='b';
errorbar(xx,OutRePMean+BlankOut,OutRePStd,'.','color',colortype,'LineWidth',0.5);hold on;
plot(xx,OutReAMean+BlankOut,'o-','color',colortype,'Markersize',MS);
plot(xx,OutRePMean+BlankOut,'o-','color',colortype,'MarkerFacecolor',colortype,'Markersize',MS);
errorbar(xx,OutReAMean+BlankOut,OutReAStd,'.','color',colortype,'LineWidth',0.5);
plot(xx,ones(1,length(x_input))*BlankOut,'k--');
set(gca,'XScale','log');
axis square;
set(gca,'YTick',[0:50:100]);
set(gca,'YTickLabel',[0:50:100]);
set(gca,'XTick',[0.1,1,10]);
set(gca,'XTickLabel',[0.1,1,10]);
ylim([0,140]);
set(gca,'FontSize',7);box off
xlim([min(xx),max(xx)]);


subplot(212)
colortype='r';
errorbar(xx,InRePMean+BlankIn,InRePStd,'.','color',colortype,'LineWidth',0.5);hold on;
plot(xx,InReAMean+BlankIn,'o-','color',colortype,'Markersize',MS);
plot(xx,InRePMean+BlankIn,'o-','color',colortype,'MarkerFacecolor',colortype,'Markersize',MS);
errorbar(xx,InReAMean+BlankIn,InReAStd,'.','color',colortype,'LineWidth',0.5);
plot(xx,ones(1,length(x_input))*BlankIn,'k--');
set(gca,'XScale','log');
axis square;
set(gca,'YTick',[0:100:200]);
set(gca,'YTickLabel',[0:100:200]);
set(gca,'XTick',[0.1,1,10]);
set(gca,'XTickLabel',[0.1,1,10]);
ylim([0,200]);
set(gca,'FontSize',7);box off
xlim([min(xx),max(xx)]);
ylabel('Response(spks/s)')
xlabel(' Diameter (°)')

