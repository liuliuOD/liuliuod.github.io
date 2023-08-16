---
layout: print
permalink: /print
---


{% include_relative _includes/resume/career-profile.html %}

{% include_relative _includes/resume/certifications.html %}

{% include_relative _includes/skills-list.html %}

{% include_relative _includes/resume/experiences.html %}

{% include_relative _includes/resume/projects.html %}

{% include_relative _includes/resume/oss-contributions.html %}

{% include_relative _includes/resume/publications.html %}

{% unless site.data.data.sidebar.education %}
  {% include education.html %}
{% endunless %}
