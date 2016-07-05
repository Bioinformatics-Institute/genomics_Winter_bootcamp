velveth assembly 31 -shortPaired -fastq -separate trimmed/PE310_L.fastq.trimmed.gz trimmed/PE310_R.fastq.trimmed.gz -shortPaired2 -fastq -separate trimmed/MP2000_L.fastq.trimmed.gz trimmed/MP2000_R.fastq.trimmed.gz -shortPaired3 -fastq -separate trimmed/MP5000_L.fastq.trimmed.gz trimmed/MP5000_R.fastq.trimmed.gz;

velvetg assembly -ins_length 319 -ins_length2 2300 -ins_length3 3400 -exp_cov auto -cov_cutoff auto;
