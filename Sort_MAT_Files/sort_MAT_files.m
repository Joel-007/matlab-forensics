%MAT_Base='/media/marzampoglou/3TB/Recovery/Recuva/Excellent/Folders/folder_mat/';
%MatFileList=dir([MAT_Base '*.mat']);


mkdir([MAT_Base '01/Tw']);
mkdir([MAT_Base '01/TwRes']);
mkdir([MAT_Base '02/Tw']);
mkdir([MAT_Base '02/TwRes']);
mkdir([MAT_Base '04/Tw']);
mkdir([MAT_Base '04/TwRes']);
mkdir([MAT_Base '05/Tw']);
mkdir([MAT_Base '05/TwRes']);
mkdir([MAT_Base '07/Tw']);
mkdir([MAT_Base '07/TwRes']);
mkdir([MAT_Base '08/Tw']);
mkdir([MAT_Base '08/TwRes']);
mkdir([MAT_Base '09/Tw']);
mkdir([MAT_Base '09/TwRes']);
mkdir([MAT_Base '10/Tw']);
mkdir([MAT_Base '10/TwRes']);
mkdir([MAT_Base '12/Tw']);
mkdir([MAT_Base '12/TwRes']);
mkdir([MAT_Base '14/Tw']);
mkdir([MAT_Base '14/TwRes']);
mkdir([MAT_Base '16/Tw']);
mkdir([MAT_Base '16/TwRes']);

mkdir([MAT_Base 'Unsorted/Tw']);
mkdir([MAT_Base 'Unsorted/TwRes']);
mkdir([MAT_Base 'Irrelevant']);

for ii=163894:length(MatFileList)
    try
        Loaded=load([MAT_Base MatFileList(ii).name]);
        if isfield(Loaded,'Results')
            if strfind(Loaded.Name,'TwRes')
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/08/TwRes/' MatFileList(ii).name]);
            elseif strfind(Loaded.Name,'Tw')
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/08/Tw/' MatFileList(ii).name]);
            else
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/08/' MatFileList(ii).name]);
            end
            disp('08')
        elseif isfield(Loaded,'bayer')
            if strfind(Loaded.Name,'TwRes')
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/04/TwRes/' MatFileList(ii).name]);
            elseif strfind(Loaded.Name,'Tw')
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/04/Tw/' MatFileList(ii).name]);
            else
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/04/' MatFileList(ii).name]);
            end
            disp('04')
        elseif isfield(Loaded,'Result')
            if iscell(Loaded.Result)
                if length(Result)==5
                    if strfind(Loaded.Name,'TwRes')
                        system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/05/TwRes/' MatFileList(ii).name]);
                    elseif strfind(Loaded.Name,'Tw')
                        system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/05/Tw/' MatFileList(ii).name]);
                    else
                        system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/05/' MatFileList(ii).name]);
                    end
                end
                disp('05')
            elseif isfield(Loaded.Result,'OutlierPrmsMap')
                if strfind(Loaded.Name,'TwRes')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/09/TwRes/' MatFileList(ii).name]);
                elseif strfind(Loaded.Name,'Tw')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/09/Tw/' MatFileList(ii).name]);
                else
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/09/' MatFileList(ii).name]);
                end
                disp('09')
            elseif isfield(Loaded.Result,'estVDCT')
                if strfind(Loaded.Name,'TwRes')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/12/TwRes/' MatFileList(ii).name]);
                elseif strfind(Loaded.Name,'Tw')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/12/Tw/' MatFileList(ii).name]);
                else
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/12/' MatFileList(ii).name]);
                end
                disp('12')
            elseif sum(sum(Loaded.Result-round(Loaded.Result)))==0
                if strfind(Loaded.Name,'TwRes')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/10/TwRes/' MatFileList(ii).name]);
                elseif strfind(Loaded.Name,'Tw')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/10/Tw/' MatFileList(ii).name]);
                else
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/10/' MatFileList(ii).name]);
                end
                disp('10')
            elseif min(min(Result))<0
                if strfind(Loaded.Name,'TwRes')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/14/TwRes/' MatFileList(ii).name]);
                elseif strfind(Loaded.Name,'Tw')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/14/Tw/' MatFileList(ii).name]);
                else
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/14/' MatFileList(ii).name]);
                end
                disp('14')
            elseif max(max(Result))>1
                if strfind(Loaded.Name,'TwRes')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/07/TwRes/' MatFileList(ii).name]);
                elseif strfind(Loaded.Name,'Tw')
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/07/Tw/' MatFileList(ii).name]);
                else
                    system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/07/' MatFileList(ii).name]);
                end
                disp('07')
            end
        elseif isfield(Loaded,'Name')
            if strfind(Loaded.Name,'TwRes')
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/Unsorted/TwRes/' MatFileList(ii).name]);
            elseif strfind(Loaded.Name,'Tw')
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/Unsorted/Tw/' MatFileList(ii).name]);
            else
                system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/Unsorted/' MatFileList(ii).name]);
            end
            disp('Unsorted');
        else
            system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/Irrelevant/' MatFileList(ii).name]);
            disp('Irrelevant');
        end
    catch
        system(['mv ' MAT_Base MatFileList(ii).name ' ' MAT_Base '/Corrupt/' MatFileList(ii).name]);
        disp('Corrupt');
    end
    disp(ii)
    clear Loaded
    pause(0.1);
end