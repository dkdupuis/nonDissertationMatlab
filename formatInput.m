function formatInput(fileLoc,fileType)

%f=fopen('C:\Users\dud164\Documents\MATLAB\File_io\test.txt');
%newf=fopen('C:\Users\dud164\Documents\MATLAB\File_io\newtest.doc','w');

%a= fscanf(f, '%f');

%num=size(a);

%for i=1:1:num
    
%    fprintf(newf,'%s %f %s\n',' ',a(i),' ');
    
%end



%fclose(f);
%fclose(newf);

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
            %newFolder(r).name
            %strfind(newFolder(r).name,'.1w1')
            
            if (strfind(newFolder(r).name,fileType)>0)
                %w=size(strfind(newFolder(r).name,'Fz_100uV.dat'));
                
                %if (w(1)==0)
                    newFolder(r).name
                    f=fopen(strcat(subFold,'\',newFolder(r).name));
                    newDataName=strcat(subFold,'\','dat.doc');
                    newf=fopen(newDataName,'w');%'C:\Users\dud164\Documents\MATLAB\File_io\newtest.doc','w');


                    fgets(f);%cuz of channel name at beginning
                    a= fscanf(f, '%f');
                    num=length(a);
                                        %num
     %done in generateAvg               %numTrials=fopen(strcat(subFold,'\',folders(i).name,'_numTrials.txt'),'wt');
                                        %fprintf(numTrials,'%u\n',num/819);
                                        %fclose(numTrials);
                    
                    for c=1:1:num

                        fprintf(newf,'%s %f %s\n',' ',a(c),' ');

                    end
                    fclose(newf);
                    fclose(f);
                
                %end

            end
        end
        %subFold
        
        
        
        
        
        
        

        
        
    end
    
    
end

