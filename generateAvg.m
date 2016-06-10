function generateAvg(fileLoc,fileExtenstion, numDataPoints)
%and numTrials
%fileExtenstion='Fz_100uV.dat';
startTime=1;
endTime=numDataPoints;

%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
dataBaseLoc=strcat(fileLoc,'\');
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);

for i=3:1:numFolders
    
    if(f(i).isdir==1)

        fileLoc=strcat(dataBaseLoc,f(i).name);
        newF=dir(fileLoc);
        newFpreSize=size(newF);
        newFSize=newFpreSize(1);
        
        for r=3:1:newFSize
           
            if(strfind(newF(r).name,fileExtenstion)>0)
                newF(r).name;
                data=fopen(strcat(fileLoc,'\',newF(r).name));
                avg=fopen(strcat(fileLoc,'\',f(i).name,'_rawAve.txt'),'wt');
                exportNumTrials=fopen(strcat(fileLoc,'\',f(i).name,'_numTrials.txt'),'wt');
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
                    newF(r).name
                end
                fclose(avg);
                fclose(data);
                fclose(exportNumTrials);
            end
            
        end
        

        
        
    end
    
end