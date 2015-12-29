Fs=8192;
duraklama=Fs*(1/100);

t=struct('line',{});
fid=fopen('notalar.txt');
i=1;
 satir=fgets(fid); %sat?r sat?r okuyor
while ischar(satir) %sat?rda karakter varsa
% if ischar(satir)~=','
    t(i).line=satir;
 satir=fgets(fid);
i=i+1;
end
% end
fclose(fid);
for i=1:length(t)
    disp(t(i).line)
    
% f=frek(nota,oktav) 
end