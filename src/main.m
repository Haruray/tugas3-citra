imtool = ImProcTools;
img = imread('../data/colored/1.png');
%kernel = [0, 1, 0 ; 1,4,1 ;0,1,0];
%conv = imtool.convolution(img, kernel, "fillzero");
tes = ImProcTools.showFourierImg(img);
%figure;imshow(img);
%figure;imshow(conv);