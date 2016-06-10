function plotLags(partNum,f)


%partNum='115607';
%numTrials=4;

datFile=fopen(strcat('C:\Users\dud164\Desktop\Woody\W1\Comparison\',partNum,'\dat.doc'));
%rawAveFile=fopen(strcat('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Comparison\',partNum,'\',partNum,'_rawAve.txt'));
lagFile=fopen(strcat('C:\Users\dud164\Desktop\Woody\W1\Comparison\',partNum,'\woodyLags.txt'));
numTrialFile=fopen(strcat('C:\Users\dud164\Desktop\Woody\W1\Comparison\',partNum,'\',partNum,'_numTrials.txt'));
numTrials=str2num(fgetl(numTrialFile));
fclose(numTrialFile);



numDataPoints=819;
timeConver=1.953125;
iniTime=-800;
iniTime2=-757;

a= fscanf(lagFile, '%f');
fclose(lagFile);

preSize=size(a);
len=preSize(1)/2;
lags=zeros(numTrials,2);
temp=1;
for i=1:1:numTrials
    
    if(temp<=len && a((temp-1)*2+1)==i)  
        
        lags(i,1)=a((temp-1)*2+1); %%%
        lags(i,2)=a((temp-1)*2+2);
        temp=temp+1;
    end
        
end

%lags
%return
%-5==>rawTimePoint 1= lagTimePoint 6
% 5==>rawTimePoint 6= lagTimePoint 1

a= fscanf(datFile, '%f');
fclose(datFile);
lagTrials=zeros(numDataPoints,numTrials+1);

%for c=1:1:numTrials
%    temp=zeros(c-1)*819;
%    lag=lags(c,2);
    
%    for r=1:1:819

%        if( r-lag>=1 && r-lag<=819 )
            
%            lagTrials(r-lag,c)=a(temp+r);
%            lagTrials(r-lag,numTrials+1)=lagTrials(r-lag,numTrials+1)+lagTrials(r-lag,c);

%        end
%    end
%end

keptTrials=0;
for c=1:1:numTrials
    temp=(c-1)*819;
    hasLag=lags(c,1);
    lag=lags(c,2);
    
    if(hasLag~=0)
        
        keptTrials=keptTrials+1;
        for r=1:1:819

            if( r-lag>=1 && r-lag<=819 )

                lagTrials(r-lag,c)=a(temp+r);
                lagTrials(r-lag,numTrials+1)=lagTrials(r-lag,numTrials+1)+lagTrials(r-lag,c);

            end
        end
    end
end


for i=1:1:819
    lagTrials(i,numTrials+1)=lagTrials(i,numTrials+1)/keptTrials;
end

xaxis=zeros(819,1);
xaxis2=zeros(819,1);
for i=0:1:numDataPoints-1
    xaxis(i+1,1)=iniTime+timeConver*i;
    xaxis2(i+1,1)=iniTime2+timeConver*i;
end


%figure('Name',strcat('Lagged Data:',partNum));

%subplot(4,1,2);
%plot(xaxis(:,1),lagTrials(:,1),xaxis(:,1),lagTrials(:,2),xaxis(:,1),lagTrials(:,3),xaxis(:,1),lagTrials(:,4),xaxis(:,1),lagTrials(:,5),xaxis(:,1),lagTrials(:,6),xaxis(:,1),lagTrials(:,7),xaxis(:,1),lagTrials(:,8),xaxis(:,1),lagTrials(:,9),xaxis(:,1),lagTrials(:,10),xaxis(:,1),lagTrials(:,11),xaxis(:,1),lagTrials(:,12),xaxis(:,1),lagTrials(:,13),xaxis(:,1),lagTrials(:,14),xaxis(:,1),lagTrials(:,15),xaxis(:,1),lagTrials(:,16),xaxis(:,1),lagTrials(:,17),xaxis(:,1),lagTrials(:,18),xaxis(:,1),lagTrials(:,19),xaxis(:,1),lagTrials(:,20),xaxis(:,1),lagTrials(:,21),xaxis(:,1),lagTrials(:,22),xaxis(:,1),lagTrials(:,23),xaxis(:,1),lagTrials(:,24),xaxis(:,1),lagTrials(:,25),xaxis(:,1),lagTrials(:,26),xaxis(:,1),lagTrials(:,27),xaxis(:,1),lagTrials(:,28));%,xaxis(:,1),lagTrials(:,29),xaxis(:,1),lagTrials(:,30),xaxis(:,1),lagTrials(:,31),xaxis(:,1),lagTrials(:,32),xaxis(:,1),lagTrials(:,33),xaxis(:,1),lagTrials(:,34),xaxis(:,1),lagTrials(:,35),xaxis(:,1),lagTrials(:,36);%
subplot(2,2,2);
for i=1:1:numTrials

    if(lags(i,1)~=0)
        if i<=numTrials/3
            col=[((numTrials/3)-i+1)/((numTrials/3)) (i-1)/(numTrials/3)  0];
        elseif i<=(2*numTrials)/3
            col=[0 (2/3*(numTrials-1)-i+1)/(numTrials/3) (i-1-((numTrials-2)/3))/(numTrials/3)];
        else
            col=[((i-(2*(numTrials-1))/3)-1)/(numTrials/3) 0 ((numTrials/3)-(i-(2*(numTrials-1))/3)+1)/((numTrials/3))];
        end

        plot(xaxis(:,1),lagTrials(:,i),'Color',col);%,xaxis(:,1),yaxis(1,2,:));
        hold on;
        
    end
end




axis([16 125 -40 30]);
xlabel('Time (ms)');
ylabel('Voltage (\mu)');

subplot(2,2,4);
plot(xaxis(:,1),lagTrials(:,numTrials+1),'LineWidth',2);
axis([16 116 -15 5]);
xlabel('Time (ms)');
ylabel('Voltage (\mu)');
%figure
%subplot(2,1,1);
%plot(xaxis(:,1),lagTrials(:,numTrials+1),'LineWidth',2);
%axis([-200 450 -40 30]);
%subplot(2,1,2);
%plot(xaxis2(:,1),lagTrials(:,numTrials+1),'LineWidth',2);
%axis([-200 450 -40 30]);
%plot([0 1],[0 0], [1 2],[0 0], [2 3],[0 0], [3 4],[0 0], [4 5],[0 0], [5 6],[0 0], [6 7],[0 0], [7 8],[0 0], [8 9],[0 0], [9 10],[0 0], [10 11],[0 0], [11 12],[0 0],'LineWidth',15);
%axis([0 12 -.2 .2]);


newAl=fopen('C:\Users\dud164\Desktop\alignedTrials.txt','wt');

start=417;
finish=417+56;
temp=horzcat(xaxis(:,1),lagTrials);


for c=start:1:finish
    for r=1:1:numTrials+1
    
        fprintf(newAl,'%f\t',temp(c,r));
    
    end
    fprintf(newAl,'\n');
end


fclose(newAl);




