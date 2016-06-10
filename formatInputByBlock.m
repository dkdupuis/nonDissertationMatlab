function formatInputByBlock(fileLoc,fileTypeA,fileTypeB)


parDir=strcat(fileLoc,'\');
folders=dir(parDir);
t=size(folders);
numFolders=t(1);



for i=3:1:numFolders
    
    if(folders(i).isdir==1)
       
        subFold=strcat(parDir,folders(i).name,'\A1\')
        
        if(isdir(subFold)==1)
        
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (strfind(newFolder(r).name,fileTypeA)>0)
                    if((strfind(newFolder(r).name,fileTypeB)>0))

                        %newFolder(r).name
                        f=fopen(strcat(subFold,'\',newFolder(r).name));
                        newDataName=strcat(subFold,'\','dat.doc');
                        newf=fopen(newDataName,'w');%'C:\Users\dud164\Documents\MATLAB\File_io\newtest.doc','w');


                        fgets(f);%cuz of channel name at beginning
                        a= fscanf(f, '%f');
                        num=length(a);

                        for c=1:1:num

                            fprintf(newf,'%s %f %s\n',' ',a(c),' ');

                        end
                        fclose(newf);
                        fclose(f);
                    end

                end
            end
        end
        
        subFold=strcat(parDir,folders(i).name,'\B1\');
        
        if(isdir(subFold)==1)
        
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (strfind(newFolder(r).name,fileTypeA)>0)
                    if((strfind(newFolder(r).name,fileTypeB)>0))
                        
                        %newFolder(r).name
                        f=fopen(strcat(subFold,'\',newFolder(r).name));
                        newDataName=strcat(subFold,'\','dat.doc');
                        newf=fopen(newDataName,'w');%'C:\Users\dud164\Documents\MATLAB\File_io\newtest.doc','w');


                        fgets(f);%cuz of channel name at beginning
                        a= fscanf(f, '%f');
                        num=length(a);

                        for c=1:1:num

                            fprintf(newf,'%s %f %s\n',' ',a(c),' ');

                        end
                        fclose(newf);
                        fclose(f);
                        
                    end
                end
            end
        end
        
        subFold=strcat(parDir,folders(i).name,'\A2\');
        
        if(isdir(subFold)==1)
        
            newFolder=dir(subFold);
            newFpreSize=size(newFolder);
            newFSize=newFpreSize(1); 

            for r=3:1:newFSize

                if (strfind(newFolder(r).name,fileTypeA)>0)
                    if((strfind(newFolder(r).name,fileTypeB)>0))

                        %newFolder(r).name
                        f=fopen(strcat(subFold,'\',newFolder(r).name));
                        newDataName=strcat(subFold,'\','dat.doc');
                        newf=fopen(newDataName,'w');%'C:\Users\dud164\Documents\MATLAB\File_io\newtest.doc','w');


                        fgets(f);%cuz of channel name at beginning
                        a= fscanf(f, '%f');
                        num=length(a);

                        for c=1:1:num

                            fprintf(newf,'%s %f %s\n',' ',a(c),' ');

                        end
                        fclose(newf);
                        fclose(f);

                    end
                end
            end
        end
    end
end