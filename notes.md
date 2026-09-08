---
layout: default
title: 课程笔记
permalink: /notes/
---

# 📚 课程笔记

这里是我学习各门课程的笔记归档。

{% for subject in site.subjects %}
## [{{ subject.name }}]({{ subject.url }})
{{ subject.description }}
{% endfor %}
