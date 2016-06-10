function reGenerateParFilesByBlock(fileLoc)

lagLimit=20; %in datapoints; 1 datapoint=1.95 ms

dataBaseLoc=strcat(fileLoc,'\');
folders=dir(dataBaseLoc);
preNum=size(folders);
numFolders=preNum(1);

for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(dataBaseLoc,folders(i).name,'\A1\')
        
        if(isdir(subFold)==1)

            oldPar=fopen(strcat(dataBaseLoc,folders(i).name,'\A1\par.doc'));
            a= fscanf(oldPar, '%f');
            fclose(oldPar);
            folders(i)
            Ntimes=a(1);
            Ntrials=a(2);
            InitialTime=a(3);
            FinalTime=a(4);
            MaxLag=a(5);

            Tresh1=a(7);
            Tresh2=a(8);


            sigLength=ceil((FinalTime-InitialTime+1)/5);
            %sigLength
            wout=fopen(strcat(dataBaseLoc,folders(i).name,'\A1\wout.doc'));
            trialNum = fgetl(wout);
            preSize=size(strfind(trialNum,'active'));
            fgetl(wout);%space after iteration#
            lagLimitReached=0;
            %folders(i).name
            while(preSize(1)==0 && lagLimitReached==0)

                for r=1:1:Ntrials

                    d=fscanf(wout,'%d',2);
                    %abs(d(2))
                    %abs(d(2))>6
                    %d
                    if ( abs(d(2))>lagLimit )
                        lagLimitReached=1;
                        folders(i).name;
                        %trialNum
                    end

                end

                if(lagLimitReached==0)
                    Niterations=str2num(trialNum);
                end

                for r=1:1:4+sigLength+1
                    fgetl(wout);
                end

                trialNum = fgetl(wout);
                preSize=size(strfind(trialNum,'active'));
 
            end  

            fclose(wout);

            newPar=fopen(strcat(dataBaseLoc,folders(i).name,'\A1\par.doc'),'w');
            fprintf(newPar,'%f\t %f\t %f\t %f\n %f\t %f\t %f\t %f\n',Ntimes,Ntrials,InitialTime,FinalTime,MaxLag,Niterations,Tresh1,Tresh2);
            fclose(newPar);
        
        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\B1\');
        
        if(isdir(subFold)==1)

            oldPar=fopen(strcat(dataBaseLoc,folders(i).name,'\B1\par.doc'));
            a= fscanf(oldPar, '%f');
            fclose(oldPar);
            folders(i)
            Ntimes=a(1);
            Ntrials=a(2);
            InitialTime=a(3);
            FinalTime=a(4);
            MaxLag=a(5);

            Tresh1=a(7);
            Tresh2=a(8);


            sigLength=ceil((FinalTime-InitialTime+1)/5);
            %sigLength
            wout=fopen(strcat(dataBaseLoc,folders(i).name,'\B1\wout.doc'));
            trialNum = fgetl(wout);
            preSize=size(strfind(trialNum,'active'));
            fgetl(wout);%space after iteration#
            lagLimitReached=0;
            %folders(i).name
            while(preSize(1)==0 && lagLimitReached==0)

                for r=1:1:Ntrials

                    d=fscanf(wout,'%d',2);
                    %abs(d(2))
                    %abs(d(2))>6
                    %d
                    if ( abs(d(2))>lagLimit )
                        lagLimitReached=1;
                        folders(i).name;
                        %trialNum
                    end

                end

                if(lagLimitReached==0)
                    Niterations=str2num(trialNum);
                end

                for r=1:1:4+sigLength+1
                    fgetl(wout);
                end

                trialNum = fgetl(wout);
                preSize=size(strfind(trialNum,'active'));

            end  

            fclose(wout);

            newPar=fopen(strcat(dataBaseLoc,folders(i).name,'\B1\par.doc'),'w');
            fprintf(newPar,'%f\t %f\t %f\t %f\n %f\t %f\t %f\t %f\n',Ntimes,Ntrials,InitialTime,FinalTime,MaxLag,Niterations,Tresh1,Tresh2);
            fclose(newPar);            

        end
        
        subFold=strcat(dataBaseLoc,folders(i).name,'\A2\');
        
        if(isdir(subFold)==1)

            oldPar=fopen(strcat(dataBaseLoc,folders(i).name,'\A2\par.doc'));
            a= fscanf(oldPar, '%f');
            fclose(oldPar);
            folders(i)
            Ntimes=a(1);
            Ntrials=a(2);
            InitialTime=a(3);
            FinalTime=a(4);
            MaxLag=a(5);

            Tresh1=a(7);
            Tresh2=a(8);


            sigLength=ceil((FinalTime-InitialTime+1)/5);
            %sigLength
            wout=fopen(strcat(dataBaseLoc,folders(i).name,'\A2\wout.doc'));
            trialNum = fgetl(wout);
            preSize=size(strfind(trialNum,'active'));
            fgetl(wout);%space after iteration#
            lagLimitReached=0;
            %folders(i).name
            while(preSize(1)==0 && lagLimitReached==0)

                for r=1:1:Ntrials

                    d=fscanf(wout,'%d',2);
                    %abs(d(2))
                    %abs(d(2))>6
                    %d
                    if ( abs(d(2))>lagLimit )
                        lagLimitReached=1;
                        folders(i).name;
                        %trialNum
                    end

                end

                if(lagLimitReached==0)
                    Niterations=str2num(trialNum);
                end

                for r=1:1:4+sigLength+1
                    fgetl(wout);
                end

                trialNum = fgetl(wout);
                preSize=size(strfind(trialNum,'active'));

            end  

            fclose(wout);

            newPar=fopen(strcat(dataBaseLoc,folders(i).name,'\A2\par.doc'),'w');
            fprintf(newPar,'%f\t %f\t %f\t %f\n %f\t %f\t %f\t %f\n',Ntimes,Ntrials,InitialTime,FinalTime,MaxLag,Niterations,Tresh1,Tresh2);
            fclose(newPar);            

        end
    end
end