function mchrom=Mutate_Random(chrom,Pm,range,elitism,bestchrom)
if(nargin<5)
    error(['Cannot run the genetic algorithm']);
end
[N,L]=size(chrom);
mchrom=chrom;
for p=1:N
    if elitism==0 | p~=bestchrom
        if Pm>rand
            for gene=1:L
                mchrom(p,gene)=(rand-0.5)*(range(2,gene)-range(1,gene))+0.5*(range(2,gene)+range(1,gene));
            end
        end
    end
end
