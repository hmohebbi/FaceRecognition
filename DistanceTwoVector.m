function Distance = DistanceTwoVector( vec1, vec2 )
% calcute distance two vector using Euclidean way
    sum = 0;
    for i = 1 : size(vec1,2)
        sum = sum + ((vec1(i)-vec2(i)) * (vec1(i)-vec2(i)));
    end
    Distance = sqrt(sum);
        
end

