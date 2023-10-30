function result = logOperator(img)
    h = fspecial("log");
    result = uint8(convn(double(img), double(h)));
    figure, imshow(result);
end