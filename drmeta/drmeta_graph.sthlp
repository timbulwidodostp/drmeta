{smcl}
{* *! version 1.1.0 apr19}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "drmeta" "help drmeta"}{...}
{vieweralsosee "drmeta_gof" "help drmeta_gof"}{...}
{vieweralsosee "glst" "help glst"}{...}
{vieweralsosee "predict" "help drmeta_predict"}{...}
{cmd:help drmeta_graph}{right: ({browse "https://doi.org/10.1177/1536867X211025798":SJ21-2: st0638})}
{hline}

{title:Title}

{p2colset 5 21 23 2}{...}
{p2col :{cmd:drmeta_graph} {hline 2}}Plot the fitted dose-response meta-analysis model{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 20 2}
{cmd:drmeta_graph} [{cmd:,} {opt d:ose(numlist)} {opt r:ef(#)}  
{opt eq:uation(string)} {opt matk:nots(matname)} {opt k:nots(numlist)} {opt blup} {opt gls} {opt l:evel(#)} {opt eform} 
{opt scatter} {opt list} {opt addplot(string)} {opt plotopts(string)} {opth form:at(%fmt)} {it:twoway_options}] 


{title:Description}

{pstd}
The {cmd:drmeta_graph} command greatly facilitates the visualization of the
fitted dose-response model.  It is a postestimation tool of the {cmd:drmeta}
command.  {cmd:drmeta_graph} plots the average dose-response relationship
together with confidence intervals upon indication of a list of dose/exposure
values, a referent, and the types of transformations used to model the
quantitative predictor.  It is particularly convenient when modeling the dose
with splines.{p_end}


{title:Options}

{phang}
{opt dose(numlist)} specifies the values of the dose at which to estimate
differences in predicted responses.

{phang}
{opt ref(#)} specifies the reference value of the dose; this value is not
necessarily included in {opt dose(numlist)}.

{phang}
{opt equation(string)} specifies the mathematical transformations of the dose
{it:d} used in the previously fitted dose-response model.  It is relevant only
if {opt matknots(matname)} or {opt knots(numlist)} has not been specified.
Example 1: {opt equation(d)} means that the dose was modeled assuming a linear
function.  Example 2: {opt equation(d d^2)} means that the dose was modeled
with a quadratic function.  Example 3: {cmd:equation(}{it:d} ln({it:d}){cmd:)}
means that the dose was modeled with {it:d} and the natural logarithm of
{it:d}.

{phang}
{opt matknots(matname)} specifies the matrix of knots used to create restricted
cubic splines.  This can be easily obtained from the stored results of the
{cmd:mkspline} command.

{phang}
{opt knots(numlist)} specifies a list of knots used to create the restricted
cubic splines.  It is an alternative to the option {opt matknots(matname)}.

{phang}
{opt blup} shows conditional study-specific lines arising from the estimated
random-effects model (best linear unbiased prediction).

{phang}
{opt gls} shows study-specific lines estimated separately using generalized
least squares.

{phang}
{opt level(#)} sets the confidence level as a percentage for confidence
intervals.  The default is {cmd:level(95)} or as set by {help level:set level}.

{phang}
{opt eform} exponentiates the estimated differences in predicted responses.

{phang}
{opt scatter} shows a scatterplot rather than a line plot (default).
 
{phang}
{opt list} lists the estimated differences in predicted responses.

{phang}
{opt addplot(string)} specifies the equation of the model to be plotted in
terms of the dose {it:d}.  It can be useful to overlay a line or curve on the
graph of the previously fitted model.  Example 1: You previously fit a spline
model, and you want to add a line {cmd:addplot(}{it:b_1}*({it:d-10}){cmd:)},
representing the change in predicted outcome relative to the dose value of 10
according to a linear function.  Example 2: You previously fit a linear
response model, and you want to add a curve
{cmd:addplot(}{it:b_1}*({it:d-10})+{it:b_2}*({it:d}^2-100){cmd:)},
representing the change in predicted outcome relative to the dose value of 10
according to a quadratic function.

{phang}
{opt plotopts(string)} controls the {help line} options affecting the added
plot with the option {opt addplot(string)}.

{phang}
{cmdab:format(%}{it:fmt}{cmd:)} specifies the display format for presenting
numbers.  {cmd:format(%3.2f)} is the default; see 
{help format:help format}.{p_end}

{phang}
{it:twoway_options} are most of the options documented in
{manhelpi twoway_options G}, including options for titles, axes, labels,
schemes, and saving the graph to disk.  However, the {cmd:by()} option is not
allowed.


{title:Examples}

{pstd}
Read data about alcohol consumption and colorectal cancer risk
(Orsini et al. 2012){p_end}
{phang2}{cmd:. use http://www.stats4life.se/data/ex_alcohol_crc.dta}{p_end}
 
{pstd}
Model 1. One-stage random-effects dose-response model assuming a linear
trend{p_end}
{phang2}{cmd:. drmeta logrr dose, data(peryears cases) id(study) type(type) se(se) reml}{p_end}

{pstd}
Graph the colorectal cancer relative risk as a linear function of alcohol
consumption ranging from 0 to 60 (step by 1) grams/day using 10 grams/day as
referent{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) equation(d) list eform}{p_end}

{pstd}
Model 2. One-stage random-effects dose-response model assuming a quadratic
trend{p_end}
{phang2}{cmd:. generate dosesq = dose^2}{p_end}
{phang2}{cmd:. drmeta logrr dose dosesq, data(peryears cases) id(study) type(type) se(se) reml}{p_end}

{pstd}
Graph the colorectal cancer relative risk as a quadratic function of alcohol
consumption ranging from 0 to 60 (step by 1) grams/day using 10 grams/day as
referent{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) equation(d d^2) eform}{p_end}

{pstd}
Overlay the linear trend with the previously fit quadratic trend{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) equation(d d^2) addplot(.0064376*(d-10)) plotopts(lc(red) lw(thick)) eform}{p_end}

{pstd}
Model 3. One-stage random-effects dose-response model using restricted cubic
splines{p_end}
{phang2}{cmd:. mkspline doses = dose, nk(3) cubic}{p_end}
{phang2}{cmd:. matrix knots = r(knots)}{p_end}
{phang2}{cmd:. drmeta logrr doses1 doses2, data(peryears cases) id(study) type(type) se(se) reml}{p_end}

{pstd}
Graph the colorectal cancer relative risk as a function of alcohol consumption
ranging from 0 to 60 (step by 1) grams/day using 10 grams/day as referent,
passing the matrix of knots allows the command to reconstruct the restricted
cubic splines at the specified values{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) matk(knots) eform}{p_end}

{pstd}
Improve the graph specifying common {it:twoway_options}{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) matk(knots) eform ytitle("Relative risk") xtitle("Alcohol consumption, grams/day")}{p_end}

{pstd}
Add conditional study-specific lines (best linear unbiased prediction){p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) matk(knots) blup eform ytitle("Relative risk") xtitle("Alcohol consumption, grams/day")}{p_end}

{pstd}
Add study-specific lines estimated separately within each study using
generalized least squares{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) matk(knots) gls eform ytitle("Relative risk") xtitle("Alcohol consumption, grams/day")}{p_end}

{pstd}
Overlay the quadratic trend with the previously fit spline model{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) matk(knots) ytitle("Relative risk") xtitle("Alcohol consumption, grams/day") addplot(-.0015682*(d-10)+.0001636*(d^2-100)) plotopts(lc(red) lw(thick)) eform}{p_end}

{pstd}
Shows a scatterplot rather than a line plot{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(5)60) ref(10) matk(knots) xlabel(0(5)60, grid) yline(1, lp(-)) ytitle("Relative risk") xtitle("Alcohol consumption, grams/day") scatter eform}{p_end}


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
Help:  {helpb drmeta}, {helpb drmeta_gof}, {helpb glst},
{helpb drmeta_predict:predict} (if installed){p_end}
