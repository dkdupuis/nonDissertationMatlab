function generateParameterFilesByBlock(fileLoc,numDataPointsPerTrial)


pointsToEitherSideOfCenter=25;%As name suggests

dataBaseLoc=strcat(fileLoc,'\');


folders=dir(dataBaseLoc);
preNum=size(folders);
numFolders=preNum(1);
minLocFile=fopen(strcat(dataBaseLoc,'allMinLoc_byBlock.txt'));
minLoc=fscanf(minLocFile,'%u');
fclose(minLocFile);
index=2;
for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(dataBaseLoc,folders(i).name,'\A1\')
        
        if(isdir(subFold)==1)
        
            index=index+1;
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (strfind(newFolder(r).name,'numTrials')>0)

                    center=minLoc((index-2)*2);
                    %[folders(i).name '1']
                    %num2str(minLoc((i-2)*2-1))
                    if(strcmp([folders(i).name '1'],num2str(minLoc((index-2)*2-1)))==1)
                        
                        trialFile=fopen(strcat(subFold,newFolder(r).name));
                        numTrials=fgetl(trialFile);
                        fclose(trialFile);
                        
                        parName=strcat(subFold,'par.doc');
                        par=fopen(parName,'w');
                        
                        fprintf(par,'%u\t %s\t %s\t %s\n %s\t %s\t %s\t %s\n',numDataPointsPerTrial,num2str(numTrials),num2str(center-pointsToEitherSideOfCenter),num2str(center+pointsToEitherSideOfCenter+1),'5','100','2.9','0');
                        fclose(par);

                    end


                end
            end
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\B1\');
        
        if(isdir(subFold)==1)
        
            index=index+1;
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (strfind(newFolder(r).name,'numTrials')>0)

                    center=minLoc((index-2)*2);
                    if(strcmp([folders(i).name '2'],num2str(minLoc((index-2)*2-1)))==1)
                        
                        trialFile=fopen(strcat(subFold,newFolder(r).name));
                        numTrials=fgetl(trialFile);
                        fclose(trialFile);
                        
                        parName=strcat(subFold,'par.doc');
                        par=fopen(parName,'w');
                        
                        fprintf(par,'%u\t %s\t %s\t %s\n %s\t %s\t %s\t %s\n',numDataPointsPerTrial,num2str(numTrials),num2str(center-pointsToEitherSideOfCenter),num2str(center+pointsToEitherSideOfCenter+1),'5','100','2.9','0');
                        fclose(par);

                    end

                end
            end
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\A2\');
        
        if(isdir(subFold)==1)
        
            index=index+1;
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (strfind(newFolder(r).name,'numTrials')>0)

                    center=minLoc((index-2)*2);
                    if(strcmp([folders(i).name '3'],num2str(minLoc((index-2)*2-1)))==1)
                        
                        trialFile=fopen(strcat(subFold,newFolder(r).name));
                        numTrials=fgetl(trialFile);
                        fclose(trialFile);
                        
                        parName=strcat(subFold,'par.doc');
                        par=fopen(parName,'w');
                        
                        fprintf(par,'%u\t %s\t %s\t %s\n %s\t %s\t %s\t %s\n',numDataPointsPerTrial,num2str(numTrials),num2str(center-pointsToEitherSideOfCenter),num2str(center+pointsToEitherSideOfCenter+1),'5','100','2.9','0');
                        fclose(par);

                    end

                end
            end
        end
    end
end