function tr_im = TransformedImage(image, x, y, Xfixed, Yfixed, CROP_SIZE)
% this function normalize to fixed points.

movingPoints = [x(1) y(1) ; x(2) y(2) ; x(3) y(3) ; x(4) y(4) ; x(5) y(5)];
fixedPoints =  [Xfixed(1) Yfixed(1); Xfixed(2) Yfixed(2); Xfixed(3) Yfixed(3); Xfixed(4) Yfixed(4); Xfixed(5) Yfixed(5)];
transformedMatrix = fitgeotrans(movingPoints,fixedPoints,'affine');
tr_im = imwarp(image,transformedMatrix,'OutputView',imref2d([CROP_SIZE CROP_SIZE])); 
    
end
