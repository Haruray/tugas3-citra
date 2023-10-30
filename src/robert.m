peach = imread('C:\Users\User\Downloads\peach.jpg');
data = peach;
figure, imshow(data);
robert(data);

function result = robert(img)
    img = rgb2gray(img);
    Rx = [1 0;0 -1];
    Ry = [0 1;-1 0];
    Jx = convn(double(img), double(Rx), 'same');
    Jy = convn(double(img), double(Ry), 'same');
    result = uint8(sqrt(Jx.^2 + Jy.^2));
    figure, imshow(result);
end