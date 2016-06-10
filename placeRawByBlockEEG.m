function placeRawByBlockEEG()

rawLoc='C:\Users\dud164\Desktop\byBlockEEGFiles\';
rawFiles=dir(rawLoc);
preNum=size(rawFiles);
numFiles=preNum(1);

folderLoc='K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\';
folders=dir(folderLoc);
preNum=size(folders);
numFolders=preNum(1);


for i=3:1:numFiles
   
    if(rawFiles(i).isdir~=1)
        
        if(length(strfind(rawFiles(i).name,'.vhdr'))>=1)
            temp=fopen([rawLoc rawFiles(i).name]);
            id=fscanf(temp,'%s',15);
            fclose(temp);
            found=0;
            block=-1;

            if(length(strfind(rawFiles(i).name,'A1'))>=1)
                block=0;
            else if(length(strfind(rawFiles(i).name,'B1'))>=1)
                    block=1;
                else if(length(strfind(rawFiles(i).name,'A2'))>=1)
                        block=2;
                    end
                end
            end

            for r=3:1:numFolders

                if(found==0)
                    if(folders(r).isdir==1)

                        subFold=[folderLoc folders(r).name '\'];
                        subFoldFiles=dir(subFold);
                        numSubFoldFiles=length(subFoldFiles);

                        for k=3:1:numSubFoldFiles

                            if(found==0)
                                if(length(strfind(subFoldFiles(k).name,'Fz_100uV.vhdr'))>=1)

                                    temp=fopen([subFold subFoldFiles(k).name]);
                                    foldId=fscanf(temp,'%s',15);
                                    fclose(temp);

                                    if(length(strfind(foldId,id))>=1)

                                        found=1;
                                        
                                        if(block==0)
                                            b=[subFold 'A1'];
                                            mkdir(b);                                            
                                        else if(block==1)
                                                b=[subFold 'B1'];
                                                mkdir(b);                                                
                                            else if(block==2)
                                                    b=[subFold 'A2'];
                                                    mkdir(b);                                                    
                                                end
                                            end
                                        end
                                            
                                        if(block~=-1)
                                            
                                            vhdr=rawFiles(i).name;
                                            txt=strrep(vhdr,'vhdr','txt');
                                            movefile([rawLoc vhdr],[b '\' vhdr]);
                                            movefile([rawLoc txt],[b '\' txt]);                                            
                                            
                                        end
                                    end                           
                                end
                            end
                        end 
                    end
                end
            end
        end
                

    end
end