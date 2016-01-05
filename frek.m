%% Fonksiyon tanýmý
function ff=frek(nota,oktav) %girilen nota ve oktav degerine gore frekansi hesaplayan fonksiyon tanimi
%% Deger atamalarý
notalar={'do' 'dod' 're' 'red' 'mi' 'fa' 'fad' 'sol' 'sold' 'la' 'lad' 'si' 'sus'};%Lad=La#,Sib;Dod=Do#,Reb;Red=Re#,Mib;Fad=Fa#,Solb;Sold=Sol#,Lab
referans=16.35;    %referans degeri atandý.
p=length(notalar); %notalar dizisinin eleman sayisi 
%% Oktav degerinin girilmemesi durumu
if nargin<2        %girilen arguman sayýsýnýn 2'den az olma durumu(oktav degeri girilmemis ise).
    oktav=4;       %oktav'a 4 degerini ata.
end
%% Frekans degerinin hesaplanmasý
for okt=0:8 %okt(oktav) degerini 0'dan 8(dahil)'e kadar artýrma islemi
    if okt==oktav  %girilen oktav degerinin okt degeriyle esitlenmesi halinde
        for j=1:p  %++dizi eleman indisinin artýrýmý    
            if size(nota)==size(notalar{j}) %girilen ile dizideki notalarin uzunluklari esit ise
                if nota==notalar{j}         %++girilen notanin dizideki karsiliginin(indisinin) bulunmasi 
                    if j==p                 %++bulunan nota 'sus' ise 
                        ff=0;               %++frekansý degerini 0 ata.
                    else                    %'sus' dýsýndaki notalar icin
                        ff=2^okt*(2^((j-1)/12)*referans); %++oktav ve nota indisine bagli olarak
                    end                                   %++frekansi hesaplayan formul
                end                                   
            end    
        end
    end
end
end