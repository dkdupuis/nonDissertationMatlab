function genRandoTrials()

tic
origLoc='C:\Users\dud164\Desktop\Test\Originals\';
newLoc='C:\Users\dud164\Desktop\Test\TestFolds\';

f=dir(origLoc);
preNum=size(f);
numFolders=preNum(1);

for i=3:1:numFolders
    
    fileLoc=strcat(origLoc,f(i).name);
    
    newFold=dir(fileLoc);
    newFpreSize=size(newFold);
    newFSize=newFpreSize(1);

    for r=3:1:newFSize

        if(strfind(newFold(r).name,'Fz_100uV.dat')>0)
            
            %name=strcat(f(i).name);
            %fprintf(newF,'%s\t %s\n',name,num2str(numTrials));
            %fclose(trialFile);
            data=fopen(strcat(fileLoc,'\',newFold(r).name));
            fgets(data);
            a= fscanf(data, '%f');
            preNum=size(a);
            numTrials=preNum(1)/819;
            fclose(data);
            
%            for t=1:1:100
%               
%                randoFold=strcat(newLoc,'2\',f(i).name,num2str(t));
%                mkdir(randoFold);
%                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
%                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
%                fprintf(newFz,'%s\n','Fz');
%                
%                k=randperm(numTrials);                
%                
%                for s=1:1:2
%                   
%                    start=819*(k(s)-1);
%                    for c=1:1:819
%                    
%                        fprintf(newFz,'%f\n',a(start+c));
%                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
%                        
%                    end
%                    
%                    
%                end
%                
%                fclose(newFz);
%                fclose(newDatDoc);
%                
%            end
            
            for t=1:1:80
               
                randoFold=strcat(newLoc,'3\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'w');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:3
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:80
               
                randoFold=strcat(newLoc,'4\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:4
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:80
               
                randoFold=strcat(newLoc,'5\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:5
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:80
               
                randoFold=strcat(newLoc,'7\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:7
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:80
               
                randoFold=strcat(newLoc,'10\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:10
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:50
               
                randoFold=strcat(newLoc,'15\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:15
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:50
               
                randoFold=strcat(newLoc,'20\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:20
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:50
               
                randoFold=strcat(newLoc,'25\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:25
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:25
               
                randoFold=strcat(newLoc,'30\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:30
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end
            
            for t=1:1:25
               
                randoFold=strcat(newLoc,'35\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:35
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end

            for t=1:1:10
               
                randoFold=strcat(newLoc,'40\',f(i).name,num2str(t));
                mkdir(randoFold);
                newFz=fopen(strcat(randoFold,'\Fz_100uV.dat'),'wt');
                newDatDoc=fopen(strcat(randoFold,'\dat.doc'),'wt');
                fprintf(newFz,'%s\n','Fz');
                
                k=randperm(numTrials);                
                
                for s=1:1:40
                   
                    start=819*(k(s)-1);
                    for c=1:1:819
                    
                        fprintf(newFz,'%f\n',a(start+c));
                        fprintf(newDatDoc,'%s %f %s\n',' ',a(c),' ');
                        
                    end
                    
                    
                end
                
                fclose(newFz);
                fclose(newDatDoc);
                
                
            end            
            
            

            
        end
        
        
        
        
    end
    toc

    
end
