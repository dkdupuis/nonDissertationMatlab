function getNumTrialsAllByBlock(fileLoc)

dataBaseLoc=strcat(fileLoc,'\');
folders=dir(dataBaseLoc);
preNum=size(folders);
numFolders=preNum(1);

newF=fopen(strcat(dataBaseLoc,'pre_numTrialsByBlock.txt'),'wt');


for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(dataBaseLoc,folders(i).name,'\A1\');
        
        if(isdir(subFold)==1)            
         
            trialFile=fopen([subFold folders(i).name '_A1_numTrials.txt']);
            numTrials=fgetl(trialFile);
            
            name=[folders(i).name '1'];
            fprintf(newF,'%s\t %s\n',name,num2str(numTrials));
            fclose(trialFile);
            
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\B1\');
        
        if(isdir(subFold)==1)

            trialFile=fopen([subFold folders(i).name '_B1_numTrials.txt']);
            numTrials=fgetl(trialFile);
            
            name=[folders(i).name '2'];
            fprintf(newF,'%s\t %s\n',name,num2str(numTrials));
            fclose(trialFile);      
            
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\A2\');
        
        if(isdir(subFold)==1)

            trialFile=fopen([subFold folders(i).name '_A2_numTrials.txt']);
            numTrials=fgetl(trialFile);
            
            name=[folders(i).name '3'];
            fprintf(newF,'%s\t %s\n',name,num2str(numTrials));
            fclose(trialFile);                       
            
        end
    end
end




fclose(newF);
file=fopen(strcat(dataBaseLoc,'pre_numTrialsByBlock.txt'));

newFile=fopen(strcat(dataBaseLoc,'numTrialsByBlock.txt'),'wt');

fprintf(newFile,'%s\t%s\t%s\t%s\n','ID','numTrials_1','numTrials_2','numTrials_3');

data=textscan(file,'%s');
data=data{1,1};

numLines=length(data)/2;

fullId=data{1,1};

id=str2num([fullId(1) fullId(2) fullId(3) fullId(4) fullId(5) fullId(6)]);
prevId=id;
block=fullId(7);

allign1='';
allign2='';
allign3='';


for i=0:1:numLines-1;
   
    fullId=data{i*2+1,1};
    id=str2num([fullId(1) fullId(2) fullId(3) fullId(4) fullId(5) fullId(6)]);
    block=fullId(7);
    
    if(id~=prevId)
        
        fprintf(newFile,'%u\t%s\t%s\t%s\n',prevId,allign1,allign2,allign3);
        
        prevId=id;
        allign1='';
        std1='';
        maxShift1='';
        avgShift1='';
        allign2='';
        std2='';
        maxShift2='';
        avgShift2='';
        allign3='';
        std3='';
        maxShift3='';
        avgShift3='';

    end 
    
    eval(['allign' block '=data{i*2+2,1};']);
    %eval(['std' block '=data{i*5+3,1};']);
    %eval(['maxShift' block '=data{i*5+4,1};']);
    %eval(['avgShift' block '=data{i*5+5,1};']);  
    
end

fprintf(newFile,'%u\t%s\t%s\t%s\n',prevId,allign1,allign2,allign3);

fclose(file);
fclose(newFile);




