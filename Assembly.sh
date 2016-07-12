

velveth # Call the program velveth \
assembly # output to a directory called assembly \
31 # Use a k-mer size of 31 \
-shortPaired -fastq -separate # Library 1 has these characteristics \
trimmed/PE310_L.fastq.trimmed.gz trimmed/PE310_R.fastq.trimmed.gz # Left and right reads for library 1 \
-shortPaired2 -fastq -separate # Library 2 has these characteristics \
trimmed/MP2000_L.fastq.trimmed.gz trimmed/MP2000_R.fastq.trimmed.gz # Left and right reads for library 2 \
-shortPaired3 -fastq -separate # Library 3 has these characteristics \
trimmed/MP5000_L.fastq.trimmed.gz trimmed/MP5000_R.fastq.trimmed.gz # Left and right reads for library 3 ;

velvetg # Call the program velvetg \
assembly #  velvetg expects the output of velveth to be in this directory \
-ins_length 319 # Expected insert size for library 1 \
-ins_length2 2300 # Expected insert size for library 2 \
-ins_length3 3400 # Expected insert size for library 3 \
-exp_cov auto # velvet will estimate the expected coverage \
-cov_cutoff auto # velvet will set a coverage cutoff \;
