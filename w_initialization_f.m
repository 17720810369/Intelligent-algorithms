%% 柯西反向初始化
function Positions=w_initialization_f(SearchAgents_no,dim,ub,lb,fun,func_num)

Boundary_no= size(ub,2); % numnber of boundaries

% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb
if Boundary_no==1
    Positions=rand(SearchAgents_no,dim).*(ub-lb)+lb;
end

if Boundary_no>1
   for j = 1:SearchAgents_no
       SineMapValue =  y_SineMap(dim);
        for i=1:dim
            ub_i=ub(i);
            lb_i=lb(i);
            Positions(j,i)=SineMapValue(i).*(ub_i-lb_i)+lb_i;
            if(Positions(j,i)>ub_i)
                Positions(j,i) = ub_i;
            end
            if(Positions(j,i)<lb_i)
                Positions(j,i) = lb_i;
            end
        end
   end
end


%% 计算柯西反向
for i = 1:SearchAgents_no
    BPostion(i,:) = y_KBack(Positions(i,:),ub,lb);   
end
%合并种群
AllPositionsTemp = [Positions;BPostion];
AllPositions = AllPositionsTemp;
for i = 1:size(AllPositionsTemp,1)
   fitness(i) = fun(AllPositionsTemp(i,:)',func_num);
end
[fitness, index]= sort(fitness);%排序
for i = 1:2*SearchAgents_no
    AllPositions(i,:) = AllPositionsTemp(index(i),:);
end
%取适应度排名靠前的作为种群的初始化
Positions = AllPositions(1:SearchAgents_no,:);
end