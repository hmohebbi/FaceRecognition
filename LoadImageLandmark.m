function [im, x, y] = LoadImageLandmark(imst)
lmst = [imst(1:end-4) '.mat'];
im = imread(imst);
load(lmst);
%imshow(im);
%hold on; plot(x, y, '*r'); hold off;

end