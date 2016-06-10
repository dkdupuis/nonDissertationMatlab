function outputMinLocFromRawByBlock(fileLoc, startPoint, endPoint)


dataBaseLoc=strcat(fileLoc,'\');
%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);

newFms=fopen(strcat(dataBaseLoc, 'allMinLoc_inMs_byBlock.txt'),'wt');%fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc_inMs_minus50.txt','wt');
newF=fopen(strcat(dataBaseLoc,'allMinLoc_byBlock.txt'),'wt');%fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc_minus50.txt','wt');
newFRaw=fopen(strcat(dataBaseLoc,'rawSig_byBlock.txt'),'wt');%fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_rawERN.txt','wt');

for i=3:1:numFolders
    
    if(f(i).isdir==1)
       
        subFold=strcat(dataBaseLoc,f(i).name,'\A1\')
        
        if(isdir(subFold)==1)
        strcat(subFold,f(i).name,'A1_rawAve.txt')
            raw=fopen(strcat(subFold,f(i).name,'_A1_rawAve.txt'));        
            araw=fscanf(raw, '%f');
            fclose(raw);

            minLoc=-100000;
            minVal=100;

            for c=startPoint:1:endPoint%%%%383:1:434 %%%%%%%%%383:1:435%-50 to 50 %%%%410:1:460 461? 0ms to 100ms

                if(araw(c)<minVal)

                    minVal=araw(c);
                    minLoc=c;

                end

            end

            nameBlock=[f(i).name '1'];
            minLocMs=round(-800.78125+1.953125*minLoc);
            fprintf(newF, '%s\t%u\n', nameBlock,minLoc);
            fprintf(newFms, '%s\t%d\n', nameBlock,minLocMs);
            fprintf(newFRaw, '%s\t%f\n', nameBlock,minVal);
            
        end
        
        subFold=strcat(dataBaseLoc,f(i).name,'\B1\');
        
        if(isdir(subFold)==1)
        
            raw=fopen(strcat(subFold,f(i).name,'_B1_rawAve.txt'));        
            araw=fscanf(raw, '%f');
            fclose(raw);

            minLoc=-100000;
            minVal=100;

            for c=startPoint:1:endPoint%%%%383:1:434 %%%%%%%%%383:1:435%-50 to 50 %%%%410:1:460 461? 0ms to 100ms

                if(araw(c)<minVal)

                    minVal=araw(c);
                    minLoc=c;

                end

            end

            nameBlock=[f(i).name '2'];
            minLocMs=round(-800.78125+1.953125*minLoc);
            fprintf(newF, '%s\t%u\n', nameBlock,minLoc);
            fprintf(newFms, '%s\t%d\n', nameBlock,minLocMs);
            fprintf(newFRaw, '%s\t%f\n', nameBlock,minVal);
            
        end
        
        subFold=strcat(dataBaseLoc,f(i).name,'\A2\');
        
        if(isdir(subFold)==1)
        
            raw=fopen(strcat(subFold,f(i).name,'_A2_rawAve.txt'));        
            araw=fscanf(raw, '%f');
            fclose(raw);

            minLoc=-100000;
            minVal=100;

            for c=startPoint:1:endPoint%%%%383:1:434 %%%%%%%%%383:1:435%-50 to 50 %%%%410:1:460 461? 0ms to 100ms

                if(araw(c)<minVal)

                    minVal=araw(c);
                    minLoc=c;

                end

            end

            nameBlock=[f(i).name '3'];
            minLocMs=round(-800.78125+1.953125*minLoc);
            fprintf(newF, '%s\t%u\n', nameBlock,minLoc);
            fprintf(newFms, '%s\t%d\n', nameBlock,minLocMs);
            fprintf(newFRaw, '%s\t%f\n', nameBlock,minVal);
            
        end
    end
end