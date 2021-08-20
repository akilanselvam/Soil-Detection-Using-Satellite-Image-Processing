%....     
clear all
close all
clc                                                                                            
x=imread('Ionian_Sea_satellite_picture.jpg');
%x=imread('paperimage2.jpg');
x1=x(:);   %The whole image matrix is converted a coumn vector
[m n]=size(x);                                   %Gives no of rows and columns x-image
[cnt1,aaa]=size(x1(:));                          %Gives no of rows and columns of x1
%............
h=zeros(1,256);                                  %H is the hostogram matrix %Creates a matrix of zeros for given dimension(A new matrix is being initialized)
for i=1:256
    for j=1:m
        for k=1:n
            if((i-1)==x(j,k))    %If the pixel intensity gets equal to the the intensityh value in 1 to 256 then 
                h(1,i)=h(1,i)+1;  %We will get the count of all the intensity values for making histogram 
            end
        end
    end
end
%...........
p=h/(cnt1*aaa);  %Here we are dividng the count of all the histogram frequency values for each pixel stored in the array h with total no of terms 
a=0:255;         %1D Matrix of numbers form 0 to 256 for multiplying each intensity value with its corresponding count to get the sum in the next step
mean=p.*a;       %Mean is being calulated by multiplying all intensity values its no of counts, so by this we get the dum and to divide it by total no of terms n is done in the previuos step with its,Here we are just creating an array afterwards we will be adding thid array to get the sum %Multipies matrix(Element by element multiplication as in the case of image multiplication)
p1=zeros(1,256);
p2=zeros(1,256);
m1=zeros(1,256);
m2=zeros(1,256);
var=zeros(1,256);
minimum=1;
maximum=256;
for i=1:256
    p1(i)=sum(p(minimum:i));
    p2(i)=1-p1(i);      %Value of p1(i) is less than since p is histogram count/total_count 
    
    m1(i)=sum(mean(minimum:i))/p1(i);
    m2(i)=sum(mean(i+1:maximum))/p2(i);
    
    mg=p1(i)*m1(i)+p2(i)*m2(i);%Within the class variance 
    var(i)=p1(i)*(m1(i)-mg).^2+p2(i)*(m2(i)-mg).^2;%Between the class variance
   
end
%...........
for i=minimum:maximum
    if var(i)==max(var)              
        index=i; %i is the pixel intensity which is between 1:256
        break
    end
end
%...........
for i=1:m
    for j=1:(n/3)
        if x(i,j)<=index;
            y(i,j)=0;
        else
            y(i,j)=1;
        end
    end
end
%.............
index
figure(1);
imshow(x);
figure(2);
bar(h);
figure(3);
imshow(y);