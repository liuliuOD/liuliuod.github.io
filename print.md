---
layout: print
permalink: /print
---


{% include_relative _includes/resume/career-profile.html %}

{% unless site.data.data.sidebar.education %}
{% include_relative _includes/resume/education.html %}
{% endunless %}

{% include_relative _includes/resume/experiences.html %}

{% include_relative _includes/resume/projects.html %}

{% include_relative _includes/resume/publications.html %}

{% include_relative _includes/skills-list.html %}
