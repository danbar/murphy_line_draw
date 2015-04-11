clc

bitmap = zeros(100, 100);
offset = 50;

% part1
pt0    = struct('x', offset+4, 'y', offset+2);
pt1    = struct('x', offset+48, 'y', offset+20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);

pt0    = struct('x', offset-4, 'y', offset-2);
pt1    = struct('x', offset-48, 'y', offset-20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);

pt0    = struct('x', offset+4, 'y', offset-2);
pt1    = struct('x', offset+48, 'y', offset-20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);

pt0    = struct('x', offset-4, 'y', offset+2);
pt1    = struct('x', offset-48, 'y', offset+20);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);

% part2
pt0    = struct('x', offset+2, 'y', offset+4);
pt1    = struct('x', offset+20, 'y', offset+48);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);

pt0    = struct('x', offset-2, 'y', offset-4);
pt1    = struct('x', offset-20, 'y', offset-48);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);

pt0    = struct('x', offset+2, 'y', offset-4);
pt1    = struct('x', offset+20, 'y', offset-48);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);

pt0    = struct('x', offset-2, 'y', offset+4);
pt1    = struct('x', offset-20, 'y', offset+48);
bitmap = murphy_line_draw(bitmap, pt0, pt1, 5);


imagesc(rot90(bitmap))
axis equal
