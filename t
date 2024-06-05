Moogle 2024 Jun script

> 以时间为轴

hi 大家好，我是yuqi来自大连site，今天想给大家展示一个针对视频的搜索工具，希望对大家有帮助。

很荣幸我能代表 moogle团队，实际上有很多人参与这个项目，他们在想法和硬件上都提供了很多支持，尤其是wendy和rob，谢谢。

我会介绍Moogle的功能，但在这之前我不得不先讲一下它的故事，因为如果现在让我不使用大模型重新再做一个同样的工具，我一定会说这是不可能实现的。但事实是我们就是这样走过来的。

---

Hi everyone, I'm Yuqi from Dalian site. Today, I'd like to show you a search tool designed for videos, hoping it will be helpful to everyone.

I'm honored to represent the Moogle team. Actually, many people have contributed to this project, provided a lot of support in ideas and hardware. Especially Wendy and Rob, thank you.

I'll walk you through the features of Moogle, but before that, I'd like to share its story first. Because if I were asked to recreate the same tool without using LLM now, I would definitely say it's impossible. But the truth is, that's how we've come this far.

> 背景 - 点出所有人都会遇到这个问题

这个想法诞生的很早，在2022年，还没有chatgpt的时候。大连site组织了多次业务和技术的线上分享，同事们受益良多，但是有些业务知识我当时并不能理解，比如TLC - trade life cycle，因为在我的工作范围中没有接触到，等我在工作中接触到的时候，我想去了解，我找到当时Rob讲的视频，当然我可以一秒一秒的看，但是视频实在太长了，有两个小时，也可以跳着看，但有可能跳过关键部分。还有可能我看完了两个小时，发现这个视频没有提到我感兴趣的东西。

我相信遇到这种困境的不只是我自己，也不只是大连的员工，这是一个普遍存在的问题。

---

This idea was born quite early, back in 2022, before ChatGPT. Dalian site organized multiple online sharing sessions on business and technology, from which my colleagues benefited greatly. However, there was some business knowledge that I couldn't understand at that time, such as TLC - trade life cycle, because it was not within my work scope. When I did encounter it in my work, I found the video by Rob. Of course, I could watch it frame by frame, second by second, but the video is very long, two hours. I could also skip through it, but there was a risk of missing key parts. There was also the possibility that even after watching the full two hours, I would find that the video didn't mention anything I was interested in.

I believe I'm not the only one facing this challenge, not the only employees in Dalian. It's a common issue that many people encounter.

> 团队精神

所以我在关于那次分享的survey中提了这个问题，幸运的是Wendy当时也正在筹备组织大连的tech guild，她详细了解了我的问题并在guild上与成员进行了讨论。

---

So, I raised this issue in the survey regarding those sharing sessions. Fortunately, Wendy was at that time preparing the tech guild in Dalian. She took a detailed look at my question and discussed it with the members of the guild.

> 组织能力

guild成员一致认为这是一个很好的痛点，同时可能是全公司甚至所有世界上想搜索视频的人遇到的挑战，我们都很兴奋且跃跃欲试。在两周一次的会议中，guild成员头脑风暴了很多次，因为兴趣而加入的人也越来越多，有来自大连，上海，日本的不同部分的员工加入，我们沿着脚本的路深入探索。

---

The guild members agreed that this was a great pain point, it might be a challenge faced by everyone in the company and even all those around the world who want to search for videos. We were all very excited and eager to try. During the bi-weekly meetings, the guild members brainstormed many times, and more and more people joined of interest, with employees from different departments of Dalian, Shanghai, and Japan.

> 工程师精神 - 困境1 - ppt model page v1

我们从视频中获取文本，在没有大模型的情况下，我们对整段视频脚本使用QA模型进行问答，对于一个一万字左右的脚本，在我16核cpu的vdi上需要超过5分钟的推导，每次测试都需要很长的时间，但是幸运的是，it works，我们证明了这是一条可行的方案。这是最重要的部分，也是最激动人心的部分。

---

We extracted text from the videos, and without a LLM, we used a QA model for the entire video script. For a script of about ten thousand words, it took over 5 minutes to infer on my 16-core CPU's VDI. But fortunately, it works; we proved that this is a viable solution. This is the most important part and also one of the most exciting part.

> RAG先驱 - 稀缺性

为了加速QA的部分，我们对脚本进行了分割，这同时产生了语义上的错乱，因为有些主语出现在上一个段落，而在下一个段落中是it, that等代词。这阻碍了推导，所以我们在分割的时候在段落之间加上了overlap，同时识别段落中的实体也是曾经的一个讨论方案。这听起来很熟悉对吧，是的，RAG，所以在RAG出现的时候我们一下子就理解了它的过程，因为我们走过同样的路。

---

To speed up the QA part, we segmented the script, which caused some issue in semantic because some subjects appear in the previous paragraph, but in the next paragraph, they are replaced by word like 'it' or 'that'. This caused issue when inferring, so we added an overlap between paragraphs. And, entity reorganization model is also a choice for us at that time. Does this sound familiar? Yes, it's RAG. So when RAG came out, we understood its process immediately because we had walked the same way.

> 工程师精神 - 困境2 - ppt model page v2

不同的是，在当时我们可没有大模型，而QA模型的答案只有一两个词，非常简单，不能详细解释用户的提问。所以我们对答案附近的上下文进行了总结，以此来提供更好的答案。而有时可能会找到多个答案，我们又引入了GPT2对多个答案进行了合并。虽然GPT2只有几百兆的参数，但是对于vdi来说也需要至少3分钟来生成。所以最终，我们创造了一个可以搜索视频，生成摘要，生成答案的fancy的工具，唯一的瑕疵是回答一个问题需要大概6-10分钟的时间，就像一个非常时尚的汽车，每个人都说它看起来很酷，但是开起来却和步行速度一样，这真是一个华丽的工具，以至于我们不应该称它为工具，而是艺术品，并且旁边要有一个说明：an very useful tool but, don't touch please！

性能问题是另一位维度的问题，靠代码的调试收效甚微，幸好在Rob的帮助下，我们build 了一个macbook环境，使整个过程缩短到10秒之内。终于为我们的汽车装上了发动机，我们把车开出了博物馆。

---

Different is, there was no LLM for us at that time, the QA model's answers were just one or two words, too simple to answer user's query. So, we summarized the context around the answer. For multiple answers, we started to use GPT-2. Although GPT-2 only 4 hundred million parameters, still took at least 3 minutes to generate. 

In the end, we created a fancy tool that can search videos, generate summaries, and produce answers. The only issue is that each question takes about 6-10 minutes, much like a very fashion car that all people think it's cool, but it's as slow as a snail. It's such fancy that we shouldn't call it a tool, but an art, with a note next to it: "A very useful tool, but please don't use it!"

> 工程师精神 - 保持探索 - ppt model page v3 + embedding

接下来的故事大家都比较熟悉了，大概一年之后，ChatGPT破圈，虽然我们没有权限调用ChatGPT turbo，但是它提醒了我们，使用embedding来增强搜索，同时很多优秀的开源LLM我们可以选择，比如我们当前在使用的ChatGLM，最近大家可能也听说过，斯坦福对它很感兴趣（抄袭）。

---

The following story is more familiar to everyone. About a year later, ChatGPT is here. Although we don't have access to the ChatGPT turbo, it gave us the idea of embeddings to enhance search. At the same time, there are many excellent open-source LLMs we can choose, like ChatGLM we're using. 

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

It looks good, right? The PA Youth charity thinks so too. We implemented similar function in last year's Tech Fest Hackathon and won, Nikhil is the sponsor of that PA Youth project.

Currently, Moogle has nearly 200 videos and is used by over 300 users from China, Japan, Singapore, India, and the United States.

If you like Moogle, welcome to use it and welcome to join us. Thank you.

