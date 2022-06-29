%% 01-set path and load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig3');
AllDoG=num(9,1:end);
AllRoG=num(10,1:end);
Allyy=num(11,1:end);
boundary=[35,37.9,43.9,57.95,72,86,100];
Outpos=find(Allyy>0 & Allyy<=boundary(3));
Inpos=find(Allyy>boundary(3) & Allyy<=boundary(5));
OutR2(1,:)=AllDoG(Outpos);OutR2(2,:)=AllRoG(Outpos);
InR2(1,:)=AllDoG(Inpos);InR2(2,:)=AllRoG(Inpos);
FName='Arial';

%% 02-scatter plot 
typecolor={[0,0,0]+0.5;[0,0,0]+0.5};
InR2(InR2<0)=0;OutR2(OutR2<0)=0;
selesite=7;
figure(1)
set(gcf,'color','w')
leftregion=0.2;MarkerSize=5;
hold off;
h(1)=plot(InR2(1,:),InR2(2,:),'ro','MarkerSize',MarkerSize,'LineWidth',0.5);
alpha 0.3
Barlength=20;
maxlim=1.00;minlim=-0.05;barStep=0.2;
hold on;
h(2)=plot(OutR2(1,:),OutR2(2,:),'bo','MarkerSize',MarkerSize);
alpha 0.3
plot([minlim,maxlim],[minlim,maxlim],'k--','LineWidth',1);
xx=[0:barStep:maxlim];
set(gca,'XTick',xx);
set(gca,'YTick',xx);
axis xy
axis([minlim,maxlim,minlim,maxlim]);
xlabel({['DoG-Goodness of Fit']},'FontSize',7);
ylabel({['RoG-Goodness of Fit']},'FontSize',7);
text(0.35,0.25,['Input: N= ',num2str(length(InR2(1,:)))],'FontSize',8,'color','r')
text(0.35,0.15,['Output: N= ',num2str(length(OutR2(1,:)))],'FontSize',8,'color','b')
axis square;
set(gca,'XTick',[0:0.2:1]);
set(gca,'XTickLabel',{'<=0','.2','.4','.6','.8','1'});
set(gca,'YTick',[0:0.2:1]);
set(gca,'YTickLabel',{'0','.2','.4','.6','.8','1'});
box off;
set(gca,'FontSize',9);
set(gca,'FontName',FName);
alpha 0.3



