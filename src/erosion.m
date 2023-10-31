function result = erosion(img, k)
    [height, width, ~] = size(img);

    % create structuring element             
    se=ones(k, k); 
 
    % store number of rows in P and 
    % number of columns in Q.           
    [P, Q]=size(se); 
 
    % create a zero matrix of size I.        
    result=zeros(height, width); 
 
    for i=ceil(P/2):height-floor(P/2)
        for j=ceil(Q/2):width-floor(Q/2)
 
            % take all the neighbourhoods.
            on=img(i-floor(P/2):i+floor(P/2), j-floor(Q/2):j+floor(Q/2)); 
 
            % take logical se
            nh=on(logical(se)); 
       
            % compare and take minimum value of the neighbor 
            % and set the pixel value to that minimum value. 
            result(i, j)=min(nh(:));      
        end
    end
end