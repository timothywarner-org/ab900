const pptxgen = require('pptxgenjs');
const path = require('path');

// Microsoft-inspired color palette (NO # prefix for PptxGenJS)
const C = {
  navy: '0F1B2D', blue: '0078D4', darkBlue: '005A9E', lightBlue: '50E6FF',
  white: 'FFFFFF', offWhite: 'F5F5F5', lightGray: 'E0E0E0', gray: '888888',
  darkGray: '333333', black: '1B1B1B',
  accent1: 'FFB900', accent2: 'E74856', accent3: '00CC6A', accent4: '9B59B6',
};

const pptx = new pptxgen();
pptx.layout = 'LAYOUT_16x9';
pptx.author = 'Tim Warner';
pptx.title = 'AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals';
pptx.subject = 'O\'Reilly Live Learning';

// Helpers
function titleSlide(title, subtitle, opts = {}) {
  const s = pptx.addSlide();
  s.background = { path: path.join(__dirname, 'html', opts.bg || 'bg-title.png') };
  s.addText(title, { x: 0.8, y: 1.2, w: 8.4, h: 1.6, fontSize: 36, bold: true, color: C.white, fontFace: 'Arial' });
  if (subtitle) s.addText(subtitle, { x: 0.8, y: 2.9, w: 8.4, h: 0.8, fontSize: 18, color: C.lightBlue, fontFace: 'Arial' });
  return s;
}

function segmentDivider(num, title, subtitle) {
  const s = pptx.addSlide();
  s.background = { path: path.join(__dirname, 'html', 'bg-segment.png') };
  s.addText(`SEGMENT ${num}`, { x: 0.8, y: 1.0, w: 8.4, h: 0.6, fontSize: 14, bold: true, color: C.accent1, fontFace: 'Arial', letterSpacing: 4 });
  s.addText(title, { x: 0.8, y: 1.7, w: 8.4, h: 1.2, fontSize: 32, bold: true, color: C.white, fontFace: 'Arial' });
  if (subtitle) s.addText(subtitle, { x: 0.8, y: 3.0, w: 8.4, h: 0.6, fontSize: 16, color: C.lightBlue, fontFace: 'Arial' });
  s.addShape(pptx.shapes.RECTANGLE, { x: 0.8, y: 4.0, w: 2.5, h: 0.06, fill: { color: C.accent1 } });
  return s;
}

function contentSlide(title, bullets, opts = {}) {
  const s = pptx.addSlide();
  s.background = { fill: C.white };
  // Top bar
  s.addShape(pptx.shapes.RECTANGLE, { x: 0, y: 0, w: 10, h: 0.08, fill: { color: C.blue } });
  // Title
  s.addText(title, { x: 0.6, y: 0.3, w: 8.8, h: 0.7, fontSize: 24, bold: true, color: C.navy, fontFace: 'Arial' });
  // Underline
  s.addShape(pptx.shapes.RECTANGLE, { x: 0.6, y: 1.05, w: 1.5, h: 0.04, fill: { color: C.blue } });
  // Bullets
  const textRows = bullets.map(b => {
    if (typeof b === 'string') return { text: b, options: { bullet: { type: 'bullet' }, fontSize: 15, color: C.darkGray, fontFace: 'Arial', lineSpacingMultiple: 1.3, paraSpaceBefore: 4 } };
    return { text: b.text, options: { bullet: b.indent ? { type: 'bullet', indent: 18 } : { type: 'bullet' }, fontSize: b.size || 15, bold: b.bold || false, color: b.color || C.darkGray, fontFace: 'Arial', lineSpacingMultiple: 1.3, paraSpaceBefore: b.spaceBefore || 4, indentLevel: b.indent || 0 } };
  });
  s.addText(textRows, { x: 0.6, y: 1.25, w: opts.wide ? 9.0 : 8.8, h: opts.h || 4.0, valign: 'top' });
  // Footer
  if (opts.footer) s.addText(opts.footer, { x: 0.6, y: 5.1, w: 8.8, h: 0.3, fontSize: 10, color: C.gray, fontFace: 'Arial' });
  return s;
}

function twoColSlide(title, leftBullets, rightBullets, opts = {}) {
  const s = pptx.addSlide();
  s.background = { fill: C.white };
  s.addShape(pptx.shapes.RECTANGLE, { x: 0, y: 0, w: 10, h: 0.08, fill: { color: C.blue } });
  s.addText(title, { x: 0.6, y: 0.3, w: 8.8, h: 0.7, fontSize: 24, bold: true, color: C.navy, fontFace: 'Arial' });
  s.addShape(pptx.shapes.RECTANGLE, { x: 0.6, y: 1.05, w: 1.5, h: 0.04, fill: { color: C.blue } });

  const fmt = (bullets) => bullets.map(b => typeof b === 'string'
    ? { text: b, options: { bullet: { type: 'bullet' }, fontSize: 14, color: C.darkGray, fontFace: 'Arial', lineSpacingMultiple: 1.25, paraSpaceBefore: 3 } }
    : { text: b.text, options: { bullet: { type: 'bullet' }, fontSize: b.size || 14, bold: b.bold || false, color: b.color || C.darkGray, fontFace: 'Arial', lineSpacingMultiple: 1.25, paraSpaceBefore: 3, indentLevel: b.indent || 0 } }
  );

  if (opts.leftTitle) s.addText(opts.leftTitle, { x: 0.6, y: 1.2, w: 4.2, h: 0.4, fontSize: 16, bold: true, color: C.blue, fontFace: 'Arial' });
  if (opts.rightTitle) s.addText(opts.rightTitle, { x: 5.2, y: 1.2, w: 4.4, h: 0.4, fontSize: 16, bold: true, color: C.blue, fontFace: 'Arial' });

  const yStart = (opts.leftTitle || opts.rightTitle) ? 1.65 : 1.25;
  s.addText(fmt(leftBullets), { x: 0.6, y: yStart, w: 4.2, h: 3.8, valign: 'top' });
  s.addText(fmt(rightBullets), { x: 5.2, y: yStart, w: 4.4, h: 3.8, valign: 'top' });

  // Divider line
  s.addShape(pptx.shapes.RECTANGLE, { x: 4.95, y: 1.3, w: 0.02, h: 3.5, fill: { color: C.lightGray } });
  return s;
}

function tableSlide(title, headers, rows, opts = {}) {
  const s = pptx.addSlide();
  s.background = { fill: C.white };
  s.addShape(pptx.shapes.RECTANGLE, { x: 0, y: 0, w: 10, h: 0.08, fill: { color: C.blue } });
  s.addText(title, { x: 0.6, y: 0.3, w: 8.8, h: 0.7, fontSize: 24, bold: true, color: C.navy, fontFace: 'Arial' });
  s.addShape(pptx.shapes.RECTANGLE, { x: 0.6, y: 1.05, w: 1.5, h: 0.04, fill: { color: C.blue } });

  const headerRow = headers.map(h => ({ text: h, options: { fill: { color: C.blue }, color: C.white, bold: true, fontSize: 13, fontFace: 'Arial' } }));
  const dataRows = rows.map((row, i) => row.map(cell => typeof cell === 'string'
    ? { text: cell, options: { fill: { color: i % 2 === 0 ? C.offWhite : C.white }, fontSize: 12, fontFace: 'Arial', color: C.darkGray } }
    : cell
  ));

  s.addTable([headerRow, ...dataRows], {
    x: 0.6, y: 1.25, w: 8.8, colW: opts.colW || undefined,
    border: { pt: 0.5, color: C.lightGray },
    align: 'left', valign: 'middle', rowH: opts.rowH || 0.45
  });
  return s;
}

function demoSlide(title, steps) {
  const s = pptx.addSlide();
  s.background = { fill: C.navy };
  s.addText('DEMO', { x: 0.6, y: 0.3, w: 2.0, h: 0.5, fontSize: 13, bold: true, color: C.accent1, fontFace: 'Arial', letterSpacing: 3 });
  s.addText(title, { x: 0.6, y: 0.8, w: 8.8, h: 0.7, fontSize: 26, bold: true, color: C.white, fontFace: 'Arial' });
  s.addShape(pptx.shapes.RECTANGLE, { x: 0.6, y: 1.55, w: 1.5, h: 0.04, fill: { color: C.accent1 } });
  const textRows = steps.map((st, i) => ({ text: `${i + 1}. ${st}`, options: { fontSize: 15, color: C.offWhite, fontFace: 'Arial', lineSpacingMultiple: 1.5, paraSpaceBefore: 6 } }));
  s.addText(textRows, { x: 0.6, y: 1.8, w: 8.8, h: 3.5, valign: 'top' });
  return s;
}

function breakSlide(num) {
  const s = pptx.addSlide();
  s.background = { path: path.join(__dirname, 'html', 'bg-dark.png') };
  s.addText('10-MINUTE BREAK', { x: 0, y: 1.5, w: 10, h: 1.0, fontSize: 36, bold: true, color: C.white, fontFace: 'Arial', align: 'center' });
  s.addText(`Segment ${num + 1} starts shortly`, { x: 0, y: 2.6, w: 10, h: 0.6, fontSize: 18, color: C.lightBlue, fontFace: 'Arial', align: 'center' });
  s.addText('Stretch, grab a drink, and post questions in chat!', { x: 0, y: 3.4, w: 10, h: 0.5, fontSize: 14, color: C.gray, fontFace: 'Arial', align: 'center' });
  return s;
}

// ============================================================
// BUILD THE DECK
// ============================================================

// --- SLIDE 1: Title ---
const s1 = titleSlide('AB-900: Microsoft 365 Copilot and\nAgent Administration Fundamentals', 'O\'Reilly Live Learning  |  Tim Warner  |  TechTrainerTim.com');
s1.addText('Exam: AB-900  |  45 min  |  700/1000 to pass  |  Beginner level', { x: 0.8, y: 4.2, w: 8.4, h: 0.4, fontSize: 12, color: C.gray, fontFace: 'Arial' });

// --- SLIDE 2: Exam Domains ---
tableSlide('AB-900 Exam Domains', ['Domain', 'Weight', 'Focus'], [
  ['1: Core features and objects of M365 services', '30-35%', 'Identity, admin centers, core services'],
  ['2: Data protection and governance', '35-40%', { text: 'HEAVIEST -- Purview, DLP, DSPM for AI', options: { fill: { color: 'FFF3CD' }, fontSize: 12, fontFace: 'Arial', color: C.darkGray, bold: true } }],
  ['3: Basic admin tasks for Copilot and agents', '25-30%', 'Licensing, agents, Copilot Studio'],
], { colW: [3.5, 1.2, 4.1] });

// --- SLIDE 3: Session Roadmap ---
contentSlide('Session Roadmap', [
  { text: 'Segment 1: Microsoft 365 Copilot -- What it is, how it works, licensing', bold: true },
  { text: 'Segment 2: Copilot Agents + Copilot Studio -- Build and manage agents', bold: true },
  { text: 'Segment 3: Data Protection and Governance -- Purview, DLP, DSPM for AI', bold: true },
  { text: 'Segment 4: M365 Admin, Identity, Security + Exam Prep', bold: true },
  { text: '', size: 6 },
  { text: 'Each segment: 50 minutes + 10-minute break', color: C.blue },
  { text: 'Demos throughout -- follow along if you have a tenant', color: C.blue },
]);

// ============================================================
// SEGMENT 1: MICROSOFT 365 COPILOT
// ============================================================
segmentDivider(1, 'Microsoft 365 Copilot', '50 minutes  |  Domain 3 (25-30%)');

// Slide: What is Copilot?
contentSlide('What is Microsoft 365 Copilot?', [
  'NOT a standalone app -- it is embedded in Word, Excel, PowerPoint, Outlook, and Teams',
  'AI assistant powered by large language models (Azure OpenAI Service)',
  'Grounded in YOUR organizational data via Microsoft Graph',
  { text: 'Key principle: Copilot can only see what the user can already see', bold: true, color: C.blue },
  'Data never leaves the tenant and is never used to retrain public models',
  'User always sees source references -- full transparency',
]);

// Slide: Architecture
contentSlide('Copilot Architecture: Four Components', [
  { text: 'Microsoft Graph -- unified data layer (emails, files, meetings, chats)', bold: true },
  { text: 'Work IQ -- intelligence layer that learns patterns and workflows', bold: false, indent: 1 },
  { text: 'Large Language Models -- hosted in Azure OpenAI, fine-tuned for enterprise', bold: true },
  { text: 'Tenant-isolated; data never shared across organizations', indent: 1 },
  { text: 'Orchestration Service -- manages prompts, data, and LLM interactions', bold: true },
  { text: '5 steps: prompt intake > evaluation > enrichment > execution > formatting', indent: 1 },
  { text: 'Semantic Index -- meaning-based retrieval, not keyword matching', bold: true },
  { text: '"Project kickoff" finds docs about "launch meetings" or "initial planning"', indent: 1 },
]);

// Slide: Copilot in Each App
twoColSlide('Copilot Across Microsoft 365 Apps', [
  { text: 'Word', bold: true },
  'Draft documents, summarize, rewrite',
  { text: 'Excel', bold: true },
  'Formulas, charts, what-if via natural language',
  { text: 'PowerPoint', bold: true },
  'Outline to full slide deck with visuals',
], [
  { text: 'Outlook', bold: true },
  'Thread summaries, draft responses',
  { text: 'Teams', bold: true },
  'Meeting recaps, action items, chat summaries',
  { text: 'Copilot Chat', bold: true },
  'Cross-app search, tenant-wide queries via Graph',
]);

// Slide: Responsible AI
contentSlide('Responsible AI Principles', [
  { text: 'Data minimization', bold: true },
  { text: 'Fetches only data needed for the specific request', indent: 1 },
  { text: 'Transparency', bold: true },
  { text: 'Every answer includes source references users can verify', indent: 1 },
  { text: 'Content filtering', bold: true },
  { text: 'Blocks harmful, offensive, or unverified content', indent: 1 },
  { text: 'Auditability', bold: true },
  { text: 'All interactions logged in Microsoft Purview and M365 audit logs', indent: 1 },
  { text: 'No fabrication by design -- "No data found" rather than hallucinating', bold: true, color: C.accent2 },
]);

// Slide: Licensing
tableSlide('Copilot Licensing Models', ['Plan', 'For', 'Key Difference'], [
  ['Copilot Chat (Free)', 'Anyone', 'Web-grounded only -- NO org data'],
  ['M365 Copilot Business', 'Up to 300 users', 'Graph grounding + core security'],
  ['M365 Copilot Enterprise', 'E3/E5 orgs', 'Full Purview compliance + governance'],
  ['Copilot Studio', 'Business/Enterprise', 'Build custom agents + connectors'],
], { colW: [2.5, 2.0, 4.3] });

// Slide: Per-user vs PAYG
twoColSlide('Monthly Per-User vs. Pay-as-You-Go', [
  { text: 'Monthly Per-User License', bold: true },
  'Fixed monthly fee regardless of usage',
  'Predictable budgeting',
  'Risk: over-licensing inactive users',
  'Best for: consistent daily users',
], [
  { text: 'Pay-as-You-Go (Consumption)', bold: true },
  'Charged based on actual usage (Azure)',
  'Metered against Azure subscription',
  'Risk: unexpected cost spikes',
  'Best for: pilots, seasonal, fluctuating demand',
], { leftTitle: 'Subscription', rightTitle: 'Consumption' });

// Demo
demoSlide('Copilot in Action', [
  'Open Word -- use Copilot to draft a project summary from a SharePoint doc',
  'Open Excel -- ask Copilot to create a chart from raw data',
  'Open Teams -- review a meeting recap with action items',
  'Open Copilot Chat -- cross-app search ("What did the team discuss last week?")',
  'Show source references and Graph grounding in each response',
]);

breakSlide(1);

// ============================================================
// SEGMENT 2: COPILOT AGENTS + COPILOT STUDIO
// ============================================================
segmentDivider(2, 'Copilot Agents + Copilot Studio', '50 minutes  |  Domain 3 (25-30%)');

// Slide: What Are Agents?
contentSlide('What Are Agents?', [
  'Intelligent software that automates tasks, answers questions, and acts on user intent',
  'Unlike Copilot (reactive assistant), agents can be tailored for specific expertise',
  'Agents can retrieve information, perform actions, and operate independently',
  { text: '', size: 4 },
  { text: 'Four types of agents:', bold: true, color: C.blue },
  { text: '1. Prebuilt (Microsoft): Researcher, Analyst, Writing Coach, Prompt Coach', indent: 1 },
  { text: '2. Ready-made SharePoint site agents: auto-created, scoped to site content', indent: 1 },
  { text: '3. Everyday user agents: no-code, built in Copilot Chat or SharePoint', indent: 1 },
  { text: '4. Advanced agents: Copilot Studio full experience or VS Code, 1000+ connectors', indent: 1 },
]);

// Slide: Researcher and Analyst
contentSlide('Prebuilt Agents: Researcher and Analyst', [
  { text: 'Researcher Agent', bold: true, color: C.blue },
  'AI-powered research assistant -- gathers, analyzes, synthesizes into structured reports',
  'Semantic search across SharePoint, Teams, incident logs',
  { text: '', size: 4 },
  { text: 'Analyst Agent', bold: true, color: C.blue },
  'Virtual data scientist -- transforms raw data into insights using Python',
  'Works with Excel, Power BI datasets',
  { text: '', size: 4 },
  { text: 'EXAM TRAP: Researcher and Analyst require a SEPARATE admin block.', bold: true, color: C.accent2 },
  { text: 'They are NOT governed by the general agent on/off toggle!', bold: true, color: C.accent2 },
]);

// Slide: Copilot vs Agents
tableSlide('Copilot vs. Agents: Key Differences', ['Criteria', 'Copilot', 'Agents'], [
  ['Interaction', 'Real-time, conversational in apps', 'Schedule/trigger-based, behind scenes'],
  ['Data access', 'User permissions only', 'Service accounts, managed identities'],
  ['Customization', 'Org-level config', 'Fully customizable per agent'],
  ['Security', 'User-level audit logs', 'Approval process, credential mgmt'],
  ['Best for', 'Quick one-off tasks', 'Repetitive, automated workflows'],
], { colW: [1.8, 3.5, 3.5] });

// Slide: Copilot Studio Lite vs Full
twoColSlide('Copilot Studio: Lite vs. Full Experience', [
  { text: 'Lite Experience (Testable!)', bold: true },
  'For everyday business users',
  'No coding required',
  'Describe tab: plain language creation',
  'Configure tab: manual step-by-step',
  'Both tabs sync automatically',
  'Templates: preconfigured starting points',
], [
  { text: 'Full Experience', bold: true },
  'For developers and IT pros',
  'Advanced customization',
  'Multi-step workflows',
  'Custom connectors and APIs',
  '1000+ data connectors',
  'Lifecycle management and security',
], { leftTitle: 'No-Code (Exam Focus)', rightTitle: 'Pro-Code' });

// Slide: Creating a Copilot Chat Agent
contentSlide('Creating a Copilot Chat Agent', [
  { text: 'Describe Tab (plain language):', bold: true, color: C.blue },
  { text: 'Select a template (optional) -- provides preconfigured starting point', indent: 1 },
  { text: 'WARNING: Changing template on Configure tab resets ALL customizations', indent: 1, color: C.accent2 },
  { text: 'Enter description in natural language; Copilot Studio refines via follow-up questions', indent: 1 },
  { text: '', size: 4 },
  { text: 'Configure Tab (manual):', bold: true, color: C.blue },
  { text: 'Knowledge sources (up to 20): files, SharePoint, web, Copilot connectors', indent: 1 },
  { text: 'Capabilities (off by default): Code Interpreter, Image Generator', indent: 1 },
  { text: 'Starter prompts: unlimited for Copilot Chat agents', indent: 1 },
  { text: 'Test draft before creating -- verify instructions and knowledge sources', indent: 1 },
]);

// Slide: Creating a SharePoint Agent
contentSlide('Creating a SharePoint Agent', [
  { text: 'Four entry points:', bold: true, color: C.blue },
  { text: 'Site homepage (+New > Agent), Library command bar, File context menu, Chat pane', indent: 1 },
  { text: '', size: 4 },
  { text: 'Three tabs:', bold: true, color: C.blue },
  { text: 'Overview: name, description, icon (.png, max 1 MB)', indent: 1 },
  { text: 'Sources: "Entire site" or pick specific libraries/folders/files (up to 20)', indent: 1 },
  { text: 'Behavior: welcome message, starter prompts (max 3), instructions', indent: 1 },
  { text: '', size: 4 },
  { text: 'Key differences from Copilot Chat agents:', bold: true, color: C.blue },
  { text: 'Has welcome message, max 3 starter prompts, NO Code Interpreter, NO Image Generator', indent: 1 },
]);

// Slide: Agent Approval and Lifecycle
contentSlide('Agent Approval and Lifecycle', [
  { text: 'Three-stage approval process:', bold: true, color: C.blue },
  { text: '1. Submission -- user/developer provides purpose, audience, permissions', indent: 1 },
  { text: '2. Review -- admins + compliance officers assess', indent: 1 },
  { text: '3. Decision -- approve, reject, or send back for revisions', indent: 1 },
  { text: '', size: 4 },
  { text: 'Portal path: admin.microsoft.com > Agents > All agents > Requests', bold: true, color: C.darkBlue },
  { text: '', size: 4 },
  { text: 'Lifecycle: Create > Approve > Deploy > Maintain > Block/Remove', bold: true },
  { text: 'Communicate retirement 30 days in advance', indent: 1 },
  { text: 'Monitor via Power Platform admin center and M365 admin center', indent: 1 },
  { text: '', size: 4 },
  { text: 'Licensing: Free (declarative) | Licensed (Copilot Studio) | Consumption (PAYG)', color: C.blue },
]);

// Demo
demoSlide('Create Two Agents Side by Side', [
  'Create a Copilot Chat agent using the Describe tab -- enter plain language description',
  'Switch to Configure tab -- add SharePoint knowledge source, enable Code Interpreter',
  'Add 3 starter prompts and test the draft agent',
  'Create a SharePoint agent from a document library -- pick specific files as sources',
  'Compare: welcome message, starter prompt limits, capabilities',
  'Show the agent approval queue at admin.microsoft.com > Copilot > Agents',
]);

breakSlide(2);

// ============================================================
// SEGMENT 3: DATA PROTECTION AND GOVERNANCE
// ============================================================
segmentDivider(3, 'Data Protection and Governance', '50 minutes  |  Domain 2 (35-40%) -- HEAVIEST');

// Slide: Microsoft Purview Overview
contentSlide('Microsoft Purview: The Unified Portal', [
  { text: 'purview.microsoft.com -- NOT compliance.microsoft.com (deprecated)', bold: true, color: C.accent2 },
  { text: '', size: 4 },
  { text: 'Three pillars:', bold: true, color: C.blue },
  { text: 'Data Security: sensitivity labels, DLP, encryption', indent: 1 },
  { text: 'Data Governance: lifecycle management, retention, archiving', indent: 1 },
  { text: 'Risk and Compliance: Insider Risk, Communication Compliance, eDiscovery', indent: 1 },
  { text: '', size: 4 },
  { text: 'Key exam concept: Purview protects data that Copilot accesses', bold: true },
  { text: 'Sensitivity labels + DLP are enforced on Copilot responses', indent: 1 },
]);

// Slide: Sensitivity Labels
contentSlide('Sensitivity Labels', [
  { text: 'Classify and protect data -- labels TRAVEL with the data', bold: true },
  { text: '', size: 4 },
  { text: 'Label components:', bold: true, color: C.blue },
  { text: 'Encryption -- restrict who can open, edit, print, copy', indent: 1 },
  { text: 'Content markings -- headers, footers, watermarks', indent: 1 },
  { text: 'Access restrictions -- block external sharing', indent: 1 },
  { text: '', size: 4 },
  { text: 'Application: manual, automatic (content detection), recommended, or mandatory', color: C.darkGray },
  { text: 'Justification required to downgrade a label', color: C.darkGray },
  { text: '', size: 4 },
  { text: 'Portal: purview.microsoft.com > Solutions > Information protection > Labels', bold: true, color: C.darkBlue },
]);

// Slide: DLP
contentSlide('Data Loss Prevention (DLP)', [
  { text: 'Prevents accidental or intentional sharing of sensitive data', bold: true },
  { text: '', size: 4 },
  'Scans content for patterns: credit card numbers, SSNs, health records',
  'Actions: block, warn with policy tip, require business justification, alert admin',
  'Enforced across: email, chat, SharePoint, OneDrive, Copilot interactions',
  { text: '', size: 4 },
  { text: 'Data classification methods:', bold: true, color: C.blue },
  { text: 'Sensitive Information Types (SITs) -- regex + checksums + confidence scoring', indent: 1 },
  { text: 'Trainable classifiers -- ML models (50+ document samples)', indent: 1 },
  { text: 'Exact Data Match -- precise matching against uploaded data lists', indent: 1 },
]);

// Slide: Insider Risk + Comms Compliance
twoColSlide('Insider Risk and Communication Compliance', [
  { text: 'Insider Risk Management', bold: true },
  'Behavioral analytics + HR signals',
  'Mass file downloads, personal email sharing',
  'Unusual hours, unfamiliar locations',
  'Integrates resignation/role change data',
  'Elevates risk score with combined signals',
], [
  { text: 'Communication Compliance', bold: true },
  'Monitors email, Teams, Yammer, Copilot prompts',
  'Detects harassment, data leaks, insider trading',
  'Pattern-based detection + ML classifiers',
  'Reviewer dashboard for investigation',
  'Dismiss, notify, or escalate to HR/Legal',
]);

// Slide: DSPM for AI
contentSlide('DSPM for AI (Data Security Posture Management)', [
  { text: 'Portal: purview.microsoft.com > Solutions > DSPM for AI (classic)', bold: true, color: C.darkBlue },
  { text: '', size: 4 },
  { text: 'What it does:', bold: true, color: C.blue },
  'Discovers and monitors how AI interacts with sensitive data',
  'Detects shadow AI -- unsanctioned AI tools used without IT approval',
  'Tracks AI-generated content: where stored, who has access',
  'Oversharing assessments -- identifies data exposure risks',
  { text: '', size: 4 },
  { text: 'EXAM TRAP: Use DSPM for AI (not Content Explorer) for AI-specific data risk', bold: true, color: C.accent2 },
  { text: 'Content Explorer finds sensitive data. DSPM for AI monitors AI interactions.', indent: 1 },
]);

// Slide: Compliance, eDiscovery, Retention
contentSlide('Compliance Manager, eDiscovery, and Retention', [
  { text: 'Compliance Manager:', bold: true, color: C.blue },
  { text: 'Compliance score -- quantifies regulatory readiness (GDPR, HIPAA, ISO 27001)', indent: 1 },
  { text: 'Improvement actions -- specific steps to close gaps', indent: 1 },
  { text: '', size: 4 },
  { text: 'eDiscovery:', bold: true, color: C.blue },
  { text: 'Standard: search + export + legal hold', indent: 1 },
  { text: 'Premium: case management + analytics + redaction', indent: 1 },
  { text: '', size: 4 },
  { text: 'Retention:', bold: true, color: C.blue },
  { text: 'Labels (per-item) vs. policies (location-wide)', indent: 1 },
  { text: 'Auto-apply rules based on SITs, keywords, or classifiers', indent: 1 },
]);

// Slide: How Copilot Accesses Data
contentSlide('How Copilot Accesses Data Through Graph', [
  { text: 'Copilot can only see what the user can already see', bold: true, color: C.blue },
  { text: '', size: 4 },
  'Queries Graph using the user OAuth token (same permissions as user)',
  'Semantic index ranks results by context, recency, and activity',
  'Sensitivity labels enforced -- "Confidential - Finance Only" excluded for non-Finance users',
  'DLP rules apply to Copilot responses (block, warn, log)',
  '"Anyone with the link" -- if link is active, Copilot can access it; revoke = Copilot loses access',
  { text: '', size: 4 },
  { text: 'All Copilot interactions are logged and auditable via Purview', bold: true },
]);

// Slide: SharePoint Oversharing
contentSlide('SharePoint Oversharing', [
  { text: 'Common oversharing scenarios:', bold: true, color: C.blue },
  '"Everyone" or "Anyone with the link" used too broadly',
  'Edit access when View-only is sufficient',
  'External guests with full site access instead of specific documents',
  { text: '', size: 4 },
  { text: 'Tools to detect and fix:', bold: true, color: C.blue },
  { text: 'DAG reports (SharePoint admin center) -- identify high-risk sites', indent: 1 },
  { text: 'SharePoint Advanced Management (SAM) -- paid add-on for restricted site access', indent: 1 },
  { text: 'DSPM for AI oversharing reports -- AI-specific oversharing', indent: 1 },
]);

// Demo
demoSlide('Purview Portal Walkthrough', [
  'Navigate to purview.microsoft.com -- show the unified portal',
  'Solutions > Information protection > Labels -- view/create sensitivity labels',
  'Solutions > Data loss prevention > Policies -- review a DLP policy and alerts',
  'Solutions > DSPM for AI (classic) -- show oversharing reports and AI activity',
  'Show how a "Confidential" label restricts Copilot from surfacing a document',
]);

breakSlide(3);

// ============================================================
// SEGMENT 4: M365 ADMIN, IDENTITY, SECURITY + EXAM PREP
// ============================================================
segmentDivider(4, 'M365 Admin, Identity, Security\n+ Exam Prep', '50 minutes  |  Domain 1 (30-35%) + Wrap-up');

// Slide: M365 Admin Center
contentSlide('Microsoft 365 Admin Center', [
  { text: 'admin.microsoft.com -- the central hub', bold: true, color: C.blue },
  { text: '', size: 4 },
  'Dashboard: user activity, license usage, service health, recommendations',
  'Users: create, assign licenses, reset passwords, configure MFA',
  'Groups: Security, M365, Mail-enabled Security, Distribution, Dynamic',
  'Billing: subscriptions, license allocation, PAYG policies',
  'Reports: usage across Exchange, Teams, SharePoint, OneDrive, Copilot',
  'Service health: real-time status, incidents, advisories, Message Center',
]);

// Slide: Core Services
twoColSlide('Core Services at a Glance', [
  { text: 'Exchange Online', bold: true },
  'User, shared, and resource mailboxes',
  'Transport rules (mail flow)',
  'Retention policies, litigation hold',
  { text: 'SharePoint Online', bold: true },
  'Team sites vs. communication sites',
  'Document libraries, permissions, sharing',
  'Permission inheritance model',
], [
  { text: 'Microsoft Teams', bold: true },
  'Channels: standard, private, shared',
  'Meeting/messaging/app policies',
  'Built on M365 Groups + SharePoint',
  { text: 'OneDrive for Business', bold: true },
  '1 TB per user, Known Folder Move',
  'Sharing controls with expiration',
]);

// Slide: Copilot Admin Tasks
contentSlide('Copilot Admin Tasks', [
  { text: 'License assignment:', bold: true, color: C.blue },
  { text: 'Individual: admin.microsoft.com > Users > Active users > Licenses and apps', indent: 1 },
  { text: 'Group-based: admin.microsoft.com > Groups > Active groups > Licenses', indent: 1 },
  { text: '', size: 4 },
  { text: 'Pay-as-you-go billing (2-step process):', bold: true, color: C.blue },
  { text: 'Step 1: Create billing policy at admin.microsoft.com > Copilot > Billing & usage', indent: 1 },
  { text: 'Step 2: Connect policy to a Copilot service -- if skipped, PAYG stays disabled!', indent: 1, color: C.accent2 },
  { text: '', size: 4 },
  { text: 'Monitor usage:', bold: true, color: C.blue },
  { text: 'Reports > Usage > Microsoft 365 Copilot (quick triage)', indent: 1 },
  { text: 'Copilot Analytics via Viva Insights Dashboard (deeper adoption analysis)', indent: 1 },
  { text: 'Prompt governance: save, share, schedule, delete prompts', color: C.darkGray },
]);

// Slide: Zero Trust
contentSlide('Zero Trust Security Model', [
  { text: 'Three core principles:', bold: true, color: C.blue },
  { text: 'Verify explicitly -- every request authenticated with all signals (identity, device, location)', indent: 1 },
  { text: 'Least privilege -- minimum access needed; PIM for just-in-time elevation', indent: 1 },
  { text: 'Assume breach -- segment, monitor, respond; Defender XDR + Sentinel', indent: 1 },
  { text: '', size: 4 },
  { text: 'Six pillars: Identity, Endpoints, Apps, Data, Infrastructure, Network', bold: true },
  { text: '', size: 4 },
  { text: 'Microsoft Secure Score measures your security posture', color: C.blue },
  { text: 'Identity Secure Score measures identity-specific posture', color: C.blue },
]);

// Slide: Identity and Authentication
contentSlide('Identity and Authentication', [
  { text: 'Microsoft Entra ID -- the central identity platform', bold: true, color: C.blue },
  { text: '', size: 4 },
  { text: 'Authentication methods:', bold: true },
  'MFA, passwordless (FIDO2, Windows Hello, Authenticator), SSPR',
  { text: 'Hybrid auth:', bold: true },
  'Password Hash Sync (most common) | Pass-through Auth | Federation (AD FS)',
  { text: 'SSO:', bold: true },
  'Authenticate once, access all M365 + approved third-party apps',
  { text: '', size: 4 },
  { text: 'Conditional Access: signals > decision > enforcement', bold: true, color: C.blue },
  { text: 'Signals: user risk, device compliance, location, app sensitivity', indent: 1 },
  { text: '"What If" tool to simulate policies before deployment', indent: 1 },
]);

// Slide: PIM and Defender XDR
twoColSlide('PIM and Microsoft Defender XDR', [
  { text: 'Privileged Identity Management (PIM)', bold: true },
  'Just-in-time admin role activation',
  'Time-bound access -- auto-revokes',
  'Requires MFA + justification at activation',
  'Approval workflows for sensitive roles',
  'All activations logged and auditable',
], [
  { text: 'Microsoft Defender XDR', bold: true },
  'Unified threat detection and response',
  'Defender for Office 365 (email/phishing)',
  'Defender for Endpoint (devices)',
  'Defender for Identity (AD signals)',
  'Defender for Cloud Apps (shadow IT)',
]);

// Slide: App Registrations
contentSlide('App Registrations and Enterprise Apps', [
  { text: 'App Registrations:', bold: true, color: C.blue },
  'Define how an app connects to M365 and what it can access',
  'Specify account types and required permissions (read profiles, send email, etc.)',
  'Secured with client secrets or certificates -- rotate regularly',
  { text: '', size: 4 },
  { text: 'Enterprise Applications:', bold: true, color: C.blue },
  'Service principals instantiated in a tenant',
  'Represent the actual app instance users interact with',
  { text: '', size: 4 },
  { text: 'User consent management:', bold: true, color: C.blue },
  'Review and limit which apps users can approve',
  'Regularly audit permissions -- enforce least privilege for apps',
]);

// Slide: RBAC
contentSlide('Role-Based Access Control (RBAC)', [
  { text: 'Principle of least privilege -- do NOT use Global Admin for everything', bold: true, color: C.accent2 },
  { text: '', size: 4 },
  { text: 'Key built-in roles:', bold: true, color: C.blue },
  'Global Administrator: full access (use sparingly)',
  'Exchange Administrator, Teams Administrator, SharePoint Administrator',
  'Helpdesk Administrator: password resets only',
  'Compliance Administrator: audit logs, DLP policies',
  'User Administrator: account management',
  { text: '', size: 4 },
  'Custom roles available in Microsoft Entra ID for fine-tuned access',
  'Use group-based role assignment for scalability',
]);

// Demo
demoSlide('Admin Center Tour', [
  'admin.microsoft.com -- show dashboard, user list, license management',
  'Assign a Copilot license to a user (Users > Active users > Licenses and apps)',
  'Copilot > Billing & usage -- show PAYG billing policy setup',
  'entra.microsoft.com -- show Conditional Access policy and "What If" tool',
  'Health > Service health -- review active advisories',
]);

// Slide: Key Portal Paths
tableSlide('Key Portal Paths (Memorize These!)', ['Task', 'Portal Path'], [
  ['DSPM for AI', 'purview.microsoft.com > Solutions > DSPM for AI (classic)'],
  ['Copilot PAYG billing', 'admin.microsoft.com > Copilot > Billing & usage'],
  ['Agent approval queue', 'admin.microsoft.com > Agents > All agents > Requests'],
  ['Sensitivity labels', 'purview.microsoft.com > Solutions > Information protection > Labels'],
  ['Conditional Access', 'entra.microsoft.com > Protection > Conditional Access > Policies'],
  ['PIM role activation', 'entra.microsoft.com > Identity governance > PIM'],
  ['Copilot license', 'admin.microsoft.com > Users > Active users > Licenses and apps'],
], { colW: [2.5, 6.3], rowH: 0.38 });

// Slide: Exam Tips
contentSlide('Exam Tips and Final Reminders', [
  { text: 'Domain 2 (Purview/data protection) is 35-40% -- study it most', bold: true, color: C.accent2 },
  { text: 'Know the portal paths -- wrong portal is the #1 distractor pattern', bold: true },
  'Copilot = reactive assistant | Agents = autonomous, customizable',
  'Researcher and Analyst need a separate admin block (not the general toggle)',
  'PAYG billing is a 2-step process -- both steps required or PAYG stays disabled',
  { text: 'Copilot license activation has a 24-hour delay -- NOT immediate', bold: true, color: C.accent2 },
  { text: 'PAYG usage is metered in Copilot Credits (not "per message")', bold: true, color: C.accent2 },
  'DSPM for AI for AI-specific risk; Content Explorer for general sensitive data',
  'Copilot can only see what the user can see -- Graph enforces permissions',
  { text: '', size: 4 },
  { text: 'Passing score: 700/1000  |  45 minutes  |  Exam sandbox: aka.ms/examdemo', bold: true, color: C.blue },
]);

// Slide: Closing
const closing = pptx.addSlide();
closing.background = { path: path.join(__dirname, 'html', 'bg-closing.png') };
closing.addText('Thank You!', { x: 0, y: 1.0, w: 10, h: 1.2, fontSize: 42, bold: true, color: C.white, fontFace: 'Arial', align: 'center' });
closing.addText('Tim Warner  |  TechTrainerTim.com  |  github.com/timothywarner', { x: 0, y: 2.3, w: 10, h: 0.6, fontSize: 18, color: C.lightBlue, fontFace: 'Arial', align: 'center' });
closing.addText('Good luck on the AB-900 exam!', { x: 0, y: 3.2, w: 10, h: 0.6, fontSize: 20, color: C.accent1, fontFace: 'Arial', align: 'center' });
closing.addText('Resources: github.com/timothywarner-org/ab900', { x: 0, y: 4.2, w: 10, h: 0.4, fontSize: 14, color: C.gray, fontFace: 'Arial', align: 'center' });

// ============================================================
// SAVE
// ============================================================
const outPath = path.join(__dirname, '..', '..', 'docs', 'warner-ab900-april-2026.pptx');
pptx.writeFile({ fileName: outPath }).then(() => {
  console.log(`Deck created: ${outPath}`);
  console.log(`Total slides: ${pptx.slides.length}`);
}).catch(err => console.error(err));
