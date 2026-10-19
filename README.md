# Business Analytics: Power and Renewable Energy

CSE5014 Business Analytics coursework investigating building energy efficiency, focusing on cooling load, building geometry, and orientation. Includes R analysis, data, saved graphs, and the coursework report.

## Analysis

- Missing-value and duplicate checks, descriptive statistics, and skewness.
- Histograms, normal curves, and Shapiro-Wilk normality tests.
- Cooling load by orientation: box plots, one-way ANOVA, and variance checks.
- Spearman correlations, scatter plots, and roof-area linear regression.
- Regression diagnostics and robust coefficient tests.

## Files

| Path | Description |
| --- | --- |
| `analysis.R` | Supplied standalone analysis script |
| `CSE5014_Business_Analytics/analysis.R` | Script from the original RStudio project |
| `CSE5014_Business_Analytics/CSE5014_Business_Analytics.Rproj` | RStudio project |
| `CSE5014_Business_Analytics/EED.csv` | Dataset with 768 observations and 10 columns |
| `CSE5014_Business_Analytics/graphs/` | Saved analysis figures |
| `CLHDCSECMU_131_38_CSE5014.docx` | Coursework report |
| `CSE5014_BA_PROJECT_FILE.rar` | Original project archive |

## Dataset

Columns: `Relative_Compactness`, `Surface_Area`, `Wall_Area`, `Roof_Area`, `Overall_Height`, `Orientation`, `Glazing_Area`, `Glazing_Area_Distribution`, `Heating_Load`, and `Cooling_Load`.

## Getting started

Install R and optionally RStudio, then install the dependencies in an R console:

```r
install.packages(c("moments", "lmtest", "sandwich"))
```

Open `CSE5014_Business_Analytics/CSE5014_Business_Analytics.Rproj` in RStudio and run sections of `analysis.R`. Keep the working directory set to that project folder so the script can locate `EED.csv`.

Alternatively, from an R console at the repository root:

```r
setwd("CSE5014_Business_Analytics")
source("analysis.R", echo = TRUE)
```

## Execution limitations

The supplied scripts reference `model_rw` near the end without defining it. A full run in a fresh session stops there; define the intended regression model before running those diagnostics. The scripts also install packages during execution, which requires internet access. The analysis is preserved as supplied. Execution was not verified during upload because R was unavailable.

Saved figures are in `graphs/` within the RStudio project. New plots are sent to the active R graphics device.
