%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% MATLAB CLASS FINAL PROJECT%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2016
% Tyler Whittier
% B01096287



% This code will load any JPEG picture in the working folder and generate
% picture files of both the same image, and its mirror reflection, rotated
% at every 45 degree increment from 0-360 degrees.  It will then sort these
% files into three different folders, based on the class of picture that it
% is.  Class of each image is dictated by the first word in its filename.  
% Within each class folder are subfolders that contain all images of the 
% right and left hand, respectively.  This code uses matlab built in functions
% as well as user made functions.  To begin, we have 20 different images, after the
% code has run we will have 16 images for every original one, placed in
% its appropriate folder.
%% 
clear all 
clc
% We first need to create a directory that includes all files to be
% processed.  In this project, we want all JPEG files so we state that with
% the *.jpg sign.  The following command creates a column vector of all
% jpeg files

files = dir('*.jpg');

% In order to keep track of the amount of iterations of the flip loop we
% initialize a counting variable (fliploopcnt)
fliploopcnt = 0;

% This for loop creates the mirror reflection image of all the original
% images and saves them as the same filename with the exeption of hand
% direction (Right becomes left)
for file = files'
    %in order to do a loop we need a row vector so we transpose the
    %original 'files'
    I = imread(file.name);
    % file.name represents the current file being processed in the 'file'
    % row vector
    I = flipdim(I,2);
    % flipdim flips the dimensions of the picture, the second input '2'
    % flips the columns, as opposed to the rows
    [PATHSTR,NAME,EXT] = fileparts(file.name);
    % fileparts gives the specific information for the current file which
    % helps in the naming process
    flipname = strrep(NAME, 'Right', 'Left')
    % strrep replaces the original 'Right' with the new 'Left'
    imwrite(I, [flipname '.jpg'])
    % adding 1 to our original fliploopcnt allows us to know how many
    % iterations of the loop have been executed
    fliploopcnt = fliploopcnt + 1;
end
% A simple test to see if the fliploopcnt = the amount of jpegs tells us if
% all the images have been processed in the loop.  A message is given to
% the user if files have not been processed
FlipTEST = (length(files') == fliploopcnt);
    if FlipTEST ~= 1
        fprintf('Flip Loop Was Not Successful in Flipping All Images')
    else
        fprintf('All JPEG files have been flipped successfully')
    end
angletest = length(files');
    %% 
% The following for loop creates 7 additional image files from all files
% within the folder, including the new left handed images.  A new directory
% 'files' is generated to include the new images.
files = dir('*.jpg');
% angleloopcnt will allow us to count iterations of the loop
angleloopcnt = 0;
for file = files'
    %Since each image will need to generate 7 additional images, a nested
    %for loop is used to create 7 different rotations of each file prior to
    %moving on to the next file
        for j = [45 90 135 180 225 270 315]
        A_L = imread(file.name);
        [PATHSTR,NAME,EXT] = fileparts(file.name)
        % Because we are putting numbers into the filename, we need to
        % convert them to strings
        angle =num2str(j)
        % We now rotate all images A_L by j degrees using the user made
        % function 'rotation'
        Irot45 = rotation(A_L,j);
        % 'imwrite' saves the new image 'Irot45' by the string combination
        % of the previous name and the new angle
        imwrite(Irot45, [NAME angle '.jpg']);
        angleloopcnt = angleloopcnt + 1;
        angletest(angleloopcnt) = 1;
        end
        %Once all angles have been generated, the next image is processed
        %in the loop
end
angleTEST = ((angletest * 8) == angleloopcnt);
    if angleTEST ~= 1
        fprintf('Angle Loop Was Not Successful in Flipping All Images')
    else
        plot(angletest) % plot success rate of rotated images
        title('All image angle files have been Processed')
        xlabel('Number of File in Directory')
        ylabel('Success ( 0 = no, 1 = yes )')
    end
makefolders % Call the user created function 'makefolders' in order to 
% generate three new folders within the working folder and two new subfolders
% within each of the new ones
Recfiles = dir('*Recognize*.jpg') % create a directory with only files that 
% contain the word 'Recognize.'
for file = Recfiles' % Transpose 'Recfiles' into a row vector and perform analysis 
    % to determine which files go where
    movefile(file.name, [pwd '/' 'Recognizable']) %move every file that contains 'Recognize
    % to the folder for recognizable images
    cd('Recognizable') % change directory to the new folder
    leftFiles = dir('*Left*.jpg') %Within the new folder create a new directory for only files that contain the word 'Left'
    rightFiles = dir('*Right*.jpg') % Do the same with 'Right'
    for file = leftFiles' % For all files in 'leftFiles', move them to the left folder
        movefile(file.name, [pwd '/' 'Left'])
    end
    for file = rightFiles' % Do the same for the right
        movefile(file.name, [pwd '/' 'Right'])
    end
    cd ..
end
% The next 2 for loops do the same as the above loop.  Instead of creating
% a folder for files with the word 'Recognize' in the title, they do the
% same thing for the terms 'Simple' and 'Unique', respectively.
simpfiles = dir('*Simple*.jpg')
for file = simpfiles'
    movefile(file.name, [pwd '/' 'Simple'])
    cd('Simple')
    leftFiles = dir('*Left*.jpg')
    rightFiles = dir('*Right*.jpg')
    for file = leftFiles'
        movefile(file.name, [pwd '/' 'Left'])
    end
    for file = rightFiles'
        movefile(file.name, [pwd '/' 'Right'])
    end
    cd ..
end

Uniqfiles = dir('*Unique*.jpg')
for file = Uniqfiles'
    movefile(file.name, [pwd '/' 'Unique'])
    cd('Unique')
    leftFiles = dir('*Left*.jpg')
    rightFiles = dir('*Right*.jpg')
    for file = leftFiles'
        movefile(file.name, [pwd '/' 'Left'])
    end
    for file = rightFiles'
        movefile(file.name, [pwd '/' 'Right'])
    end
    cd ..
end
