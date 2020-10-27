load('nyu_depth_v2_labeled.mat')
% Output RGBD
for i = 1:length(images)
    if i <= 1200
        imageFileName = strcat('images/train/1/', 'image', sprintf('%04d',i), '.png');
    else
        imageFileName = strcat('images/val/1/', 'image', sprintf('%04d',i), '.png');
    end
    depthFileName = strcat('depths/', 'image', sprintf('%04d',i), '.csv');
    labelFileName = strcat('labels/', 'label', sprintf('%04d',i), '.png');
    rgbdImage = images(:,:,:,i);
    depth = depths(:,:,i);
    label = labels(:,:,i);
    imwrite(rgbdImage, imageFileName, 'png')
    csvwrite(depthFileName, depth)
    imwrite(label, labelFileName, 'png')
end

% Output label names
T = cell2table([val, k]);
writetable(T,'labelNames.csv');

% Output target mask

maxCeiling = 2;
maxFloor = 1;
maxWall = 5;
for i = 1:length(images)
    if i <= 1200
        path = strcat('target/train/1/', 'label', sprintf('%04d',i), '.png');
    else
        path = strcat('target/val/1/', 'label', sprintf('%04d',i), '.png');
    end
    
    [instanceMasks, instanceLabels] = get_instance_masks(labels(:,:,i), instances(:,:,i));
    mat(1:480,1:640,1:3) = 255;
    ceil = 0;
    floor = 1;
    wall = 2;
    a = true;
    for m = 1:size(instanceMasks,3)
        for r = 1:480
            for c = 1:640
                if instanceLabels(m) == 4 && instanceMasks(r, c, m) == 1  
                    mat(r, c, :) = ceil/255;
                elseif instanceLabels(m) == 11 && instanceMasks(r, c, m) == 1  
                    mat(r, c, :) = floor/255;
                elseif instanceLabels(m) == 21 && instanceMasks(r, c, m) == 1
                    mat(r, c, :) = wall/255;
                end
            end
        end
    end
    imwrite(mat, path, 'png')
end




