% To train 

% Features of Clay
close all
clear all
clc
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Clay\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Clay Image');
    feat_clay =  Extract_FeaturesofSoil(img);
    Clay_Feat(i,:) = feat_clay;
    save Clay_Feat;
    close all
end

% Features of Clayey Peat
close all
clear all
clc
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Clayey Peat\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Clay Peat Image');
    feat_clay =  Extract_FeaturesofSoil(img);
    Clayey_Peat_Feat(i,:) = feat_clay;
    save Clayey_Peat_Feat;
    close all
end

% Features of Clayey Sand
close all
clear all
clc
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Clayey Sand\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Clayey Sand');
    feat_clay =  Extract_FeaturesofSoil(img);
    Clayey_Sand_Feat(i,:) = feat_clay;
    save Clayey_Sand_Feat;
    close all
end

% Features of Humus Clay
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Humus Clay\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Humus Clay');
    feat_clay =  Extract_FeaturesofSoil(img);
    Humus_Clay_Feat(i,:) = feat_clay;
    save Humus_Clay_Feat;
    close all
end

% Features of Peat
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Peat\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Peat');
    feat_clay =  Extract_FeaturesofSoil(img);
    Peat_Feat(i,:) = feat_clay;
    save Peat_Feat;
    close all
end

% % Features of Sandy Clay
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Sandy Clay\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('sandy Clay');
    feat_clay =  Extract_FeaturesofSoil(img);
    Sandy_Clay_Feat(i,:) = feat_clay;
    save Sandy_Clay_Feat;
    close all
end

 % Features of Silty Sand
 for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Silty Sand\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Silty Sand');
    feat_clay =  Extract_FeaturesofSoil(img);
    Silty_Sand_Feat(i,:) = feat_clay;
    save Silty_Sand_Feat;
    close all
 end

% Put all features into one
clear all
close all
clc
load('Clay_Feat.mat')
load('Clayey_Peat_Feat.mat')
load('Clayey_Sand_Feat.mat')
load('Humus_Clay_Feat.mat')
load('Peat_Feat.mat')
load('Sandy_Clay_Feat.mat')
load('Silty_Sand_Feat.mat')

TrainFeat = [Clay_Feat; Clayey_Peat_Feat; Clayey_Sand_Feat; Humus_Clay_Feat; Peat_Feat; Sandy_Clay_Feat; Silty_Sand_Feat];
Train_Label = [ ones(1,25) 2*ones(1,25) 3*ones(1,25) 4*ones(1,25) 5*ones(1,25) 6*ones(1,25) 7*ones(1,25) ];  
save TrainFeat_Soil