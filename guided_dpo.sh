#!/bin/bash

python -m torch.distributed.run \
    --nproc_per_node $NPROC_PER_NODE \
    --nnodes $NNODES \
    --node_rank $RANK \
    --master_addr $MASTER_ADDR \
    --master_port $MASTER_PORT \
    src/train_bash.py \
    --deepspeed ../deepspeed/ds_z3_config.json \
    --stage dpo \
    --do_train \
    --model_name_or_path mistralai/Mixtral-8x22B-Instruct-v0.1 \
    --dataset hint_add_dpo \
    --dataset_dir ./data \
    --template mistral \
    --finetuning_type full \
    --output_dir ./saves/Mixtral-8x22B/guided_dpo \
    --overwrite_cache \
    --overwrite_output_dir \
    --cutoff_len 8192 \
    --preprocessing_num_workers 16 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 8 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --warmup_steps 20 \
    --save_steps 100 \
    --eval_steps 100 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --learning_rate 5e-6 \
    --num_train_epochs 1.0 \
    --max_samples 1000 \
    --val_size 0.1 \
    --dpo_beta 0.01 \
    --dpo_ftx 0.2 \
    --plot_loss \
    --bf16
