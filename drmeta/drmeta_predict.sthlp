{smcl}
{* *! version 1.1.0 11sep18}{...} 
{vieweralsosee "" "--"}{...}
{vieweralsosee "drmeta" "help drmeta"}{...}
{vieweralsosee "drmeta_gof" "help drmeta_gof"}{...}
{vieweralsosee "drmeta_graph" "help drmeta_graph"}{...}
{vieweralsosee "glst" "help glst"}{...}
{cmd:help drmeta_predict}{right: ({browse "https://doi.org/10.1177/1536867X211025798":SJ21-2: st0638})}
{hline}

{title:Title}

{p2colset 5 16 18 2}{...}
{p2col :{cmd:predict} {hline 2}}Obtain predictions after {cmd:drmeta} command for dose-response meta-analysis{p_end}
{p2colreset}{...}


{title:Syntax for predict}

{p 8 15 2}
{cmd:predict} {it:stubname} [{cmd:,} {it:statistic}]
{p2colreset}{...}

{synoptset 18 tabbed}{...}
{synopthdr:statistic}
{synoptline}
{synopt :{opt xb}}linear prediction for the fixed portion of the model only; the default{p_end}
{synopt :{opt xbs}}linear prediction using study-specific coefficient vector estimated using generalized least squares (GLS){p_end}
{synopt :{opt fit:ted}}fitted values, fixed-portion linear prediction plus
contributions based on predicted random effects{p_end}
{synopt :{opt ref:fects}}predict best linear unbiased predictions (BLUPs) of random effects{p_end}
{synoptline}
{p2colreset}{...}


{title:Description}

{pstd}
The {cmd:predict} command after {cmd:drmeta} creates a new variable containing
the requested predictions using study-specific reference values.{p_end}


{title:Options}

{phang}
{opt xb} calculates the linear prediction for the fixed portion of the model
only; this option is the default.

{phang}
{opt xbs} calculates the linear prediction using a study-specific coefficient
vector estimated using GLS.

{phang}
{opt fitted} calculates fitted values, that is, a fixed-portion linear
prediction plus contributions based on predicted random effects.

{phang}
{opt reffects} predicts BLUPs of random effects.


{title:Examples}

{pstd}
Read data about alcohol consumption and colorectal cancer risk (Orsini et al.
2012){p_end}
{phang2}{cmd:. use http://www.stats4life.se/data/ex_alcohol_crc.dta}{p_end}
 
{pstd} Model 1. One-stage random-effects dose-response model assuming a linear
trend{p_end}
{phang2}{cmd:. drmeta logrr dose, data(peryears cases) id(study) type(type) se(se) reml}{p_end}

{pstd}
Prediction 1. Store the predicted contrasts using the GLS estimates obtained
within each study{p_end}
{phang2}{cmd:. predict fit_xbs, xbs}{p_end}

{pstd}
Prediction 2. Store the predicted contrasts using the estimated fixed
effects{p_end}
{phang2}{cmd:. predict fit_xb, xb}{p_end}
 
{pstd}
Prediction 3. Store the predicted contrasts using the estimated fixed effects
plus the random effects{p_end}
{phang2}{cmd:. predict fit_fitted, fitted}{p_end}

{pstd}
Prediction 4. Store the predicted BLUPs of random effects{p_end}
{phang2}{cmd:. predict fit_blup, reffect}{p_end}

{pstd}
Examine predicted values{p_end}
{phang2}{cmd:. list study dose logrr fit_xb fit_xbs fit_fitted, sepby(study)}{p_end}

{pstd}
Graphical comparison of dose-response curves estimated separately within each
study (xbs) and with random-effects model (fitted){p_end}
{phang2}{cmd:. twoway (scatter fit_xbs dose, sort c(ascending) lc(red)) (line fit_fitted dose, sort c(ascending) lc(blue)), by(study, legend(off))}{p_end}

{pstd}
Model 2. One-stage random-effects dose-response model using restricted cubic
splines{p_end}
{phang2}{cmd:. mkspline doses = dose, nk(3) cubic}{p_end}
{phang2}{cmd:. drmeta logrr doses1 doses2, data(peryears cases) id(study) type(type) se(se) reml}{p_end}

{pstd}
Prediction 1. Store the predicted contrasts using the GLS estimates obtained
within each study{p_end}
{phang2}{cmd:. predict fit2_xbs, xbs}{p_end}

{pstd}
Prediction 2. Store the predicted contrasts using the estimated fixed
effects{p_end}
{phang2}{cmd:. predict fit2_fitted, fitted}{p_end}

{pstd}
Graphical comparison of dose-response curves estimated separately within each study (xbs) and with random-effects model (fitted){p_end}
{phang2}{cmd:. twoway (line fit2_xbs dose, sort lc(red)) (line fit2_fitted dose, sort lc(blue)), by(study, legend(off))}{p_end}


{title:Support}

{p 4 8 2}
{browse "http://www.stats4life.se"}{p_end}
{p 4 8 2}
{browse "mailto:nicola.orsini@ki.se?subject=drmeta":nicola.orsini@ki.se}{p_end}


{title:Reference}

{p 4 8 2}
Orsini, N., R. Li, A. Wolk, P. Khudyakov, and D. Spiegelman. 2012.
Meta-analysis for linear and nonlinear dose-response relations: Examples, an
evaluation of approximations, and software.
{it:American Journal of Epidemiology} 175: 66-73.
{browse "https://doi.org/10.1093/aje/kwr265"}.{p_end}


{title:Author}

{pstd}Nicola Orsini{p_end}
{pstd}Biostatistics Team{p_end}
{pstd}Department of Public Health Sciences{p_end}
{pstd}Karolinska Institutet{p_end}
{pstd}Solna, Sweden{p_end}
{pstd}nicola.orsini@ki.se{p_end}


{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 21, number 2: {browse "https://doi.org/10.1177/1536867X211025798":st0638}{p_end}

{p 7 14 2}
Help:  {helpb drmeta}, {helpb drmeta_gof}, {helpb drmeta_graph}, {helpb glst}
(if installed){p_end}
