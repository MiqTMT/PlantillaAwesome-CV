# CV Workflow

Edit your personal files at the repo root:

- `cv.tex`
- `resume.tex`
- `sections/*.tex`

Keep `examples/` only as reference.

## Which file should I use?

- `resume.tex`: shorter, selective version for job applications.
- `cv.tex`: fuller academic and professional history.

## Recommended workflow

1. Edit the personal details at the top of `cv.tex` and `resume.tex`.
2. Update the shared content in:
   - `sections/summary.tex`
   - `sections/experience.tex`
   - `sections/education.tex`
   - `sections/skills.tex`
3. Keep `resume.tex` tighter and more selective.
4. Keep `cv.tex` broader and include publications or other academic sections.

## Compile

From the repo root:

```powershell
xelatex resume.tex
xelatex cv.tex
```
