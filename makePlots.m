function makePlots()

numDataPoints=819;
startTime=383;
startOffset=0;
endTime=466;
endOffset=0;
numTrials=8;

datFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Comparison\105362\dat.doc');
lagFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Comparison\105362\woodyLags.txt');
%rawAveFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Control\104333\101982_rawAve.txt');
filteredAveFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Comparison\105362\woodySignal.txt');

a= fscanf(datFile, '%f');
fclose(datFile);


rawDat=zeros(numDataPoints,numTrials);

for c=1:1:numTrials
    temp=(c-1)*819;
    for r=1:1:819

        rawDat(r,c)=a(temp+r);
        
        
    end
end

%dat
a= fscanf(lagFile, '%d');
fclose(lagFile);

preSize=size(a);
len=preSize(1)/2;
lags=zeros(numTrials,2);
temp=1;
for i=1:1:numTrials
    
    if(temp<=len && a((temp-1)*2+1)==i)  
        
        lags(i,1)=1;
        lags(i,2)=a((temp-1)*2+2);
        temp=temp+1;
    end
        
end
unFil=zeros(84,numTrials);
datLength=(endTime+endOffset)-(startTime+startOffset);
dat=zeros(datLength,numTrials);
for r=0:1:(datLength-1)
    for c=1:1:numTrials%startTime+startOffset:1:endtime+endOffset
        
        if (lags(c,2)+r>=0 && lags(c,2)+r<datLength)
            dat(r+1,c)=rawDat(startTime+startOffset+r,c);
        end
        unFil(r+1,c)=rawDat(r+1,c);
    end
end

figure
%subplot(5,2,1);
xaxis=zeros(84,1);
for i=1:1:84
    xaxis(i,1)=383+i;
end
%for i=1:1:5
    %unFil
%    subplot(5,1,i);%(i-1)*2+1);
%    plot(xaxis(:,1),unFil(:,i))
%    axis([399 451 -40 40])
    
%end


%lags
laggedDat=zeros(84,numTrials);
filtAvg=zeros(datLength,1);
for r=0:1:(datLength-1)
    for c=1:1:numTrials
        %c
        %lags(c,1)
        if(lags(c,1)==1)
            
            laggedDat(r+1,c)=rawDat(r+startTime+startOffset-lags(c,2),c);
            filtAvg(r+1,1)=filtAvg(r+1,1)+laggedDat(r+1,c);
        end
        
    end
end

subplot(2,1,1);
plot(xaxis(:,1),unFil(:,1),xaxis(:,1),unFil(:,2),xaxis(:,1),unFil(:,3),xaxis(:,1),unFil(:,4),xaxis(:,1),unFil(:,5),xaxis(:,1),unFil(:,6),xaxis(:,1),unFil(:,7),xaxis(:,1),unFil(:,8));
axis([383 466 -40 40]);
subplot(2,1,2);
plot(xaxis(:,1),laggedDat(:,1),xaxis(:,1),laggedDat(:,2),xaxis(:,1),laggedDat(:,3),xaxis(:,1),laggedDat(:,4),xaxis(:,1),laggedDat(:,5),xaxis(:,1),laggedDat(:,6),xaxis(:,1),laggedDat(:,7),xaxis(:,1),laggedDat(:,8));
axis([383 466 -40 40]);



for i=1:1:datLength
    filtAvg(i,1)=filtAvg(i,1)/(temp-1);
end

%laggedDat(20,4)
%dat(23,4)
%figure
%plot(rawDat)
%subplot(5,2,1);
%for i=1:1:5
    
%    sigLag=lags(i,2);
%    signalLength=52-abs(sigLag);

%    temp=zeros(signalLength,1);
%    xaxis=zeros(signalLength,1);
%    if( sigLag<=0 )
%        start=abs(sigLag);
%        endpoint=52;
%    else
%        start=0;
%        endpoint=52-sigLag;
%    end
    
%    for c=start+1:1:endpoint
        
%        temp(c-start,1)=laggedDat(c,i);
%        xaxis(c-start,1)=c-1+460;
        
%    end

%    subplot(5,1,i);%(i-1)*2+1);
%    plot(xaxis(:,1),temp(:,1))
%    axis([460 511 -40 40])
    
%end
%figure
%for i=1:1:4
   
%    subplot(4,1,i);%(i-1)*2+1);
%    plot(laggedDat(:,i))
%    axis([0 130 -35 35])
%    
%end

%figure
%for i=5:1:8
   
%    subplot(4,1,i-4);%(i-1)*2+1);
%    plot(laggedDat(:,i))
%    axis([0 130 -35 35])
%    
%end

%figure
%for i=9:1:12
   
%    subplot(4,1,i-8);%(i-1)*2+1);
%    plot(laggedDat(:,i))
%    axis([0 130 -35 35])
%    
%end

%figure
%for i=13:1:14
%   
%    subplot(4,1,i-12);%(i-1)*2+1);
%    plot(laggedDat(:,i))
%    axis([0 130 -35 35])
%    
%end


%rawAve= fscanf(rawAveFile, '%f');

%avg=zeros(datLength,1);

%laggedDat
%for i=1:1:datLength;
%    for c=1:1:numTrials
%        avg(i,1)=avg(i,1)+dat(i,c);
%    end
%end
%for i=1:1:datLength;
%        avg(i,1)=avg(i,1)/numTrials;    
%end    

%figure
%subplot(2,1,1);
%plot(avg(:,1))
%subplot(2,1,2);
%plot(filtAvg(:,1))

%fclose(rawAveFile);
fclose(filteredAveFile);
