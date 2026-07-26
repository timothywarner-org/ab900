# Contributing to the Course Repository

Thank you for your interest in contributing to this O'Reilly Live Learning course repository!

## How to Contribute

### Types of Contributions

We welcome the following types of contributions:

1. **Bug Fixes** - Corrections to errors in documentation or code
2. **Enhancements** - Improvements to existing materials
3. **New Resources** - Additional scripts, templates, or reference materials
4. **Lab Improvements** - Enhanced lab exercises or additional scenarios
5. **Documentation** - Better explanations, clarifications, or examples

### Contribution Process

1. **Fork the Repository**
   ```bash
   git clone https://github.com/timothywarner-org/ab900.git
   cd ab900
   ```

2. **Create a Branch**
   ```bash
   git checkout -b feature/your-contribution-name
   ```

3. **Make Your Changes**
   - Follow the existing structure and format
   - Test any scripts or code thoroughly
   - Update relevant documentation

4. **Commit Your Changes**
   ```bash
   git add .
   git commit -m "Description of your changes"
   ```

5. **Push to Your Fork**
   ```bash
   git push origin feature/your-contribution-name
   ```

6. **Submit a Pull Request**
   - Provide a clear description of your changes
   - Reference any related issues
   - Explain the benefit of your contribution

## Guidelines

### Code Standards

- **PowerShell Scripts**
  - Use approved verbs (Get, Set, New, etc.)
  - Include comment-based help
  - Add error handling
  - Test in multiple environments

- **Documentation**
  - Use clear, concise language
  - Follow existing formatting
  - Include examples where appropriate
  - Check spelling and grammar

### House Style (enforced by CI)

The `validate.yml` workflow greps every Markdown file for these. It is non-blocking, but findings should be resolved before merge.

- **Plain ASCII only.** No curly quotes, no en dashes, no em dashes. Use straight quotes and `--`.
- **No contractions.** Write "do not", not "don't". This file, `style-guide.md`, and `fictional-companies.md` are excluded from that check.
- **Microsoft Writing Style Guide.** Use official UI labels, sentence-style capitalization, and Microsoft instruction formatting.
- **Current terminology only.** Never use retired product names or portal URLs. The full rename table is in `.github/copilot-instructions.md`, and the authoritative navigation paths are in the Portal Accuracy Rules section of `CLAUDE.md`.
- **Negatives only when required.** If a negative is necessary, write it in CAPS and bold.
- **No color-only signaling.** Differentiate with a label, shape, or position as well as color.
- **Fictional companies only.** Use names from `references/fictional-companies.md` (Contoso, Fabrikam, Tailwind Traders) for scenario context.
- **Practice question rationale** must be exactly 2 sentences per choice, and distractors must reference real Microsoft 365 services, portals, or settings.

Check locally before pushing:

```bash
grep -rn --include="*.md" -E 'compliance\.microsoft\.com|Azure AD[^C]|\bAAD\b|Azure Active Directory|AI hub|per message|Billing > Billing policies|Azure AI Studio' .
```

Two patterns produce known false positives. `per message` is only partially retired, because a current Microsoft pay-as-you-go Meters page still uses it. `compliance.microsoft.com` trips whenever content explains which portal is retired. See the "Known false positives" note in `CLAUDE.md` before rewriting either.

### Content Standards

- **Accuracy** - Ensure all information is current and correct
- **Grounding** - Verify every portal path, price, feature status, and GA date against Microsoft Learn before asserting it. If you cannot verify a claim, omit it or flag it for review. Do not guess a UI location, button label, or version number.
- **Exam alignment** - Content targets the **Skills measured as of July 22, 2026** version of the AB-900 study guide. If Microsoft publishes a newer version, note the change log delta in your pull request description.
- **Relevance** - Contributions should align with course objectives
- **Quality** - Maintain high standards for all materials
- **Attribution** - Credit sources appropriately. Link to the specific Microsoft Learn page, not a search result.

### Testing Requirements

Before submitting:
- [ ] Test all scripts in a non-production environment
- [ ] Verify documentation accuracy against Microsoft Learn
- [ ] Confirm every portal navigation path matches the Portal Accuracy Rules in `CLAUDE.md`
- [ ] Check all links work correctly
- [ ] Run the retired-terminology grep above
- [ ] Confirm no contractions, curly quotes, em dashes, or en dashes
- [ ] Ensure formatting is consistent
- [ ] Review for typos and errors

## What NOT to Contribute

- Copyrighted materials without permission
- Sensitive or confidential information
- Credentials or secrets
- Malicious code or scripts
- Off-topic content

## Questions or Issues?

If you have questions or find issues:

1. Check existing issues first
2. Open a new issue with details
3. Tag appropriately (bug, enhancement, question)
4. Provide context and examples

## Code of Conduct

- Be respectful and professional
- Focus on constructive feedback
- Help create a welcoming environment
- Follow GitHub's community guidelines

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for helping make this course better!**
