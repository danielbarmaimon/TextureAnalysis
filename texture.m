function [ stats ] = texture( inIm, grayLevels )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
img = double(imread(inIm));
%% It's a color image?
checkColor = numel(size(img));
if checkColor == 2
    %flagColor = 0;      % The image is a grey scale image
    %imLabeled = zeros(size(img));%
    imgG = img;
else
    flagColor = 1;      % The image is a color image
    %temp = size(img);
    %imLabeled = zeros(temp(1:2));
    imgG = rgb2gray(img);
end
%% Co - occurrence matrix
features = zeros(1,4);
featuresArray =zeros(1,12);
cont = 1;
%D = [-1 0; 0 1; -1 1; -1 -1]; % Orientations (non-symmetric)
D = [-1 0; -1 0; -1 0; -1 0];
%grayLevels = [32 32 32 32]; % Gray Levels for the parameters
grayLevels = [8 8 8 8]; 
symmetric = [false, false, false, false];
% d = 1;                  %Distance for the co-occurrence matrix
% angleArray = [d 0];     %Angle and distance array for the matrix
for i=1:4
    glcm = graycomatrix(imgG, 'NumLevel', grayLevels(i),'Offset', D(i),...
    'Symmetric', symmetric(i)); % If img too dark o to brigth 'GrayLimits' 

    features(i) = graycoprops(glcm, {'contrast','homogeneity','energy'}); % 'correlation'
    featuresArray(cont:cont+2)=[features(i).Contrast ,...
                                features(i).Energy,features(i).Homogeneity];
    cont = cont+3;    
end

%% Classification

end

