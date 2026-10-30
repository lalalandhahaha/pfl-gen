#!/bin/bash
ALGO="FedRep"

for seed in {0..9}; do
  for ls in 1 2 3 4 5; do
    echo "▶️ Running: Epoch=$ls, Seed=$seed"
    python main.py -data Camelyon17 -m ResNet18 -algo $ALGO \
      -gr 100 -ls $ls -lr 0.1 -jr 0.6 -nc 5 -seed $seed \
      -did 0 -dev cuda -lbs 128 -t 1 -pls 5 \
      > log_${ALGO}_ls${ls}_seed${seed}.txt 2>&1
  done
done