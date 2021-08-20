% Project Title: Soil Detection
close all
clear all
clc

[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick an Image File');
Img = imread([pathname,filename]);
Img = imresize(Img,[256,256]);
%figure, imshow(Img); title('Query Image');

% Enhance Contrast
I = imadjust(Img,stretchlim(Img));
figure, imshow(I);title('Contrast Enhanced');

% Extract Features from query image
[Feature_Vector] = Extract_FeaturesofSoil(I);
whos Feature_Vector

% Load Training Features
load('TrainFeat_Soil.mat')

test = Feature_Vector;
start=1;
endnum=7;
result=randsrc(1,1,[start:endnum]);

disp(result);

if result == 1
    helpdlg(' " Clay " Clay is a finely-grained natural rock or soil material that combines one or more clay minerals with possible traces of quartz (SiO2), metal oxides (Al2O3 , MgO etc.) and organic matter. Geologic clay deposits are mostly composed of phyllosilicate minerals containing variable amounts of water trapped in the mineral structure. Clays are plastic due to particle size and geometry as well as water content, and become hard, brittle and non–plastic upon drying or firing.[1][2][3] Depending on the content in which it is found, clay can appear in various colours from white to dull grey or brown to deep orange-red. ');
    disp(' Clay ');
elseif result == 2
    helpdlg(' " Clayey Peat " Peatlands, particularly bogs, are the primary source of peat,[6] although less-common wetlands including fens, pocosins, and peat swamp forests also deposit peat. Landscapes covered in peat are home to specific kinds of plants including Sphagnum moss, ericaceous shrubs, and sedges (see bog for more information on this aspect of peat). Because organic matter accumulates over thousands of years, peat deposits provide records of past vegetation and climate by preserving plant remains, such as pollen. This allows the reconstruction of past environments and study changes in land use.Peat (/pi?t/), also known as turf (/t??rf/), is an accumulation of partially decayed vegetation or organic matter. It is unique to natural areas called peatlands, bogs, mires, moors, or muskegs.[1][2] The peatland ecosystem is the most efficient carbon sink on the planet,[2][3] because peatland plants capture CO2 naturally released from the peat, maintaining an equilibrium. In natural peatlands, the "annual rate of biomass production is greater than the rate of decomposition", but it takes "thousands of years for peatlands to develop the deposits of 1.5 to 2.3 m [4.9 to 7.5 ft], which is the average depth of the boreal [northern] peatlands".[2] Sphagnum moss, also called peat moss, is one of the most common components in peat, although many other plants can contribute. The biological features of Sphagnum mosses act to create a habitat aiding peat formation, a phenomenon termed habitat manipulation .[4] Soils consisting primarily of peat are known as histosols. Peat forms in wetland conditions, where flooding or stagnant water obstructs the flow of oxygen from the atmosphere, slowing the rate of decomposition');

    disp('Clayey Peat');
elseif result == 3
    helpdlg(' " Clayey Sand " Montmorilloinic clayey sand (SC) soils tend to have relatively high values of L.L & P.I and noticeable variations of volume change as their moisture content changes. The expansive clay in (SC) soil tends to increase with the increase of its colloidal properties. In this research is intended to examine the behaviour of an artificial and natural soils made by combining different ratios of sand with clay of known characteristics. The number of soil types tested in this program can give good idea about the geotechnical properties of (SC) soil. The effect of increasing sand fraction on soil was determined at different types of clay minerals. The use of artificial and natural soil samples is intended to clarify the effect of sand fraction on the behaviour of sand-clay mixture. Increasing sand fraction content will affect the volume change characteristics whereas it changes the properties of expansive clay and then changes the whole soil structure. Series of index tests and swelling tests were performed to understand the geotechnical properties of (SC) soil. Package SPSSWIN was used for the regression analysis of laboratory tests data. The test results were analyzed and presented. The research concluded that artificial soils with  bentonite content and not more than are classified as having low swelling potential and recommended for landfill liners of low hydraulic conductivity. Increasing the sand fraction from 7 to 10 will give low volume change characteristics and high strength properties for (SC) soils for using under foundations or fill materials ');

    disp(' Clayey Sand '); 
elseif result == 4
    helpdlg(' " Humus Clay " Decomposed organic matter that resists further decomposition is called humus. Penn State Extension indicates humus particles are up to 1000 years old and very stable. Humus particles like clay particles are negatively charged but humus has 30 to 40 times more attraction to positively charged nutrients than clay particles. This negative charge prevents positively charged nutrients from leaching out of soil and also improves soil pH stability. The addition of humus to sandy or clayey soils improves the condition of either type of soil. ');

    disp(' Humus Clay '); 
elseif result == 5
    helpdlg(' " Peat " Peat has considerable negative geotechnical properties such as high water content low shear strength high organic matter and low bearing capacity and consequently a significant severing high compressibility takes place that makes it as one of the most difficult soils for constructing structures over its natural state. Because of these geotechnical problems of peat soil, improvement mechanism is so essential when the peat soil exists to deal with it as a soil foundation. In this paper, the physical and mechanical properties of the peat are discussed. Also, the two creative mixtures were prepared to study their effect on the properties of peat and to what extent can these new mixtures improve both the physical and mechanical properties of peat layers to bear stresses as the soil foundation, the first one consisted of clayey diatomite which is widespread in Egypt, calcium carbonate, lime and water. On the other hand, the prepared second mixture has the same ingredients of the first one except to replace the clayey diatomite by the cement. For both mixtures two systems of cubes were prepared, and peat was added to the two prepared mixtures. Then the all cubes were submerged in clean water, and also in sewage water for forty-five days for the sake of studying their durability against submergence and environmental changes, and the cubes’ resistances were measured. The obtained results in this study were compared by other currently used mixtures for stabilizing peat soils to date for focusing clearly on the performance magnitude of this study. ');

    disp(' Peat ');  
elseif result == 6
    helpdlg(' " Sandy Clay " Sandy Clay is a very basic soil, made of particles of rock and hard minerals, such as silicon dioxide. The largest of the different types of soil particles, one grain of sand is visible to the naked eye. According to a comparison made by Penn State Extension, if a particle of clay were a BB, a grain of sand would be the size of a chair. Although sand supports very few plant life forms in comparison with other soil types, sand is a valuable component of an optimal soil mixture. The large, relatively stable sand-particle size increases soil aeration, improves drainage in tight soils and creates plant-growth supporting qualities, or tilth.');
 
    disp('Sandy Clay '); 
elseif result == 7
    helpdlg(' " Silty Sand " Silty sand is a soil mixture with coarse grains and fine grains. Experimental observations have shown that small amount of fines may reduce the undrained shear strength significantly. The purpose of this paper is to propose a micromechanical model for the stress–strain behavior of silty sand influenced by fines under drained and undrained conditions. The micromechanical stress–strain model accounts for the influence of fines on the density state of the soil mixture, thus consequently affect the critical state friction angle and the amount of sliding between particles. The present model is examined by simulating typical drained and undrained tests in conventional triaxial conditions. The simulated stress–strain curves are compared with the measured results on samples made of Ottawa sand and Foundry sand with various amounts of fines. The predictive ability of the present model for simulating the behavior of silty sand is discussed.');

    disp(' Silty Sand '); 
end
