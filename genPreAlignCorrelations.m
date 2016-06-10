function genPreAlignCorrelations()

parDir='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
folders=dir(parDir);
t=size(folders);
numFolders=t(1);
windowLength=53;
trialLength=819;

corrFile=fopen(strcat(parDir,'preAlignmentCorrelations.txt'),'wt');

for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(parDir,folders(i).name,'\');
        newFolder=dir(subFold);
        newFpreSize=size(newFolder);
        newFSize=newFpreSize(1);
 
        for r=3:1:newFSize
            %newFolder(r).name
            %strfind(newFolder(r).name,'.1w1')
            
            if (strfind(newFolder(r).name,'Fz_100uV.dat')>0)
                
                parFile=fopen(strcat(subFold,'par.doc'));
                a= fscanf(parFile, '%f');
                fclose(parFile);
                InitialTime=a(3);
                               
                
                datFile=fopen(strcat(subFold,newFolder(r).name));
                fgets(datFile);%cuz of channel name at beginning
                input=fscanf(datFile, '%f');
                fclose(datFile);
                numTrials=length(input)/819;
                data=zeros(numTrials,windowLength);
                %numTrials
                %trialLength*(numTrials-1)
                for m=1:1:numTrials
                   
                    offset=trialLength*(m-1);
                    
                    for c=0:1:windowLength-1
                        
                        data(m,c+1)=input(offset+InitialTime+c);
                        
                    end
                end
                
                corrs=zeros(numTrials,1);
                
                for m=1:1:numTrials
                    %data(m,:)
                    %sum(data)-data(m,:)
                    corMat=corrcoef(data(m,:),sum(data)-data(m,:));
                    corrs(m)=corMat(2,1);                    
                    
                end
                %folders(i).name
                %corrs
                %mean(corrs)
                fprintf(corrFile,'%s\t %f\n',folders(i).name, mean(corrs));
                
            end            
        end
    end
end

fclose(corrFile);
