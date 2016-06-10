function reformatGenOutputByBlock()
%%not Needed


file=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\pre_allSignalMinLoc_inMsByBlock.txt');
newFile=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\Fz\allSignalMinLoc_inMsByBlock.txt','wt');

%fprintf(newFile,'%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n','ID', '#Alligned_1', 'STD_Lags_1', 'Max Shift_1', 'Avg Shift_1', '#Alligned_1', 'STD_Lags_2', 'Max Shift_2', 'Avg Shift_2', '#Alligned_3', 'STD_Lags_3', 'Max Shift_3', 'Avg Shift_3');
fprintf(newFile,'%s\t%s\t%s\t%s\t%s\t%s\t%s\n','ID','MinLoc_1','MinVal_1','MinLoc_2','MinVal_2','MinLoc_3','MinVal_3');
%fgetl(file);
data=textscan(file,'%s');
data=data{1,1};

numLines=length(data)/3;

fullId=data{1,1};

id=str2num([fullId(1) fullId(2) fullId(3) fullId(4) fullId(5) fullId(6)]);
prevId=id;
block=fullId(7);

allign1='';
std1='';
%maxShift1='';
%avgShift1='';
allign2='';
std2='';
%maxShift2='';
%avgShift2='';
allign3='';
std3='';
%maxShift3='';
%avgShift3='';

for i=0:1:numLines-1;
   
    fullId=data{i*3+1,1};
    id=str2num([fullId(1) fullId(2) fullId(3) fullId(4) fullId(5) fullId(6)]);
    block=fullId(7);
    
    if(id~=prevId)
        
        %fprintf(newFile,'%u\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n',prevId,allign1,std1,maxShift1,avgShift1,allign2,std2,maxShift2,avgShift2,allign3,std3,maxShift3,avgShift3);
        fprintf(newFile,'%u\t%s\t%s\t%s\t%s\t%s\t%s\n',prevId,allign1,std1,allign2,std2,allign3,std3);

        prevId=id;
        allign1='';
        std1='';
        %maxShift1='';
        %avgShift1='';
        allign2='';
        std2='';
        %maxShift2='';
       % avgShift2='';
        allign3='';
        std3='';
        %maxShift3='';
        %avgShift3='';

    end 
    
    eval(['allign' block '=data{i*3+2,1};']);
    eval(['std' block '=data{i*3+3,1};']);
   % eval(['maxShift' block '=data{i*5+4,1};']);
    %eval(['avgShift' block '=data{i*5+5,1};']);  
    
end
fprintf(newFile,'%u\t%s\t%s\t%s\t%s\t%s\t%s\n',prevId,allign1,std1,allign2,std2,allign3,std3);
fclose(file);
fclose(newFile);
