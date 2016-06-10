function plotGrandAve()

dataBaseLoc='K:\Cindy\GoPz_Ave_T1_Control&Comparison\';
f=dir(dataBaseLoc);

trialLength=614;
numFiles=length(f);
numPpl=0;
ga=zeros(trialLength,1);

for i=3:1:numFiles
    
    file=fopen([dataBaseLoc f(i).name]);
    fgets(file);
    dat=fscanf(file, '%f');
    if(length(dat)==trialLength)
    
        numPpl=numPpl+1;
        for c=1:1:trialLength
        
            ga(c)=ga(c)+dat(c);
            
        end
    else
        
        [f(i).name 'not sampled at correct frequency']
        
    end
    fclose(file);
    
end

ga=ga/numPpl;

timeConver=1.953125;
iniTime=-199.22;
xaxis=zeros(614,1);
for i=0:1:613
    xaxis(i+1,1)=iniTime+timeConver*i;
end
%axis
%xaxis
MRT=507.8;

plot(xaxis(:,1),ga(:,1),'Color','k');
hold on;
plot([0 0],[-10 10],'Color','k');
plot([-200 1000],[0 0],'Color','k');
%hold off;

axis([-200 1000 -2 5])
xlabel('Time (ms)');
ylabel('Voltage (\muV)');