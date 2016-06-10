function genFilteredFullAverage()

postERN=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\postERN_Fz.txt','wt');
minLocFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc.txt');

%minLocFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\Fz_allMinLoc.txt');
minLocRaw=fscanf(minLocFile,'%u');
fclose(minLocFile);

startTime=1;
endTime=819;

dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);

numDataPoints=819;
timeConver=1.953125;
iniTime=-800;

for i=3:1:numFolders
    
    if(f(i).isdir==1)

        fileLoc=strcat(dataBaseLoc,f(i).name);
        %newF=dir(fileLoc);
       % newFpreSize=size(newF);
        %newFSize=newFpreSize(1);
        
        %for r=3:1:newFSize
           
            %if(strfind(newF(r).name,fileExtenstion)>0)

            datFile=fopen(strcat(fileLoc,'\dat.doc'));
            lagFile=fopen(strcat(fileLoc,'\woodyLags.txt'));
            numTrialFile=fopen(strcat(fileLoc,'\',f(i).name,'_numTrials.txt'));
            %strcat(fileLoc,f(i).name,'\_numTrials.txt')
            numTrials=str2num(fgetl(numTrialFile));
            fclose(numTrialFile);

            aa= fscanf(lagFile, '%f');
            fclose(lagFile);

            preSize=size(aa);
            len=preSize(1)/2;
            lags=zeros(numTrials,2);
            temp=1;
            for k=1:1:numTrials

                if(temp<=len && aa((temp-1)*2+1)==k)  

                    lags(k,1)=aa((temp-1)*2+1); %%%
                    lags(k,2)=aa((temp-1)*2+2);
                    temp=temp+1;
                end

            end

            dat= fscanf(datFile, '%f');
            fclose(datFile);
            lagTrials=zeros(numDataPoints);
            
            keptTrials=0;
            for c=1:1:numTrials
                temp=(c-1)*819;
                hasLag=lags(c,1);
                lag=lags(c,2);

                if(hasLag~=0)

                    keptTrials=keptTrials+1;
                    for r=1:1:819

                        if( r-lag>=1 && r-lag<=819 )

                            %lagTrials(r-lag,c)=a(temp+r);
                            lagTrials(r-lag)=lagTrials(r-lag)+dat(temp+r);

                        end
                    end
                end
            end

            
            filAvg=fopen(strcat(fileLoc,'\filteredAvg.txt'),'wt');
            for r=1:1:819
                fprintf(filAvg,'%f\n',lagTrials(r)/keptTrials);
            end
            fclose(filAvg);
            f(i).name
            %tempRaw=lagTrials(410);
            %rawLoc=410;
            %for c=410:1:461
                %f(i).name
                %araw(c);
                %awoody(c);
                %if(awoody(c)<tempWoody)
                %    tempWoody=awoody(c);
                %end
            %    if(lagTrials(c)<tempRaw)
            %        tempRaw=lagTrials(c);
            %        rawLoc=c;
            %    end
            %end
            
            rawLoc=minLocRaw((i-2)*2);
            %'ssss';
            %lagTrials(rawLoc-1);
            %lagTrials(rawLoc);
            %lagTrials(rawLoc+1);
            fprintf(postERN,'%s\t %d\t %f\t %f\t %f\t %f\n',f(i).name,round(-800.78125+1.953125*rawLoc),lagTrials(rawLoc)/keptTrials-(lagTrials(rawLoc-26)/keptTrials+lagTrials(rawLoc+26)/keptTrials)/2,lagTrials(rawLoc)/keptTrials,lagTrials(rawLoc-26)/keptTrials,lagTrials(rawLoc+26)/keptTrials);


%            sum=zeros(819,1);
%            fgets(data);
%            a= fscanf(data, '%f');
%            preNum=size(a);
%            numTrials=preNum(1)/819;
%            if(floor(numTrials)==numTrials&&numTrials>0)                
%                for n=1:1:numTrials
%                    offset=819*(n-1);
%                    for c=1:1:819
%                        sum(c)=sum(c)+a(offset+c);
%                    end
%                end

 %               for c=startTime:1:endTime
 %                   fprintf(avg,'%f\n',sum(c)/numTrials);
 %               end
 %               fprintf(exportNumTrials,'%u\n',numTrials);%

%            else
%                newF(r).name
%            end
%            fclose(filtAvg);
%            fclose(data);
                
            %end
            
        %end
        

        
        
    end
    
end

fclose(postERN);