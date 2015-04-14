% A MATLAB script file containing a small demo for Murphy's line algorithm.
%
% Copyright (C) 2015 Daniel Bartel
% Distributed under the GNU GPL v2. For full terms see the file LICENSE.
%

% Use a 100x100 matrix for line drawing,
bitmap = zeros(100, 100);

% ... draw lines in each octant,
angle  = 15*pi/180;
center = 50;

for n = 1:24
    x = cos(n*angle); y = sin(n*angle);
    
    startpoint = struct('x', center + round(15*x), ...
                        'y', center + round(15*y));
    endpoint   = struct('x', center + round(45*x), ...
                        'y', center + round(45*y));                    
    thickness  = mod(n, 2) + 1;
                
    bitmap = murphy_line_draw(bitmap, startpoint, endpoint, thickness);
end

% ... and plot the resulting matrix.
imagesc(rot90(bitmap));
axis equal
title('Murphy''s line algorithm');
