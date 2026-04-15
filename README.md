# CV Repository

This repository is organized around the files you actually build:

- `cv/` for full CVs
- `resumes/` for shorter or tailored resumes
- `sections/` for reusable pieces

There is no hidden builder layer. Each CV or resume file directly loads the sections it wants.

## Repository Layout

```text
.
|-- cv/
|   |-- en.tex
|   `-- es.tex
|-- resumes/
|   |-- generic/
|   |   |-- en.tex
|   |   `-- es.tex
|   `-- company-template/
|       |-- en.tex
|       `-- es.tex
|-- sections/
|   |-- shared/
|   |-- headers/
|   |-- summaries/
|   |-- experience/
|   |-- education/
|   |-- skills/
|   `-- publications/
|-- awesome-cv.cls
|-- awesome-cv.cls.bak
`-- Makefile
```

## Mental Model

- `cv/en.tex` means "build the English full CV"
- `cv/es.tex` means "build the Spanish full CV"
- `resumes/generic/en.tex` means "build the English generic resume"
- `sections/` stores the reusable text blocks

When you open one of the compilable files, you can immediately see:

- which language it is
- which sections it includes
- which entries it keeps or omits
- in what order they appear

## What To Edit

### Shared personal details

Edit:

- `sections/shared/personal-en.tex`
- `sections/shared/personal-es.tex`

Keep contact info, location, and public links aligned here.

### Header line under your name

Edit:

- `sections/headers/cv-en.tex`
- `sections/headers/cv-es.tex`
- `sections/headers/generic-en.tex`
- `sections/headers/generic-es.tex`
- `sections/headers/company-template-en.tex`
- `sections/headers/company-template-es.tex`

### Summary paragraph

Edit:

- `sections/summaries/cv-en.tex`
- `sections/summaries/cv-es.tex`
- `sections/summaries/generic-en.tex`
- `sections/summaries/generic-es.tex`
- `sections/summaries/company-template-en.tex`
- `sections/summaries/company-template-es.tex`

### Experience entries

Edit:

- `sections/experience/*-en.tex`
- `sections/experience/*-es.tex`

Each file is one experience entry in one language.

### Education entries

Edit:

- `sections/education/*-en.tex`
- `sections/education/*-es.tex`

### Skills

Edit:

- `sections/skills/en.tex`
- `sections/skills/es.tex`

### Publications

Edit:

- `sections/publications/*.tex`

## Workflow

### Main outputs

The actual compilable files are:

- `cv/en.tex`
- `cv/es.tex`
- `resumes/generic/en.tex`
- `resumes/generic/es.tex`
- `resumes/company-template/en.tex`
- `resumes/company-template/es.tex`

Each of those files already assembles a complete document.

### Build from the repo root

Direct build:

```powershell
xelatex cv/en.tex
xelatex cv/es.tex
xelatex resumes/generic/en.tex
xelatex resumes/generic/es.tex
xelatex resumes/company-template/en.tex
xelatex resumes/company-template/es.tex
```

Root wrapper build:

Use [build.tex](c:\Users\mmartif\Documents\GitHub\PlantillaAwesome-CV\build.tex) if you prefer a single root-level file.

Uncomment exactly one line such as:

```tex
\input{cv/en.tex}
```

Available inputs:

- `\input{cv/en.tex}`
- `\input{cv/es.tex}`
- `\input{resumes/generic/en.tex}`
- `\input{resumes/generic/es.tex}`
- `\input{resumes/company-template/en.tex}`
- `\input{resumes/company-template/es.tex}`

Then compile:

```powershell
xelatex build.tex
```

`build.tex` is only a thin wrapper. It forwards to one already-compilable file such as `cv/es.tex` or `resumes/generic/en.tex`.

### Make targets

You can also use:

```powershell
make cv-en
make cv-es
make resume-generic-en
make resume-generic-es
```

## How To Add A New Company Resume

Suppose you want a tailored resume for a company called `tesla`.

1. Create:
   - `resumes/tesla/en.tex`
   - `resumes/tesla/es.tex`
2. Copy one of the existing resume files as a starting point.
3. Change the loaded summary and header if needed.
4. Reorder, remove, or swap entries directly in that resume file.

This keeps the customization visible in the actual resume file.

## How To Add A Company-Specific Version Of One Experience

If one company needs a special wording for a single experience, do not rewrite the shared entry for everyone.

Create a targeted override instead, for example:

- `sections/experience/iri-engineer-tesla-en.tex`
- `sections/experience/iri-engineer-tesla-es.tex`

Then in `resumes/tesla/en.tex`, load:

```tex
\input{sections/experience/iri-engineer-tesla-en.tex}
```

instead of:

```tex
\input{sections/experience/iri-engineer-en.tex}
```

That way:

- the full CV stays canonical
- the generic resume stays canonical
- the Tesla resume gets its one special variant

## Consistency Rules

- Keep stable facts in the shared experience and education entries.
- Use the Spanish and English files as language pairs.
- Tailor resumes by changing which files are loaded and in what order.
- Only create company-specific variants when the wording really must change for that target.
- Keep `awesome-cv.cls.bak` as the class backup.

## Notes

- `examples/` remains upstream reference material from Awesome-CV.
- `oldcv/` remains archival material.
- Build artifacts such as `.aux`, `.log`, `.pdf`, and `.synctex.gz` should not be treated as source files.
