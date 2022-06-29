%% 01-set path and load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig4');

OutRePMean=num(2,1:10);OutRePStd=num(2,13:22);
OutReAMean=num(3,1:10);OutReAStd=num(3,13:22);

xx=logspace(log10(0.02),log10(10),10);
FName='Arial';
Lwid=1.5;
MS=4;
BlankOut=5;
%% 02-plot tunings
figure(1)
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

%% 03-Distribution of GoF
FName='Arial';
boundry = [35,37.9,43.9,57.95,72,86,100];
AllR2=num(5,1:331);
Allyy=num(6,1:331);
Outpos=find(Allyy>0 & Allyy<=boundry(3));
OutR2Sele=AllR2(Outpos);
figure(2)
hold off
maxy=0.48;
Barlength=15;
Mean=mean(OutR2Sele);
Std=std(OutR2Sele)/sqrt(length(OutR2Sele));
xx=linspace(0.5,1,Barlength);
[y2 x2]=hist(OutR2Sele,xx);
Currbar2=bar(x2,y2/length(OutR2Sele),1);hold on;
set(Currbar2,'BarWidth',0.6);
set(Currbar2,'Facecolor','k');
set(Currbar2,'Edgecolor','k');
set(gca,'YTick',[0:0.2:maxy]);
set(gca,'YTickLabel',{'0','.2','.4'});
ylim([0.0,0.6]);
axis square
xlabel('Goodness of Fit');%Adjust
set(gca,'XTick',[0:0.2:1]);
ylabel('Proportion')
xlim([0,1.05]);
text(0.2,0.2,[' N=',num2str(length(OutR2Sele))],'Fontsize',8);
text(0.6,0.57,['Mean= ',num2str(roundn(Mean,-2))],'Fontsize',8);
text(Mean,0.5,'\downarrow','FontSize',10,'color','k');
set(gca,'FontSize',8);
box off
set(gca,'FontName',FName);
