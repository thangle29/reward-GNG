
%% INPUT parameters
clc
clear 
spm('defaults', 'FMRI')

spm_jobman('initcfg'); % SPM8 only

flag_cal=1; 
            
Q_all = {'AdsK','AinA','AmsW','AtpS','BurM',...
            'CimD','ComD','CroR','CruM','EmiH',...
            'FejK','GeiJ','GorC','GreL','HalS',...
            'HauE','HeaF','JakE','JesH','JorO',...
            'KanG','LemJ','ManR','MarK','MejJ',...
            'PolW','RowE','SalV','SevP','SmiL',...
            'SmiT','SunJ','TatJ','WruB','ZakY'}; %

dire_FIX='/mnt/data/GNG_reward/1st_level_analysis/GNG_Onset_Model_withError_S35_paper/';
model_name='_stats_postG_IorNIRT_HorLSCR_allMS';

switch flag_cal

    case 1  % pSE
        save_FIX='/mnt/data/GNG_reward/group_results_S35_first_paper/2_way_ANOVA_rerun_zero/';
%         img_ih='con_0027.img'; % GS dollar
%         img_il='con_0028.img'; % NGS dollar
%         img_nih='con_0029.img'; % GS nickel
%         img_nil='con_0030.img'; % NGS nickel
          img_ih='con_0045.img'; % GS dollar
          img_il='con_0046.img'; % NGS dollar
          img_nih='con_0047.img'; % GS nickel
          img_nil='con_0048.img'; % NGS nickel

end

%% Flexible design ANOVA (main:'subject', interaction:'group')
% load and update job
jobpath = '/mnt/data/scripts/GNG_reward/2level_analysis/batch_2ndLevel_flexibleDesign_subject_conditions.mat';
load(jobpath);

output_dir=strcat(save_FIX);
if ~exist(output_dir)
    mkdir(output_dir);
end

myjob = matlabbatch{1}.spm.stats.factorial_design;
myjob.dir{1} = output_dir;
myjob.des.fblock.fac(1).name = 'subject';        % SPECIFY
myjob.des.fblock.fac(2).name = 'interaction';          % SPECIFY
% load scan and conditions


my_conds=[];    % [groups conditions]
temp_fsubject=[];
% group 1
add_i=0;
for sub_i=1:length(Q_all)
    % reward
    add_i=add_i+1;
    myjob.des.fblock.fsuball.fsubject(1,add_i).scans{1,1}=strcat(dire_FIX,strcat('ALC_',Q_all{sub_i},'_Onset_Model_withError'),'/',img_ih,',1');
    myjob.des.fblock.fsuball.fsubject(1,add_i).scans{2,1}=strcat(dire_FIX,strcat('ALC_',Q_all{sub_i},'_Onset_Model_withError'),'/',img_il,',1');
    % niRT
    myjob.des.fblock.fsuball.fsubject(1,add_i).scans{3,1}=strcat(dire_FIX,strcat('ALC_',Q_all{sub_i},'_Onset_Model_withError'),'/',img_nih,',1');
    myjob.des.fblock.fsuball.fsubject(1,add_i).scans{4,1}=strcat(dire_FIX,strcat('ALC_',Q_all{sub_i},'_Onset_Model_withError'),'/',img_nil,',1');
    myjob.des.fblock.fsuball.fsubject(1,add_i).conds = [1;2;3;4];
end

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

% set contrast
SPM = rmfield(SPM,'xCon');
ctyp=cell(1,6);
cnam = cell(1,6);
cwgt = cell(1,6);

ctyp{1} = 'T'; ctyp{2} = 'T';ctyp{3} = 'T';
ctyp{4} = 'T'; ctyp{5} = 'T';ctyp{6} = 'T';
% ctyp{7} = 'T'; ctyp{8} = 'T';ctyp{9} = 'T';ctyp{10} = 'T';
% ctyp{11} = 'T'; ctyp{12} = 'T';ctyp{13} = 'T';ctyp{14} = 'T';

Num_subject=length(Q_all);
cnam{1} = 'GS_dollar+NGS_dollar > GS_nickel+NGS_nickel'; % reward effect
cnam{2} = 'GS_nickel+NGS_nickel > GS_dollar+NGS_dollar'; % reward effect
cnam{3} = 'GS_dollar+GS_nickel > NGS_dollar+NGS_nickel'; % response effect
cnam{4} = 'NGS_dollar+NGS_nickel > GS_dollar+GS_nickel'; % response effect
cnam{5} = 'GS_dollar-GS nickel > NGS_dollar-NGS_nickel'; % interaction
cnam{6} = 'NGS_dollar-NGS nickel > GS_dollar-GS_nickel'; % interaction


cwgt{1} = [1 1 -1 -1 zeros(1,Num_subject)]';
cwgt{2} = [-1 -1 1 1 zeros(1,Num_subject)]';
cwgt{3} = [1 -1 1 -1 zeros(1,Num_subject)]';
cwgt{4} = [-1 1 -1 1 zeros(1,Num_subject)]';
cwgt{5} = [1 -1 -1 1 zeros(1,Num_subject)]';
cwgt{6} = [-1 1 1 -1 zeros(1,Num_subject)]';
% cwgt{7} = [1 -1 0 0 zeros(1,Num_subject)]';
% cwgt{8} = [0 0 1 -1 zeros(1,Num_subject)]';
% cwgt{9} = [-1 1 0 0 zeros(1,Num_subject)]';
% cwgt{10} = [0 0 -1 1 zeros(1,Num_subject)]';
% cwgt{11} = [1 0 -1 0 zeros(1,Num_subject)]';
% cwgt{12} = [-1 0 1 0 zeros(1,Num_subject)]';
% cwgt{13} = [0 1 0 -1 zeros(1,Num_subject)]';
% cwgt{14} = [0 -1 0 1 zeros(1,Num_subject)]';
        
for i=1:length(cnam)
    SPM.xCon(i) = spm_FcUtil('Set',cnam{i},ctyp{i},'c',cwgt{i},SPM.xX.xKXs);
end
% and evaluate
%---------------------------------------------------------------------------
spm_contrasts(SPM);

