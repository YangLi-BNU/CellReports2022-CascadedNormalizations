%% 01-set pathway and load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig2');
DeltaSSI=num(16,1:125);
DeltaCRF=num(18,1:125);
DeltaCSI=num(17,1:125);
%% 02-plot laminar pattern
FName='Arial';
clear SupSI SupCI SupCRF
figure(1)
subplot(121)
SupSI=DeltaSSI;
SupCI=DeltaCSI;
hold off;
plot(SupSI,SupCI,'k.','Markersize',8);
hold on;
axis square;
axis([-0.1,0.7,-0.1,1]);
xlabel({'\Delta SSI (Output-Input)'})
ylabel({'\Delta CSI (Output-Input)'});
[r,p]=corr(SupCI',SupSI','type','Spearman');
text(-0.1, 0.93, [' r= ',num2str(roundn(r,-2)),' p= ',num2str(p)],'FontSize',7);
text(-0.1, 0.7,[' N= ',num2str(length(SupSI))],'FontSize',7);
box off;
set(gca,'FontSize',7);
set(gca,'FontName',FName);
set(gca,'XTick',[0:0.2:1]);
set(gca,'YTick',[0:0.2:1]);

subplot(122)
SupCRF=DeltaCRF;
hold off;
plot(SupSI,SupCRF,'k.','Markersize',8);
hold on;
axis square;
axis([-0.1,0.7,-0.7,0.3]);
xlabel({'\Delta SSI (Output-Input)'})
ylabel({'\Delta CRF(°) (Output-Input)'});
[r,p]=corr(SupCRF',SupSI','type','Spearman');
text(-0.1, -0.5, {[' r= ',num2str(roundn(r,-2))];[' p= ',num2str(p) ]},'FontSize',7);
box off;
set(gca,'FontSize',7);
set(gca,'FontName',FName);
set(gca,'XTick',[0:0.2:1]);
set(gca,'YTick',[-0.6:0.2:0.2]);
set(gcf,'position',[120,125,610,390])
