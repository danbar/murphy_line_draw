function bitmap = murphy_line_draw(bitmap, pt0, pt1, thickness)
% A modified version of Bresenham's line algorithm for drawing lines of
% arbitrary thickness.
% 
%
% Documentation
% -------------
% The function implements Murphy's line algorithm [1] to draw lines of
% arbitrary thickness. It is a modified version of Bresenham's line
% algorithm [2].
% This implementation works in all octants of the Cartesian coordinate
% system.
%
% Inputs:
%   bitmap     NxM matrix
%   pt0        startpoint of line (struct with fields x,y)
%   pt1        endpoint of line (struct with fields x,y)
%   thickness  thickness of line
%
% Output:
%   bitmap     NxM matrix with drawn line
%
%
% References
% ----------
% [1] Line Thickening by Modification To Bresenham's Algorithm, 
%     A.S. Murphy, 
%     IBM Technical Disclosure Bulletin, Vol. 20, No. 12, May 1978.
%
% [2] Algorithm for computer control of a digital plotter, 
%     J.E. Bresenham,
%     IBM Systems Journal, 4, 1, 1965, S. 25–30
%
%
% Copyright (C) 2015 Daniel Bartel
% Distributed under the GNU GPL v2. For full terms see the file LICENSE.
%

% Distinction of octants
% ----------------------
dx = pt1.x - pt0.x;
dy = pt1.y - pt0.y;

inc_x = sign(sign(dx) + 0.5);                             % signum function
inc_y = sign(sign(dy) + 0.5);
if dx < 0; dx = -dx; end
if dy < 0; dy = -dy; end

if dx > dy
    len = dx;
    
    sd0x = 0;      sd0y = inc_y;
    dd0x = -inc_x; dd0y = inc_y;

    sd1x = inc_x; sd1y = 0;
    dd1x = inc_x; dd1y = inc_y;

    ku = 2*dx;                                                       % 2*dx
    kv = 2*dy;                                                       % 2*dy
    kd = kv - ku;                                             % 2*dy - 2*dx

    kt = dx - kv;                                % threshold for error term
else
    len = dy;
    
    sd0x = inc_x; sd0y = 0;
    dd0x = inc_x; dd0y = -inc_y;

    sd1x = 0;     sd1y = inc_y;
    dd1x = inc_x; dd1y = inc_y;

    ku = 2*dy;                                                       % 2*dy
    kv = 2*dx;                                                       % 2*dx
    kd = kv - ku;                                             % 2*dx - 2*dy

    kt = dy - kv;                                % threshold for error term
end

% Initialization                                         % Figure 5A in [1]
% --------------
tk = 2*thickness*sqrt(dx*dx + dy*dy);             % threshold for thickness

d0 = 0;                                             % outer loop error term
d1 = 0;                                             % inner loop error term
dd = 0;                                              % thickness error term

% Murphy line draw
% ----------------
while dd < tk                          % outer loop (perpendicular to line)

    bitmap = bresenham_line_draw(bitmap, pt0, d1);

    if d0 < kt                           % square move (d0 -> M0, dd -> M0)
        pt0.x = pt0.x + sd0x;
        pt0.y = pt0.y + sd0y;
    else                               % diagonal move (d0 -> M1, dd -> M1)
        dd = dd + kv;
        d0 = d0 - ku;

        if d1 < kt                      % diagonal move (d1 needs extra M0)
            pt0.x = pt0.x + dd0x;
            pt0.y = pt0.y + dd0y;

            d1    = d1 - kv;
        else                     % (double) square move (d1 needs extra M1)
            if dx > dy
                pt0.x = pt0.x + dd0x;
            else
                pt0.y = pt0.y + dd0y;    
            end

            d1    = d1 - kd;
            if dd > tk
                return                         % breakout on the extra line
            end

            bitmap = bresenham_line_draw(bitmap, pt0, d1);

            if dx > dy
                pt0.y = pt0.y + dd0y;
            else
                pt0.x = pt0.x + dd0x;
            end
        end
    end

    dd = dd + ku;
    d0 = d0 + kv;
end

% Bresenham line draw
% -------------------
function bitmap = bresenham_line_draw(bitmap, pt, d1)    % Figure 5B in [1]
    for p = 0:len                           % inner loop (parallel to line)

        bitmap(pt.x, pt.y) = bitmap(pt.x, pt.y) + 1;

        if d1 <= kt                                % square move (d1 -> M0)
            pt.x = pt.x + sd1x;
            pt.y = pt.y + sd1y;

            d1   = d1 + kv;
        else                                     % diagonal move (d1 -> M1)
            pt.x = pt.x + dd1x;
            pt.y = pt.y + dd1y;

            d1   = d1 + kd;
        end
    end
end
end
