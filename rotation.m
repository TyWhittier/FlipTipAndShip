%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% MATLAB CLASS FINAL PROJECT%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2016
% Tyler Whittier
% B01096287
% Function ROTATION 
% This function takes two inputs (image and angle) to rotate the image at
% an angle j.  If j is an angle that is not a multiple of 90, the resulting
% image will result in a black background.  This function also replaces the
% black background with a white one
function [Irot45] = rotation(image, angle)
 Irot45 = imrotate(image, angle);
 % This section replaces the black background with a white background
 Mrot45 = ~imrotate(true(size(image)),angle);
 Irot45(Mrot45&~imclearborder(Mrot45)) = 255;
end