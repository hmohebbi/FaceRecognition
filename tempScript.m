% external script just for checking location of fixed points on images.
CROP_SIZE = 100;
path(path,'Train_Database');
path(path,'Test_Database');
trainFolder= dir('Train_Database\*.jpg');
testFolder= dir('Test_Database\*.jpg');
Xfixed = [28  70  50  32  63];
Yfixed = [38  38  59  75  75];
I = trainFolder(2).name;
[image, x, y] = LoadImageLandmark(I);
tr_im = TransformedImage(image, x, y, Xfixed, Yfixed ,CROP_SIZE);
imshow(I);
figure; imshow(image); hold on; plot(x, y, '*r'); hold off; 
figure; imshow(tr_im); hold on; plot(Xfixed, Yfixed, '*r'); hold off; 