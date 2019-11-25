function [ sobel_img ] = SobelFilter(img)
    [m, n] = size(img); %m=height n=width
    disp('Begin SobelFilter');
    sobel_img = img;
    SOBEL_CAP = 31;

    for y = 2:n - 1;

        for x = 2:m - 1;
            val = ((img(x + 1, (y - 1)) - img(x - 1, (y - 1))) + (img(x + 1, y) - img(x - 1, y)) * 2 + (img(x + 1, (y + 1)) - img(x - 1, (y + 1))));

            if (val > SOBEL_CAP)
                val = SOBEL_CAP;
            elseif (val <- SOBEL_CAP)
                val = -SOBEL_CAP;
            end

            sobel_img(x, y) = val + SOBEL_CAP; % Adding offset to prevent negative values
        end

    end

    disp('End SobelFilter');
