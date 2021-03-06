%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:
% Enginoğlu, S., Memiş, S., Karaaslan, F., 2019. A New Approach to Group 
% Decision-Making Method Based on TOPSIS Under Fuzzy Soft Environment.  
% Journal of New Results in Science, 8(2), 42-52.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abbreviation of Journal Title: J. New Results Sci.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://dergipark.org.tr/tr/pub/jnrs/issue/51087/656500
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://www.researchgate.net/profile/Serdar_Enginoglu2
% https://www.researchgate.net/profile/Samet_Memis2
% https://www.researchgate.net/profile/Faruk-Karaaslan-2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Demo: 
% clc;
% clear all;
% % at are the fpfs-matrices
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% at=rand(5,4,3);
% [s,dm,op]=EMK19(at);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=EMK19(at)
%% Step 1
[m,n,t]=size(at);
%% Step 2
    for i=1:m
        for j=1:n
            b(i,j)=sum(at(i,j,:))/t;
        end
    end
%% Step 3
    for i=2:m
        for j=1:n
            c(i-1,j)=b(1,j)*b(i,j);
        end
    end
%% Step 4
    for j=1:n
        cp(1,j)=max(c(:,j));
        cn(1,j)=min(c(:,j));
    end
%% Step 5
    for i=1:m-1
        sp(i,1)=sqrt(sum((c(i,:)-cp(1,:)).^2));
        sn(i,1)=sqrt(sum((c(i,:)-cn(1,:)).^2));
    end
%% Step 6
    for i=1:m-1
        s(i,1)=sn(i,1)/(sp(i,1)+sn(i,1));
    end
%% Step 7
dm(:,1)=normalise(s);
count=1;
    for i=1:m-1
        if(s(i)==max(s))
            op(count)=i;
            count=count+1;
        end
    end
end

function na=normalise(a)
[m,n]=size(a);
    if m==1 || n==1
        if max(a)~=min(a)
            na=(a-min(a))/(max(a)-min(a));
        else
            na=ones(m,n);
        end
    end
end
