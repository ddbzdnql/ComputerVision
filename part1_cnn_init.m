function net = part1_cnn_init()
% Original author: James Hays
% based of the MNIST example from MatConvNet

rng('default');
rng(0);

% constant scalar for the random initial network weights. You shouldn't
% need to modify this.
f=1/100; 

net.layers = {} ;

net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(9,9,1,10, 'single'), zeros(1, 10, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 0, ...
                           'name', 'conv1') ;
                       
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [7 7], ...
                           'stride', 7, ...
                           'pad', 0) ;

net.layers{end+1} = struct('type', 'relu') ;

% PROBLEM 3, 4: YOUR CODE HERE ---------------
% feel free to add or modify code anywhere in this file;
% this is just a suggested place to start
% net.layers{end+1} = struct('type', 'dropout', 'rate', 0.5);

net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(5,5,10,30, 'single'), zeros(1, 30, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 2, ...
                           'name', 'conv2') ;

net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 3], ...
                           'stride', 1, ...
                           'pad', 1) ;

net.layers{end+1} = struct('type', 'relu') ;

net.layers{end+1} = struct('type', 'dropout', 'rate', 0.55);

net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(8,8,30,15, 'single'), zeros(1, 15, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 0, ...
                           'name', 'fc1') ;
                       
% ------------------ end your code
                      
% Loss layer
net.layers{end+1} = struct('type', 'softmaxloss') ;

% Visualize the network
vl_simplenn_display(net, 'inputSize', [64 64 1 50])