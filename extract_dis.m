fileID = fopen('subjects_unrelated420_scfc.txt','r');
formatSpec = '%u';
A = fscanf(fileID,formatSpec);

for i = 1:420
    gunzip(strcat('./wmparc/wmparc_', int2str(A(i)), '.nii.gz'));
end

for i = 1:420
    BrainNet_GenCoord_new(strcat('./wmparc/wmparc_',int2str(A(i)),'.nii'),strcat('./node/subj_',int2str(A(i)),'.node'), 1);
end

subj_roi = [];
for i = 1:420 
    Vparc_wmparc = read_avw(strcat('./wmparc/wmparc_',int2str(A(i)),'.nii'));
    Vparc = reshape(Vparc_wmparc,[],1);
    roi = unique(Vparc(:,1));
    roi = roi(roi~=0);
    subj_roi = [subj_roi; {roi}];
end

gmlabels=[8;10;11;12;13;17;18;26;28;47;49;50;51;52;53;54;58;60;1001;
    1002;1003;1005;1006;1007;1008;1009;1010;1011;1012;1013;1014;1015;
    1016;1017;1018;1019;1020;1021;1022;1023;1024;1025;1026;1027;1028;
    1029;1030;1031;1032;1033;1034;1035;2001;2002;2003;2005;2006;2007;
    2008;2009;2010;2011;2012;2013;2014;2015;2016;2017;2018;2019;2020;
    2021;2022;2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;
    2034;2035];

Distance = [];
for i = 1:420
    node = load(strcat('./node/subj_',int2str(A(i)),'.node'));
    node_id = subj_roi{i};
    pos = [];
    for j = 1:length(node)
        for k = 1:length(gmlabels)
            if node_id(j) == gmlabels(k)
                pos = [pos;node(j,1:3)];
            end
        end
    end
    D = zeros(86,86);
    for m = 1:86
        for n = 1:86
            D(m,n) = sqrt(sum((pos(m) - pos(n)).^2));
        end
    end
    Distance = [Distance;{D}];
end 
    
