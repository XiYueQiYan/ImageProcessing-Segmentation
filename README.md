# Image Segmentation

Developing an image segmentation algorithm that can separate water, land and sky by using histogram thresholding. Red color represents sky, blue color represents water and green color represents land.

In segmentation function, main idea for image segmentation algorithm is converting RGB (Red Green Blue) colormap to HSV(Hue Saturation Value) colormap. Hue coordinate refers to the color having the full saturation. Saturation is the intensity of the color. Value is the lightness or darkness of the color.

Pixel information on the hsv coordinates is used for selecting the hsv threshold values. Three seperate masks (`landMask`, `skyMask`, `waterMask`) are created by using these threshold values. For the coloring the segmentation, sky segment will have the color red, land segment will have the color green and water segment will have the color blue.

Red channel values are taken from the `skyMask` and converted into uint8 type. (i.e 255 \* uint8(landMask)). Green channel values are taken from the `landMask`. Blue channel values are taken from the `waterMask`. Lastly, these three color channels which are red, green and blue are concatenated for resultant image.
