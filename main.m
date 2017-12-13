path(path,'Train_Database');
path(path,'Test_Database');
CROP_SIZE = 100;
ornt = [10 10 10 10 10 10];
scaleornt = uint8(10*6);
criterion_train_collection = Train( 'Train_Database', CROP_SIZE, ornt, scaleornt);
trainFolder= dir('Train_Database\*.jpg');
testFolder= dir('Test_Database\*.jpg');
criterion_test = zeros(5*scaleornt,1)';
Distance_vector= zeros(1,100);
correct = 0; %acuracy
for numberImages = 1:length(testFolder)
    criterion_test = criterion( testFolder(numberImages).name, CROP_SIZE, ornt, scaleornt);
    for im_count = 1:100
        Distance_vector(im_count) = DistanceTwoVector(criterion_test , criterion_train_collection(im_count,1:5*scaleornt));
    end
    [Minimum,Index]= min(Distance_vector);
    recognizeImageName = trainFolder(Index).name(1:end-8);
    testImageName = testFolder(numberImages).name(1:end-8);
    if strcmp(testImageName, recognizeImageName)
        correct = correct + 1;
        fprintf('TRUE   TEST IMAGE NAME:%s   RECOGNIZE IMAGE NAME:%s\n',testFolder(numberImages).name(1:end-4),recognizeImageName);
    else
        fprintf('FALSE  TEST IMAGE NAME:%s   RECOGNIZE IMAGE NAME:%s\n',testFolder(numberImages).name(1:end-4),recognizeImageName);
    end
        
end
fprintf('\nacuracy for all test images database is = %d %%\n',correct);

