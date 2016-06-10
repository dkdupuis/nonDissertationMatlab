function generateAvgByBlock(fileLoc, fileType, additionIdentifier, numDataPoints)


parDir=strcat(fileLoc,'\');
folders=dir(parDir);
t=size(folders);
numFolders=t(1);
startTime=1;
endTime=numDataPoints;


for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(parDir,folders(i).name,'\A1\');
        
        if(isdir(subFold)==1)
        
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (length(strfind(newFolder(r).name,fileType))>0 && length(strfind(newFolder(r).name,additionIdentifier)>0) )
                    
                    data=fopen(strcat(subFold,'\',newFolder(r).name));
                    avg=fopen(strcat(subFold,'\',folders(i).name,'_A1','_rawAve.txt'),'wt');
                    exportNumTrials=fopen(strcat(subFold,'\',folders(i).name,'_A1','_numTrials.txt'),'wt');
                    sum=zeros(numDataPoints,1);
                    fgets(data);
                    a= fscanf(data, '%f');
                    preNum=size(a);
                    numTrials=preNum(1)/numDataPoints;
                    if(floor(numTrials)==numTrials&&numTrials>0)                
                        for n=1:1:numTrials
                            offset=numDataPoints*(n-1);
                            for c=1:1:numDataPoints
                                sum(c)=sum(c)+a(offset+c);
                            end
                        end

                        for c=startTime:1:endTime
                            fprintf(avg,'%f\n',sum(c)/numTrials);
                        end
                        fprintf(exportNumTrials,'%u\n',numTrials);

                    else
                        folders(i).name
                        newFolder(r).name
                    end
                    fclose(avg);
                    fclose(data);
                    fclose(exportNumTrials);

                end
            end
        end
        
        subFold=strcat(parDir,folders(i).name,'\B1\');
        
        if(isdir(subFold)==1)
        
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (length(strfind(newFolder(r).name,fileType))>0 && length(strfind(newFolder(r).name,additionIdentifier)>0) )

                    data=fopen(strcat(subFold,'\',newFolder(r).name));
                    avg=fopen(strcat(subFold,'\',folders(i).name,'_B1','_rawAve.txt'),'wt');
                    exportNumTrials=fopen(strcat(subFold,'\',folders(i).name,'_B1','_numTrials.txt'),'wt');
                    sum=zeros(numDataPoints,1);
                    fgets(data);
                    a= fscanf(data, '%f');
                    preNum=size(a);
                    numTrials=preNum(1)/numDataPoints;
                    if(floor(numTrials)==numTrials&&numTrials>0)                
                        for n=1:1:numTrials
                            offset=numDataPoints*(n-1);
                            for c=1:1:numDataPoints
                                sum(c)=sum(c)+a(offset+c);
                            end
                        end

                        for c=startTime:1:endTime
                            fprintf(avg,'%f\n',sum(c)/numTrials);
                        end
                        fprintf(exportNumTrials,'%u\n',numTrials);

                    else
                        folders(i).name
                        newFolder(r).name
                    end
                    fclose(avg);
                    fclose(data);
                    fclose(exportNumTrials);

                end
            end
        end
        
        subFold=strcat(parDir,folders(i).name,'\A2\');
        
        if(isdir(subFold)==1)
        
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (length(strfind(newFolder(r).name,fileType))>0 && length(strfind(newFolder(r).name,additionIdentifier)>0) )

                    data=fopen(strcat(subFold,'\',newFolder(r).name));
                    avg=fopen(strcat(subFold,'\',folders(i).name,'_A2','_rawAve.txt'),'wt');
                    exportNumTrials=fopen(strcat(subFold,'\',folders(i).name,'_A2','_numTrials.txt'),'wt');
                    sum=zeros(numDataPoints,1);
                    fgets(data);
                    a= fscanf(data, '%f');
                    preNum=size(a);
                    numTrials=preNum(1)/numDataPoints;
                    if(floor(numTrials)==numTrials&&numTrials>0)                
                        for n=1:1:numTrials
                            offset=numDataPoints*(n-1);
                            for c=1:1:numDataPoints
                                sum(c)=sum(c)+a(offset+c);
                            end
                        end

                        for c=startTime:1:endTime
                            fprintf(avg,'%f\n',sum(c)/numTrials);
                        end
                        fprintf(exportNumTrials,'%u\n',numTrials);

                    else
                        folders(i).name
                        newFolder(r).name
                    end
                    fclose(avg);
                    fclose(data);
                    fclose(exportNumTrials);

                end
            end
        end
    end
end