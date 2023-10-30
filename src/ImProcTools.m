classdef ImProcTools
   methods (Static)
    function histImg = getHistImg(img)
        %di spec, tidak ada larangan untuk menggunakan histcounts, yaitu
        %fungsi untuk menghitung frekuensi dan unique values, yang
        %digunakan untuk plot bar
        [freq, uniqueVals] = ImProcTools.getHistData(img);
        figure;histImg = bar(uniqueVals(1:end-1), freq);
        xlabel("Pixel Value");
        ylabel("Frequency");
        title("Image Histogram");
    end
    function [freq, uniqueVals] = getHistData(img)
        binEdges = 0:255;
        [freq, uniqueVals] = histcounts(img, binEdges);
    end
    function convolutionImg = convolution(img, kernel, padding)
        %center point of the kernel
        kernelSize = size(kernel);
        kernelSize = kernelSize(1);
        kernelCenter = floor(kernelSize / 2);
        %image dimension
        imgSize = size(img);
        channels = imgSize(3);
        
        convolutionImg = zeros(imgSize);
        
        %div factor
        div = sum(kernel, "all");
        if (div == 0)
            div = 1;
        end
        for ch = 1 : channels
            %change img to float
            processedImg = img(:,:,ch);
            %reshape the size of image based on chosen padding
            if (padding == 'fillzero')
                processedImg = padarray(processedImg, [kernelCenter, kernelCenter], 0, "both");
            end
            processedImg = im2double(processedImg);
            for i=1:imgSize(1) - kernelCenter - 1
                for j=1:imgSize(2) - kernelCenter - 1
                    extractedImage = processedImg(i : i + kernelSize - 1 , j : j + kernelSize - 1);
                    convolutionImg(i + kernelCenter, j + kernelCenter, ch) = sum(extractedImage .* kernel, "all") / div;
                end
            end 
        end        
    end
    function fourierImg = showFourierImg(img, show)
        img = rgb2gray(img);
        fourier = fft2(img);
        fourier_shifted = fftshift(fourier);
        fourierImg = abs(fourier_shifted);
        fourierImg = log(fourierImg + 1);
        if (show)
            figure; imagesc(100*fourierImg); colormap(gray); imshow(fourierImg, []); title('Fourier Spectrum');
        end
    end
    
   end
end