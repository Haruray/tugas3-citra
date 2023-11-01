%peach = imread('../data/1.png');
%data = peach;
%figure, imshow(data);
%laplaceOperator(data);

function result = gaussianBlur(img)
    result = imgaussfilt(img);
    %figure, imshow(result);
end