% show_mean_and_var.m
%
% Show the grey value mean and variance image and the
% corresponding 28 * 28 matrix (casted to unsigned int)
% for each digit.
%
% Author: Hauke Schramm
%
close all;

filebase = "/home/hsc/PAT/Lab/Exercises/2/data/digit";

% Disabled - Matlab only
% change the size of the image shown with imshow
% store the former value (for reset)
%imsize_old = iptgetpref('ImshowInitialMagnification');
%iptsetpref('ImshowInitialMagnification',1000);    

for i = 0:9
    filename = [filebase int2str(i) '.txt'];
    D = load (filename);
    
    m = mean(D);
    v = var(D);

    m = reshape(m, 28, 28);
    m = imrotate(m, 270);
    m = fliplr(m);
    
    v = reshape(v, 28, 28);
    v = imrotate(v, 270);
    v = fliplr(v);

    figure(1);
    subplot(211);
    imshow(m, [min(min(m)), max(max(m))]);
    subplot(212);
%    figure(2);
    imshow(v, [min(min(v)), max(max(v))]);

    % output of mean and variance matrix (casted to unsigned int)
    m_cast = cast(m,'uint8');  % cast to unsigned int for illustration
    v_cast = cast(v,'uint8');  % cast to unsigned int for illustration
    pause(1);
end

% reset image size to old value (Matlab only)
%iptsetpref('ImshowInitialMagnification',imsize_old);

