
clc;    
close all;
clear;


B1 = imread('./images/B1.png');
B2 = imread('./images/B2.png');
B3 = imread('./images/B3.png');

segmentB1(B1);

segmentB2(B2);

segmentB3(B3);

% this functions smooth the border and fills the holes in the regions 
function smooth = smoothenBorder(image)
    
    se = strel('disk', 4);
    smooth = imclose(image, se);

end

% WATER MASK B1
% params
% @ hueCoordinate, hue coordinate of the hsv image
% @ saturationCoordinate, saturation coordinate of the hsv image
% @ valueCoordinate, value coordinate of the hsv image
function waterMask = B1_water_threshold(hueCoordinate, saturationCoordinate, valueCoordinate)

    hueLowerLimit = 0.55; % hue minimum threshold 
    hueUpperLimit = 0.60; % hue maximum threshold 
    saturationLowerLimit = 0.05; % saturation minimum threshold
    saturationUpperLimit = 0.20; % saturation maximum threshold
    valueLowerLimit = 0.80; % value minimum threshold
    valueUpperLimit = 0.97; % value maximum threshold

    
    hueFilter = (hueCoordinate >= hueLowerLimit) & (hueCoordinate <= hueUpperLimit); % applying hue threshold 
    saturationFilter = (saturationCoordinate >= saturationLowerLimit) & (saturationCoordinate <= saturationUpperLimit); % applying saturation threshold 
    valueFilter = (valueCoordinate >= valueLowerLimit) & (valueCoordinate <= valueUpperLimit); % applying value threshold 

    waterMask = hueFilter & saturationFilter & valueFilter; % resultant water mask is the combination of all the h,s,v filters

    waterMask = smoothenBorder(waterMask); % fills the holes and smoothen the mask


end


% WATER MASK B2
% params
% @ hueCoordinate, hue coordinate of the hsv image
% @ saturationCoordinate, saturation coordinate of the hsv image
% @ valueCoordinate, value coordinate of the hsv image
function waterMask = B2_water_threshold(hueCoordinate, saturationCoordinate, valueCoordinate)

    
    hueLowerLimit = 0.53; % hue minimum threshold 
    hueUpperLimit = 0.60; % hue maximum threshold 
    saturationLowerLimit = 0.50; % saturation minimum threshold 
    saturationUpperLimit = 1.0; % saturation maximum threshold 
    valueLowerLimit = 0.40; % value minimum threshold 
    valueUpperLimit = 0.90; % value maximum threshold 

    hueFilter = (hueCoordinate >= hueLowerLimit) & (hueCoordinate <= hueUpperLimit); % applying hue threshold 
    saturationFilter = (saturationCoordinate >= saturationLowerLimit) & (saturationCoordinate <= saturationUpperLimit); % applying saturation threshold 
    valueFilter = (valueCoordinate >= valueLowerLimit) & (valueCoordinate <= valueUpperLimit); % applying value threshold 

    waterMask = hueFilter & saturationFilter & valueFilter; % resultant water mask is the combination of all the h,s,v filters

    waterMask = smoothenBorder(waterMask); % fills the holes and smoothen the mask

end


% WATER MASK B3
% params
% @ hueCoordinate, hue coordinate of the hsv image
% @ saturationCoordinate, saturation coordinate of the hsv image
% @ valueCoordinate, value coordinate of the hsv image
function waterMask = B3_water_threshold(hueCoordinate, saturationCoordinate, valueCoordinate)

    hueLowerLimit = 0.17; % hue minimum threshold
    hueUpperLimit = 0.3; % hue maximum threshold
    saturationLowerLimit = 0.0; % saturation minimum threshold
    saturationUpperLimit = 0.17; % saturation maximum threshold
    valueLowerLimit = 0.48; % value minimum threshold 
    valueUpperLimit = 1.0; % value maximum threshold

    hueFilter = (hueCoordinate >= hueLowerLimit) & (hueCoordinate <= hueUpperLimit); % applying hue threshold
    saturationFilter = (saturationCoordinate >= saturationLowerLimit) & (saturationCoordinate <= saturationUpperLimit); % applying saturation threshold 
    valueFilter = (valueCoordinate >= valueLowerLimit) & (valueCoordinate <= valueUpperLimit); % applying value threshold 

    waterMask = hueFilter & saturationFilter & valueFilter; % resultant water mask is the combination of all the h,s,v filters

    waterMask = smoothenBorder(waterMask);

end


% LAND MASK B1
% params
% @ hueCoordinate, hue coordinate of the hsv image
% @ saturationCoordinate, saturation coordinate of the hsv image
% @ valueCoordinate, value coordinate of the hsv image
function landMask = B1_green_threshold(hueCoordinate, saturationCoordinate, valueCoordinate)

    % Green
    hueLowerLimit = 0.15; % hue minimum threshold
    hueUpperLimit = 0.60; % hue maximum threshold
    saturationLowerLimit = 0.36; % saturation minimum threshold
    saturationUpperLimit = 1; % saturation maximum threshold
    valueLowerLimit = 0; % value minimum threshold
    valueUpperLimit = 0.8; % value maximum threshold

    hueFilter = (hueCoordinate >= hueLowerLimit) & (hueCoordinate <= hueUpperLimit); % will not be used
    saturationFilter = (saturationCoordinate >= saturationLowerLimit) & (saturationCoordinate <= saturationUpperLimit); % applying saturation threshold 
    valueFilter = (valueCoordinate >= valueLowerLimit) & (valueCoordinate <= valueUpperLimit); % applying value threshold 

    landMask = hueFilter & saturationFilter & valueFilter; % resultant land mask is the combination of all the h,s,v filters

    % landMask = smoothenBorder(landMask);

end


% LAND MASK B2
% params
% @ hueCoordinate, hue coordinate of the hsv image
% @ saturationCoordinate, saturation coordinate of the hsv image
% @ valueCoordinate, value coordinate of the hsv image
function landMask = B2_green_threshold(hueCoordinate, saturationCoordinate, valueCoordinate)

    % Green
    hueLowerLimit = 0.19; % hue minimum threshold
    hueUpperLimit = 0.40; % hue maximum threshold
    saturationLowerLimit = 0.36; % saturation minimum threshold
    saturationUpperLimit = 0.9; % saturation maximum threshold
    valueLowerLimit = 0; % value minimum threshold
    valueUpperLimit = 0.8; % value maximum threshold

    hueFilter = (hueCoordinate >= hueLowerLimit) & (hueCoordinate <= hueUpperLimit);  % applying hue threshold

    landMask = hueFilter;

    landMask = smoothenBorder(landMask);

end

% LAND MASK B3
% params
% @ hueCoordinate, hue coordinate of the hsv image
% @ saturationCoordinate, saturation coordinate of the hsv image
% @ valueCoordinate, value coordinate of the hsv image
function landMask = B3_green_threshold(hueCoordinate, saturationCoordinate, valueCoordinate)

    % Green
    hueLowerLimit = 0.0; % hue minimum threshold
    hueUpperLimit = 0.60; % hue maximum threshold
    saturationLowerLimit = 0.18; % saturation minimum threshold
    saturationUpperLimit = 1; % saturation maximum threshold
    valueLowerLimit = 0; % value minimum threshold
    valueUpperLimit = 0.66; % value maximum threshold

    hueFilter = (hueCoordinate >= hueLowerLimit) & (hueCoordinate <= hueUpperLimit);  % applying hue threshold
    saturationFilter = (saturationCoordinate >= saturationLowerLimit) & (saturationCoordinate <= saturationUpperLimit); % applying saturation threshold 
    valueFilter = (valueCoordinate >= valueLowerLimit) & (valueCoordinate <= valueUpperLimit); % applying value threshold 

    landMask = hueFilter & saturationFilter & valueFilter; % resultant land mask is the combination of all the h,s,v filters

    landMask = smoothenBorder(landMask);
    
end


% SKY MASK B1
% params
% @ hueCoordinate, hue coordinate of the hsv image
% @ saturationCoordinate, saturation coordinate of the hsv image
% @ valueCoordinate, value coordinate of the hsv image
function skyMask = B1_sky_threshold(hueCoordinate, saturationCoordinate, valueCoordinate)

    hueLowerLimit = 0.45; % hue minimum threshold
    hueUpperLimit = 0.65; % hue maximum threshold
    saturationLowerLimit = 0.0; % saturation minimum threshold
    saturationUpperLimit = 0.07; % saturation maximum threshold
    valueLowerLimit = 0.98; % value minimum threshold
    valueUpperLimit = 1.0; % value maximum threshold

    hueFilter = (hueCoordinate >= hueLowerLimit) & (hueCoordinate <= hueUpperLimit);  % applying hue threshold
    saturationFilter = (saturationCoordinate >= saturationLowerLimit) & (saturationCoordinate <= saturationUpperLimit); % applying saturation threshold 
    valueFilter = (valueCoordinate >= valueLowerLimit) & (valueCoordinate <= valueUpperLimit); % applying value threshold 

    skyMask =  saturationFilter & valueFilter ; % resultant sky mask is the combination of all the s and v filters
    
    skyMask = smoothenBorder(skyMask);


end




function segmentedImage = segmentation_function(image, imageName)
    
    % rgb to hsv
    hsv = rgb2hsv(image);

    hueCoordinate = hsv(:,:,1);
    saturationCoordinate = hsv(:,:,2);
    valueCoordinate = hsv(:,:,3);
    
    
    

    if imageName == 'B1'
        % Find B1 LAND segments 
        landMask = B1_green_threshold(hueCoordinate, saturationCoordinate, valueCoordinate);

        % Find B1 WATER segments
        waterMask = B1_water_threshold(hueCoordinate, saturationCoordinate, valueCoordinate);

        % Find B1 SKY segments
        skyMask = B1_sky_threshold(hueCoordinate, saturationCoordinate, valueCoordinate);
        


        redChannel = 255 * uint8(skyMask); % put sky related pixels to red channel
        greenChannel = 255 * uint8(landMask); % put land related pixels to green channel
        blueChannel = 255 * uint8(waterMask); % put water related pixels to blue channel


    elseif imageName == 'B2'
        % Find B2 LAND segments
        landMask = B2_green_threshold(hueCoordinate, saturationCoordinate, valueCoordinate);

        % Find B2 WATER segments
        waterMask = B2_water_threshold(hueCoordinate, saturationCoordinate, valueCoordinate);

        % B2 SKY
        % assignment is just for getting the size of the channel and set all the pixel to 0 later
        % since there is no sky
        skyMask = waterMask;
        

        redChannel = 0 * uint8(skyMask); % put sky related pixels to red channel
        greenChannel = 255 * uint8(landMask); % put land related pixels to green channel
        blueChannel = 255 * uint8(waterMask); % put water related pixels to blue channel

    elseif imageName == 'B3'
        % Find B3 LAND segments
        landMask = B3_green_threshold(hueCoordinate, saturationCoordinate, valueCoordinate);

        % Find B3 WATER segments
        waterMask = B3_water_threshold(hueCoordinate, saturationCoordinate, valueCoordinate);

        % B3 SKY
        % assignment is just for getting the size of the channel and set all the pixel to 0 later
        % since there is no sky
        skyMask = waterMask;
        

        redChannel = 0 * uint8(skyMask); % put sky related pixels to red channel
        greenChannel = 255 * uint8(landMask); % put land related pixels to green channel
        blueChannel = 255 * uint8(waterMask); % put water related pixels to blue channel

    end
    
    % concatanate the three color channels
    segmentedImage = cat(3, redChannel, greenChannel , blueChannel);
    
end


function segmentB1(image)

    segmentedImage = segmentation_function(image, 'B1');

    imwrite(segmentedImage ,'./images/B1_output.png');

end

function segmentB2(image)

    segmentedImage = segmentation_function(image, 'B2');

    imwrite(segmentedImage ,'./images/B2_output.png');

end

function segmentB3(image)

    segmentedImage = segmentation_function(image, 'B3');

    imwrite(segmentedImage ,'./images/B3_output.png');

end






























