
#!/bin/bash
# 用法：CUDA_VISIBLE_DEVICES=1 bash run_lr.sh
ALGO="FedPer"

for seed in {0..9}; do
  for lr in 0.01 0.05 0.1 0.2; do
    echo "Running: LR=$lr, Seed=$seed"
    python main.py -data Camelyon17 -m ResNet18 -algo $ALGO \
      -gr 100 -ls 5 -lr $lr -jr 0.6 -nc 5 -seed $seed \
      -did 0 -dev cuda -lbs 128 -t 1 -pls 5 \
      > log_${ALGO}_lr${lr}_seed${seed}.txt 2>&1
  done
done