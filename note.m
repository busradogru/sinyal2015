function [xx,tt]=note(frekans,vurus) 
Fs=8192;
tt=0:1/Fs:((0.25-(1/Fs))/2); 
zz=0;
   xx=sin(2*pi*frekans*tt); 
if length(xx)==length(zz)    
       zz=[linspace(0,1.5,Fs*vurus*(2/8)),linspace(1.5,1,Fs*vurus*(1/8)),linspace(1,1,Fs*vurus*(4/8)),linspace(1,0,Fs*vurus*(1/8))];
end
end