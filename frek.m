function ff=frek(nota,oktav)
notalar=['A' 'a' 'B' 'b'];
referans=16.35;
p=length(notalar);

for okt=0:8
    if okt==oktav
        
for j=1:p
    if nota==char(notalar(j)) 
        ff=2^okt*(2^((j-1)/12)*referans);
    end
end

    end
end
end