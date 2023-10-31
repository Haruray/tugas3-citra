%peach = imread('../data/1.png');
%data = peach;
%figure, imshow(data);
%laplaceOperator(data);

function result = gaussianBlur(img)
    R = [0 1 0;1 4 1; 0 1 0];
    result = uint8(convn(double(img), double(R), 'same'));
    %figure, imshow(result);
end