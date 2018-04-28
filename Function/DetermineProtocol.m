function DetermineProtocol
    %{
        Inputs:
            x: subject number
        Outut:
            y: protocol type
    %}
    for x = 1:10
        % add root path
        [folder, ~, ~] = fileparts(which('DetermineProtocol'));
        root = strcat(folder, '/../');
        % load file
        path = strcat(root, '/Data/s', int2str(x), '.mat');
        data = load(path);
        fields = fieldnames(data);
        s = data.(fields{1});

        MAX = max(max(s.test(10,:)),max(s.train(10,:)));
        if MAX>12
            fprintf('%d: SC\n',x);
        else
            fprintf('%d: RC\n',x);
        end
    end
end