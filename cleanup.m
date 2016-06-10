function cleanup()

dataBaseLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Control\';
f=dir(dataBaseLoc);
preNum=size(f);
numFolders=preNum(1);

for i=3:1:numFolders
    
    fileLoc=strcat(dataBaseLoc,f(i).name);
    newF=dir(fileLoc);
    newFpreSize=size(newF);
    newFSize=newFpreSize(1);

    for r=3:1:newFSize

        if(strfind(newF(r).name,'_rawAve')>0)
            
            %movefile(strcat(fileLoc,'\',newF(r).name),strcat(fileLoc,'\',f(i).name,'_rawAve.txt'));

                %strcat(fileLoc,'\',newF(r).name)
                delete(strcat(fileLoc,'\',newF(r).name));
         
        else if (strfind(newF(r).name,'_numTrials')>0)
                
            %movefile(strcat(fileLoc,'\',newF(r).name),strcat(fileLoc,'\',f(i).name,'_numTrials.txt'));
            %strcat(fileLoc,'\',newF(r).name)
            delete(strcat(fileLoc,'\',newF(r).name));
            
            end
            
        end
        
    end
            

end