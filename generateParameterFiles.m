function generateParameterFiles(fileLoc,numDataPointsPerTrial)
pointsToEitherSideOfCenter=25;%As name suggests
%window=pointsToEitherSideOfCenter*2;
%dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
dataBaseLoc=strcat(fileLoc,'\');


f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);
minLocFile=fopen(strcat(dataBaseLoc,'allMinLoc.txt'));
minLoc=fscanf(minLocFile,'%u');
fclose(minLocFile);
for i=3:1:numFolders
    
    if(f(i).isdir==1)
        fileLoc=strcat(dataBaseLoc,f(i).name);
        newF=dir(fileLoc);
        newFpreSize=size(newF);
        newFSize=newFpreSize(1);

        for r=3:1:newFSize

            if(strfind(newF(r).name,'numTrials')>0)

                center=minLoc((i-2)*2);%-window/2;
                if(strcmp(f(i).name,num2str(minLoc((i-2)*2-1)))==0)

                    f(i).name;
                    minLoc((i-2)*2-1);

                end
                trialFile=fopen(strcat(fileLoc,'\',newF(r).name));
                numTrials=fgetl(trialFile);
                fclose(trialFile);
                %numTrials
                parName=strcat(dataBaseLoc,f(i).name,'\par.doc');
                parName
                par=fopen(parName,'w');
                %parName

                fprintf(par,'%u\t%s\t%s\t%s\n%s\t%s\t%s\t%s\n',numDataPointsPerTrial,num2str(numTrials),num2str(center-pointsToEitherSideOfCenter),num2str(center+pointsToEitherSideOfCenter+1),'5','100','2.9','0');
                fclose(par);

            end       

        end
    end
        
end
