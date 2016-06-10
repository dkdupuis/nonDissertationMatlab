function outputMinLocFromRaw(fileLoc, startPoint, endPoint)

dataBaseLoc=strcat(fileLoc,'\');
%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);

newFms=fopen(strcat(dataBaseLoc, 'allMinLoc_inMs.txt'),'wt');%fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc_inMs_minus50.txt','wt');
newF=fopen(strcat(dataBaseLoc,'allMinLoc.txt'),'wt');%fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc_minus50.txt','wt');
newFRaw=fopen(strcat(dataBaseLoc,'rawSig.txt'),'wt');%fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_rawERN.txt','wt');
for i=3:1:numFolders
    
    fileLoc=strcat(dataBaseLoc,f(i).name);
    if(f(i).isdir==1)
        f(i).name
        strcat(fileLoc,'\',f(i).name,'_rawAve.txt');
        raw=fopen(strcat(fileLoc,'\',f(i).name,'_rawAve.txt'));        
        araw=fscanf(raw, '%f');
        fclose(raw);
        
        minLoc=-100000;
        minVal=100;
        
        for c=startPoint:1:endPoint%%%%383:1:434  %%%%%%%%%383:1:435 %-50 to 50  %%%%410:1:460 461? 0ms to 100ms
            
            if(araw(c)<minVal)
                
                minVal=araw(c);
                minLoc=c;
                
            end

        end
        
        minLocMs=round(-800.78125+1.953125*minLoc);
        fprintf(newF, '%s\t %u\n', f(i).name,minLoc);
        fprintf(newFms, '%s\t %d\n', f(i).name,minLocMs);
        fprintf(newFRaw, '%s\t %f\n', f(i).name,minVal);
    end
    
end

fclose(newF);
fclose(newFms);
fclose(newFRaw);