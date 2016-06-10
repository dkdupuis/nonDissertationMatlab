function outputMinLocFromSignal(fileLoc)

window=52;%filterWindow in units of data points

%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
dataBaseLoc=strcat(fileLoc,'\');
f=dir(dataBaseLoc);
numFolders=length(f);

newF=fopen(strcat(dataBaseLoc,'allSignalMinLoc.txt'),'wt');%'K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allSignalMinLoc.txt','wt');
newFms=fopen(strcat(dataBaseLoc,'allSignalMinLoc_inMs.txt'),'wt');%'K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allSignalMinLoc_inMs.txt','wt');


minLocFile=fopen(strcat(dataBaseLoc,'allMinLoc.txt'));%K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc_minus50.txt');
minLocRaw=fscanf(minLocFile,'%u');
fclose(minLocFile);

for i=3:1:numFolders
    
    fileLoc=strcat(dataBaseLoc,f(i).name);
    if(f(i).isdir==1)

        woodySigFile=fopen(strcat(fileLoc,'\woodySignal.txt'));        
        woodySig=fscanf(woodySigFile, '%f'); 
        fclose(woodySigFile);
        n=length(woodySig);
        min=woodySig(1);
        minLoc=1;
        for c=2:1:n
            if( woodySig(c)<min )
            
                min=woodySig(c);
                minLoc=c;
                
            end
        end
                
        start=minLocRaw((i-2)*2)-window/2;
        
        minLocDataPoints=start+minLoc-1;
        minLocMs=ceil(-800+1.953125*minLocDataPoints);
        
        fprintf(newF, '%s\t%u\n', f(i).name,minLocDataPoints);
        fprintf(newFms, '%s\t%d\t%f\n', f(i).name,minLocMs, min);        
    end
    
end

fclose(newFms);
fclose(newF);