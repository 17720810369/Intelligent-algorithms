%% 蝠鲼觅食优化算法
function [Leader_score,Leader_pos,Convergence_curve]=e_MRFO(SearchAgents_no,Max_iter,lb,ub,dim,fobj,func_num)

    %初始化种群并获取适应度值
    for i=1:SearchAgents_no   
        PopPos(i,:)=rand(1,dim).*(ub-lb)+lb;
        PopFit(i)=fobj(PopPos(i,:)',func_num);   
    end
       Leader_score=inf;
       Leader_pos=[];
    %记录初始最优适应度值
    for i=1:SearchAgents_no
        if PopFit(i)<=Leader_score
           Leader_score=PopFit(i);
           Leader_pos=PopPos(i,:);
        end
    end

    Convergence_curve=zeros(Max_iter,1);


for It=1:Max_iter  
     Coef=It/Max_iter; 
     
        % 对最优位置判断进行何种操作
       if rand<0.5 %进行螺旋觅食操作
          r1=rand;                         
          Beta=2*exp(r1*((Max_iter-It+1)/Max_iter))*(sin(2*pi*r1));    
          if  Coef>rand                                                      
              newPopPos(1,:)=Leader_pos+rand(1,dim).*(Leader_pos-PopPos(1,:))+Beta*(Leader_pos-PopPos(1,:)); %Equation (4)
          else
              IndivRand=rand(1,dim).*(ub-lb)+lb;                                
              newPopPos(1,:)=IndivRand+rand(1,dim).*(IndivRand-PopPos(1,:))+Beta*(IndivRand-PopPos(1,:)); %Equation (7)         
          end              
       else %链式觅食操作
            Alpha=2*rand(1,dim).*(-log(rand(1,dim))).^0.5;           
            newPopPos(1,:)=PopPos(1,:)+rand(1,dim).*(Leader_pos-PopPos(1,:))+Alpha.*(Leader_pos-PopPos(1,:)); %Equation (1)
       end
      % 对其他位置判断进行何种操作
    for i=2:SearchAgents_no
        if rand<0.5%进行螺旋觅食操作
           r1=rand;                         
           Beta=2*exp(r1*((Max_iter-It+1)/Max_iter))*(sin(2*pi*r1));    
             if  Coef>rand                                                      
                 newPopPos(i,:)=Leader_pos+rand(1,dim).*(PopPos(i-1,:)-PopPos(i,:))+Beta*(Leader_pos-PopPos(i,:)); %Equation (4)
             else
                 IndivRand=rand(1,dim).*(ub-lb)+lb;                                
                 newPopPos(i,:)=IndivRand+rand(1,dim).*(PopPos(i-1,:)-PopPos(i,:))+Beta*(IndivRand-PopPos(i,:));  %Equation (7)       
             end              
        else %链式觅食操作
            Alpha=2*rand(1,dim).*(-log(rand(1,dim))).^0.5;           
            newPopPos(i,:)=PopPos(i,:)+rand(1,dim).*(PopPos(i-1,:)-PopPos(i,:))+Alpha.*(Leader_pos-PopPos(i,:)); %Equation (1)
       end         
    end
    %计算更新后的适应度值     
   for i=1:SearchAgents_no        
       newPopPos(i,:)=SpaceBound(newPopPos(i,:),ub,lb);
       newPopFit(i)=fobj(newPopPos(i,:)',func_num);    
      if newPopFit(i)<PopFit(i)
         PopFit(i)=newPopFit(i);
         PopPos(i,:)=newPopPos(i,:);
      end
   end
    %种群进行翻滚觅食操作
    S=2;
    for i=1:SearchAgents_no           
        newPopPos(i,:)=PopPos(i,:)+S*(rand*Leader_pos-rand*PopPos(i,:)); %Equation (8)
    end
     %更新种群，用适应度较好的位置代替适应度较差的位置。
     for i=1:SearchAgents_no        
         newPopPos(i,:)=SpaceBound(newPopPos(i,:),ub,lb);
         newPopFit(i)=fobj(newPopPos(i,:)',func_num);    
         if newPopFit(i)<PopFit(i)
            PopFit(i)=newPopFit(i);
            PopPos(i,:)=newPopPos(i,:);
         end
     end
     %更新全局最优位置
     for i=1:SearchAgents_no
        if PopFit(i)<Leader_score
           Leader_score=PopFit(i);
           Leader_pos=PopPos(i,:);            
        end
     end
     Convergence_curve(It)=Leader_score;
end

function  X=SpaceBound(X,Up,Low)
    Dim=length(X);
    S=(X>Up)+(X<Low);    
    X=(rand(1,Dim).*(Up-Low)+Low).*S+X.*(~S);

end
end