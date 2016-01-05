%% 

    [nota,b,c]=textread('notalar.txt','%s %s %s'); %notalar.txt dosyas� okundu ve i�erisindeki her s�tun bir de�ere atand�.
    oktavdegeri=1; %oktav degeri.
    fs=8192;%�rnekleme say�s� de�i�kene atand�.
    ds=round(fs/100); %durma s�resi belirlendi.
    go=round(fs/10); %gecikme s�resi belirlendi.

    notalar=zeros(1,fs); %bir dizi olu�turuldu.
    a=zeros(1,length(notalar)); %notalar matrisi boyutlar�nda bir dizi olu�turuldu.
    durak=zeros(1,ds); %durma s�resi boyutunda bir dizi olu�turuldu.
    oktav=str2num(cell2mat(b)); %de�i�kenler double de�ere d�n��t�r�ld�.
  %%

for i=1:(length(nota)) %olu�turulan d�ng� nota dizisi boyu kadar. 
       vurus((i),1)=str2num(cell2mat(c(i,1))); %dosyadan cell olarak okunan de�i�kenler double de�ere d�n��t�r�ld�.
       frekans((i),1)=frek(nota((i),1),oktav((i),1),oktavdegeri); %�nceden olu�turulmu� frek fonsiyonu �a�r�ld�.
       [x,t]=note(frekans((i),1),vurus((i),1)); %daha �nceden ol��turulmu� note fonksiyonu �a��r�ld�.
       notalar=[notalar durak x]; %durak dizisi de eklenerek note fonksiyonunun d�nd�rd��� sinyal de�eriyle birle�tirildi.
end           
   plot(notalar)
   title('Zarflanan nota sinyalleri duraklama s�resi ile birlikte pe�pe�e eklendi')
 %%
   notalarecho=zeros(1,(length(notalar))); %notalar matrisi boyutlar�nda s�f�rdan olusan bir dizi olu�turuldu
 for i=1:(length(notalar)) %d�ng� notalar dizisi boyu kadar olu�turuldu.    
     f=(go+i); %gerekli olan gecikme s�resi d�ng�ye sokuldu.
     if f<(length(notalar)) %gecikme s�resi notalar matrisinin boyutunu ge�mesin diye �art sa�land�
     notalarecho(i)=notalar(i)*0.3+notalar(f); %notalar matrisinin herbir de�erinin %30'u al�n�p ge�ikme s�resi kadar kayd�r�lm��t�r
     else 
      notalarecho(i)=notalar(i)*0.3+0;
     end
    
 end 
 plot(notalarecho)
     title('Echolanan Nota Sinyalleri')

  normalizenotalarecho=zeros(1,(length(notalar)));%de�i�ken tan�mlanm��t�r
  normalizenotalarecho=notalarecho/max(abs(notalarecho));%tepe de�erleri 1'e normalize edilmi�tir.

  sound(normalizenotalarecho) %sinyal �ald�r�l�yor.
    plot(normalizenotalarecho)
    title('Nomalize Edilmi� Nota Sinyalleri')

    