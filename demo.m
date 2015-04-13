% A MATLAB script file containing a small demo for Murphy's line algorithm.
%
% Copyright (C) 2015 Daniel Bartel
% Distributed under the GNU GPL v2. For full terms see the file LICENSE.
%

% Use a 100x100 matrix for line drawing,
bitmap = zeros(100, 100);
offset = 50;

% ... draw a line in each octant,
pt0    = struct('x', offset + 10, 'y', offset +  5);
pt1    = struct('x', offset + 45, 'y', offset + 20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 1st octant

pt0    = struct('x', offset +  5, 'y', offset + 10);
pt1    = struct('x', offset + 20, 'y', offset + 45);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 2nd octant

pt0    = struct('x', offset -  5, 'y', offset + 10);
pt1    = struct('x', offset - 20, 'y', offset + 45);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 3rd octant

pt0    = struct('x', offset - 10, 'y', offset +  5);
pt1    = struct('x', offset - 45, 'y', offset + 20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 4th octant

pt0    = struct('x', offset - 10, 'y', offset -  5);
pt1    = struct('x', offset - 45, 'y', offset - 20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 5th octant

pt0    = struct('x', offset -  5, 'y', offset - 10);
pt1    = struct('x', offset - 20, 'y', offset - 45);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 6th octant

pt0    = struct('x', offset +  5, 'y', offset - 10);
pt1    = struct('x', offset + 20, 'y', offset - 45);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 7th octant

pt0    = struct('x', offset + 10, 'y', offset -  5);
pt1    = struct('x', offset + 45, 'y', offset - 20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 3);                % 8th octant

% ... and plot the resulting matrix.
imagesc(rot90(bitmap));
axis([0 100 0 100]);
title('Murphy''s line algorithm');
