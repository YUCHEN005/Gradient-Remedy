#!/bin/bash
echo
echo "$0 $@"
echo
echo `date`
echo
set -e
set -u
set -o pipefail
nj=16

stage=2
stop_stage=12
ngpu=2
asr_config=conf/train_gradient_remedy.yaml
inference_config=conf/decode.yaml
lm_config=conf/train_lm_adam.yaml
audio_format=wav # Audio format (only in feats_type=raw).
fs=8k
train_set=rats_Ach_waveform_8k_joint_enh_asr_train
valid_set=rats_Ach_waveform_8k_joint_enh_asr_valid
test_sets=rats_Ach_waveform_8k_joint_enh_asr_test
dumpdir=dump_rats_Ach_waveform_8k                   # Directory to dump features.
expdir=exp_rats_Ach_waveform_8k_gradient_remedy     # Directory to save experiments.
use_lm=true
feats_type=raw
bpemode=bpe


. utils/parse_options.sh

./rats_chA_gradient_remedy.sh    \
    --stage $stage \
    --stop_stage $stop_stage \
    --lang en \
    --feats_type $feats_type \
    --fs $fs \
    --audio_format $audio_format \
    --dumpdir "$dumpdir" \
    --expdir  "$expdir" \
    --ngpu $ngpu \
    --nbpe 1000 \
    --use_lm ${use_lm} \
    --bpemode $bpemode \
    --max_wav_duration 30 \
    --joint_config  "${asr_config}" \
    --lm_config "${lm_config}" \
    --decode_config "${inference_config}" \
    --train_set "${train_set}" \
    --valid_set "${valid_set}" \
    --test_sets "${test_sets}" 


