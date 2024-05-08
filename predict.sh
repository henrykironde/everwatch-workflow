sbatch <<EOT
#!/bin/bash
#SBATCH --job-name=BirdDetect   # Job name
#SBATCH --mail-type=END               # Mail events
#SBATCH --mail-user=ethanwhite@ufl.edu  # Where to send mail
#SBATCH --account=ewhite
#SBATCH --nodes=1                 # Number of MPI ran
#SBATCH --cpus-per-task=8
#SBATCH --mem=62GB
#SBATCH --time=96:00:00       #Time limit hrs:min:sec
#SBATCH --output=/blue/ewhite/everglades/everwatch-workflow/logs/bird_detector_%j.out   # Standard output and error log
#SBATCH --error=/blue/ewhite/everglades/everwatch-workflow/logs/bird_detector_%j.err
#SBATCH --partition=gpu
#SBATCH --gpus=1
ulimit -c 0
cd /blue/ewhite/everglades/everwatch-workflow
source activate everwatch
python predict.py
EOT
