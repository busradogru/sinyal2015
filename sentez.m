%% 

    [nota,b,c]=textread('notalar.txt','%s %s %s'); %notalar.txt dosyasý okundu ve içerisindeki her sütun bir deðere atandý.
    oktavdegeri=1; %oktav degeri.
    fs=8192;%örnekleme sayýsý deðiþkene atandý.
    ds=round(fs/100); %durma süresi belirlendi.
    go=round(fs/10); %gecikme süresi belirlendi.

    notalar=zeros(1,fs); %bir dizi oluþturuldu.
    a=zeros(1,length(notalar)); %notalar matrisi boyutlarýnda bir dizi oluþturuldu.
    durak=zeros(1,ds); %durma süresi boyutunda bir dizi oluþturuldu.
    oktav=str2num(cell2mat(b)); %deðiþkenler double deðere dönüþtürüldü.
  %%

for i=1:(length(nota)) %oluþturulan döngü nota dizisi boyu kadar. 
       vurus((i),1)=str2num(cell2mat(c(i,1))); %dosyadan cell olarak okunan deðiþkenler double deðere dönüþtürüldü.
       frekans((i),1)=frek(nota((i),1),oktav((i),1),oktavdegeri); %önceden oluþturulmuþ frek fonsiyonu çaðrýldý.
       [x,t]=note(frekans((i),1),vurus((i),1)); %daha önceden olýþturulmuþ note fonksiyonu çaðýrýldý.
       notalar=[notalar durak x]; %durak dizisi de eklenerek note fonksiyonunun döndürdüðü sinyal deðeriyle birleþtirildi.
end           
   plot(notalar)
   title('Zarflanan nota sinyalleri duraklama süresi ile birlikte peþpeþe eklendi')
 %%
   notalarecho=zeros(1,(length(notalar))); %notalar matrisi boyutlarýnda sýfýrdan olusan bir dizi oluþturuldu
 for i=1:(length(notalar)) %döngü notalar dizisi boyu kadar oluþturuldu.    
     f=(go+i); %gerekli olan gecikme süresi döngüye sokuldu.
     if f<(length(notalar)) %gecikme süresi notalar matrisinin boyutunu geçmesin diye þart saðlandý
     notalarecho(i)=notalar(i)*0.3+notalar(f); %notalar matrisinin herbir deðerinin %30'u alýnýp geçikme süresi kadar kaydýrýlmýþtýr
     else 
      notalarecho(i)=notalar(i)*0.3+0;
     end
    
 end 
 plot(notalarecho)
     title('Echolanan Nota Sinyalleri')

  normalizenotalarecho=zeros(1,(length(notalar)));%deðiþken tanýmlanmýþtýr
  normalizenotalarecho=notalarecho/max(abs(notalarecho));%tepe deðerleri 1'e normalize edilmiþtir.

  sound(normalizenotalarecho) %sinyal çaldýrýlýyor.
    plot(normalizenotalarecho)
    title('Nomalize Edilmiþ Nota Sinyalleri')

    