function outputMinLocFromSignalByBlock(fileLoc)

window=52;%filterWindow in units of data points

dataBaseLoc=strcat(fileLoc,'\');
folders=dir(dataBaseLoc);
numFolders=length(folders);

newF=fopen(strcat(dataBaseLoc,'allSignalMinLocByBlock.txt'),'wt');
newFms=fopen(strcat(dataBaseLoc,'allSignalMinLoc_inMsByBlock.txt'),'wt');

minLocFile=fopen(strcat(dataBaseLoc,'allMinLoc_ByBlock.txt'));
minLocRaw=fscanf(minLocFile,'%u');
fclose(minLocFile);

for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(dataBaseLoc,folders(i).name,'\A1\');
        
        if(isdir(subFold)==1)
            
            woodySigFile=fopen(strcat(subFold,'woodySignal.txt'));        
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

            nameBlock=[folders(i).name '1'];
            
            fprintf(newF, '%s\t%u\n', nameBlock,minLocDataPoints);
            fprintf(newFms, '%s\t%d\t%f\n', nameBlock,minLocMs, min);               

        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\B1\');
        
        if(isdir(subFold)==1)

            woodySigFile=fopen(strcat(subFold,'woodySignal.txt'));        
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

            nameBlock=[folders(i).name '2'];
            
            fprintf(newF, '%s\t%u\n', nameBlock,minLocDataPoints);
            fprintf(newFms, '%s\t%d\t%f\n', nameBlock,minLocMs, min);            
            
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\A2\');
        
        if(isdir(subFold)==1)

            woodySigFile=fopen(strcat(subFold,'woodySignal.txt'));        
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

            nameBlock=[folders(i).name '3'];
            
            fprintf(newF, '%s\t%u\n', nameBlock,minLocDataPoints);
            fprintf(newFms, '%s\t%d\t%f\n', nameBlock,minLocMs, min);                     
            
        end
    end
end