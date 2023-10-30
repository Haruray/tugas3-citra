peach = imread('../data/1.png');
data = peach;
figure, imshow(data);
laplaceOperator(data);

function result = laplaceOperator(img)
    img = rgb2gray(img);
    R = [1 1 1;1 -8 1; 1 1 1];
    J = uint8(convn(double(img), double(R), 'same'));
    figure, imshow(J);
end