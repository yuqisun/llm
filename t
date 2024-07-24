Moogle 2024 Jun script

> 以时间为轴

hi 大家好，我是yuqi来自大连site，是今天的host和speaker。

首先自我介绍一下，我是一个developer，今年是我在花旗工作的第十一年，除了现在从事的股票借贷费率业务，我还做过操作风险和ETF的业务。

我对 Java，机器学习，加密算法都感兴趣，也在为citi的开源项目工作，也会为CGRA开源项目做一些辅助工作，同时很荣幸我是E3 program的一员。

我今天想给大家展示一个针对视频的搜索工具，希望对大家有帮助。

很荣幸我能代表 moogle团队，实际上有很多人参与这个项目，他们在想法和硬件上都提供了很多支持，尤其是wendy和rob，谢谢。

我会介绍Moogle的功能，但在这之前我不得不先讲一下它的故事，因为如果现在让我不使用大模型重新再做一个同样的工具，我一定会说这是不可能实现的。但事实是我们就是这样走过来的。

---

Hi everyone, welcome to today's equity finanace tech sharing, I'm Yuqi from Dalian site, today's host and speaker. 

Let me take a moment to introduce myself in case some of you may not know about me.

I'm a developer and this month, July 1st is my eleventh year at Citi. I'm currently working on the stock borrow loan business and apart from this,  I have also worked on operational risk and ETF business before.

As a developer, I'm interested in Java, machine learning, and encryption algos. I also contribute to a Citi's open-source project and provide some assistant work for CGRA open-source project. And I'm also a member of the E3 program.

Today, I'd like to share you a search tool designed for videos,  hope it will be helpful to everyone.

I'm honored to present on behalf of our Moogle team. Actually, many people have contributed to this project, provided a lot of support in ideas and hardware. Especially Wendy and Rob, thank you.

I'll walk you through the features of Moogle, but before that, I'd like to share journey of it first. Because if I were asked to recreate the same tool without using LLM now, I would definitely say it's impossible. But the truth good news is, we built it, we are here now.

> 背景 - 点出所有人都会遇到这个问题

这个想法诞生的很早，在2022年，还没有chatgpt的时候。大连site组织了多次业务和技术的线上分享，同事们受益良多，但是有些业务知识我当时并不能理解，比如TLC - trade life cycle，因为在我的工作范围中没有接触到，等我在工作中接触到的时候，我想去了解，我找到当时Rob讲的视频，当然我可以一秒一秒的看，但是视频实在太长了，有两个小时，也可以跳着看，但有可能跳过关键部分。还有可能我看完了两个小时，发现这个视频没有提到我感兴趣的东西。

我相信遇到这种困境的不只是我自己，也不只是Citi的员工，这是一个普遍存在的问题。

---

This idea was born quite early, back in 2022, before ChatGPT. Dalian site organized multiple online sharing sessions on business and technology, from which colleagues benefited greatly. However, there was some business knowledge that I couldn't understand at that time, such as TLC - trade life cycle, because it was not within my work scope. When I did encounter it in my work, I found the video by Rob. Of course, I could watch it frame by frame, second by second, but the video is very long, two hours. I could also skip through it, but there was a risk of missing key parts. There was also the possibility that even after watching the full two hours, I would find that the video didn't mention anything I was interested in.

I believe I'm not the only one facing this challenge, not the only employees in Citi. It's a common issue that many people encounter.

> 团队精神

所以我在关于那次分享的survey中提了这个问题，幸运的是Wendy当时也正在筹备组织大连的tech guild，她详细了解了我的问题并在guild上与成员进行了讨论。

---

So, I raised this issue in the survey regarding those sharing sessions. Fortunately, Wendy was at that time preparing the tech guild inside Citi for members to communicate. She took a detailed look at my question and discussed it with the members in the guild.

> 组织能力

guild成员一致认为这是一个很好的痛点，同时可能是全公司甚至所有世界上想搜索视频的人遇到的挑战，我们都很兴奋且跃跃欲试。在两周一次的会议中，guild成员头脑风暴了很多次，因为兴趣而加入的人也越来越多，有来自大连，上海，日本的不同部分的员工加入，我们沿着脚本的路深入探索。

---

All members agreed that this was a great pain point, it might be a challenge faced by everyone in the company and even all those around the world who want to search for videos. We were all very excited and cannot wait to try. 

During the bi-weekly meetings, the guild members brainstormed many times, and more and more people joined of interest. Speaking of this, I have to say Citi really provides us a great global platform and outstanding culture of collaboration, we have members from many different departments and areas. From Dalian, from Shanghai Rates department and Documentum department of Japan.

> 工程师精神 - 困境1 - ppt model page v1

说到解决方案，我们首先从视频中提取文字，虽然现在的ASR模型已经很准确了，word error rate已经很低了，但依然会遇到一些问题，尤其是遇到一些专有名词或缩写时，还有我们很多分享是中英双语混合使用的。对此我们不得不做很多手动纠正的工作以确保文本的准确性。

在没有大模型的情况下，我们对整段视频脚本使用QA模型进行问答，对于一个一万字左右的脚本，在我16核cpu的vdi上需要超过5分钟的推导，每次测试都需要很长的时间，但是幸运的是，it works，我们证明了这是一条可行的方案。这是最重要的部分，也是最激动人心的部分。

---

For the solution, we firstly extracted text from the videos, even though the ASR model is already very accurate, with a very low word error rate, there're still issues. Especially for some specialized term or acronyms, and also some presentations are in a mix of Chinese and English, this will increase the difficulty of transcribing.

> for example, xxx 增加例子

For this, we have to do a lot of manual corrections to ensure the accuracy of the text.

Next step, because there was no LLM at that time, we used a QA model to get the answer based on the video scripts. For a ten thousand words script, it usually took over 5 minutes to infer on my 16-core CPU's VDI. But good news is, it works; we proved that this is a viable solution. 

This is the most important part and also one of the most exciting parts.

> RAG先驱 - 稀缺性

为了加速QA的部分，我们对脚本进行了分割，这同时产生了语义上的错乱，因为有些主语出现在上一个段落，而在下一个段落中是it, that等代词。这阻碍了推导，所以我们在分割的时候在段落之间加上了overlap，同时识别段落中的实体也是曾经的一个讨论方案。这听起来很熟悉对吧，是的，RAG，所以在RAG出现的时候我们一下子就理解了它的过程，因为我们走过同样的路。

---

To speed up the QA part, we segmented the script, which of course bring us some disadvantage in semantic because some subjects appear in the previous paragraph, but in the next paragraph, they are replaced by word like 'it' or 'that'. This caused issue when inferring, so we added an overlap between paragraphs. And, entity reorganization model is also a choice for us at that time. 

You may find this familiar. Yes, it's just like RAG. So when RAG came out, we understood its process immediately because we had walked the same way.

> 工程师精神 - 困境2 - ppt model page v2

不同的是，在当时我们可没有大模型，而QA模型的答案只有一两个词，非常简单，不能详细解释用户的提问。所以我们对答案附近的上下文进行了总结，以此来提供更好的答案。而有时可能会找到多个答案，我们又引入了GPT2对多个答案进行了合并。虽然GPT2只有几百兆的参数，但是对于vdi来说也需要至少3分钟来生成。所以最终，我们创造了一个可以搜索视频，生成摘要，生成答案的fancy的工具，唯一的瑕疵是回答一个问题需要大概6-10分钟的时间，就像一个非常时尚的汽车，每个人都说它看起来很酷，但是开起来却和步行速度一样，这真是一个华丽的工具，以至于我们不应该称它为工具，而是艺术品，并且旁边要有一个说明：an very useful tool but, don't touch please！

性能问题是另一位维度的问题，靠代码的调试收效甚微，幸好在Rob的帮助下，我们build 了一个macbook环境，使整个过程缩短到10秒之内。终于为我们的汽车装上了发动机，我们把车开出了博物馆。

---

Different is, there was no LLM for us at that time, the QA model's answers were just one or two words, too simple to answer user's query. So, we summarized the context around the answer. For multiple answers, we started to use GPT-2. Although it's 4 hundred million parameters model, still took at least 3 minutes to generate. 

In the end, we created a fancy tool that can search videos, generate summaries, and produce answers. The only issue is that each question takes about 6-10 minutes, much like a very fashion car that all people think it's cool, but it's as slow as a snail. It's such fancy that we shouldn't call it a tool, but an art, and there must be a note next to it: "A very useful tool, but please don't use it!"

Performance issue is in a different dimentsion, cannot fix it by adjust code. Fortunately, Rob helped build a dedicated Mac environment, which can complete this proces in 10 seconds. We've put an engine in our fancy car, we can drive it out of the musemu now.

> 工程师精神 - 保持探索 - ppt model page v3 + embedding

接下来的故事大家都比较熟悉了，大概一年之后，ChatGPT破圈，虽然我们没有权限调用ChatGPT turbo，但是它提醒了我们，使用embedding来增强搜索，同时很多优秀的开源LLM我们可以选择，比如我们当前在使用的ChatGLM，最近大家可能也听说过，斯坦福对它很感兴趣（抄袭）。

---

The following story is more familiar to everyone. About a year later, ChatGPT is here. Although we don't have access to the ChatGPT turbo directly, it gave us the idea of embeddings to enhance search. At the same time, there are many excellent open-source LLMs we can choose, like ChatGLM we're using. 

> 成果

现在让我展示一下当前的功能：

1. 视频搜索
2. 字幕功能
3. 摘要功能
4. pdf搜索

看起来不错对吧，PA Youth慈善组织也这么认为，我们在去年Tech Fest Hackathon中实现了类似的功能并获胜，Nikhil是我们PA Youth Vote项目的sponsor。

当前Moogle有将近200个视频，有来自中国，日本，新加坡，印度，美国的超过300个用户。

如果你喜欢Moogle，欢迎使用，欢迎加入Moogle团队。谢谢。

---

Now, let me demo it.

It looks good? We implemented similar feature in last year's Tech Fest Hackathon and won at the end in PA Youth Vote category, and luckly Nikhil is the sponsor of that project.

Currently, Moogle has nearly 200 videos, over 195 hours and is used by over 300 users from China, Japan, Singapore, India, and the United States.

## What's next?

And as you know, Citi is now open to register usecase for GenAI, I have also registered for Moogle and working with MRM and AIOC to review, I found the steps is really complicated, if anyone is familiar with this process, really appreciate it if you can help with this.

And if you like Moogle, welcome to use it and welcome to join us. Thank you.


#############################################

rate prediction presentation

Hi everyone, 我是yuqi，来自SBL Rate Team，上一次给大家分享了视频搜索工具Moogle，主要基于向量搜索和大语言模型，上一期结束之后有很多人提问了关于向量数据库的问题，我先用几分钟的时间回答一下。

首先向量数据库与传统数据库的区别在于它存储的是向量而非常量，embedding模型是一种基于已有预料预训练的模型用于把文字转换成向量，而转成向量的最终目的是我们可以使用向量替代文本来计算相似度，这样我们才能知道我们的问题和已有的文本有多相似，这是一种对于关键字搜索的增强，可以理解为语义所搜。

计算向量相似度有几种方式，比如点积，cosin，略有差异。

我使用的向量数据库是 faiss，它容易上手，可以通过安装python包快速使用，但是不支持标量查询，我正在考虑使用chromadb，是一种支持标量查询的向量数据库。另外公司也提供 Milvus，功能更强大，但是要自己搭建。

因为时间有限，如果大家还有其他问题可以回看之前的视频或者欢迎直接联系我。

---

回到今天的主题，也是和机器学习相关的项目，不过这次是和我们SBL的业务结合的，主要由一位曾经在citi工作过的资深desk user和我共同完成。我先介绍一下SBL的背景，我也希望通过今天的展示给大家提供一种思路，可以把机器学习应用在其他的业务领域中。

**提问：**首先我想问下，有人做过short吗？nobody？是的，short 是一个高风险的操作。今天的业务和short有关。

citi是一个股票中间商，它从其他人那里借来股票，然后借给另外一些人，当然这里有更多的细节，比如在金融危机之后不允许裸卖空，总之如果一个客户想卖空一只股票，那么它必须要先借到这支股票，citi就是其中一个可以提供股票借贷的地方。

citi会通过收取手续费赚钱，就是这里的 lending fee。而价格由供求关系决定，无论是实体商品的价格还是股票借贷的价格。所以，不同的股票，想卖空它的人会有的多有的少，所以借贷的价格就会不同，当然肯定是想借的人越多价格就越高，反之就是价格越低。这也是为什么有时候SBL的desk user会把rate称为price。

---

正因为这样，因为不同的股票有不同的借贷费率，所以desk user需要根据每天的市场变化，改变借贷费率。因为如果价格过低，而股票实际热度很高，那citi实际相当于少赚了一些钱，而如果价格过高而股票实际没有那么高的热度，就是没有那么多人想借，就会导致没有人来citi借，也会导致citi收益减少。

---

**那每天desk user要修改多少次股票的费率呢？**

citi将SBL费率大致分为三类，当然现在又增加了一类SR。AO，即account level，比如blackrock，无论client借哪支股票，我们之间都使用同一个费率，当然我们和client之间的费率也会调整。然后是CO，即security level，也是我们用于训练的数据集，最后是GC rate。根据历史数据，我们共有400个左右的AO费率，而desk user每天要修改30个左右。而对于CO，大概有6000个费率，desk user每天平均要修改250个，而对于一些特殊的时期，比如美联储首次加息的时候，desk user连续两天修改费率超过400个。

那修改费率的desk user一共有几个人呢，你可以猜一下，10个，20个？实际只有5，6个人，查询数据库的记录，每个人平均5分钟就要修改一条记录，从早上到晚上不停的在修改。

而即使是这样，依然不能确定他们覆盖了所有的股票，因为股票实在太多，而变化每天都在发生。

---

**那不能及时修改股票的费率会有什么影响呢？**

从citi角度，比如看这样图，我查询了top 30的client的借贷amount value，平均的价值为480W美元，我们假设提高2%的费率，那每个股票，每天就是266美元，再想想我们有6000支股票，数量会很大。

从client角度，如果citi在股票热度降低的时候能比其他中间商先降低费率，那对于client来说citi给出的费率就是有竞争力的，即使早半天，client也会觉得我们的信息渠道是更快的，更值得信任的。

---

**那我们怎么使用历史的数据来帮我我们呢？**

在最开始的时候我使用了神经网络在进行训练，因为我相信，和简单的决策树比起来，神经网络能处理更复杂的情景。神经网络是一种靠多个神经元协作来完成的计算，你可以想象你有100个或一千个或十亿个开关来控制你的世界，有的开关控制你每天睡几个小时，有的开关控制你的财富，你一转这个开关你马上变成一个百万富翁，我真希望我能找到这个开关。而你的最终目的就是控制自己活到100岁，不能多也不能少，越接近100就证明你对开关的组合做的越好。这就是神经网络，我们的历史数据就是开关，股票的费率就是活到100岁这个目标。

---

但后来发现DF能达到更小的误差。决策树和神经网络不同，它简单的多。你可以想象一棵树的每个分支就是一个if else，if 当前的值大于一个数，那就向左，否则向右，就这样不断的if else，最后得出一个结果来。那对于决策树的不足也很明显，如果出现一个之前没存在过的数值，如果美联储加息到前所未有的值，它只能通向最边上的分支，解决的办法就是要重新训练决策树。

----

这里我使用决策树首先训练出一个方向模型，因为对于费率来说，是变大还是变小这是最重要的事，然后方向模型的输出作为下一个模型的数据，训练另外一个费率模型。

这里是模型产生的report，一个是shadow mode report，就是人每改变一条，模型紧接着做一个预测进行对比，来验证模型的准确率，可以看到模型的误差是非常小的。另一个是AI assistance，就是每天帮助用户生成关注的费率，来帮助用户及时发现需要修改的费率。

---

看一下模型的表现。

---

这里是我们使用的数据源，有来自xx的和xx的，这里每一个特征，desk user都review过，有一些她认为比较重要，有一些她认为和其他特征是线性相关的。

---

并且这里提醒大家，虽然我们会写代码，我们理论上可以知道一个application的逻辑，但关于业务的知识最好还是和business多交流，因为有些事情只有他们知道。我在自己训练模型的时候我认为已经达到了一个瓶颈，但是经过一段时间，每天晚上和desk user交流，我被告知对于penny stock，一种价格低于1美元的stock，他们会有一个特殊的操作来计算费率。如果我直接把它们和其他stock的历史数据一块训练，那就导致数据的不一致，最终影响模型的性能。

---

这是特征的重要性排序，基本和desk user的预期是一样的。

---

今天的展示可能对于不做SBL rate的同事来说不是那么有帮助，但是我想提供给大家一种思路，就像andrew说的，当前是大模型的时代，但是当前也不只有大模型，有些小的或者像这样的专家系统可能对我们帮助更大，而cost更低，如果大家在自己的工作中遇到类似的问题，可以考虑使用机器学习来构建一个自己的模型。

谢谢大家。现在大家有什么问题可以提问。

---

---

Rate Prediction Presentation

Hi everyone, I'm Yuqi, from the SBL Rate Team. Last time, I shared with you the video search tool Moogle, which is mainly based on vector search and large language model. After last session, there're many questions about vector database, so please allow me take a few minutes to answer that first.

Firstly, the difference between vector databases and traditional databases is that it stores vectors instead of constants. And it needs an embedding model which is a pre-trained model based on existing materials, to convert text into vectors. The ultimate goal of converting to vectors is that we can use vectors instead of text to calculate similarity. This way, we can know how similar our questions are to existing texts. This is an enhancement of keyword search and can be understood as semantic search.

There are several ways to calculate vector similarity, such as dot product and cosine.

The vector database I use is Faiss, which is easy to get started with and can be quickly used by installing a Python package, but it does not support scalar queries. I'm considering using ChromaDB, which is a vector database that supports scalar queries. In addition, citi also provides Milvus, which is more powerful but needs to be set up by yourself.

Due to time limitation, if you have any other questions, you can revisit the previous video or feel free to contact me directly.

---

Back to today's topic, which is also related to machine learning, but this time it's combined with our SBL business, mainly completed by a senior desk user and me. I will first introduce the background of SBL, and I also hope that today's presentation will provide everyone with a way of thinking, which can apply machine learning to other business areas.

**Question:** First, I would like to ask if anyone has ever short stocks? Nobody? Yes, shorting is a high-risk operation. Today's business is related to it.

Citi is a stock broker that borrows stocks from somebody and then lends them to others. Of course, there are more details here, such as the prohibition of naked short after the financial crisis. If a client wants to short a stock, they must first borrow the stock, and Citi is one of the places that can provide stock lending.

Citi makes money by charging a fee, which is the lending fee here. And as we all know, the price is determined by the supply and demand, whether it is the price of physical goods or the price of stock lending. So, different stocks, the number of people who want to short them varies, so the lending price will be different. Of course, the more people who want to borrow, the higher the price, and vice versa. This is also why sometimes SBL's desk users call the rate as "price."

---

Because of this, because different stocks have different lending fees, desk users need to change the lending rates according to the daily market changes. Because if the price is too low and the actual popularity of the stock is very high, then Citi is actually making less money, and if the price is too high and the stock is not that popular, that is, not many people want to borrow, it will lead to no one coming to Citi to borrow, which will also lead to a decrease in Citi's profit.

---

**How many times does the desk user need to change the stock fee every day?**

Citi roughly divides SBL rates into three categories, and now an additional category SR has been added. AO, that is, account level, such as BlackRock, no matter which stock the client borrows, we use the same rate between us, of course, the rate between citi and the client will also be adjusted. Then there is CO, that is, security level, which is also the dataset we used for training, and finally, the GC rate. According to historical data, we have about 400 AO rates, and the desk user needs to change about 30 every day. For CO, there are about 6,000 rates, and the desk user needs to change an average of 250 every day, and for some special periods, such as when the US raised interest rates the first time, the desk user changed the rate more than 400 in two consecutive days.

**How many desk users are there who change the rate? **

You can guess, 10, 20? In fact, there are only 5 or 6 people, query the database records, each person needs to change a record every 5 minutes, constantly changing from morning to night.

And even so, it is still not certain that they cover all the stocks, because there are too many stocks, and changes are happening every day.

---

**What are the impacts if the stock rate cannot be changed in time?**

From Citi's perspective, for example, look at this chart, I queried the top 30 client's lending amount value, the average value is 4.8 million US dollars, let's assume we increase the rate by 2%, then each stock, every day, is 266 US dollars, and think about that we have 6,000 stocks, the amount will be very big.

From the client's perspective, if Citi can lower the rate before other brokers when the stock popularity decreases, then the rate given by Citi will be more competitive, even if it is half a day earlier, the client will feel that our information channel is faster and more trustworthy.

---

**How do we use historical data to help us?**

At the beginning, I used neural networks for training because I believe that compared to simple decision trees, neural networks can handle more complex situations. Neural networks are calculations completed by the collaboration of multiple neurons. You can imagine that you have 10 or a thousand or a billion switches to control your world, your real world, some switches control how many hours you sleep every day, some switches control your wealth, you can adjust this switch and you immediately become a millionaire, I really hope I can find this switch. And your ultimate goal is to control yourself to live to 100 years old, not more and not less, the closer to 100, the better you do with the combination of the all switches. This is the neural network, our historical data are the switches, and the stock rate is the goal of living to 100 years old.

---

But later I found that decision trees can achieve smaller errors. Decision trees are different from neural networks, they are much simpler. You can imagine that each branch of a tree is an if-else, if the current value is greater than a number, then go to left, otherwise go to right, and so on, and finally come to a result. The disadvantage of decision trees are also obvious, if there is a value that has not existed before, such as the US raises interest rate to a new high value, it can only go to the edge of the branch, the solution is to retrain the decision tree.

---

Here I use the decision tree to first train a direction model, because for the rate, whether it is getting bigger or smaller is the most important thing, and then the output of the direction model is used as the data for the next model to train another rate model.

Here is the report generated by the model, one is the shadow mode report, which is that every time a person changes one, the model immediately makes a prediction for comparison to verify the accuracy of the model, and it can be seen that the model's error is very small. The other is AI assistance, which is to help users generate the rate of concern every day, to help users find the rate that needs to be modified in time.

---

Let's take a look at the performance of the model.

---

Here are the data sources we use, some from xx and some from xx, here every feature, the desk user has reviewed, some she thinks are important, some she thinks should be linearly related to other features, so removed.

---

And here to remind everyone, although we can write code, we can theoretically know the logic of an application, but the knowledge about the business is best to communicate with the business person, because there are some things only they know. When I was training the model myself, I thought I had reached a bottleneck, but after a period of time, communicating with the desk user every night, I was told that for penny stocks, which is a kind of stock with a price lower than 1 dollar, they have a special operation to calculate the rate. If I trained them directly with the historical data of other stocks, it would lead to data inconsistency and ultimately affect the performance of the model.

---

This is the importance of the feature ranking, which is basically the same as the desk user's expectation.

---

Today's presentation may not be so helpful for colleagues who do not work on SBL rate business, but I want to provide everyone with a way of thinking, just like Andrew said, now is the era of LLM, but there's only onlyLLM, some small or such expert system may help us more, and the cost is lower. If everyone encounters similar question in their work, they can consider using machine learning to build their own model.

Thank you, everyone. Now if you have any questions, you can ask.

---
