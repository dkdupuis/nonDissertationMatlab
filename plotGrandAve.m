function plotGrandAve()

offsetFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allSignalMinLoc.txt');
offsets=fscanf(offsetFile, '%f');
fclose(offsetFile);

offsetRawFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc.txt');
offsetsRaw=fscanf(offsetRawFile, '%f');
fclose(offsetRawFile);

dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);
numPpl=0;
sum=zeros(819,1);
sumFil=zeros(819,1);
sumRawAllign=zeros(819,1);
for i=3:1:numFolders
    %numFolders
    %(i-2)*2
    

    %newFold=dir(fileLoc);
    if(f(i).isdir==1)
        f(i).name
        off=offsets((i-2)*2)-414;
        offRaw=offsetsRaw((i-2)*2)-414;
        fileLoc=strcat(dataBaseLoc,f(i).name);
        avg=fopen(strcat(fileLoc,'\',f(i).name,'_rawAve.txt'));
        a= fscanf(avg, '%f');
        fclose(avg);
        filtAvg=fopen(strcat(fileLoc,'\filteredAvg.txt'));
        filtA= fscanf(filtAvg, '%f');
        fclose(filtAvg);
        preSize=size(a);
        
        if( preSize(1)>5)
            numPpl=numPpl+1;
            
            for c=1:1:819
                sum(c,1)=sum(c,1)+a(c);
                if(c>70 && c<700)
                    sumFil(c,1)=sumFil(c,1)+filtA(c+off);
                    sumRawAllign(c,1)=sumRawAllign(c,1)+a(c+offRaw);
                end
            end
        else
            f(i).name
        end
    end
    
end
%sum
timeConver=1.953125;
iniTime=-800;
xaxis=zeros(819,1);


for i=0:1:818
    xaxis(i+1,1)=iniTime+timeConver*i;
end

for c=1:1:819
    sum(c,1)=sum(c,1)/numPpl;
    sumFil(c,1)=sumFil(c,1)/numPpl;
    sumRawAllign(c,1)=sumRawAllign(c,1)/numPpl;
end

figure
subplot(1,1,1);
plot(xaxis(:,1),sum(:,1),'Color','k');
hold on;
plot(xaxis(:,1),sumFil(:,1),'Color','k','LineStyle','- -');
hold on;
plot(xaxis(:,1),sumRawAllign(:,1),'Color','k','LineStyle','.');
axis([-50 150 -15 5])
xlabel('Time (ms)');
ylabel('Voltage (\muV)');