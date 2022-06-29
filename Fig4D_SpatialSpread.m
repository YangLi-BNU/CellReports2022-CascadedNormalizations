%% 01-load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig4');

Out_Div=num(11,1:115);
Out_Sub=num(12,1:115);
In_FF=num(9,1:28);
In_Div=num(10,1:28);
%% 02-plot bar 
figure(1)
BW=0.8;
hold off;LW=1.5;
Meandata=[mean(In_FF),mean(In_Div),mean(Out_Div),mean(Out_Sub)];
Stddata=[std(In_FF)./sqrt(length(In_FF)),std(In_Div./sqrt(length(In_Div))),...
    std(Out_Div)./sqrt(length(Out_FF)),std(Out_Sub)./sqrt(length(Out_Sub))];
h(1)=bar(1,Meandata(1),BW,'EdgeColor','r','FaceColor','w','LineWidth',LW);
hold on;
bar(2,Meandata(2),BW,'EdgeColor','r','FaceColor','w','LineWidth',LW)
h(2)=bar(4,Meandata(3),BW,'EdgeColor','b','FaceColor','w','LineWidth',LW);
bar(5,Meandata(4),BW,'EdgeColor','b','FaceColor','w','LineWidth',LW)
ylabel('Spatial Extents (/°)');
ylim([0,4.5]);set(gca,'YTick',[0:1.5:6]);
set(gca,'YTick',[0:1.5:6]);
xlim([0,6]);
set(gca,'XColor','k');
errorbar([1,2,4,5],Meandata,Stddata,'.','linestyle','none','linewidth',1,'color','k');
box off;
set(gca,'FontName',FName);
set(gca,'XTick',[1,2,4,5]);
set(gca,'XTickLabel',{ });
