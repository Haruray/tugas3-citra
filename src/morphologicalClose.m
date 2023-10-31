function result = morphologicalClose(img, k)
    result = dilation(img, k);
    result = erosion(result, k);
end