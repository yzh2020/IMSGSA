% �������������㷨-���������ѧ-���л�-2023.01.01-yangzhonghua@stu.xjtu.edu.cn
%%%%%%%%%%%%%%���������ѧ-���л�-2023.01.01-yangzhonghua@stu.xjtu.edu.cn
 clc,clear,close all
 warning off
 feature jit off
 addpath('./XGSA/')%����㷨·��
 addpath('./IMSGSA/')%����㷨·��
 N=50;           % �������������ܸ��壩
 base_it=10000;    % ����������10000
 Group=5;%����
 ElitistCheck=1; % ElitistCheck: �㷨ִ�д���ѡ��
 Rpower=1;       % Rpower: 'R'�Ĵη�
 min_flag=1;     % 1: ������Сֵ��0���������ֵ
 % ����⺯��ѡ�� % ����⺯��ѡ��14-2��15-4��16-2��17-2��18-2��19-3��20-6��21-4��22-4��23-4]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; 
  index_F=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 [lie,F_size]=size(index_F);
 % ����⺯��ѡ��% ����⺯��ѡ�� % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  X_dim_C=[50];
  X_dim_C=[100];
 [lieDim,X_size]=size(X_dim_C);
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  Iterf=1;StepSize=10;Nmax=57;
  Gconstant_m=1;% 
 % ��ȡ�����Ŀ�귽�̵�δ֪�������Լ�ȡֵ��Χ
  Type=1;%1-Basic��׼���Ժ���;2-Test Functions���Ӳ��Ժ��� 
  % ����ĳ�ʼ������
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
                     disp(['��ʼʱ�䣺',num2str(T(1)),'/',num2str(T(2)),'/',num2str(T(3)),'/',num2str(T(4)),'/',num2str(T(5))]);
                     for i=1:Num
                        X=Pinitialization(dim,N,ub,lb); up=ub;low=lb;    X20=X;
%%%%%%%%%%%%%IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA-IMSGSA
                        TimeIMSGSA=tic;
                        [FBbest20(i),LBbest20(i,:),BBestChart20(i,:),BMeanChart20(i,:)]=IMSGSA(X20,F_index,N,max_it,ElitistCheck,min_flag,Rpower,dim,up,low,Type);%IMSGSA                   
                        elapsedTimeIMSGSA(i)=toc(TimeIMSGSA);
                        %%%%%%%%%%%%%%%%AAAAAAAAAAAAAAAAAAAAAA
                        disp(['���д�����',num2str(i,'%1.0f'),' IMSGSA��',num2str(FBbest20(i),'%1.300f')]);
                     end
                    
                     BestChartIMSGSA=mean(BBestChart20);
                %%�������ݱ�������%%�������ݱ�������%%�������ݱ�������
                    save(filename,'FBbest20','BestChartIMSGSA','elapsedTimeIMSGSA');

                    disp(['������ţ�',num2str(F_index,'%1.0f'),'����ά����',num2str(dim,'%1.0f')])
                    T=clock;
                    disp([num2str(T(1)),'/',num2str(T(2)),'/',num2str(T(3)),'/',num2str(T(4)),'/',num2str(T(5))]);           
                   %%IMSGSA
                    FBbest20=[];LBbest20=[];BBestChart20=[];BMeanChart20=[];%% 
                    elapsedTimeIMSGSA=[];
                 else
                     break;
                 end
             end
            disp(['hanshu��',num2str(F_index,'%1.0f')])
         else
             break;
         end
     end
end
%% ������Ӧ������

























 

