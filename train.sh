python Distillation.py --exp_name try_lstm \
--dump_path ./dumped/ \
--data_path './data/processed/de-en/' \
--lgs 'de-en' \
--mt_steps 'de-en' \
--ae_steps 'de,en' \
--word_shuffle 3 \
--word_dropout 0.1 \
--word_blank 0.1  \
--lambda_ae '0:1,100000:0.1,300000:0' \
--emb_dim 1024  \
--n_layers 6 \
--n_heads  8 \
--dropout 0.1  \
--attention_dropout 0.1  \
--gelu_activation true \
--tokens_per_batch 2000  \
--batch_size 32  \
--bptt 256  \
--optimizer adam_inverse_sqrt,beta1=0.9,beta2=0.98,lr=0.0001  \
--epoch_size 200000  \
--eval_bleu true \
--stopping_criterion 'valid_en-de_mt_bleu,10' \
--validation_metrics 'valid_en-de_mt_bleu' \
--max_epoch 15
