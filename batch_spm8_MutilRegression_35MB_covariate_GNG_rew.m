
clc
clear
spm('defaults', 'FMRI')

spm_jobman('initcfg'); % SPM8 only


% specify default job
default_job8 = '/mnt/data/scripts/GNG_reward/2level_analysis/batch_2ndLevel_MutilRegression.mat';

% % male
Q_all = {'AdsK','AinA','AmsW','AtpS','BurM','CimD','ComD','CroR','CruM',...
    'EmiH','FejK','GeiJ','GorC','GreL','HalS','HauE','HeaF','JakE',...
    'JesH','JorO','KanG','LemJ','ManR','MarK','MejJ','PolW','RowE',...
    'SalV','SevP','SmiL','SmiT','SunJ','TatJ','WruB','ZakY'};


% All
% Q_all = {'AccV','AdsK','AinA','AmsW','AroJ','AtpS','BalJ','BarI','BatC',...
%     'BroL','BurM','CamO','CimD','ComD','ComS','CovE','CroR','CruM','DecG',...
%     'DechK','DechKY','DecS','DumC','EmiH','FeaA','FejK','GarK','GeiJ',...
%     'GorC','GreL','HalS','HauE','HeaF','HicT','HugR','IdeJ','JakE','JesH',...
%     'JonN','JorO','KanG','LemJ','LesR','ManR','MarK','MckR','MejJ','MelN',...
%     'MonM','PolW','PunM','RobM','RowE','SalV','SevP','SmiL','SmiT','SunJ',...
%     'TatJ','ThoM','TouR','VelJ','WalR','WanW','WilD','WilT','WruB','YouJ',...
%     'ZakY','ZhoS'};%
% % Female
% Q_all = {'AccV','AroJ','AtpS','BalJ','BarI','BatC','BroL','BurM','CamO','ComS',...
%     'DechK','DechKY','DecS','EmiH','FejK','GarK','GreL','HauE','HeaF',...
%     'HicT','HugR','JesH','JonN','JorO','ManR','MarK','PunM','RobM',...
%     'SalV','SevP','SmiL','SunJ','VelJ','WilT','YouJ','ZakY'}; % 'MarK_2',,
% 
dire_FIX='/mnt/data/GNG_reward/1st_level_analysis/GNG_Onset_Model_withError_S71_v2/';
model_name='_Onset_Model_withError';
dire_save='/mnt/data/GNG_reward/group_results_S35_first_paper/Regression_with_GS_dollar_vs_control_RT_windowdur/';

read_name='/mnt/data/scripts/GNG_reward/for_regression_S35.xlsx';
sheet_name='Sheet1';
read_behavior=xlsread(read_name,sheet_name,strcat('i2:i36'));
name_behavior={'GS_dollar_GS_control_RT'};

windowdur=xlsread(read_name,sheet_name,strcat('q2:q36'));

% Pun=xlsread(read_name,sheet_name,strcat('G2:G71'));
% Rew=xlsread(read_name,sheet_name,strcat('H2:H71'));
% Age=xlsread(read_name,sheet_name,strcat('D2:D71'));
% AUDIT=xlsread(read_name,sheet_name,strcat('E2:E71'));
% UPPS=xlsread(read_name,sheet_name,strcat('F2:F71'));

save_name{1} = 'GS_reward>NGS_reward';
save_name{2} = 'NGS_reward>GS_reward';
save_name{3} = 'GS_dollar>NGS_dollar';
save_name{4} = 'NGS_dollar>GS_dollar';
save_name{5} = 'GS_5cent>NGS_5cent';
save_name{6} = 'NGS_5cent>GS_5cent';
save_name{7} = 'GS_reward>GS_control';
save_name{8} = 'GS_control>GS_reward';
save_name{9} = 'GS_dollar>GS_5cent';
save_name{10} = 'GS_5cent>GS_dollar';
save_name{11} = 'NGS_reward>NGS_control';
save_name{12} = 'NGS_control>NGS_reward';
save_name{13} = 'NGS_dollar>NGS_5cent';
save_name{14} = 'NGS_5cent>NGS_dollar';
save_name{15} = 'GS_reward>GE_reward';
save_name{16} = 'GE_reward>GS_reward';
save_name{17} = 'GE_reward>GE_control';
save_name{18} = 'GE_control>GE_reward';
save_name{19} = 'reward_error>control_error';
save_name{20} = 'control_error>reward_error';
save_name{21} = 'GS_dollar>GS_control';
% save_name{22} = 'NGS_5cent>NGS_control';
% save_name{23} = 'GS_5cent>GS_control';
% save_name{24} = 'NGS_dollar>NGS_control';
% save_name{25} = 'NGS_reward>NGE_reward';
% save_name{26} = 'NGE_reward>NGS_reward';
% save_name{27} = 'GS_dollar>GE_dollar';
% save_name{28} = 'GE_dollar>GS_dollar';
% save_name{29} = 'GS_nickel>GE_nickel';
% save_name{30} = 'GE_nickel>GS_nickel';
% save_name{31} = 'GS_control>GE_control';
% save_name{32} = 'GE_control>GS_control';
% save_name{33} = 'GE_dollar>NGE_dollar';
% save_name{34} = 'GE_nickel>NGE_nickel';
% save_name{35} = '(GS_reward-GS_control)>(NGS_reward-NGS_control)';
% save_name{36} = '(NGS_reward-NGS_control)>(GS_reward-GS_control)';
% save_name{37} = '(NGS_dollar-GS_dollar)>(NGS_5cent-GS_5cent)';
% save_name{38} = '(NGS_5cent-GS_5cent)>(NGS_dollar-GS_dollar)';
% save_name{39} = '(GS_reward+NGS_reward)>(GS_control+NGS_control)';
% save_name{40} = '(GE_reward-GS_reward)>(NGE_reward-NGS_reward)';
% save_name{41} = '(GE_reward+NGE_reward)>(GS_reward+NGS_reward)';
% save_name{42} = '(GE_reward+NGE_reward)>(GE_control+NGE_control)';
% save_name{43} = '(GE_reward-GE_control)>(NGE_reward-NGE_control)';
% save_name{44} = 'GE_reward>NGE_reward';
% save_name{45} = 'NGE_reward>NGE_control';

for behavior_i=1:length(name_behavior)
    for con_num=1:length(save_name)
        add_str=[];
        matlabbatch = [];
        load(default_job8);
        output_dir=strcat(dire_save,name_behavior{behavior_i},'/',save_name{con_num});
        if con_num>9
            add_str=strcat('con_00',int2str(con_num));
        else
            add_str=strcat('con_000',int2str(con_num));
        end
        
        if ~exist(output_dir)
            mkdir(output_dir);
        end
        
        % myjob = matlabbatch{1}.spm.stats.factorial_design;
        myjob.dir{1} = output_dir;
        
        for sub_i=1:length(Q_all)
            myjob.des.mreg.scans{sub_i,1}=strcat(dire_FIX,strcat('ALC_',Q_all{sub_i}),model_name,'/',add_str,'.img,1');
        end
        myjob.des.mreg.mcov(1).c=windowdur;
        myjob.des.mreg.mcov(1).cname = 'windowdur';
        myjob.des.mreg.mcov(1).iCC = 1;
       
%         myjob.des.mreg.mcov(1).c=Edu;
%         myjob.des.mreg.mcov(1).cname = 'Edu';
%         myjob.des.mreg.mcov(1).iCC = 1;
%         
%         myjob.des.mreg.mcov(2).c=Sex;
%         myjob.des.mreg.mcov(2).cname = 'Sex';
%         myjob.des.mreg.mcov(2).iCC = 1;
% 
% 
%         myjob.des.mreg.mcov(3).c=Rew;
%         myjob.des.mreg.mcov(3).cname = 'Rew';
%         myjob.des.mreg.mcov(3).iCC = 1;
                
        myjob.des.mreg.mcov(2).c= read_behavior(:,behavior_i);
        myjob.des.mreg.mcov(2).cname = name_behavior{behavior_i};
        myjob.des.mreg.mcov(2).iCC = 1;
        myjob.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});

        myjob.des.mreg.incint=1;
        
        
        myjob.masking.tm.tm_none = 1;
        myjob.masking.im = 1;
        myjob.masking.em = {''};
        myjob.globalc.g_omit = 1;
        myjob.globalm.gmsca.gmsca_no = 1;
        myjob.globalm.glonorm = 1;
        
        % execute
        matlabbatch{1}.spm.stats.factorial_design = myjob;
        
        spm_jobman('run',matlabbatch); % execute job
        %spm quit
        
        % estimate model
        cpath = pwd;
        cd(output_dir);
        load SPM.mat;
        SPM = spm_spm(SPM);
        %cd(cpath);
        
        SPM = rmfield(SPM,'xCon');
        ctyp=cell(1,2);
        cnam = cell(1,2);
        ctyp{1} = 'T'; ctyp{2} = 'T';
        
        cnam{1} = 'positive';
        cnam{2} = 'negative';
        
        cwgt = cell(1,2);
        cwgt{1} = [0 0 1]';
        cwgt{2} = [0 0 -1]';
         
        for i=1:length(cnam)
            SPM.xCon(i) = spm_FcUtil('Set',cnam{i},ctyp{i},'c',cwgt{i},SPM.xX.xKXs);
        end
        % and evaluate
        %---------------------------------------------------------------------------
        spm_contrasts(SPM);
    end
end