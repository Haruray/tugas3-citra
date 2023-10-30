function result = logoperation(img)
    h = fspecial("log");
    img = rgb2gray(img);
    result = uint8(convn(double(img), double(h)));
    %figure, imshow(result);
end