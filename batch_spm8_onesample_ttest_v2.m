% this version group dollar and nickel together into a single reward condition
function batch_spm8_onesample_ttest_v2()
clear
spm('defaults', 'FMRI')

spm_jobman('initcfg'); % SPM8 only

cal_flag=4; % 1- Onset_Model, 7 subjects;, 2- Onset_model, 23 MB subjects, 3- Onset_model, 30 combined subjects 
            % 4- Onset_model, 35 MB subjects, 5- onset_model, 35MB+7=42, 
            % 6- Onset_model_withError, 27 subjects (only subjects with error trials > 10 were selected)
            % 7- 10m+10f, 8- Onset_model, 69 subjects, 9- Onset_model, 45
            % subjects with audit score =<8, 10- Onset_model, 35
            % subjects with audit score =<8 , 11- 65 attentive subjects
            % with good behav; 12- original 35 minus MarK and SunK due to
            % run issue; 13- 59 subjects with at least 50% accuracy on GS
            % dollar and GS control; 1x- 43 subjects with at least 50% accuracy on GS
            % dollar and GS control and GS nickel;14- 38 subjects with at least 50% accuracy on GS
            % dollar and GS control and GS nickel and aged less than 50;
            % 15- control first only; 16- control middle only; 17- 41
            % subjects with good behv after considering NGS difference

            
switch cal_flag
    case 1
        dire_FIX='F:/go_nogo_reward_task/Onset_Model_withError/';
        dire_save='F:/go_nogo_reward_task/group_results/OneSample_ttest_7subjects/';
        model_name='_Onset_Model_withError';
        Q_all = {'bpGNG_AlvD','bpGNG_BulS','bpGNG_LiG','bpGNG_ManP','bpGNG_PeiV','bpGNG_SolM','bpGNG_ZhoJ'};
    case 2
        dire_FIX='E:/Alcohol_craving/GNG_Onset_Model/';
        dire_save='F:/go_nogo_reward_task/group_results/OneSample_ttest_23MBsubjects/';
        model_name='_Onset_Model';
        Q_all = {'ALC_AinA','ALC_AmsW','ALC_BurM','ALC_CruM','ALC_FejK',...
            'ALC_GreL','ALC_GorC','ALC_HalS','ALC_HauE','ALC_HeaF',...
            'ALC_JakE','ALC_JesH','ALC_KanG','ALC_LemJ','ALC_Mark',...
            'ALC_PolW','ALC_RowE','ALC_SevP','ALC_SmiL','ALC_SmiT',...
            'ALC_TatJ','ALC_WruB','ALC_ZakY'};
    case 3
        Q_all = {'bpGNG_AlvD','bpGNG_BulS','bpGNG_LiG','bpGNG_ManP','bpGNG_PeiV','bpGNG_SolM','bpGNG_ZhoJ',...
            'ALC_AinA','ALC_AmsW','ALC_BurM','ALC_CruM','ALC_FejK',...
            'ALC_GreL','ALC_GorC','ALC_HalS','ALC_HauE','ALC_HeaF',...
            'ALC_JakE','ALC_JesH','ALC_KanG','ALC_LemJ','ALC_Mark',...
            'ALC_PolW','ALC_RowE','ALC_SevP','ALC_SmiL','ALC_SmiT',...
            'ALC_TatJ','ALC_WruB','ALC_ZakY'};
        for i=1:length(Q_all)
            if i<8
                dire_FIX{i}='F:/go_nogo_reward_task/Onset_Model_withError/';
                model_name{i}='_Onset_Model_withError';
            else
                dire_FIX{i}='E:/Alcohol_craving/GNG_Onset_Model/';
                model_name{i}='_Onset_Model';
            end
        end
        dire_save='F:/go_nogo_reward_task/group_results/OneSample_ttest_30CombinedSubjects/';
    case 4
        Q_all = {'AdsK','AinA','AmsW','AtpS','BurM',...
            'CimD','ComD','CroR','CruM','EmiH',...
            'FejK','GeiJ','GorC','GreL','HalS',...
            'HauE','HeaF','JakE','JesH','JorO',...
            'KanG','LemJ','ManR','MarK','MejJ',...
            'PolW','RowE','SalV','SevP','SmiL',...
            'SmiT','SunJ','TatJ','WruB','ZakY'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError_PPI/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_35_Subjects_v2/';
    case 5
        Q_all = {'bpGNG_AlvD','bpGNG_BulS','bpGNG_LiG','bpGNG_ManP','bpGNG_PeiV','bpGNG_SolM','bpGNG_ZhoJ',...
            'ALC_AdsK','ALC_AinA','ALC_AmsW','ALC_AtpS','ALC_BurM',...
            'ALC_CimD','ALC_ComD','ALC_CroR','ALC_CruM','ALC_EmiH',...
            'ALC_FejK','ALC_GeiJ','ALC_GorC','ALC_GreL','ALC_HalS',...
            'ALC_HauE','ALC_HeaF','ALC_JakE','ALC_JesH','ALC_JorO',...
            'ALC_KanG','ALC_LemJ','ALC_ManR','ALC_Mark','ALC_MejJ',...
            'ALC_PolW','ALC_RowE','ALC_SalV','ALC_SevP','ALC_SmiL',...
            'ALC_SmiT','ALC_SunJ','ALC_TatJ','ALC_WruB','ALC_ZakY'};
        for i=1:length(Q_all)
            dire_FIX{i}='E:/Alcohol_craving/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='F:/go_nogo_reward_task/group_results/OneSample_ttest_42Subjects/';
    case 6
        Q_all = {'bpGNG_AlvD','bpGNG_BulS','bpGNG_LiG','bpGNG_ManP','bpGNG_PeiV','bpGNG_SolM','bpGNG_ZhoJ',...
            'ALC_AinA','ALC_AmsW','ALC_AtpS','ALC_BurM',...
            'ALC_ComD','ALC_EmiH',...
            'ALC_FejK','ALC_GeiJ','ALC_GreL','ALC_HalS',...
            'ALC_HauE','ALC_HeaF',...
            'ALC_KanG','ALC_LemJ','ALC_ManR','ALC_Mark','ALC_MejJ',...
            'ALC_RowE','ALC_SmiL',...
            'ALC_WruB'};
        for i=1:length(Q_all)
            dire_FIX{i}='E:/Alcohol_craving/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='F:/go_nogo_reward_task/group_results/OneSample_ttest_Error_27Subjects/';
    case 7
        Q_all = {'ALC_AtpS','ALC_GreL','ALC_HauE','ALC_HeaF','ALC_JorO',...
            'ALC_Mark','ALC_SalV','ALC_SevP','ALC_SmiL','ALC_ZakY',...
            'ALC_AdsK','ALC_ComD','ALC_CroR','ALC_CruM','ALC_HalS',...
            'ALC_KanG','ALC_ManR','ALC_MejJ','ALC_PolW','ALC_SmiT'};
        for i=1:length(Q_all)
            dire_FIX{i}='E:/Alcohol_craving/GNG_Onset_Model/';
            model_name{i}='_Onset_Model';
        end
        dire_save='F:/GNG_task_MB/results_10M10F/OneSample_ttest_10M10F/';
    case 8
        Q_all = {'AccV','AdsK','AinA','AmsW','AroJ','AtpS','BalJ','BarI','BatC',...
            'BroL','BurM','CamO','CimD','ComD','ComS','CovE','CroR','CruM','DecG',...
            'DechK','DechKY','DecS','DumC','EmiH','FeaA','FejK','GarK','GeiJ',...
            'GorC','GreL','HalS','HauE','HeaF','HicT','HugR','IdeJ','JakE',...
            'JesH','JonN','JorO','KanG','LemJ','LesR','ManR',...
            'MckR','MejJ','MelN','MonM','PolW','PunM','RobM','RowE','SalV',...
            'SevP','SmiL','SmiT','SunJ','TatJ','ThoM','TouR','VelJ','WalR','WanW','WilD',...
            'WilT','WruB','YouJ','ZakY','ZhoS'}; % no MarK or MarK_2
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_69_Subjects/';
        
    case 9
        Q_all = {'HicT','WruB','PolW','IdeJ','ComS','DechKY','GreL','WanW','PunM','DechK',...
    'JonN','ManR','ComD','FejK','KanG','JakE','MarK','RobM','MelN','DecS',...
    'AroJ','MarK_2','VelJ','DecG','BurM','RowE','HeaF','GarK','EmiH','SunJ',...
    'SmiT','ZakY','ZhoS','YouJ','JesH','SevP','AtpS','SmiL','MonM','GorC',...
    'AdsK','HalS','CimD','AinA','AccV'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_45_Subjects/';
    case 10
        Q_all = {'HicT','WruB','PolW','IdeJ','ComS','DechKY','GreL','WanW','PunM','DechK',...
            'JonN','ManR','ComD','FejK','KanG','JakE','MarK','RobM','MelN','DecS',...
            'AroJ','MarK_2','VelJ','DecG','BurM','RowE','HeaF','GarK','EmiH','SunJ',...
            'SmiT','ZakY','ZhoS','YouJ'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_34_Subjects/';
    case 11
        Q_all = {'AccV','AdsK','AinA','AmsW','AroJ','AtpS','BalJ','BarI','BatC',...
            'BroL','BurM','CamO','CimD','ComD','CovE','CroR','CruM','DecG',...
            'DechK','DechKY','DecS','DumC','EmiH','FeaA','FejK','GarK','GeiJ',...
            'GorC','GreL','HalS','HauE','HeaF','HicT','HugR','IdeJ','JakE',...
            'JesH','JonN','JorO','KanG','LemJ','ManR',...
            'MckR','MejJ','MelN','MonM','PolW','RobM','RowE','SalV',...
            'SevP','SmiL','SmiT','TatJ','ThoM','TouR','VelJ','WalR','WanW','WilD',...
            'WilT','WruB','YouJ','ZakY','ZhoS'}; % no MarK or MarK_2,'ComS','LesR','PunM','SunJ'
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_65_Subjects/';
    case 12
        Q_all = {'AdsK','AinA','AmsW','AtpS','BurM',...
            'CimD','ComD','CroR','CruM','EmiH',...
            'FejK','GeiJ','GorC','GreL','HalS',...
            'HauE','HeaF','JakE','JesH','JorO',...
            'KanG','LemJ','ManR','MejJ',...
            'PolW','RowE','SalV','SevP','SmiL',...
            'SmiT','TatJ','WruB','ZakY'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_33_Subjects/';
    case 13
        Q_all = {'AccV','AdsK','AinA','AmsW','AroJ','AtpS','BalJ','BarI',...
            'BurM','CamO','CimD','ComD','ComS','CovE','CroR','CruM',...
            'DechK','DecS','DumC','EmiH','FeaA','FejK','GarK','GeiJ',...
            'GorC','GreL','HalS','HauE','HeaF','HugR','IdeJ','JakE',...
            'JesH','JorO','KanG','LemJ','ManR',...
            'MckR','MejJ','MelN','MonM','PolW','RobM','RowE','SalV',...
            'SevP','SmiL','SmiT','TatJ','ThoM','TouR','VelJ','WalR','WanW',...
            'WilT','WruB','YouJ','ZakY','ZhoS'}; % no MarK or MarK_2
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_59_Subjects/';
    case 14
        Q_all = {'AdsK','AinA','AmsW','AroJ','AtpS',...
            'BurM','CimD','CruM',...
            'DecS','DumC','EmiH','FejK','GarK','GeiJ',...
            'GorC','GreL','HalS','HeaF','JakE','JesH','JorO','KanG','LemJ',...
            'ManR','MckR','MejJ','MelN','PolW','RobM','SalV',...
            'SevP','SmiT','TatJ','ThoM','TouR','VelJ',...
            'WilT','ZakY'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_38_Subjects/';
    case 15
        Q_all = {'AccV','AroJ','BalJ','BarI','BatC',...
            'BroL','CamO','ComS','CovE','DecG',...
            'DechK','DechKY','DecS','DumC','GarK','HicT','HugR','IdeJ',...
            'JonN','LesR',...
            'MckR','MelN','MonM','PunM','RobM',...
            'ThoM','TouR','VelJ','WalR','WanW','WilD',...
            'WilT','YouJ','ZhoS'}; % no MarK or MarK_2
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_34_Subjects_CTL_first/';
    case 16
        Q_all = {'AdsK','AinA','AmsW','AtpS','BurM',...
            'CimD','ComD','CroR','CruM','EmiH','FeaA',...
            'FejK','GeiJ','GorC','GreL','HalS',...
            'HauE','HeaF','JakE','JesH','JorO',...
            'KanG','LemJ','ManR','MarK','MejJ',...
            'PolW','RowE','SalV','SevP','SmiL',...
            'SmiT','SunJ','TatJ','WruB','ZakY'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_36_Subjects_CTL_middle/';
    case 17
        Q_all = {'AdsK','AinA','AmsW','AtpS','BurM',...
            'CimD','ComD','CroR','CruM','EmiH','FeaA',...
            'FejK','GeiJ','GorC','GreL','HalS',...
            'HauE','HeaF','JakE','JesH','JorO',...
            'KanG','LemJ','ManR','MarK','MejJ',...
            'PolW','RowE','SalV','SevP','SmiL',...
            'SmiT','SunJ','TatJ','WruB','ZakY'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_41_Subjects/';
    case 18
        Q_all = {'AccV','AdsK','AmsW','BalJ','BatC','BurM','CimD','ComS',...
            'CroR','CruM','DecG','FejK','GarK','GeiJ','HalS',...
            'HeaF','HugR','IdeJ','JesH','KanG','LemJ','ManR',...
            'MckR','MejJ','MelN','MonM','PunM','RobM','RowE',...
            'SalV','SevP','SmiL','SmiT','ThoM','VelJ','WalR',...
            'WanW','YouJ'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_38_ACC/';
    case 19
        Q_all = {'AccV','AdsK','AinA','AmsW','BalJ','BatC','BurM','CimD','ComS',...
            'CroR','CruM','DecG','EmiH','FejK','GarK','GeiJ','HalS','HauE',...
            'HeaF','HugR','IdeJ','JesH','KanG','LemJ','ManR',...
            'MckR','MejJ','MelN','MonM','PunM','RobM','RowE',...
            'SalV','SevP','SmiL','SmiT','TatJ','ThoM','VelJ','WalR',...
            'WanW','YouJ','ZhoS'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_43_ACC_Insula/';
    case 20
        Q_all = {'AccV','AroJ','AtpS','BarI','BatC','BurM','CamO','CimD',...
            'ComD','CroR','CruM','DecG','DechKY','DecS','DumC','FeaA',...
            'HalS','HauE','HugR','JakE','JesH','JonN','JorO','LesR',...
            'ManR','MckR','MejJ','MelN','PolW','RobM','RowE','SunJ',...
            'TatJ','ThoM','TouR','WilT','WruB','YouJ','ZakY','ZhoS'};
        for i=1:length(Q_all)
            dire_FIX{i}='/mnt/data/GNG_reward/GNG_Onset_Model_withError/';
            model_name{i}='_Onset_Model_withError';
        end
        dire_save='/mnt/data/GNG_reward/group_results/OneSample_ttest_40_ACC_PreSMA/';

end

if cal_flag~=6
    con_from=1;
    con_to=8;
    
    save_name{1} = 'GS_control_vs_NGS_control';
    save_name{2} = 'NGS_control_vs_GS_control';    
    save_name{3} = 'GS_reward_vs_NGS_reward';
    save_name{4} = 'NGS_reward_vs_GS_reward';    
    save_name{5} = '(GS_reward-GS_control)_vs_(NGS_reward-NGS_control)';
    save_name{6} = '(NGS_reward-NGS_control)_vs_(GS_reward-GS_control)';        
    save_name{7} = 'GS_rewardvs_GS_control';    
    save_name{8} = 'NGS_reward_vs_NGS_control';
end

% specify default job
default_job8 = '/mnt/data/scripts/GNG_reward/2level_analysis/batch_onesample_ttest.mat';


%% input images
for con_num=con_from:con_to
    add_str=[];
    matlabbatch = [];
    load(default_job8);
    output_dir=strcat(dire_save,save_name{con_num});
    if con_num>9
        add_str=strcat('con_00',int2str(con_num));
    else
        add_str=strcat('con_000',int2str(con_num));
    end
    
    if ~exist(output_dir)
        mkdir(output_dir);
    end
    % output dir
    matlabbatch{1}.spm.stats.factorial_design.dir{1}=output_dir;
    % input image data
    temp_scans=[];
    add_i=0;
    for sub_i=1:length(Q_all)
        add_i=add_i+1;
        temp_scans{add_i,1}=strcat(dire_FIX{sub_i},'ALC_',Q_all{sub_i},model_name{sub_i},'/',add_str,'.img,1');
    end
    matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = temp_scans;
    % execute
    spm_jobman('run',matlabbatch); % execute job


    %% estimate
    cd(output_dir);
    load('SPM.mat');

    %Estimating parameters
    SPM = spm_spm(SPM);

    SPM = rmfield(SPM,'xCon');
    ctyp=cell(1,2);
    cnam = cell(1,2);
    ctyp{1} = 'T'; ctyp{2} = 'T';
    cnam{1} = 'Positive';
    cnam{2} = 'Negative';

    cwgt = cell(1,2);
    cwgt{1} = [1]';
    cwgt{2} = [-1]';
    for i=1:length(cnam)
        SPM.xCon(i) = spm_FcUtil('Set',cnam{i},ctyp{i},'c',cwgt{i},SPM.xX.xKXs);
    end
    % and evaluate
    %---------------------------------------------------------------------------
    spm_contrasts(SPM);
end