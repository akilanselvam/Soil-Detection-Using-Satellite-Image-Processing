img = imread('pawnee_oli.jpg');
img1=double(img);
img11 = img1(:);%This will represent the matrixx in the form of a vertical vector to perform operations for the clustring 

[R,C] = size(img1);%R and C are the dimensions of the matrix

a_mean = [60 151 251];%This is the random mean that we have assumed,we can take it any thing from 0 to 255

clu1 = zeros(R,C);%Returns a matrix where all the elements are 0 and dimension is R*C.Cluster 1
clu2 = zeros(R,C);%This is set as 0. This is initialized to a 0 matrix as cluster 2
clu3 = zeros(R,C);%Cluster 3

while(1)
    olda_mean = a_mean;
    for i =1:R
        for j =1:C
            r = img1(i,j);%This gives the specific pixel value where i and j are present 
            ab = abs(r-a_mean);%This subtracts the value of the pixel from the cenroid pixel,we are substracting to get to know that the particular pixel will go in which section of cluster since the closest one has to go 
            mn= find(ab==min(ab));%Minia_meanm is calculated to find the so as find in which clusteer the pixel is be sent 
            %Actually the above function returns the position of the position of the cluster to which the pixel is nearesst       
            if mn(1)==1%If it is near to cluster 1
                clu1(i,j)=r;%Pixel is given to cluster 1 in which it is at the same position as that it was there in the main imgge 
            end
            if mn(1)==2
                clu2(i,j)=r;
            end
            if mn(1)==3
                clu3(i,j)=r;
            end
        end
    end
    %now to calc the mean for cluster 2 elements...............
    co1 = clu1(:);%This is converted into vertical vector form so that we can use the sum function siince the sum function only sums up the values in the column values 
    su1 = sum(co1);%Sum of all the values 
    fi1 = find(co1);%Actually when we are filling the clusters with the pixels we are filling it with the same position as the positions of the pixels in the imgge,so now some pixels will be 0 since they were initialized to 0 and thus we need to take the mean of only those which are filled in so we use find function which will remove all the elements with zeros 
    len1 = length(fi1);
    mm1 = su1/len1;%Mean is calculated
    mm11 = round(mm1);
    %now to calc the mean for cluster 2 elements...............
    co2 = clu2(:);
    su2 = sum(co2);
    fi2=find(co2);
    len2=length(fi2);
    mm2=su2/len2;
    mm22=round(mm2);
    %now to calc the mean for cluster 2 elements...............
    co3=clu3(:);
    su3=sum(co3);
    fi3=find(co3);
    len3=length(fi3);
    mm3=su3/len3;
    mm33=round(mm3);
    %new centroid 
    a_mean=[mm11 mm22 mm33];
    if(a_mean==olda_mean) break;end%The procedure is repeated untill the same mean comes again 
end
%labelling of clusters
for i=1:R
    for j=1:C
        if clu1(i,j)>0
            clu1(i,j)=1;
        end
        if clu2(i,j)>0
            clu2(i,j)=2;
        end
        if clu3(i,j)>0
            clu3(i,j)=3;
        end
    end
    end1

%Display original imgge 

imshow(img);%This will display the original imgge
figure;
title('original imgge'); 


%Displaying the clustured imgge 1
finlcluste1=label2rgb(clu1);
ff1=rgb2gray(finlcluste1);                                          
imshow(finlcluste1);
figure;
title('cluster imgge');
imshow(ff1);
figure;
title('clustered imgge is grey');

%Displaying the clustured imgge 2
finlcluste2=label2rgb(clu2);
ff2=rgb2gray(finlcluste2);                                          
imshow(finlcluste2);
figure;
title('cluster imgge1');
imshow(ff2);
figure;
title('clustered imgge is grey'); 

%Displaying the clustured imgge 3
finlcluste3=label2rgb(clu3);
ff3=rgb2gray(finlcluste3);                                          
imshow(finlcluste3);
figure;
title('cluster imgge');
imshow(ff3);
figure;
title('clustered imgge is grey'); 