function genERNSignals()


dataBaseLoc='C:\Users\dud164\Desktop\Woody\Cz\';
preERN=fopen('C:\Users\dud164\Desktop\Woody\Cz\preERN_Cz.txt','wt');

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
        %woody=fopen(strcat(fileLoc,'\woodySignal.txt'));
        raw=fopen(strcat(fileLoc,'\',f(i).name,'_rawAveFullTrial.txt'));
        
        %awoody= fscanf(woody, '%f');
        araw=fscanf(raw, '%f');
        preSize=size(araw);

        if( preSize(1)>20)
            numPpl=numPpl+1;
            tempWoody=15.0;
            tempRaw=15.0;
            rawLoc=0;
            for c=410:1:461
                f(i).name
                araw(c);
                %awoody(c);
                %if(awoody(c)<tempWoody)
                %    tempWoody=awoody(c);
                %end
                if(araw(c)<tempRaw)
                    tempRaw=araw(c);
                    rawLoc=c;
                end
            end
            
            fprintf(preERN,'%s\t %u\t %f\t %f\t %f\t %f\n',f(i).name,round(-800.78125+1.953125*rawLoc),araw(rawLoc)-(araw(rawLoc-26)+araw(rawLoc+26))/2,araw(rawLoc),araw(rawLoc-26),araw(rawLoc+26));

        else
            f(i).name
        end
        
        %fclose(woody);
        fclose(raw);
        
        
    end
    
       
    
end

fclose(preERN);

