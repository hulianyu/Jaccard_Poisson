clearvars
pv = zeros(15,2);
for I=1:15
    disp(I);
    % ODS
    ODS_X = load(['etwork-', num2str(I), '-adjacency.txt']); %Load I-th ODS
    pv(I,1) = RunPoisson(ODS_X);
    % CRDS
    pvC  = 0;
    parfor Run=1:50
        CRDS_X = Generate_CRDS(ODS_X);
        pv_t = RunPoisson(CRDS_X);
        pvC = pvC + pv_t;
    end
    pv(I,2) = pvC/50;
    %% Plot ODS
    figure
    ODS_X(ODS_X==1)=0;
    ODS_X(ODS_X==2)=1;
    plot(graph(ODS_X));
    title(['etwork-', num2str(I)],['p-value: ',num2str(pv(I,1))]);
end