function ff=frek(nota,oktav) 
notalar={'Do','Dod', 'Re', 'Mib' ,'Mi' ,'Fa', 'Fad', 'Sol', 'Sold', 'La', 'Sib', 'Si','sus'};
referans=16.35;  
k=length(notalar); 
if nargin<2
     oktav=4;
end
for i=0:8 
    if i==oktav 
       for j=1:k 
           if  size(nota)==size(notalar{j})
              if nota==notalar{j}
                  ff=2^i*(2^((j-1)/12)*referans);
              
              end 
           end
       end
     end
end
end