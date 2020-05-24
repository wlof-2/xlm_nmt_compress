python train.py --exp_name unsupMT_ende \
--dump_path ./dumped/ \
--reload_model 'mlm_ende_1024.pth,mlm_ende_1024.pth' \
--data_path './data-en-de/processed/en-de/' \
--lgs 'fr-de-tr-pl-vi-ar-zh-pt-it-ja-nl-hi-es-en-sv-ko-ru' \
--ae_steps 'en,de' \
--bt_steps 'en-de-en,de-en-de' \
--word_shuffle 3 \
--word_dropout 0.1 \
--word_blank 0.1  \
--lambda_ae '0:1,100000:0.1,300000:0' \
--encoder_only false  \
--emb_dim 1024  \
--max_vocab 200000 \
--use_lang_emb false \
--save_periodic -1 \
--n_layers 1 \
--n_heads  1 \
--dropout 0.1  \
--attention_dropout 0.1  \
--gelu_activation true \
--tokens_per_batch 2000  \
--batch_size 2  \
--bptt 256  \
--optimizer adam_inverse_sqrt,beta1=0.9,beta2=0.98,lr=0.0001  \
--epoch_size 200000  \
--eval_bleu true \
--stopping_criterion 'valid_en-de_mt_bleu,10' \
--validation_metrics 'valid_en-de_mt_bleu' \
--distillation 1
