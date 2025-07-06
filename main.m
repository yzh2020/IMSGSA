% 万有引力搜索算法-西安交大大学-杨中华-2023.01.01-yangzhonghua@stu.xjtu.edu.cn
%%%%%%%%%%%%%%西安交大大学-杨中华-2023.01.01-yangzhonghua@stu.xjtu.edu.cn
 clc,clear,close all
 warning off
 feature jit off
 addpath('./XGSA/')%添加算法路径
 addpath('./IMSGSA/')%添加算法路径
 N=50;           % 粒子数量（智能个体）
 base_it=10000;    % 最大迭代次数10000
 Group=5;%组数
 ElitistCheck=1; % ElitistCheck: 算法执行次数选择
 Rpower=1;       % Rpower: 'R'的次方
 min_flag=1;     % 1: 求函数最小值，0：求函数最大值
 % 带求解函数选择 % 带求解函数选择14-2，15-4，16-2，17-2，18-2，19-3，20-6，21-4，22-4，23-4]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; 
  index_F=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 [lie,F_size]=size(index_F);
 % 带求解函数选择% 带求解函数选择 % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  X_dim_C=[50];
  X_dim_C=[100];
 [lieDim,X_size]=size(X_dim_C);
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  Iterf=1;StepSize=10;Nmax=57;
  Gconstant_m=1;% 
 % 获取待求解目标方程的未知数个体以及取值范围
  Type=1;%1-Basic基准测试函数;2-Test Functions复杂测试函数 
  % 随机的初始化个体
%   F_index=1;max_it=2000;dim=30;[lb,ub,dim]=Ptest_functions_range(F_index,dim,Type);
%   X=Pinitialization(dim,N,ub,lb); up=ub;low=lb;
  Num=30;%Num=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  fileID=fopen('./readme.txt','a+');strt1 = '-';strt2 = {32};strt3 = ':';
  T=clock;
  filetimeID = char(strcat(num2str(T(1)),num2str(strt1),num2str(T(2)),num2str(strt1),num2str(T(3)),{32},num2str(T(4)),num2str(strt3),num2str(T(5))));
%   fprintf(fileID,'\n'filetimeID'\n');
  fprintf(fileID,'\n');
  fwrite(fileID,filetimeID);
  fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for kk=1:lie
     for j=1:F_size
         if (index_F(kk,j)~=0)
             for k=1:X_size
                 dim=X_dim_C(kk,k);
                 if(dim~=0)
                     F_index=index_F(kk,j);
                     str1 = 'Filel';str2 = num2str(F_index);str3 = '-';str4 =num2str(dim);str5 = '.mat';
                     filename = char(strcat(str1,str2,str3,str4,str5));
                     [lb,ub,dim]=Ptest_functions_range(F_index,dim,Type);
                     max_it=base_it*dim/N; 
                     T=clock;
                     disp(['开始时间：',num2str(T(1)),'/',num2str(T(2)),'/',num2str(T(3)),'/',num2str(T(4)),'/',num2str(T(5))]);
                     for i=1:Num
                        X=Pinitialization(dim,N,ub,lb); up=ub;low=lb;    X20=X;
%%%%%%%%%%%%%IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA
                        TimeIMSGSA=tic;
                        [FBbest20(i),LBbest20(i,:),BBestChart20(i,:),BMeanChart20(i,:)]=IMSGSA(X20,F_index,N,max_it,ElitistCheck,min_flag,Rpower,dim,up,low,Type);%IMSGSA                   
                        elapsedTimeIMSGSA(i)=toc(TimeIMSGSA);
                        %%%%%%%%%%%%%%%%AAAAAAAAAAAAAAAAAAAAAA
                        disp(['运行次数：',num2str(i,'%1.0f'),' IMSGSA：',num2str(FBbest20(i),'%1.300f')]);
                     end
                    
                     BestChartIMSGSA=mean(BBestChart20);
                %%保存数据保存数据%%保存数据保存数据%%保存数据保存数据
                    save(filename,'FBbest20','BestChartIMSGSA','elapsedTimeIMSGSA');

                    disp(['函数序号：',num2str(F_index,'%1.0f'),'运行维数：',num2str(dim,'%1.0f')])
                    T=clock;
                    disp([num2str(T(1)),'/',num2str(T(2)),'/',num2str(T(3)),'/',num2str(T(4)),'/',num2str(T(5))]);           
                   %%IMSGSA
                    FBbest20=[];LBbest20=[];BBestChart20=[];BMeanChart20=[];%% 
                    elapsedTimeIMSGSA=[];
                 else
                     break;
                 end
             end
            disp(['hanshu：',num2str(F_index,'%1.0f')])
         else
             break;
         end
     end
end
%% 绘制适应度曲线

























 

