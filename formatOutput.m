function formatOutput(fileLoc)

numDataPoints=52;
%parDir='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
parDir=strcat(fileLoc,'\');
folders=dir(parDir);
t=size(folders);
numFolders=t(1);


for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(parDir,folders(i).name);
        newFolder=dir(subFold);
        newFpreSize=size(newFolder);
        newFSize=newFpreSize(1);
 
        for r=3:1:newFSize
            
            %if (strfind(newFolder(r).name,'wout.doc')>0)
                    %newFolder(r).name
                    
            f=fopen(strcat(subFold,'\wout.doc'));
            
            input=fgetl(f);
            w=size(strfind(input,'active'));
            
            while(w(1)==0)
                input=fgetl(f);
                w=size(strfind(input,'active'));
            end
                
            
            if(f>0)
                
                %fgetl(f);%remove 'active set' heading
                input=fgetl(f);
                w=size(input);
                numTrials=0;
                lags=[];
                %input
                while(w(1)~=0)
                    %input
                    %size(input)
                    numTrials=numTrials+1;
                    temp=[str2num(input) 0];
                    lags=vertcat(lags,temp);
                    input=fgetl(f);
                    w=size(input);                       

                end
                    %folders(i).name
                    %lags
                    %input
                    %folders(i).name
                %if(strcmp('',input)==0)
                %    fgetl(f);
                %end
                %preLags=fscanf(f,'%f',numTrials*2);
                
                fgetl(f);
                fgetl(f);
                %input
                index=1;
                d=fscanf(f,'%d',2);
                preSize=size(d);
                while(preSize(1)~=0)
                    
                    if(index<=numTrials && d(1,1)==lags(index,1))
                        
                        lags(index,2)=d(2,1);
                        index=index+1;
                        
                    end

                    d=fscanf(f,'%d',2);
                    preSize=size(d);
                    
                end
                
                %index
                %preSize=size(lags);
                %preSize(1);
                
                fgetl(f);%remove 'woody filtered signal' heading
                fgetl(f);%remove blank line

                signal=fscanf(f,'%f',numDataPoints);
                %signal
                newSignal=fopen(strcat(subFold,'\woodySignal.txt'),'wt');
                
               % size(signal);
                %numDataPoints;
                %numTrials
                %lags
                %folders(i).name;
                for d=1:1:numDataPoints
                    fprintf(newSignal,'%f\n',signal(d));
                end
                
                newLags=fopen(strcat(subFold,'\woodyLags.txt'),'wt');

                for d=1:1:numTrials

                    fprintf(newLags,'%d\t %d\n',lags(d,1),lags(d,2));

                end

                fclose(newSignal);
                fclose(f);
                fclose(newLags);
                
            end
        end
    end
end