%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% MATLAB CLASS FINAL PROJECT%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2016
% Tyler Whittier
% B01096287
% Function MAKEFOLDERS
% This is a function that generates folders within the working folder
% and can create subfolders within each of the new folders.  It takes no input
% argument and gives no output.  Its job is simply to create the folders.
%% 

function makefolders 
FolderNames = {'Recognizable','Simple', 'Unique'} %Create a cell array with the names of the new folders
SubFolderNames = {'Left','Right'} % Create a cell array with names of the subfolders
for i = 1:length(FolderNames) %This for loop iterates to make a new folder for each title within the cell array 'Folder Names'
    name = strjoin([FolderNames(i)]) % This line and the next one convert the values to strings and make a new folder with that value name
        mkdir(name);
    for j = 1:length(SubFolderNames) % This nested for loop creates a subfolder for each value in the cell array 'SubFolderNames'
        path = pwd % pwd generates the file path for the current folder
        string = strjoin([FolderNames(i)]) % Convert the value in the cell array to a string
        path = [path '/' string] % Concatenate the path, a forward slash, and the new folder name to create a path for the subfolder to be created
        name2 = strjoin([SubFolderNames(j)]) % Make the value in subfolder array into a string
        mkdir(path, name2) % Make a new folder and provide the file path for where it goes, and its name
    end
end
end


