%peach = imread('../data/1.png');
%data = peach;
%figure, imshow(data);
%cannyOperator(data);

function result = canny(img)
    img = rgb2gray(img);
    result = edge(img,"canny");
end