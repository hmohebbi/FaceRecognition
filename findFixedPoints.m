% find fixed points using average of points
fl = dir('Train_Database\*.jpg');
%[lefteye righteye nose leftlip rightlip]
XEyeLeft = 0;
XEyeRight = 0;
XNose = 0;
XLipLeft = 0;
XLipRight = 0;
YEyeLeft = 0;
YEyeRight = 0;
YNose = 0;
YLipLeft = 0;
YLipRight = 0;

for i = 1:length(fl)
    [im, x, y] = LoadImageLandmark(fl(i).name);
    XEyeLeft = XEyeLeft + x(1);
    XEyeRight = XEyeRight + x(2);
    XNose = XNose + x(3);
    XLipLeft = XLipLeft + x(4);
    XLipRight = XLipRight + x(5);
    
    YEyeLeft = YEyeLeft + y(1);
    YEyeRight = YEyeRight + y(2);
    YNose = YNose + y(3);
    YLipLeft = YLipLeft + y(4);
    YLipRight = YLipRight + y(5);
end
result = [XEyeLeft XEyeRight XNose XLipLeft XLipRight; YEyeLeft YEyeRight YNose YLipLeft YLipRight];
result = result / 100