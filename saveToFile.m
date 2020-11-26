function [] = saveToFile(filename, data)

    % Save the file
    save(filename, 'data', '-ascii');

end