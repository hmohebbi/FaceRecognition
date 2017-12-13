function criterion_vector = criterion( im , CROP_SIZE, ornt, scaleornt)
%calculate gaber for an image
    %Xfixed = [103  145  125  107  144]; average points
    %Yfixed = [111  110  136  155  154]; average points
    Xfixed = [28  70  50  32  63];
    Yfixed = [38  38  59  75  75];

    [image, x, y] = LoadImageLandmark(im);
    tr_im = rgb2gray(TransformedImage(image, x, y, Xfixed, Yfixed ,CROP_SIZE));
    criterion_vector = zeros(5*scaleornt,1)';
    Gab = Create_Gab_Kernels(ornt, CROP_SIZE);
    cellGab = Compute_Gabbed_Image(double(tr_im), Gab);
    for k = 1:scaleornt
        t_onecell = cellGab{k};
            for j = 1:5
                criterion_vector(j*k) = t_onecell(Xfixed(j),Yfixed(j)); 
            end
    end
end

