peach = imread('../data/1.png');
data = peach;
figure, imshow(data);
cannyOperator(data);

function result = cannyOperator(img)
    img = rgb2gray(img);
    result = edge(img,"canny");
    figure, imshow(result);
end