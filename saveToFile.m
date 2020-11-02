function [] = saveToFile(filename, data)

    % Save the file
    data
    save(filename, 'data', '-ascii');

end