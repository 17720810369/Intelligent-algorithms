

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%**********各 种 智  能 算 法 收 敛 性 能 比 较*************%%%%%%%%%%%%%%%%%%%

clear all 
clc
% SearchAgents_no=30; % Number of search agents 种群数量
% Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper) 设定适应度函数(1,2,13,22,)
% Max_iteration=50; % Maximum numbef of iterations 设定最大迭代次数

func_num=4; % F1到F12
dim=20; % 2/10/20维
lb=-100;
ub=100;
SearchAgents_no=30; %种群规模
Max_iteration=1000; %最大迭代次数
fhd=str2func('cec22_test_func');
% Load details of the selected benchmark function
% [lb,ub,dim,fobj]=x_Get_Functions_details(Function_name);  %设定边界以及优化函数
tic
%%%%%%%%%%%%%%%%%%%%%%%%***************导 入 各 种 智 能 算 法*******************%%%%%%%%%%%%%%%%%%%%%%
%原始天鹰算法
% [Best_score12,Best_pos12,l_AO_cg_curve12]=l_AO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %原始麻雀算法
% [Best_score8,Best_pos8,h_SSA_cg_curve8]=h_SSA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% % % 正余弦levy改进麻雀算法
% % [Best_score9,Best_pos9,i_ISSA_cg_curve9]=i_ISSA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% % %原始鲸鱼算法
 [Best_score1,Best_pos1,a_WOA_cg_curve1]=a_WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num); %开始优化
 [Best_score2,Best_pos2,PSO_cg_curve1]=PSO(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num); %开始优化
 [Best_score3,Best_pos3,SSA_cg_curve1]=h_SSA(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num); %开始优化
 [Best_score4,Best_pos4,AO_cg_curve1]=K_AO(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num); %开始优化
 [Best_score10,Best_pos10,g_TFMRFO_cg_curve1]=g_TFMRFO(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num); %开始优化
 %[Best_score5,Best_pos5,f_COCMRFO_cg_curve1]=f_COCMRFO(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num);
 [Best_score6,Best_pos6,MRFO_cg_curve1]=e_MRFO(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num);
 [Best_score7,Best_pos7,GWO_cg_curve1]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num);
 [Best_score8,Best_pos8,BOA_cg_curve1]=j_BOA(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num);
 [Best_score9,Best_pos9,SOA_cg_curve1]=GSA(SearchAgents_no,Max_iteration,lb,ub,dim,fhd,func_num);
 % % 混沌反馈鲸鱼算法
% [Best_score2,Best_pos2,b_CFAWOA_cg_curve2]=b_CFAWOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %差分变异混沌鲸鱼算法
% [Best_score4,Best_pos4,d_DECWOA_cg_curve4]=d_DECWOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %柯西反向鲸鱼算法（寻优最佳！！！）
% [Best_score3,Best_pos3,c_QOWOA_cg_curve3]=c_QOWOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %柯西反向混沌蝠鲼觅食算法（创新-专利2）
% [Best_score6,Best_pos6,f_COCMRFO_cg_curve6]=f_COCMRFO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %Limit阈值反馈蝠鲼觅食算法（创新-论文）
% [Best_score7,Best_pos7,g_TFMRFO_cg_curve7]=g_TFMRFO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% % 正余弦levy改进麻雀算法
% [Best_score9,Best_pos9,i_ISSA_cg_curve9]=i_ISSA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %原始蝠鲼觅食算法
% [Best_score5,Best_pos5,e_MRFO_cg_curve5]=e_MRFO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %原始蝴蝶算法
% [Best_score10,Best_pos10,j_BOA_cg_curve10]=j_BOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化
% %全局优化蝴蝶算法
% [Best_score11,Best_pos11,k_SMSCABOA_cg_curve11]=k_SMSCABOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); %开始优化

%绘图
% semilogy(BestCost_PSO,'--c','LineWidth',2)
% hold on
% semilogy(BestCost_GSA,'--k','LineWidth',2)
% hold on
% semilogy(BestCost_GWO,'--g','LineWidth',2)
% hold on
 semilogy(a_WOA_cg_curve1,'-r','LineWidth',2)
 hold on
 semilogy(PSO_cg_curve1,'-g','LineWidth',2)
 hold on
 semilogy( SSA_cg_curve1,'-m','LineWidth',2)
 hold on
 semilogy( AO_cg_curve1,'-k','LineWidth',2)
 hold on
 semilogy( g_TFMRFO_cg_curve1,'-b','LineWidth',2)
 hold on
 semilogy( MRFO_cg_curve1,'-c','LineWidth',2)
 hold on
 semilogy(GWO_cg_curve1,'--c','LineWidth',2)
 hold on
 semilogy( BOA_cg_curve1,'--K','LineWidth',2)
 hold on
 semilogy(SOA_cg_curve1,'--g','LineWidth',2)
 hold on

 
 
 % semilogy(BestCost_AVOA,'--m','LineWidth',2)
% hold on
% semilogy(BestCost_GTO,'-k','LineWidth',2)
% hold on
% semilogy(BestCost_DBO,'--b','LineWidth',2)
% hold on
% semilogy(BestCost_SO,'--r','LineWidth',2)

CurveTitle=['F',num2str(func_num)];


ylabel('Best Fitness Value');
title( CurveTitle,'FontName','Times New Roman','FontSize',12,'LineWidth',2)
xlabel('Iteration','FontName','Times New Roman','FontSize',12,'LineWidth',2);
ylabel('Best Fitness Value','FontName','Times New Roman','FontSize',12,'LineWidth',2);
axis square
legend('WOA','PSO','SSA','AO','HSIMRFO','MRFO','GWO','BOA','SOA')
axis tight
grid on
box on


%%%%%%%%%%%%%%%%%%%%%%%%%%*************各 种 算 法 优 化 曲 线****************%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% semilogy(l_AO_cg_curve12,'r','linewidth',2)
% hold on
% semilogy(h_SSA_cg_curve8,'g','linewidth',2)
% hold on
% semilogy(b_CFAWOA_cg_curve2,'c','linewidth',2)
% hold on
% semilogy(k_SMSCABOA_cg_curve11,'g','linewidth',1.5)
% hold on
% semilogy(i_ISSA_cg_curve9,'m','linewidth',2)
% hold on
% semilogy(a_WOA_cg_curve1,'m','linewidth',2)
% hold on
%   semilogy(d_DECWOA_cg_curve4,'b','linewidth',2)
% hold on
% semilogy(e_MRFO_cg_curve5,'k','linewidth',2)
% hold on
% semilogy(c_QOWOA_cg_curve3,'k','linewidth',2)
% hold on
% semilogy(e_MRFO_cg_curve5,'k:','linewidth',1.5)
% hold on
% semilogy(f_COCMRFO_cg_curve6,'k','linewidth',1.5)
% hold on
% semilogy(g_TFMRFO_cg_curve7,'k','linewidth',1.5)
% hold on
% semilogy(j_BOA_cg_curve10,'c:','linewidth',1.5)
% hold on

% set(gca,'linewidth',1.2);
% set(gca,'XTick',(0:50:500));
% set(gca,'YMinorTick','off');
% set(gca,'XGrid','off');
% set(gca,'YGrid','off');
% set(gca,'YMinorGrid','off')
% set(gca,'GridLineStyle',':');
% set(gca,'GridAlpha',0.2);
% legend('AO','SSA','DE','WOA','CFAWOA','DECWOA');



% title('Objective space')
% xlabel('Iteration');
% ylabel('适应度值/FBest score obtained so far');
% xlabel('迭代次数/I');
% ylabel('适应度值/F');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% legend('WOA','CFAWOA','DECWOA','BOA','SMSCABOA','AO');
%%%%%开题
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% axis tight
% grid on
% box on
% display(['The best solution obtained by WOA is : ', num2str(Best_pos1)]);
% display(['The best optimal value of the objective funciton found by WOA is : ', num2str(Best_score1)]);
%         
% display(['The best solution obtained by CFAWOA is : ', num2str(Best_pos2)]);
% display(['The best optimal value of the objective funciton found by CFAWOA is : ', num2str(Best_score2)]);
%         
% display(['The best solution obtained by QOWOA is : ', num2str(Best_pos3)]);
% display(['The best optimal value of the objective funciton found by QOWOA is : ', num2str(Best_score3)]);
% 
% display(['The best solution obtained by DECWOA is : ', num2str(Best_pos4)]);
% display(['The best optimal value of the objective funciton found by DECWOA is : ', num2str(Best_score4)]);
%         
% display(['The best solution obtained by MRFO is : ', num2str(Best_pos5)]);
% display(['The best optimal value of the objective funciton found by MRFO is : ', num2str(Best_score5)]);
%         
% display(['The best solution obtained by COCMRFO is : ', num2str(Best_pos6)]);
% display(['The best optimal value of the objective funciton found by COCMRFO is : ', num2str(Best_score6)]);
%         
% display(['The best solution obtained by TFMRFO is : ', num2str(Best_pos7)]);
% display(['The best optimal value of the objective funciton found by TFMRFO is : ', num2str(Best_score7)]);
% 
% display(['The best solution obtained by SSA is : ', num2str(Best_pos8)]);
% display(['The best optimal value of the objective funciton found by SSA is : ', num2str(Best_score8)]);
%         
% display(['The best solution obtained by ISSA is : ', num2str(Best_pos9)]);
% display(['The best optimal value of the objective funciton found by ISSA is : ', num2str(Best_score9)]);
%         
% display(['The best solution obtained by BOA is : ', num2str(Best_pos10)]);
% display(['The best optimal value of the objective funciton found by BOA is : ', num2str(Best_score10)]);
%         
% display(['The best solution obtained by SMSCABOA is : ', num2str(Best_pos11)]);
% display(['The best optimal value of the objective funciton found by SMSCABOA is : ', num2str(Best_score11)]);
% 
% display(['The best solution obtained by AO is : ', num2str(Best_pos12)]);
% display(['The best optimal value of the objective funciton found by AO is : ', num2str(Best_score12)]);


% %测试
% display(['The best solution obtained by AAAWOA is : ', num2str(Best_pos13)]);
% display(['The best optimal value of the objective funciton found by AAAWOA is : ', num2str(Best_score13)]);

toc

