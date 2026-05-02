---
layout: print
permalink: /print-zh/
resume_lang: zh
---

{% assign resume_data = site.data.data[page.resume_lang] | default: site.data.data %}
{% assign experience_list = resume_data.experiences.info | default: resume_data.experiences.assignments %}
{% assign education_list = resume_data.education.info | default: resume_data.education %}
{% assign skill_list = resume_data.skills.categories | default: resume_data.skills.toolset %}

<style>
  :root {
    --page-width: 210mm;
    --page-padding: 12mm;
    --text-color: #111;
    --muted-color: #333;
    --border-color: #d8d8d8;
  }

  *, *::before, *::after {
    box-sizing: border-box;
  }

  html,
  body {
    margin: 0;
    padding: 0;
    background: #fff;
  }

  @page {
    size: A4;
    margin: 0;
  }

  body {
    color: var(--text-color);
    font-family: Arial, Helvetica, sans-serif;
    font-size: 10pt;
    line-height: 1.28;
  }

  @media screen {
    body {
      background: #f2f2f2;
    }
  }

  .resume-page {
    width: var(--page-width);
    max-width: var(--page-width);
    min-height: 297mm;
    margin: 16px auto;
    padding: var(--page-padding);
    background: #fff;
    box-shadow: 0 0 14px rgba(0, 0, 0, 0.15);
  }

  @media print {
    .resume-page {
      margin: 0;
      box-shadow: none;
    }
  }

  .resume-page,
  .resume-page * {
    color: var(--text-color);
    text-shadow: none !important;
  }

  .resume-page a {
    color: var(--text-color);
    text-decoration: underline;
  }

  .resume-header {
    margin: 0 0 5mm 0;
    padding: 0 0 3mm 0;
    border-bottom: 1px solid var(--border-color);
  }

  .resume-name {
    margin: 0 0 1mm 0;
    font-size: 18pt;
    font-weight: 700;
    line-height: 1.15;
  }

  .resume-title {
    margin: 0 0 1.5mm 0;
    font-size: 11pt;
    font-weight: 700;
  }

  .resume-contact {
    font-size: 9.5pt;
    line-height: 1.25;
  }

  .resume-section-heading {
    margin: 5mm 0 2mm 0;
    padding: 0 0 1mm 0;
    border-bottom: 1px solid var(--border-color);
    font-size: 12pt;
    font-weight: 700;
    line-height: 1.2;
    break-after: avoid;
    page-break-after: avoid;
    display: block !important;
    position: static !important;
    float: none !important;
    clear: both !important;
  }

  .summary {
    margin: 0 0 3mm 0;
  }

  .summary p {
    margin: 0 0 2mm 0;
  }

  .experience-item {
    margin: 0 0 4mm 0;
    break-inside: auto;
    page-break-inside: auto;
  }

  .experience-role-line {
    margin: 0 0 1mm 0;
    font-weight: 700;
  }

  .experience-time {
    font-weight: 400;
    color: var(--muted-color) !important;
  }

  .experience-company {
    margin: 0 0 1.5mm 0;
    font-weight: 700;
  }

  .resume-bullet {
    margin: 0 0 1.2mm 0;
  }

  .skill-group {
    margin: 0 0 2.5mm 0;
    break-inside: avoid;
    page-break-inside: avoid;
  }

  .skill-title {
    margin: 0 0 0.8mm 0;
    font-weight: 700;
  }

  .skill-items {
    margin: 0;
  }

  .education-item {
    margin: 0 0 2mm 0;
  }

  .education-school {
    margin: 0 0 1mm 0;
    font-weight: 700;
  }

  .education-degree {
    margin: 0;
    color: var(--muted-color) !important;
  }
</style>

<div class="resume-page">
  <header class="resume-header">
    <div class="resume-name">Chia-Min Liu</div>
    <div class="resume-title">Senior Backend / Platform Engineer</div>
    <div class="resume-contact">
      Taipei, Taiwan |
      <a href="mailto:liuliugit@gmail.com">liuliugit@gmail.com</a> |
      <a href="https://github.com/liuliuod">GitHub: https://github.com/liuliuod</a> |
      <a href="https://liuliuod.github.io/resume">Portfolio: https://liuliuod.github.io/resume</a>
    </div>
  </header>

  <section>
    <div class="resume-section-heading">ABOUT ME</div>
    <div class="summary">
      {{ resume_data["career-profile"].summary | markdownify }}
    </div>
  </section>

  <section>
    <div class="resume-section-heading">EXPERIENCE</div>
    {% for experience in experience_list %}
      <div class="experience-item">
        <div class="experience-role-line">
          {{ experience.role }} <span class="experience-time">| {{ experience.time }}</span>
        </div>
        <div class="experience-company">
          {{ experience.company | markdownify | strip_html | strip }}
        </div>
        {% assign detail_source = experience.details_print | default: experience.details %}
        {% assign detail_lines = detail_source | newline_to_br | split: '<br />' %}
        {% for detail_line in detail_lines %}
          {% assign clean_line = detail_line | strip %}
          {% if clean_line != '' %}
            {% assign normalized_line = clean_line | remove_first: '- ' | strip %}
            {% if normalized_line != '' %}
              <div class="resume-bullet">- {{ normalized_line | markdownify | strip_html | strip }}</div>
            {% endif %}
          {% endif %}
        {% endfor %}
      </div>
    {% endfor %}
  </section>

  <section>
    <div class="resume-section-heading">SKILLS</div>
    {% for skill_category in skill_list %}
      <div class="skill-group">
        <div class="skill-title">{{ skill_category.name }}</div>
        <div class="skill-items">
          {% for skill in skill_category.items %}
            {{ skill.name }}{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </div>
      </div>
    {% endfor %}
  </section>

  <section>
    <div class="resume-section-heading">EDUCATION</div>
    {% for education in education_list %}
      <div class="education-item">
        <div class="education-school">{{ education.university }}</div>
        <div class="education-degree">{{ education.degree }}{% if education.time %} | {{ education.time }}{% endif %}</div>
      </div>
    {% endfor %}
  </section>
</div>
