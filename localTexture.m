function [ imout ] = localTexture( imIn, winSize )

    % The window is symetric and odd number
    
    mask =ones(winSize,winSize);
    
    A = imread(imIn);
    
    [row col] = size(A);
    border = floor(winSize/2);
    
    numFeatures = 12; % Defined in computeFeatureVector
    imout = zeros(row,col,numFeatures + 1);
    imout(:,:,13) = A; 
    for i=border+1:row - border
        for j=border+1:col - border
            window = A(i-border:i+border,j-border:j+border);
            features = computeFeatureVector(window);
            for k=1:numFeatures
                imout(i,j,k)=features(k);
            end
        end
    end
    


end
%nlfilter ----- alternativa
