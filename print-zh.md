---
layout: print
permalink: /print-zh
resume_lang: zh
---

<style>
  /* --- A4 print page styling (screen + print) --- */
  :root {
    --a4-width: 210mm;
    --a4-height: 297mm;
    --a4-padding: 10mm;
  }

  /* Global reset for predictable print layout */
  *, *::before, *::after { box-sizing: border-box; }
  html, body { margin: 0; padding: 0; }

  /* Screen preview: looks like a sheet of paper */
  @media screen {
    body { background: #f2f2f2; }
    .a4-page {
      width: var(--a4-width);
      min-height: var(--a4-height);
      margin: 16px auto;
      padding: var(--a4-padding);
      background: #fff;
      box-shadow: 0 0 14px rgba(0,0,0,.15);
      font-size: 11pt;
      line-height: 1.25;
      color: #111;
      overflow: visible;
    }
    .print-actions {
      width: var(--a4-width);
      margin: 0 auto 8px auto;
      display: flex;
      gap: 8px;
      justify-content: flex-end;
    }
    .print-actions button {
      border: 1px solid #ccc;
      background: #fff;
      padding: 8px 10px;
      border-radius: 6px;
      cursor: pointer;
      font-size: 14px;
    }
  }

  /* Print/PDF: force A4 + consistent margins */
  @page {
    size: A4;
    margin: 0;
  }

  @media print {
    /* Keep colors */
    * { -webkit-print-color-adjust: exact; print-color-adjust: exact; }

    /* Remove screen-only decorations */
    body { background: #fff !important; }
    .print-actions { display: none !important; }

    /* The printable sheet */
    .a4-page {
      width: var(--a4-width);
      min-height: var(--a4-height);
      margin: 0;
      padding: var(--a4-padding);
      box-shadow: none;
      font-size: 11pt;
      line-height: 1.25;
      color: #111;
      overflow: visible;
    }

    /* Page-break strategy (print engines vary):
       - Keep headings with the next block.
       - Allow Experience entries to split if needed (prevents whole chunks being dropped/pushed).
    */
    .a4-page { break-inside: auto; }

    /* Keep headings with following content */
    h1, h2, h3, .section-title { break-after: avoid; page-break-after: avoid; }

    /* Keep small items together (skills, short cards) */
    .skillset, .skills-section .item { break-inside: avoid; page-break-inside: avoid; }

    /* Experiences should be allowed to break across pages if they are long */
    .experiences-section, .experience-section, .work-section,
    .experience, .project, .item { break-inside: auto; page-break-inside: auto; }

    /* Reduce risk of lonely lines */
    p, li { orphans: 3; widows: 3; }
  }
</style>

<!-- Hide download button
<div class="print-actions">
  <button type="button" onclick="window.print()">下載 A4 PDF（列印）</button>
</div> -->

<div class="a4-page">
  <div style="display:flex; gap:24px; align-items:flex-start;">
    <div style="flex:1; min-width:0;">
      {% include_relative _includes/resume/career-profile.html %}
    </div>
    <div style="flex:1; min-width:0;">
      {% include_relative _includes/skills-list.html %}
    </div>
  </div>

  {% include_relative _includes/resume/experiences-print.html %}

  {% unless site.data.data.sidebar.education %}
    {% include education.html %}
  {% endunless %}
</div>
