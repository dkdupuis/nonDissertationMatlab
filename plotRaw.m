function plotRaw()

partNum='112807';
%numTrials=9;


datFile=fopen(strcat('C:\Users\dud164\Desktop\Woody\W1\Comparison\',partNum,'\dat.doc'));
%rawAveFile=fopen(strcat('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\HighRisk\',partNum,'\',partNum,'_rawAve.txt'));
numTrialFile=fopen(strcat('C:\Users\dud164\Desktop\Woody\W1\Comparison\',partNum,'\',partNum,'_numTrials.txt'));
numTrials=str2num(fgetl(numTrialFile));
fclose(numTrialFile);


numDataPoints=819;
timeConver=1.953125;
iniTime=-800;



a= fscanf(datFile, '%f');
fclose(datFile);
rawDat=zeros(numDataPoints,numTrials+1);


for c=1:1:numTrials
    temp=(c-1)*819;
    for r=1:1:819

        rawDat(r,c)=a(temp+r);
        rawDat(r,numTrials+1)=rawDat(r,numTrials+1)+rawDat(r,c);
        
    end
end

%a=fscanf(rawAveFile,'%f');




for i=1:1:819
    rawDat(i,numTrials+1)=rawDat(i,numTrials+1)/numTrials;
end


xaxis=zeros(819,1);
for i=0:1:numDataPoints-1
    xaxis(i+1,1)=iniTime+timeConver*i;
end

f=figure('Name',strcat('Raw Data:',partNum));

%[1 0 0]red
%[0 1 0]green
%0 0 1 blue

subplot(2,2,1);
for i=1:1:numTrials
    
    if i<=numTrials/3
        col=[((numTrials/3)-i+1)/((numTrials/3)) (i-1)/(numTrials/3)  0];
    elseif i<=(2*numTrials)/3
        col=[0 (2/3*(numTrials-1)-i+1)/(numTrials/3) (i-1-((numTrials-2)/3))/(numTrials/3)];
    else
        col=[((i-(2*(numTrials-1))/3)-1)/(numTrials/3) 0 ((numTrials/3)-(i-(2*(numTrials-1))/3)+1)/((numTrials/3))];
    end
        
    
    plot(xaxis(:,1),rawDat(:,i),'Color',col);%,xaxis(:,1),yaxis(1,2,:));
    hold on;
end



%subplot(2,1,1);
%plot(xaxis(:,1),rawDat(:,1),xaxis(:,1),rawDat(:,2),xaxis(:,1),rawDat(:,3),xaxis(:,1),rawDat(:,4),xaxis(:,1),rawDat(:,5),xaxis(:,1),rawDat(:,6),xaxis(:,1),rawDat(:,7),xaxis(:,1),rawDat(:,8),xaxis(:,1),rawDat(:,9),xaxis(:,1),rawDat(:,10),xaxis(:,1),rawDat(:,11),xaxis(:,1),rawDat(:,12),xaxis(:,1),rawDat(:,13),xaxis(:,1),rawDat(:,14),xaxis(:,1),rawDat(:,15),xaxis(:,1),rawDat(:,16),xaxis(:,1),rawDat(:,17),xaxis(:,1),rawDat(:,18),xaxis(:,1),rawDat(:,19),xaxis(:,1),rawDat(:,20),xaxis(:,1),rawDat(:,21),xaxis(:,1),rawDat(:,22),xaxis(:,1),rawDat(:,23),xaxis(:,1),rawDat(:,24),xaxis(:,1),rawDat(:,25),xaxis(:,1),rawDat(:,26),xaxis(:,1),rawDat(:,27),xaxis(:,1),rawDat(:,28));%,xaxis(:,1),rawDat(:,29),xaxis(:,1),rawDat(:,30),xaxis(:,1),rawDat(:,31),xaxis(:,1),rawDat(:,32),xaxis(:,1),rawDat(:,33),xaxis(:,1),rawDat(:,34),xaxis(:,1),rawDat(:,35),xaxis(:,1),rawDat(:,36));%
axis([16 116 -40 30]);
xlabel('Time (ms)');
ylabel('Voltage (\mu)');

subplot(2,2,3);
plot(xaxis(:,1),rawDat(:,numTrials+1),'LineWidth',2);
axis([16 116 -15 5]);
annotation('ellipse',[.27 .3158 .035 (5.5/11.5)*.035])    
text(63.8,-4,'\uparrow center location','FontSize',10)
xlabel('Time (ms)');
ylabel('Voltage (\mu)');    
%fclose(rawAveFile);



%newRaw=fopen('C:\Users\dud164\Desktop\rawTrials.txt','wt');

%start=417;
%finish=417+56;
%temp=horzcat(xaxis(:,1),rawDat);


%for c=start:1:finish
%    for r=1:1:numTrials+1
%    
%        fprintf(newRaw,'%f\t',temp(c,r));
%    
%    end
%    fprintf(newRaw,'\n');
%end


%fclose(newRaw);

plotLags(partNum,f);
