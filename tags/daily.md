---
layout: default
title: Daily
permalink: /tags/daily/
---

# Daily

{% for post in site.posts %}
{% if post.tags contains "daily" %}
- [{{ post.title }}]({{ post.url }}) - {{ post.date | date: "%B %d, %Y" }}
{% endif %}
{% endfor %}
