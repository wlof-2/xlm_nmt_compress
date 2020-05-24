import torch
import torch.nn as nn

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")


class EncoderRNN(nn.Module):
    def __init__(self, input_size, hidden_size):
        super(EncoderRNN, self).__init__()
        self.hidden_size = hidden_size

        self.embedding = nn.Embedding(input_size, hidden_size)
        # with embedding, the input size of LSTM is hidden_size
        self.lstm = nn.LSTM(hidden_size, hidden_size, bidirectional=True,batch_first=True)
        self.out = nn.Linear(hidden_size*2, hidden_size)

    def forward(self, in_put, hidden):
        embedded = self.embedding(in_put).view(1, 1, -1)
        output = embedded
        # 中间的 embed 向量就是通过编码后的 one-hot向量
        output, hidden = self.lstm(output, hidden)
        output = self.out(output)
        return output, hidden

    def initHidden(self):
        return torch.zeros(2, 1, self.hidden_size, device=device)
    # 这里为什么要设置成三维的呢

