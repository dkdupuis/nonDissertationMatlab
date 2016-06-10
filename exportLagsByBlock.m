function exportLagsByBlock(fileLoc)


dataBaseLoc=strcat(fileLoc,'\');
folders=dir(dataBaseLoc);
preNum=size(folders);
numFolders=preNum(1);

newF=fopen(strcat(dataBaseLoc,'allLagsByBlock.txt'),'wt');
genOut=fopen(strcat(dataBaseLoc,'pre_generalOutputByBlock.txt'),'wt');

fprintf(genOut,'%s\t %s\t %s\t %s\t %s\n','ID', '# Alligned', 'STD_Lags', 'Max Shift', 'Avg Shif');


for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(dataBaseLoc,folders(i).name,'\A1\');
        
        if(isdir(subFold)==1)            
         
            fileLoc=subFold;
            newFold=dir(fileLoc);
            newFpreSize=size(newFold);
            newFSize=newFpreSize(1);

            for r=3:1:newFSize

                if(strfind(newFold(r).name,'Lags')>0)

                    lagFile=fopen(strcat(fileLoc,'\',newFold(r).name));
                    lags=fscanf(lagFile, '%d');

                    name=strcat(folders(i).name,'1');
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

                    medianAdj=shifts-median(shifts);
                    avgLag=sum(abs(medianAdj))/(numLag-1);
                    fprintf(genOut,'%s\t %u\t %f\t %f\t %f\n',name,numLag,std(shifts),abs(max(shifts))+abs(min(shifts)),avgLag);%id 'STD_Lags', 'Max Shift', 'Avg Shif');
                end

            end
            
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\B1\');
        
        if(isdir(subFold)==1)

            fileLoc=subFold;
            newFold=dir(fileLoc);
            newFpreSize=size(newFold);
            newFSize=newFpreSize(1);

            for r=3:1:newFSize

                if(strfind(newFold(r).name,'Lags')>0)

                    lagFile=fopen(strcat(fileLoc,'\',newFold(r).name));
                    lags=fscanf(lagFile, '%d');

                    name=strcat(folders(i).name,'2');
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

                    medianAdj=shifts-median(shifts);
                    avgLag=sum(abs(medianAdj))/(numLag-1);
                    fprintf(genOut,'%s\t %u\t %f\t %f\t %f\n',name,numLag,std(shifts),abs(max(shifts))+abs(min(shifts)),avgLag);%id 'STD_Lags', 'Max Shift', 'Avg Shif');
                end

            end       
            
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\A2\');
        
        if(isdir(subFold)==1)

            fileLoc=subFold;
            newFold=dir(fileLoc);
            newFpreSize=size(newFold);
            newFSize=newFpreSize(1);

            for r=3:1:newFSize

                if(strfind(newFold(r).name,'Lags')>0)

                    lagFile=fopen(strcat(fileLoc,'\',newFold(r).name));
                    lags=fscanf(lagFile, '%d');

                    name=strcat(folders(i).name,'3');
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

                    medianAdj=shifts-median(shifts);
                    avgLag=sum(abs(medianAdj))/(numLag-1);
                    fprintf(genOut,'%s\t %u\t %f\t %f\t %f\n',name,numLag,std(shifts),abs(max(shifts))+abs(min(shifts)),avgLag);%id 'STD_Lags', 'Max Shift', 'Avg Shif');
                end

            end                       
            
        end
    end
end





fclose(genOut);
file=fopen(strcat(dataBaseLoc,'pre_generalOutputByBlock.txt'));

newFile=fopen(strcat(dataBaseLoc,'generalOutputByBlock.txt'),'wt');

fprintf(newFile,'%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n','ID', '#Alligned_1', 'STD_Lags_1', 'Max Shift_1', 'Avg Shift_1', '#Alligned_1', 'STD_Lags_2', 'Max Shift_2', 'Avg Shift_2', '#Alligned_3', 'STD_Lags_3', 'Max Shift_3', 'Avg Shift_3');

fgetl(file);
data=textscan(file,'%s');
data=data{1,1};

numLines=length(data)/5;

fullId=data{1,1};

id=str2num([fullId(1) fullId(2) fullId(3) fullId(4) fullId(5) fullId(6)]);
prevId=id;
block=fullId(7);

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

for i=0:1:numLines-1;
   
    fullId=data{i*5+1,1};
    id=str2num([fullId(1) fullId(2) fullId(3) fullId(4) fullId(5) fullId(6)]);
    block=fullId(7);
    
    if(id~=prevId)
        
        fprintf(newFile,'%u\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n',prevId,allign1,std1,maxShift1,avgShift1,allign2,std2,maxShift2,avgShift2,allign3,std3,maxShift3,avgShift3);
        
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
    
    eval(['allign' block '=data{i*5+2,1};']);
    eval(['std' block '=data{i*5+3,1};']);
    eval(['maxShift' block '=data{i*5+4,1};']);
    eval(['avgShift' block '=data{i*5+5,1};']);  
    
end
fprintf(newFile,'%u\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n',prevId,allign1,std1,maxShift1,avgShift1,allign2,std2,maxShift2,avgShift2,allign3,std3,maxShift3,avgShift3);

fclose(file);
fclose(newFile);




