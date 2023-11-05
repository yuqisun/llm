import nltk
from nltk.corpus import stopwords
from collections import Counter
import matplotlib.pyplot as plt

# 下载nltk的punkt和stopwords数据
nltk.download('punkt')
nltk.download('stopwords')

# 定义停止词
stop_words = set(stopwords.words('english'))

# 添加额外的停止词
extra_stop_words = ['I', 'a', 'are']
stop_words = stop_words.union(extra_stop_words)


# 定义函数来处理文本，计算词频，排除停止词
def process_text(text):
    words = nltk.word_tokenize(text)  # 对文本进行分词
    words = [word.lower() for word in words if word.isalpha()]  # 转换为小写，移除非字母字符
    words = [word for word in words if word not in stop_words]  # 移除停止词
    return Counter(words)  # 计算词频并返回


# 输入txt文件的路径
txt_path = 'news.txt'  # 你需要替换成你的txt文件路径

with open(txt_path, 'r', encoding='utf-8') as file:
    text = file.read()  # 读取txt文件

word_freq = process_text(text)  # 处理文本，得到词频
sorted_word_freq = sorted(word_freq.items(), key=lambda x: x[1], reverse=True)  # 按照词频从高到低排序

# 生成柱状图
plt.figure(figsize=(16, 8))
plt.bar([word for word, freq in sorted_word_freq[:20]], [freq for word, freq in sorted_word_freq[:20]])
plt.xlabel('Words')
plt.xticks(rotation=45)
plt.xticks(fontsize=8)  # 设置横轴标签的字体大小为8
plt.ylabel('Frequency')
plt.title('Word Frequency Bar Chart')
plt.show()
