%_____________________________________________________________________________________________ %
%  Butterfly Optimization Algorithm (BOA) source codes demo V1.0                               %
%                                                                                              %
%  Author and programmer: Sankalap Arora                                                       %
%                                                                                              %
%         e-Mail: sankalap.arora@gmail.com                                                     %
%                                                                                              %
%  Main paper: Sankalap Arora, Satvir Singh                                                    %
%              Butterfly optimization algorithm: a novel approach for global optimization	   %
%              Soft Computing, in press,                                                       %
%              DOI: https://doi.org/10.1007/s00500-018-3102-4                                  %
%___________________________________________________________________________________________   %
%

% This function randomly initializes the position of agents in the search space.
function [X]=w_initialization_k(SearchAgents_no,dim,up,lb)

if size(up,1)==1
    X=rand(SearchAgents_no,dim).*(up-lb)+lb;
end
if size(up,1)>1
    for i=1:dim
        high=up(i);low=lb(i);
        X(:,i)=rand(1,SearchAgents_no).*(high-low)+low;
    end
end