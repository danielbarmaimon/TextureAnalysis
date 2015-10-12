function featuresArray = computeFeatureVector(A)
%
% Describe an image A using texture features.
%   A is the image
%   v is a 1xN vector, being N the number of features used to describe the
% image
%

if size(A,3) > 1,
	A1 = rgb2gray(A);
end

%v = mean(A);

%% Co - occurrence matrix
featuresArray =zeros(1,15);
cont = 1;
D = [-1 0; 0 1; -1 1; -3 -3]; % Orientations (non-symmetric)
%D = [-1 0; -1 0; -1 0; -1 0];
%grayLevels = [32 32 32 32]; % Gray Levels for the parameters
grayLevels = [16 16 16 16]; 
%symmetric = [true, true, true, true];
symmetric = [false, false, false, false];
for i=1:4
    glcm = graycomatrix(A1, 'NumLevel', grayLevels(i),'Offset', D(i,:),...
    'Symmetric', symmetric(i)); % If img too dark o to brigth 'GrayLimits' 
    features = graycoprops(glcm, {'contrast','homogeneity','energy'}); % 'correlation'
    featuresArray(cont:cont+2)=[features.Contrast ,...
                                features.Energy,features.Homogeneity];
    cont = cont+3;    
end
for i=1:3
featuresArray(12+i) = mean(mean(A(:,:,i))); 
end


