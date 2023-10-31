function result = objectSegment(originalImg, edgedImg, k)

    [height, width, channels] = size(originalImg);
    closed_img = morphologicalClose(edgedImg, k);
    fill_img = imfill(closed_img, "holes");

    r = originalImg(:,:,1) .* uint8(fill_img);
    g = originalImg(:,:,2) .* uint8(fill_img);
    b = originalImg(:,:,3) .* uint8(fill_img);
    result = cat(3, r,g,b);
end