function convertToSingleColumn()


f=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Comparison\105788\datd.doc');
newf=fopen('K:\PATHS to Success\Manuscripts in Progress\ERN development\data\T1\W1\Comparison\105788\dat.doc','wt');
a= fscanf(f, '%f');

num=size(a);

for i=1:1:num
    
    fprintf(newf,'%s %f %s\n',' ',a(i),' ');
    
end
fclose(f);
fclose(newf);