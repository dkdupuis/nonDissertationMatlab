function findERN()


dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Comparison\';
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);
numPpl=0;
sumWoody=0.0;
sumRaw=0.0;
tempWoody=0.0;
tempRaw=0.0;

for i=3:1:numFolders
    
    fileLoc=strcat(dataBaseLoc,f(i).name);
    %newFold=dir(fileLoc);
    if(f(i).isdir==1)
        woody=fopen(strcat(fileLoc,'\woodySignal.txt'));
        raw=fopen(strcat(fileLoc,'\',f(i).name,'_rawAve.txt'));
        
        awoody= fscanf(woody, '%f');
        araw=fscanf(raw, '%f');
        preSize=size(araw);

        if( preSize(1)>20)
            numPpl=numPpl+1;
            tempWoody=0.0;
            tempRaw=0.0;
            for c=1:1:53
                araw(c);
                awoody(c);
                if(awoody(c)<tempWoody)
                    tempWoody=awoody(c);
                end
                if(araw(c)<tempRaw)
                    tempRaw=araw(c);
                end
            end
            tempWoody
            sumWoody=sumWoody+tempWoody;
            sumRaw=sumRaw+tempRaw;
        else
            f(i).name
        end
        
        fclose(woody);
        fclose(raw);
        
        
    end
    
       
    
end
%sum
sumRaw
sumWoody
for c=1:1:53
    sumRaw=sumRaw/numPpl;
    sumWoody=sumWoody/numPpl;
end

sumRaw
sumWoody
numPpl
