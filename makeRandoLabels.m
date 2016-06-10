function makeRandoLabels()

origLoc='C:\Users\dud164\Desktop\Woody\Test\Originals\';
newLoc='C:\Users\dud164\Desktop\Test\TestFolds\';

f=dir(origLoc);
preNum=size(f);
numFolders=preNum(1);

eightyFile=fopen('C:\Users\dud164\Desktop\Woody\Test\list80.txt','wt');
fifteyFile=fopen('C:\Users\dud164\Desktop\Woody\Test\list50.txt','wt');
twentyFiveFile=fopen('C:\Users\dud164\Desktop\Woody\Test\list25.txt','wt');
tenFile=fopen('C:\Users\dud164\Desktop\Woody\Test\list10.txt','wt');


for i=3:1:numFolders
    
    fileLoc=strcat(origLoc,f(i).name);
    
    newFold=dir(fileLoc);
    newFpreSize=size(newFold);
    newFSize=newFpreSize(1);
    
    
    for r=1:1:80
        
       fprintf(eightyFile, '%s\n',f(i).name);
        
    end
    for r=1:1:50

        fprintf(fifteyFile, '%s\n',f(i).name);

    end
    for r=1:1:25

        fprintf(twentyFiveFile, '%s\n',f(i).name);

    end
    for r=1:1:10

        fprintf(tenFile, '%s\n',f(i).name);

    end
    
end
fclose('all');