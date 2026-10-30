#!/bin/bash
ALGO="FedRep"

for seed in {0..9}; do
  for jr in 0.4 0.6 0.8 1.0; do
    echo "▶️ Running: Fraction=$jr, Seed=$seed"
    python main.py -data Camelyon17 -m ResNet18 -algo $ALGO \
      -gr 100 -ls 5 -lr 0.1 -jr $jr -nc 5 -seed $seed \
      -did 0 -dev cuda -lbs 128 -t 1 -pls 5 \
      > log_${ALGO}_jr${jr}_seed${seed}.txt 2>&1
  done
done