function getNumTrialsAll(fileLoc)

%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
dataBaseLoc=strcat(fileLoc,'\');
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);

newF=fopen(strcat(dataBaseLoc,'numTrials.txt'),'wt');%K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\numTrialsCz_all_minus50.txt','wt');

for i=3:1:numFolders
    
    fileLoc=strcat(dataBaseLoc,f(i).name);
    newFold=dir(fileLoc);
    newFpreSize=size(newFold);
    newFSize=newFpreSize(1);

    for r=3:1:newFSize

        if(strfind(newFold(r).name,'numTrials')>0)
            
            trialFile=fopen(strcat(fileLoc,'\',newFold(r).name));
            numTrials=fgetl(trialFile);
            
            name=strcat(f(i).name);
            fprintf(newF,'%s\t %s\n',name,num2str(numTrials));
            fclose(trialFile);
            
            %numTrials
            %parName=strcat(dataBaseLoc,f(i).name,'\par.doc');
            %par=fopen(parName,'w');
            %parName
            %fprintf(par,'%s\t %s\t %s\t %s\n %s\t %s\t %s\t %s\n','819',num2str(numTrials),'460','512','2','100','1','.001');
            %fclose(par);
            
        end
        
        
        
        
    end
    

    
end

fclose(newF);
