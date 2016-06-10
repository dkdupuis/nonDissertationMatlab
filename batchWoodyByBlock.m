function batchWoodyByBlock()
dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz';
fileType='.txt';
fileTypeB='Fz';
numDataPointsPerTrial=819;
startPoint=410;
endPoint=461;

formatInputByBlock(dataBaseLoc,fileType,fileTypeB);%can be commented out most likely
generateAvgByBlock(dataBaseLoc, fileType,fileTypeB,numDataPointsPerTrial);%can be commented out most likely
outputMinLocFromRawByBlock(dataBaseLoc, startPoint, endPoint);%can be commented out most likely
generateParameterFilesByBlock(dataBaseLoc,numDataPointsPerTrial);%can be commented out most likely

runLoc='C:\Users\dud164\Documents\MATLAB\Woody\';
par=strcat(runLoc,'par.doc');
dat=strcat(runLoc,'dat.doc');
wout=strcat(runLoc,'wout.doc');

f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);


for i=3:1:numFolders
    
    if(f(i).isdir==1)
       
        f(i).name
        
        if(isdir([dataBaseLoc '\' f(i).name '\A1']))

            prepar=strcat(dataBaseLoc,'\',f(i).name,'\A1\par.doc');
            predat=strcat(dataBaseLoc,'\',f(i).name,'\A1\dat.doc');
            prewout=strcat(dataBaseLoc,'\',f(i).name,'\A1\wout.doc');

            movefile(prepar,par,'f');
            movefile(predat,dat,'f');
            system('woody2.exe');
            movefile(dat,predat,'f');
            movefile(par,prepar,'f');
            movefile(wout,prewout,'f');
            
        end
        
        if(isdir([dataBaseLoc '\' f(i).name '\B1']))

            prepar=strcat(dataBaseLoc,'\',f(i).name,'\B1\par.doc');
            predat=strcat(dataBaseLoc,'\',f(i).name,'\B1\dat.doc');
            prewout=strcat(dataBaseLoc,'\',f(i).name,'\B1\wout.doc');

            movefile(prepar,par,'f');
            movefile(predat,dat,'f');
            system('woody2.exe');
            movefile(dat,predat,'f');
            movefile(par,prepar,'f');
            movefile(wout,prewout,'f');
            
        end
        
        if(isdir([dataBaseLoc '\' f(i).name '\A2']))

            prepar=strcat(dataBaseLoc,'\',f(i).name,'\A2\par.doc');
            predat=strcat(dataBaseLoc,'\',f(i).name,'\A2\dat.doc');
            prewout=strcat(dataBaseLoc,'\',f(i).name,'\A2\wout.doc');

            movefile(prepar,par,'f');
            movefile(predat,dat,'f');
            system('woody2.exe');
            movefile(dat,predat,'f');
            movefile(par,prepar,'f');
            movefile(wout,prewout,'f');
            
        end
        
    end
  
end

reGenerateParFilesByBlock(dataBaseLoc);

for i=3:1:numFolders
    
    if(f(i).isdir==1)
       
        f(i).name
        
        if(isdir([dataBaseLoc '\' f(i).name '\A1']))

            prepar=strcat(dataBaseLoc,'\',f(i).name,'\A1\par.doc');
            predat=strcat(dataBaseLoc,'\',f(i).name,'\A1\dat.doc');
            prewout=strcat(dataBaseLoc,'\',f(i).name,'\A1\wout.doc');

            movefile(prepar,par,'f');
            movefile(predat,dat,'f');
            system('woody2.exe');
            movefile(dat,predat,'f');
            movefile(par,prepar,'f');
            movefile(wout,prewout,'f');
            
        end
        
        if(isdir([dataBaseLoc '\' f(i).name '\B1']))

            prepar=strcat(dataBaseLoc,'\',f(i).name,'\B1\par.doc');
            predat=strcat(dataBaseLoc,'\',f(i).name,'\B1\dat.doc');
            prewout=strcat(dataBaseLoc,'\',f(i).name,'\B1\wout.doc');

            movefile(prepar,par,'f');
            movefile(predat,dat,'f');
            system('woody2.exe');
            movefile(dat,predat,'f');
            movefile(par,prepar,'f');
            movefile(wout,prewout,'f');
            
        end
        
        if(isdir([dataBaseLoc '\' f(i).name '\A2']))

            prepar=strcat(dataBaseLoc,'\',f(i).name,'\A2\par.doc');
            predat=strcat(dataBaseLoc,'\',f(i).name,'\A2\dat.doc');
            prewout=strcat(dataBaseLoc,'\',f(i).name,'\A2\wout.doc');

            movefile(prepar,par,'f');
            movefile(predat,dat,'f');
            system('woody2.exe');
            movefile(dat,predat,'f');
            movefile(par,prepar,'f');
            movefile(wout,prewout,'f');
            
        end
        
    end
  
end

formatOutputByBlock(dataBaseLoc);
outputMinLocFromSignalByBlock(dataBaseLoc);
exportLagsByBlock(dataBaseLoc);