function batchWoody()

numDataPointsPerTrial=819;
startPoint=410;         %n170=169;
endPoint=461;           %n170=256;

dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz';%'K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz';
fileType='AR_Fz_100uV.dat';
formatInput(dataBaseLoc,fileType);%can be commented out most likely
generateAvg(dataBaseLoc, fileType, numDataPointsPerTrial);%can be commented out most likely
outputMinLocFromRaw(dataBaseLoc, startPoint, endPoint);%can be commented out most likely
generateParameterFiles(dataBaseLoc,numDataPointsPerTrial);%can be commented out most likely

runLoc='C:\Users\dud164\Documents\MATLAB\Woody\';
par=strcat(runLoc,'par.doc');
dat=strcat(runLoc,'dat.doc');
wout=strcat(runLoc,'wout.doc');

f=dir(dataBaseLoc);
numFolders=length(f);


for i=3:1:numFolders
    
    if(f(i).isdir==1)
       
        f(i).name
        prepar=strcat(dataBaseLoc,'\',f(i).name,'\par.doc');
        predat=strcat(dataBaseLoc,'\',f(i).name,'\dat.doc');
        prewout=strcat(dataBaseLoc,'\',f(i).name,'\wout.doc');
        
        movefile(prepar,par,'f');
        movefile(predat,dat,'f');
        system('woody2.exe');
        movefile(dat,predat,'f');
        movefile(par,prepar,'f');
        movefile(wout,prewout,'f');
        
    end   
end

reGenerateParFiles(dataBaseLoc);

for i=3:1:numFolders
    
    if(f(i).isdir==1)
       
        f(i).name
        prepar=strcat(dataBaseLoc,'\',f(i).name,'\par.doc');
        predat=strcat(dataBaseLoc,'\',f(i).name,'\dat.doc');
        prewout=strcat(dataBaseLoc,'\',f(i).name,'\wout.doc');
        
        movefile(prepar,par,'f');
        movefile(predat,dat,'f');
        system('woody2.exe');
        movefile(dat,predat,'f');
        movefile(par,prepar,'f');
        movefile(wout,prewout,'f');
        
    end
%clock    
end

formatOutput(dataBaseLoc);
outputMinLocFromSignal(dataBaseLoc);
getNumTrialsAll(dataBaseLoc);
exportLags(dataBaseLoc);