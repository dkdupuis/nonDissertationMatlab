function exportLags(fileLoc)

%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
dataBaseLoc=strcat(fileLoc,'\');
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);

newF=fopen(strcat(dataBaseLoc,'allLags.txt'),'wt');%'K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\allLagsFz_all_minus50.txt','wt');
genOut=fopen(strcat(dataBaseLoc,'generalOutput.txt'),'wt');%'K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\generalOutput.txt','wt');

fprintf(genOut,'%s\t%s\t%s\t%s\t%s\n','ID', '# Alligned', 'STD_Lags', 'Max Shift', 'Avg Shift');
for i=3:1:numFolders
    
    fileLoc=strcat(dataBaseLoc,f(i).name);
    newFold=dir(fileLoc);
    newFpreSize=size(newFold);
    newFSize=newFpreSize(1);

    for r=3:1:newFSize

        if(strfind(newFold(r).name,'Lags')>0)
            
            lagFile=fopen(strcat(fileLoc,'\',newFold(r).name));
            lags=fscanf(lagFile, '%d');
            
            name=strcat(f(i).name);
            fprintf(newF,'%s\t',name);
            
            %i=1;
            preSize=size(lags);
            numLag=preSize(1)/2;
            shifts=zeros(numLag,1);
            %numLag
            for d=1:1:numLag
                %lags(2*d)
                %lags(2*d+1)
                fprintf(newF, '%d\t',lags(2*d));
                %d
                shifts(d)=1.953125*lags(2*d);
            end
            
            fprintf(newF, '\n');
            
            fclose(lagFile);
            
            %get numAlligned STDlgs, max abs shift, average shift 
            
            medianAdj=shifts-median(shifts);
            avgLag=sum(abs(medianAdj))/(numLag-1);
            fprintf(genOut,'%s\t%u\t%f\t%f\t%f\n',name,numLag,std(shifts),abs(max(shifts))+abs(min(shifts)),avgLag);%id 'STD_Lags', 'Max Shift', 'Avg Shif');
        end

    end

end
fclose(genOut);
fclose(newF);



