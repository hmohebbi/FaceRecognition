function criterion_train_vector = Train( images_path , CROP_SIZE, ornt, scaleornt)
%work on train images
criterion_train_vector = zeros(100,5*scaleornt);
folder= dir([images_path '\*.jpg']);

for numberImages = 1:length(folder)
    criterion_train_vector(numberImages,1:5*scaleornt) = criterion( folder(numberImages).name, CROP_SIZE, ornt, scaleornt );
end
end

