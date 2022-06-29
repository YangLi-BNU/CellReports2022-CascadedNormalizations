%% 01-set pathway and load data
Dirname='..\Code files';
cd(Dirname);
[num,Name] = xlsread('Datasets for the manuscript','Fig2');
AllSI=num(9,1:end);
AllCRF=num(10,1:end);
AllCI=num(11,1:end);
AllR2=num(12,1:end);
AllLayer=num(13,1:end);
boundary=[35,37.9,43.9,57.95,72,86,100];
badsite1=find(AllCRF>5);
%there is one site in L6 showing no surround suppression
%we removed this site to better show the variability
Goodsite=intersect(find(AllR2>=0.8),find(AllCRF<5));
Suppos=intersect(Goodsite,find(AllLayer<boundary(3)));
Inpos=intersect(Goodsite,find(AllLayer>=boundary(3) & AllLayer<=boundary(5)));

%% 02-plot laminar pattern
xlabelname={'Surround Suppression Index ','CRF (°)','Center Suppression Index '};
RawRFit{1}=AllSI(Goodsite);
RawRFit{3}=AllCI(Goodsite);
RawRFit{2}=AllCRF(Goodsite);
InPara{1}=AllSI(Inpos);
InPara{3}=AllCI(Inpos);
InPara{2}=AllCRF(Inpos);
SupPara{1}=AllSI(Suppos);
SupPara{3}=AllCI(Suppos);
SupPara{2}=AllCRF(Suppos);
ySPN=linspace(1,100,100);
clear plottype colorType
plottype={'-','-','-','-'};
Allyy=AllLayer(Goodsite);
Inyy=AllLayer(Inpos);
Supyy=AllLayer(Suppos);
colorTypef={[1,1,1].*0.6,[1,1,1].*0.6,[1,1,1].*0.6};
colorType={[1,1,1].*0.6,[1,1,1].*0.6,[1,1,1].*0.6};
x_lim=[0 1];K=1;
FontSizeText=8;FName='Arial';
figure(1)
for aa=1:3
    subplot('position',[0.05+(aa-1)*0.32,0.1,0.280,0.800]);
    hold off;
    ReDepth = Allyy;
    AA=[];
    EmptySPN=[];
    hold off
    DownLim=0.1;
    AA=RawRFit{aa};
    BB=InPara{aa};
    CC=SupPara{aa};
    R=AA;
    if aa==2
        BB(BB>K)=K;
        CC(CC>K)=K;
        R(R>K)=K;
    else
        BB(BB>1)=1;
        CC(CC>1)=1;
        R(R>1)=1;
    end
    ReDepth=Allyy;
    if aa==2
        R(R<0.2)=0.2;
        BB(BB<0.2)=0.2;
        CC(CC<0.2)=0.2;
    end
    plot(R,ReDepth,'k.','MarkerFaceColor','w','Markersize',7);hold on;
    plot(BB,Inyy,'r.','MarkerFaceColor','w','Markersize',7)
    plot(CC,Supyy,'b.','MarkerFaceColor','w','Markersize',7)
    smoothR = [];ErrorR=[];
    for ii = 1:length(ySPN)
        currpos = find(abs(ReDepth-ySPN(ii))<5);
        smoothR(ii) = mean(R(currpos));
        ErrorR(ii) = std(R(currpos))/sqrt(length(R(currpos)));
    end
    h(aa)=fill([smoothR-ErrorR,rot90(smoothR+ErrorR,2)],[ySPN,rot90(ySPN,2)],colorTypef{aa},'EdgeColor','none');
    hold on;
    plot(smoothR,ySPN,plottype{aa},'color','k','LineWidth',1);
    alpha 0.7;
    if aa==2
        x_lim=[0 K];
    else
        x_lim=[0 1];
    end
    if aa==1
        aaaa=0.15;
        text(min(x_lim)-aaaa,(boundary(1)-boundary(1)/2)/2,'2','Color','k','Fontsize',FontSizeText);
        text(min(x_lim)-aaaa,boundary(1)/4+boundary(1)/2,'3','Color','k','Fontsize',FontSizeText);
        text(min(x_lim)-aaaa,(boundary(3)-boundary(1))/2+boundary(1),'4B','Color','k','Fontsize',FontSizeText);
        text(min(x_lim)-aaaa,(boundary(4)-boundary(3))/2+boundary(3),'4C\alpha','Color','k','Fontsize',FontSizeText);
        text(min(x_lim)-aaaa,(boundary(5)-boundary(4))/2+boundary(4),'4C\beta','Color','k','Fontsize',FontSizeText);
        text(min(x_lim)-aaaa,(boundary(6)-boundary(5))/2+boundary(5),'5','Color','k','Fontsize',FontSizeText);
        text(min(x_lim)-aaaa,(100-boundary(6))/2+boundary(6),'6','Color','k','Fontsize',FontSizeText);
    end
    plot(x_lim,[boundary(1)/2 boundary(1)/2],'--k');
    plot(x_lim,[boundary(1) boundary(1)],'--k');
    plot(x_lim,[boundary(3) boundary(3)],'--k');
    plot(x_lim,[boundary(4) boundary(4)],'--k');
    plot(x_lim,[boundary(5) boundary(5)],'--k');
    plot(x_lim,[boundary(6) boundary(6)],'--k');
    plot(x_lim,[boundary(7) boundary(7)],'--k');
    ylim([0 100]);
    if aa==1
        set(gca,'YTick',[0,100]);
        set(gca,'YTickLabel',[ ]);
        pos=axis;
    else
        set(gca,'YTick',[]);
    end
    box off;
    axis ij
    set(gcf,'color','w')
    xlabel(xlabelname{aa});
    if aa==2
        set(gca,'XTick',[0.2:0.4:1]);
        set(gca,'XTickLabel',{'<=0.2',[0.6],'>=1'});
    elseif aa==1
        set(gca,'XTick',[0:0.2:1]);
        set(gca,'XTickLabel',{[0:0.2:1]});
    elseif aa==3
        set(gca,'XTick',[0:0.2:1]);
        set(gca,'XTickLabel',{[0:0.2:1]});
    end
    
    if aa==2
        xlim([0.2 1.03]);
    else any(aa==[1,3])
        xlim([0 1]);
    end
    set(gca,'FontSize',8);
    if aa==2
        title(['N= ',num2str(length(AA)+1)]);
    end
    set(gca,'FontName',FName);
    
end





