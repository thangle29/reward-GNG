% v8 has 4 error contrasts only. Missing subject JakE
clc
clear
addpath /mnt/data/scripts/GNG_reward/1level_analysis/;
addpath '/mnt/data/toolboxes/spm8';
spm('Defaults','fMRI');
global defaults

TR=1;
number_slices=51;
ref_slice = 26;

subj = [1:35];

for a = 1:length(subj)
    
    add_i=0;
    Q_all = {};
    logfile_all_cell = {};
    
    if a == 1
        add_i=add_i+1;
        Q_all{add_i}='ALC_AdsK';
        logfile_all_cell{add_i}={'AdsK_1-gonogo_reward_right.log','AdsK_2-gonogo_reward_right.log','AdsK_1-gonogo_reward_control.log',...
            'AdsK_1-gonogo_reward_left.log','AdsK_2-gonogo_reward_left.log'};
    elseif a == 2
        add_i=add_i+1;
        Q_all{add_i}='ALC_AinA';
        logfile_all_cell{add_i}={'AinA_1-gonogo_reward_left.log','AinA_1-gonogo_reward_control.log','AinA_1-gonogo_reward_right.log',...
            'AinA_2-gonogo_reward_right.log','AinA_2b-gonogo_reward_left.log'};
    elseif a == 3
        add_i=add_i+1;
        Q_all{add_i}='ALC_AmsW';
        logfile_all_cell{add_i}={'AmsW_1-gonogo_reward_right.log','AmsW_1-gonogo_reward_control.log','AmsW_1-gonogo_reward_left.log',...
            'AmsW_2-gonogo_reward_left.log','AmsW_2-gonogo_reward_right.log'};
    elseif a == 4
        add_i=add_i+1;
        Q_all{add_i}='ALC_AtpS';
        logfile_all_cell{add_i}={'AtpS_1-gonogo_reward_left.log','AtpS_2-gonogo_reward_left.log','AtpS_1-gonogo_reward_control.log',...
            'AtpS_1-gonogo_reward_right.log'};
    elseif a == 5
        add_i=add_i+1;
        Q_all{add_i}='ALC_BurM';
        logfile_all_cell{add_i}={'BurM_1-gonogo_reward_right.log','BurM_2-gonogo_reward_right.log','BurM_1-gonogo_reward_control.log',...
            'BurM_1-gonogo_reward_left.log','BurM_2-gonogo_reward_left.log'};
    elseif a == 6
        add_i=add_i+1;
        Q_all{add_i}='ALC_CimD';
        logfile_all_cell{add_i}={'CimD_1-gonogo_reward_right.log','CimD_2-gonogo_reward_right.log','CimD_1-gonogo_reward_control.log',...
            'CimD_1-gonogo_reward_left.log','CimD_2-gonogo_reward_left.log'};
    elseif a == 7
        add_i=add_i+1;
        Q_all{add_i}='ALC_ComD';
        logfile_all_cell{add_i}={'ComD_1-gonogo_reward_left.log','ComD_2-gonogo_reward_left.log','ComD_1-gonogo_reward_control.log',...
            'ComD_1-gonogo_reward_right.log'};
    elseif a == 8
        add_i=add_i+1;
        Q_all{add_i}='ALC_CroR';
        logfile_all_cell{add_i}={'CroR_1-gonogo_reward_right.log','CroR_1-gonogo_reward_left.log','CroR_1-gonogo_reward_control.log',...
            'CroR_2-gonogo_reward_right.log','CroR_2-gonogo_reward_left.log'};
    elseif a == 9
        add_i=add_i+1;
        Q_all{add_i}='ALC_CruM';
        logfile_all_cell{add_i}={'CruM_1-gonogo_reward_right.log','CruM_2-gonogo_reward_right.log','CruM_1-gonogo_reward_control.log',...
            'CruM_1-gonogo_reward_left.log','CruM_2-gonogo_reward_left.log'};
    elseif a == 10
        add_i=add_i+1;
        Q_all{add_i}='ALC_EmiH';
        logfile_all_cell{add_i}={'EmiH_1b-gonogo_reward_left.log','EmiH_2b-gonogo_reward_left.log','EmiH_1b-gonogo_reward_control.log',...
            'EmiH_1-gonogo_reward_right.log'};
    elseif a == 11
        add_i=add_i+1;
        Q_all{add_i}='ALC_FejK';
        logfile_all_cell{add_i}={'FejK_1-gonogo_reward_left.log','FejK_2-gonogo_reward_left.log','FejK_1-gonogo_reward_control.log',...
            'FejK_1-gonogo_reward_right.log','FejK_2-gonogo_reward_right.log'};
    elseif a == 12
        add_i=add_i+1;
        Q_all{add_i}='ALC_GeiJ';
        logfile_all_cell{add_i}={'GeiJ_1-gonogo_reward_right.log','GeiJ_2-gonogo_reward_right.log','GeiJ_1-gonogo_reward_control.log',...
            'GeiJ_1-gonogo_reward_left.log'};
    elseif a == 13
        add_i=add_i+1;
        Q_all{add_i}='ALC_GreL';
        logfile_all_cell{add_i}={'GreL_1-gonogo_reward_left.log','GreL_2-gonogo_reward_left.log','GreL_1-gonogo_reward_control.log',...
            'GreL_1-gonogo_reward_right.log','GreL_2-gonogo_reward_right.log'};
    elseif a == 14
        add_i=add_i+1;
        Q_all{add_i}='ALC_HalS';
        logfile_all_cell{add_i}={'HalS_1-gonogo_reward_left.log','HalS_2-gonogo_reward_left.log','HalS_1-gonogo_reward_control.log',...
            'HalS_1-gonogo_reward_right.log','HalS_2-gonogo_reward_right.log'};
    elseif a == 15
        add_i=add_i+1;
        Q_all{add_i}='ALC_HauE';
        logfile_all_cell{add_i}={'HauE_1-gonogo_reward_left.log','HauE_2-gonogo_reward_left.log','HauE_1-gonogo_reward_control.log',...
            'HauE_1-gonogo_reward_right.log','HauE_2-gonogo_reward_right.log'};
    elseif a == 16
        add_i=add_i+1;
        Q_all{add_i}='ALC_HeaF';
        logfile_all_cell{add_i}={'HeaF_1-gonogo_reward_right.log','HeaF_2-gonogo_reward_right.log','HeaF_1-gonogo_reward_control.log',...
            'HeaF_1-gonogo_reward_left.log','HeaF_2-gonogo_reward_left.log'};
    elseif a == 17
                add_i=add_i+1;
                Q_all{add_i}='ALC_JakE';
                logfile_all_cell{add_i}={'JakE_1-gonogo_reward_right.log','JakE_2-gonogo_reward_right.log','JakE_1-gonogo_reward_control.log',...
                    'JakE_1-gonogo_reward_left.log','JakE_2-gonogo_reward_left.log'};
%         continue
    elseif a == 18
        add_i=add_i+1;
        Q_all{add_i}='ALC_JesH';
        logfile_all_cell{add_i}={'JesH_1-gonogo_reward_left.log','JesH_1-gonogo_reward_control.log',...
            'JesH_1-gonogo_reward_right.log','JesH_2-gonogo_reward_right.log'};
    elseif a == 19
        add_i=add_i+1;
        Q_all{add_i}='ALC_JorO';
        logfile_all_cell{add_i}={'JorO_1-gonogo_reward_right.log','JorO_2-gonogo_reward_right.log','JorO_1-gonogo_reward_control.log',...
            'JorO_1-gonogo_reward_left.log'};
    elseif a == 20
        add_i=add_i+1;
        Q_all{add_i}='ALC_KanG';
        logfile_all_cell{add_i}={'KanG_1-gonogo_reward_left.log','KanG_2-gonogo_reward_left.log','KanG_1-gonogo_reward_control.log',...
            'KanG_1-gonogo_reward_right.log','KanG_2-gonogo_reward_right.log'};
    elseif a == 21
        add_i=add_i+1;
        Q_all{add_i}='ALC_LemJ';
        logfile_all_cell{add_i}={'LemJ_1-gonogo_reward_left.log','LemJ_2-gonogo_reward_left.log','LemJ_1-gonogo_reward_control.log',...
            'LemJ_1-gonogo_reward_right.log','LemJ_2-gonogo_reward_right.log'};
    elseif a == 22
        add_i=add_i+1;
        Q_all{add_i}='ALC_ManR';
        logfile_all_cell{add_i}={'ManR_1-gonogo_reward_right.log','ManR_2-gonogo_reward_right.log','ManR_1-gonogo_reward_control.log',...
            'ManR_1-gonogo_reward_left.log','ManR_2-gonogo_reward_left.log'};
    elseif a == 23
        add_i=add_i+1;
        Q_all{add_i}='ALC_MarK';
        logfile_all_cell{add_i}={'MarK_1-gonogo_reward_right.log','MarK_1-gonogo_reward_control.log',...
            'MarK_1-gonogo_reward_left.log'};
    elseif a == 24
        add_i=add_i+1;
        Q_all{add_i}='ALC_MejJ';
        logfile_all_cell{add_i}={'MejJ_1-gonogo_reward_left.log','MejJ_2-gonogo_reward_left.log','MejJ_1-gonogo_reward_control.log',...
            'MejJ_1-gonogo_reward_right.log','MejJ_2-gonogo_reward_right.log'};
    elseif a == 25
        add_i=add_i+1;
        Q_all{add_i}='ALC_PolW';
        logfile_all_cell{add_i}={'PolW1-gonogo_reward_right.log','PolW2-gonogo_reward_right.log','PolW1-gonogo_reward_control.log',...
            'PolW1-gonogo_reward_left.log','PolW2-gonogo_reward_left.log'};
    elseif a == 26
        add_i=add_i+1;
        Q_all{add_i}='ALC_RowE';
        logfile_all_cell{add_i}={'RowE_1-gonogo_reward_right.log','RowE_2-gonogo_reward_right.log','RowE_1-gonogo_reward_control.log',...
            'RowE_2-gonogo_reward_left.log'};
    elseif a == 27
        add_i=add_i+1;
        Q_all{add_i}='ALC_SalV';
        logfile_all_cell{add_i}={'SalV_1-gonogo_reward_left.log','SalV_2-gonogo_reward_left.log','SalV_1-gonogo_reward_control.log',...
            'SalV_1-gonogo_reward_right.log','SalV_3-gonogo_reward_right.log'};        
    elseif a == 28
        add_i=add_i+1;
        Q_all{add_i}='ALC_SmiL';
        logfile_all_cell{add_i}={'SmiL_1-gonogo_reward_left.log','SmiL_2-gonogo_reward_left.log','SmiL_1-gonogo_reward_control.log',...
            'SmiL_1-gonogo_reward_right.log','SmiL_2-gonogo_reward_right.log'};
    elseif a == 29
        add_i=add_i+1;
        Q_all{add_i}='ALC_SmiT';
        logfile_all_cell{add_i}={'SmiT_1-gonogo_reward_right.log','SmiT_2b-gonogo_reward_right.log','SmiT_1-gonogo_reward_control.log',...
            'SmiT_1-gonogo_reward_left.log','SmiT_2-gonogo_reward_left.log'};
    elseif a == 30
        add_i=add_i+1;
        Q_all{add_i}='ALC_TatJ';
        logfile_all_cell{add_i}={'TatJ_1-gonogo_reward_right.log','TatJ_2-gonogo_reward_right.log','TatJ_1-gonogo_reward_control.log',...
            'TatJ_1-gonogo_reward_left.log','TatJ_2-gonogo_reward_left.log'};
    elseif a == 31
        add_i=add_i+1;
        Q_all{add_i}='ALC_WruB';
        logfile_all_cell{add_i}={'WruB_1-gonogo_reward_left.log','WruB_2b-gonogo_reward_left.log','WruB_1-gonogo_reward_control.log',...
            'WruB_1-gonogo_reward_right.log','WruB_2-gonogo_reward_right.log'};
    elseif a == 32
        add_i=add_i+1;
        Q_all{add_i}='ALC_ZakY';
        logfile_all_cell{add_i}={'ZakY_1-gonogo_reward_right.log','ZakY_2-gonogo_reward_right.log','ZakY_1-gonogo_reward_control.log',...
            'ZakY_1-gonogo_reward_left.log','ZakY_2-gonogo_reward_left.log'};
    elseif a == 33
        add_i=add_i+1; Q_all{add_i}='ALC_SunJ';
        logfile_all_cell{add_i}={'SunJ_2-gonogo_reward_left.log',...
            'SunJ_1-gonogo_reward_control.log',...
            'SunJ_1-gonogo_reward_right.log'};
    elseif a == 34
        add_i=add_i+1;
        Q_all{add_i}='ALC_SevP';
        logfile_all_cell{add_i}={'SevP_1-gonogo_reward_left.log','SevP_2-gonogo_reward_left.log','SevP_1-gonogo_reward_control.log',...
            'SevP_2-gonogo_reward_right.log'};
    elseif a == 35
        add_i=add_i+1;
        Q_all{add_i}='ALC_GorC';
        logfile_all_cell{add_i}={'GorC_1-gonogo_reward_left.log','GorC_2-gonogo_reward_left.log','GorC_1-gonogo_reward_control.log',...
            'GorC_1-gonogo_reward_right.log','GorC_2-gonogo_reward_right.log'};
    end
    
    
    %% Your INPUT
    for j_all=1:length(Q_all)
        Q_id=Q_all{j_all};
        logfile_all=logfile_all_cell{j_all};
        if_print=1;
        
        % specify default job
        default_compute_model = '/mnt/data/scripts/GNG_reward/1level_analysis/batch_compute_model_stats_1RT_34SSD.mat';
        default_estimate_model = '/mnt/data/scripts/GNG_reward/1level_analysis/batch_estimate_SPM_model.mat';
        default_setcon_model = '/mnt/data/scripts/GNG_reward/1level_analysis/batch_set_contrast.mat';
        
        % specify dataset path
        
        datapath = '/mnt/data/GNG_reward/nifti/'; % main folder of BOLD images
        spath = '/mnt/data/GNG_reward/1st_level_analysis/GNG_Onset_Model_withError_S35_v11/';
        modelname = '_Onset_Model_withError';
        logfilepath='/mnt/data/GNG_reward/nifti/';
        
        cpath = pwd;
        % get paths for each subject!
        P = fun_load_image_data_path_gonogo_1sTR(Q_id,datapath,'swarfm00');
        ns = length(P.scans);
        num_reg = zeros(1,ns); % count number of regressors
        
        savepath = fullfile(spath,[Q_id modelname]);
        if ~exist(savepath)
            mkdir(savepath);
            fprintf('- creating folder %s /n',savepath);
        end
        
        %% 1) Construct spm8 model
        matlabbatch = [];
        modelo = load(default_compute_model); %
        matlabbatch = modelo.matlabbatch;
        matlabbatch{1}.spm.stats.fmri_spec.dir{1} = savepath;
        matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t=number_slices;
        matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0=ref_slice;
        matlabbatch{1}.spm.stats.fmri_spec.timing.RT=TR;
        
        cd(savepath);
        % re-Set session information (for different number of sessions)
        reg_all=[]; %set up regressors: 11- GS_control, 12- GE_control, 13- NGS_control, 14- NGE_control
        %                   21- GS_dollar, 22- GE_dollar, 23-NGS_dollar, 24- NGE_dollar
        %                   31- GS_5cent, 32- GE_5cent, 33-NGS_5cent, 34- NGE_5cent
        NumGS_control_all=0;
        NumNGS_control_all=0;
        NumGS_dollar_all=0;
        NumNGS_dollar_all=0;
        NumGS_5cent_all=0;
        NumNGS_5cent_all=0;
        NumGE_dollar_all=0;
        NumNGE_dollar_all=0;
        NumGE_5cent_all=0;
        NumNGE_5cent_all=0;
        Num_Control_Sess=0;
        Num_Reward_Sess=0;
        
        for s=1:ns
            reg_all_temp=[];
            % check whether it is control session or reward session
            if length(strfind(logfile_all{s},'control'))>0  % control sessions
                matlabbatch{1}.spm.stats.fmri_spec.sess(s) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess(1); % initialize sample session structure
                matlabbatch{1}.spm.stats.fmri_spec.sess(s).scans = P.scans{s}';
                % set onsets and param
                allonset = fun_get_onset_gonogo_control_model_1sTR(strcat(logfilepath,Q_id,'/',logfile_all{s}),if_print);
                % four conditions: GS, GE, NGS, NGE
                reg_all{s}.NumGS=length(allonset.Onset_GoS);
                reg_all{s}.NumGE=length(allonset.Onset_GoE);
                reg_all{s}.NumNGS=length(allonset.Onset_NogoS);
                reg_all{s}.NumNGE=length(allonset.Onset_NogoE);
                
                NumGS_control_all=NumGS_control_all+reg_all{s}.NumGS;
                NumNGS_control_all=NumNGS_control_all+reg_all{s}.NumNGS;
                
                Num_Control_Sess=Num_Control_Sess+1;
                % go success
                c=1;
                if ~isempty(allonset.Onset_GoS)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'GS_control';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_GoS;
                    % PM with RT
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).name = 'RT';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).param = allonset.RT_GoS;
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).poly = 1; % first order polynomial expansion
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 11 0 0 0];
                end
                
                % go error
                if ~isempty(allonset.Onset_GoE)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'GE_control';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_GoE;
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 12 0];
                end
                
                % Nogo sucess
                if ~isempty(allonset.Onset_NogoS)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'NGS_control';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_NogoS;
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 13 0];
                end
                
                % Nogo error
                if ~isempty(allonset.Onset_NogoE)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'NGE_control';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_NogoE;
                    % PM with RT
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).name = 'RT';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).param = allonset.RT_NogoE;
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).poly = 1; % first order polynomial expansion
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 14 0 0 0];
                end
                
            else  % reward sessions
                matlabbatch{1}.spm.stats.fmri_spec.sess(s) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess(1); % initialize sample session structure
                matlabbatch{1}.spm.stats.fmri_spec.sess(s).scans = P.scans{s}';
                % set onsets and param
                allonset = fun_get_onset_gonogo_reward_model_1sTR(strcat(logfilepath,Q_id,'/',logfile_all{s}),if_print);
                c=1;
                reg_all{s}.NumGS_dollar=length(allonset.Onset_GoS_dollar);
                reg_all{s}.NumGE_dollar=length(allonset.Onset_GoE_dollar);
                reg_all{s}.NumNGS_dollar=length(allonset.Onset_NogoS_dollar);
                reg_all{s}.NumNGE_dollar=length(allonset.Onset_NogoE_dollar);
                reg_all{s}.NumGS_5cent=length(allonset.Onset_GoS_5cent);
                reg_all{s}.NumGE_5cent=length(allonset.Onset_GoE_5cent);
                reg_all{s}.NumNGS_5cent=length(allonset.Onset_NogoS_5cent);
                reg_all{s}.NumNGE_5cent=length(allonset.Onset_NogoE_5cent);
                % four conditions of dollar sessions: GS_dollar, GE_dollar, NGS_dollar, NGE_dollar
                NumGS_dollar_all=NumGS_dollar_all+reg_all{s}.NumGS_dollar;
                NumNGS_dollar_all=NumNGS_dollar_all+reg_all{s}.NumNGS_dollar;
                NumGS_5cent_all=NumGS_5cent_all+reg_all{s}.NumGS_5cent;
                NumNGS_5cent_all=NumNGS_5cent_all+reg_all{s}.NumNGS_5cent;
                NumGE_dollar_all=NumGE_dollar_all+reg_all{s}.NumGE_dollar;
                NumNGE_dollar_all=NumNGE_dollar_all+reg_all{s}.NumNGE_dollar;
                NumGE_5cent_all=NumGE_5cent_all+reg_all{s}.NumGE_5cent;
                NumNGE_5cent_all=NumNGE_5cent_all+reg_all{s}.NumNGE_5cent;
                
                Num_Reward_Sess=Num_Reward_Sess+1;
                
                % go success dollar
                if ~isempty(allonset.Onset_GoS_dollar)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'GS_dollar';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_GoS_dollar;
                    % PM with RT
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).name = 'RT';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).param = allonset.RT_GoS_dollar;
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).poly = 1; % first order polynomial expansion
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 21 0 0 0];
                end
                
                % go error dollar
                if ~isempty(allonset.Onset_GoE_dollar)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'GE_dollar';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_GoE_dollar;
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 22 0];
                end
                
                % Nogo sucess dollar
                if ~isempty(allonset.Onset_NogoS_dollar)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'NGS_dollar';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_NogoS_dollar;
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 23 0];
                end
                
                % Nogo error dollar
                if ~isempty(allonset.Onset_NogoE_dollar)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'NGE_dollar';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_NogoE_dollar;
                    % PM with RT
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).name = 'RT';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).param = allonset.RT_NogoE_dollar;
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).poly = 1; % first order polynomial expansion
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 24 0 0 0];
                end
                
                % four conditions of 5cent sessions: GS_5cent, GE_5cent, NGS_5cent, NGE_5cent
                % go success 5cent
                if ~isempty(allonset.Onset_GoS_5cent)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'GS_5cent';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_GoS_5cent;
                    % PM with RT
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).name = 'RT';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).param = allonset.RT_GoS_5cent;
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).poly = 1; % first order polynomial expansion
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 31 0 0 0];
                end
                
                % go error 5cent
                if ~isempty(allonset.Onset_GoE_5cent)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'GE_5cent';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_GoE_5cent;
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 32 0];
                end
                
                % Nogo sucess 5cent
                if ~isempty(allonset.Onset_NogoS_5cent)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'NGS_5cent';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_NogoS_5cent;
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 33 0];
                end
                
                % Nogo error 5cent
                if ~isempty(allonset.Onset_NogoE_5cent)
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c) = modelo.matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1); % initialize sample condition strutucture
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).name = 'NGE_5cent';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).onset = allonset.Onset_NogoE_5cent;
                    % PM with RT
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).name = 'RT';
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).param = allonset.RT_NogoE_5cent;
                    matlabbatch{1}.spm.stats.fmri_spec.sess(s).cond(c).pmod(1).poly = 1; % first order polynomial expansion
                    
                    c = c + 1;
                    reg_all_temp=[reg_all_temp 34 0 0 0];
                end
            end
            
            % set additional regressors - motion parameters
            rnames = {'X','Y','Z','x','y','z'};
            %[r1, r2, r3, r4, r5, r6]=textread(P{j}.motion_param_files{s}, '%f%f%f%f%f%f');
            rr=[];
            [rr(:,1),rr(:,2),rr(:,3),rr(:,4),rr(:,5),rr(:,6) ]= textread(P.motion_param_files{s}, '%f%f%f%f%f%f');
            
            for r=1:length(rnames)
                matlabbatch{1}.spm.stats.fmri_spec.sess(s).regress(r).name = rnames{r};
                matlabbatch{1}.spm.stats.fmri_spec.sess(s).regress(r).val = rr(:,r);
            end
            reg_all_temp=[reg_all_temp 0 0 0 0 0 0];
            
            reg_all{s}.reg=reg_all_temp;
        end
        % execute
        %spm fmri;
        spm_jobman('run',matlabbatch); % execute job
        
        %% estimate model
        %spm fmri;
        matlabbatch = [];
        load(default_estimate_model); %
        matlabbatch{1}.spm.stats.fmri_est.spmmat{1} = fullfile(savepath,'SPM.mat');
        spm_jobman('run',matlabbatch); % execute job
        
        
        %% set contrast
        cnam = cell(1,6);
        cwgt = cell(1,6);
        
        %% DIFFERENT CONTRASTS

        cnam{3} = 'GE_reward>0';
        cnam{4} = 'NGE_reward>0';


        
        
        %% EXPLAINING THE CONTRAST VECTOR
        for ses=1:length(reg_all)
            if length(strfind(logfile_all{ses},'control'))>0  % control sessions
                
               
                % cnam{1} = 'GE_reward>0)';
                temp_reg=zeros(1,length(reg_all{ses}.reg));
                cwgt{1} = [cwgt{1} temp_reg];
                % cnam{2} = 'NGE_reward>0)';
                temp_reg=zeros(1,length(reg_all{ses}.reg));
                cwgt{2} = [cwgt{2} temp_reg];

                
            else % reward sessions
               
                % cnam{1} = 'GE_reward>0)';
                temp_reg=zeros(1,length(reg_all{ses}.reg));
                temp_reg(find(reg_all{ses}.reg==22))=reg_all{ses}.NumGE_dollar/(NumGE_dollar_all+NumGE_5cent_all);
                temp_reg(find(reg_all{ses}.reg==32))=reg_all{ses}.NumGE_5cent/(NumGE_dollar_all+NumGE_5cent_all);
                cwgt{1} = [cwgt{1} temp_reg];
                % cnam{2} = 'NGE_reward>0';
                temp_reg=zeros(1,length(reg_all{ses}.reg));
                temp_reg(find(reg_all{ses}.reg==24))=reg_all{ses}.NumGE_dollar/(NumGE_dollar_all+NumGE_5cent_all);
                temp_reg(find(reg_all{ses}.reg==34))=reg_all{ses}.NumGE_5cent/(NumGE_dollar_all+NumGE_5cent_all);
                cwgt{2} = [cwgt{2} temp_reg];
               
            end
            %set up regressors: 11- GS_control, 12- GE_control, 13- NGS_control, 14- NGE_control
            %                   21- GS_dollar, 22- GE_dollar, 23-NGS_dollar, 24- NGE_dollar
            %                   31- GS_5cent, 32- GE_5cent, 33-NGS_5cent, 34- NGE_5cent
            
        end
        matlabbatch = [];
        load(default_setcon_model); %
        savepath = fullfile(spath,[Q_id modelname]);
        matlabbatch{1}.spm.stats.con.spmmat{1} = fullfile(savepath,'SPM.mat');
        for con=1:length(cwgt)
            matlabbatch{1}.spm.stats.con.consess{con}.tcon.name = cnam{con};
            matlabbatch{1}.spm.stats.con.consess{con}.tcon.convec = cwgt{con};
            matlabbatch{1}.spm.stats.con.consess{con}.tcon.sessrep = 'none';
        end
        spm_jobman('run',matlabbatch); % execute job
        
        
        % check whether the sums of the contrast are all zeros
        for i=1:length(cwgt)
            fprintf('contrast %s = %6.2f /n',cnam{i},sum(cwgt{i}));
        end
    end
end