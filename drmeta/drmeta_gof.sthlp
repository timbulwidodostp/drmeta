{smcl}
{* *! version 1.1.0 18sep18}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "drmeta" "help drmeta"}{...}
{vieweralsosee "drmeta_graph" "help drmeta_graph"}{...}
{vieweralsosee "glst" "help glst"}{...}
{vieweralsosee "predict" "help drmeta_predict"}{...}
{cmd:help drmeta_gof}{right: ({browse "https://doi.org/10.1177/1536867X211025798":SJ21-2: st0638})}
{hline}

{title:Title}

{p2colset 5 19 21 2}{...}
{p2col :{cmd:drmeta_gof} {hline 2}}Goodness of fit after dose-response meta-analysis{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 18 2}
{cmd:drmeta_gof}
[{cmd:,} {opt r2s}
{opt opvd:plot}{cmd:(}{it:dose_var}{cmd:,}
[{cmd:xb}|{cmd:xbs}|{cmd:fitted}]{cmd:)}
{opt drvd:plot(dose_var)}
{opt dovp:plot}
{it:{help twoway_options:twoway_options}}]


{title:Description}

{pstd}
The {cmd:drmeta_gof} command provides tools (deviance test, R-squared) to
evaluate the goodness of fit in dose-response meta-analysis.  It is a
postestimation tool of the {helpb drmeta} command.{p_end}


{title:Options}

{phang}
{opt r2s} shows the study-specific coefficient of determination (R-squared).

{phang}
{opt opvdplot}{cmd:(}{it:dose_var}{cmd:,} [{cmd:xb}|{cmd:xbs}|{cmd:fitted}])
plots the observed and specified predicted values versus the specified dose.
The default is to use study-specific predictions using generalized least
squares ({cmd:xbs}).  See {helpb drmeta_predict}.

{phang}
{opt drvdplot(dose_var)} plots the decorrelated residuals versus the specified
dose. 

{phang}
{opt dovpplot} plots decorrelated observed contrasts versus predicted
contrasts.
 
{phang}
{it:twoway_options} are most of the options documented in
{manhelpi twoway_options G}, including options for titles, axes, labels,
schemes, and saving the graph to disk.  However, the {cmd:by()} option is not
allowed.


{title:Examples}

{pstd}
Read data from seven simulated studies with a common underlying linear
dose-response relationship (Discacciati, Crippa, and Orsini 2017){p_end}

{pstd}
The true value of the slope is 0.1 (RR=1.11){p_end}
{phang2}{cmd:. use http://www.stats4life.se/data/table1sim.dta}{p_end}
 
{pstd}
One-stage random-effects dose-response model assuming a linear trend{p_end}
{phang2}{cmd:. drmeta logor dose, se(selogor) data(n case) id(id) type(study) reml}{p_end}
{phang2}{cmd:. drmeta_gof}{p_end}
{phang2}{cmd:. drmeta_gof, r2s}{p_end}
{phang2}{cmd:. drmeta_gof, opvd(dose)}{p_end}
{phang2}{cmd:. drmeta_gof, opvd(dose, fitted)}{p_end}
{phang2}{cmd:. drmeta_gof, dovp}{p_end}

{pstd}
One-stage random-effects dose-response model using restricted cubic
splines{p_end}
{phang2}{cmd:. mkspline doses = dose, nk(3) cubic}{p_end}
{phang2}{cmd:. drmeta logor doses1 doses2, se(selogor) data(n case) id(id) type(study) reml}{p_end}
{phang2}{cmd:. drmeta_gof, r2s}{p_end}
{phang2}{cmd:. drmeta_gof, drvd(dose)}{p_end}
{phang2}{cmd:. drmeta_gof, opvd(dose)}{p_end}
{phang2}{cmd:. drmeta_gof, dovp}{p_end}


{title:Support}

{p 4 8 2}
{browse "http://www.stats4life.se"}{p_end}
{p 4 8 2}
{browse "mailto:nicola.orsini@ki.se?subject=drmeta":nicola.orsini@ki.se}{p_end}


{title:Reference}

{p 4 8 2}
Discacciati, A., A. Crippa, and N. Orsini. 2017.
Goodness of fit tools for dose-response meta-analysis of binary outcomes.
{it:Research Synthesis Methods} 8: 149-160.
{browse "https://doi.org/10.1002/jrsm.1194"}{p_end}


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
Help:  {helpb drmeta}, {helpb drmeta_graph}, {helpb glst},
{helpb drmeta_predict:predict} (if installed){p_end}
