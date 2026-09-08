---
layout: default
title: 数据结构与算法笔记
permalink: /notes/computers/
---

# 📖 计组

看书随记。

## 笔记列表

{% assign subject_posts = site.posts | where: "subject", "computers" %}
{% for post in subject_posts %}
- [{{ post.title }}]({{ post.url }})
{% endfor %}
