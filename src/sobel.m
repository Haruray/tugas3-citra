peach = imread('../data/1.png');
Sx = [-1 0 1;-2 0 2;-1 0 1];
Sy = [1 2 1;0 0 0;-1 -2 -1];
data = peach;
figure, imshow(data);
sobelOperator(data, Sx, Sy);

function result = sobelOperator(img, Sx, Sy)
    img = rgb2gray(img);
    Jx = convn(double(img), double(Sx), 'same');
    Jy = convn(double(img), double(Sy), 'same');
    result = uint8(sqrt(Jx.^2 + Jy.^2));
    result(result>100) = 255;
    result(result~=255) = 0;
    figure, imshow(result);
end