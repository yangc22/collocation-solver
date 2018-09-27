clear variables, close all,  clc

filename_info = 'test_result';
fileID_info = fopen(filename_info,'w');
fprintf(fileID_info, '%s\n', 'Test Results with Collocation:');

examples_Dir = '../examples/';
test = {'ex2ocp'};
for i = 1 : size(test, 2)
    close all;
    filename = char(test(i));
    fprintf(fileID_info, '%s\n', filename);
    test_example = [examples_Dir, filename];
    if exist(test_example, 'file') == 2
        [y0, z0, para, t0, tf, t_span, outputFile, alpham, tol, nodes_max, mesh_max, nx, nu, nw, nd, ns] = generate_bvpdae(test_example);
        collocation_solver(y0, z0, para, t0, tf, t_span, outputFile, alpham, tol, nodes_max, mesh_max, nx, nu, nw, nd, ns, fileID_info);
    end
end
fclose(fileID_info);