{smcl}
{* *! version 1.1.0 28apr19}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "drmeta_gof" "help drmeta_gof"}{...}
{vieweralsosee "drmeta_graph" "help drmeta_graph"}{...}
{vieweralsosee "glst" "help glst"}{...}
{vieweralsosee "predict" "help drmeta_predict"}{...}
{cmd:help drmeta}{right: ({browse "https://doi.org/10.1177/1536867X211025798":SJ21-2: st0638})}
{hline}

{title:Title}

{p2colset 5 15 17 2}{...}
{p2col :{cmd:drmeta} {hline 2}}Dose-response meta-analysis of summarized data{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 14 2}
{cmd:drmeta} {depvar} {it:dose_vars} {ifin} [{cmd:,} {it:options}]
{p2colreset}{...}

{synoptset 26 tabbed}{...}
{synopthdr:options}
{synoptline}
{synopt :{opth s:e(varname)}}specify an estimate of the standard error of {depvar}{p_end}
{synopt :{opt d:ata(varname1 varname2)}}crude data{p_end}
{synopt :{opt i:d(varname)}}specify the variable identifying study-specific contrasts{p_end}
{synopt :{opt t:ype(varname)}}specify type of {depvar}{p_end}
{synopt :{opt or}}specify that {depvar} be (log) odds ratios{p_end}
{synopt :{opt rr}}specify that {depvar} be (log) risk ratios{p_end}
{synopt :{opt hr}}specify that {depvar} be (log) hazard ratios{p_end}
{synopt :{opt md}}specify that {depvar} be mean differences{p_end}
{synopt :{opt smd}}specify that {depvar} be standardized mean differences{p_end}
{synopt :{opt vwls}}variance-weighted least-squares estimation{p_end}
{synopt :{opt 2stage}}specify the two-stage approach for dose-response meta-analysis; the default is the one-stage approach{p_end}
{synopt :{opt ml}}maximum likelihood method{p_end}
{synopt :{opt reml}}restricted maximum-likelihood method{p_end}
{synopt :{opt h:amling}}specify the Hamling method to estimate the covariances{p_end}
{synopt :{opt ac:ov(varname)}}pass average covariance as variable{p_end}
{synopt :{opt mc:ov(matrix_list)}}pass a list of variance-covariance matrices{p_end}

{synopt :{opt noret:able}}suppress the random-effects parameter estimates{p_end}
{synopt :{opt stddev:iations}}display the random-effects and residual-error parameter estimates as standard deviations and correlations{p_end}
{synopt :{opt nolr:t}}suppress the likelihood-ratio test for random effects{p_end}
{synopt :{opt eform}}generic label; exp(b){p_end}
{synopt :{opt l:evel(#)}}set confidence level, as a percentage, for confidence intervals (CIs); the default is {cmd:level(95)} or as set by {opt set level}{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}
{depvar} contains empirical estimates of contrasts in responses; {it:dose_vars}
specifies the variables to model the dose (polynomials, splines).{p_end}

{p 4 6 2}
After {cmd:drmeta}, the command {helpb drmeta_graph} can be useful
to plot the fitted dose-response model.  The {helpb drmeta_predict:predict}
command saves different types of predicted values (fixed, random, and fixed
plus random).  The {helpb drmeta_gof} command provides tools to
evaluate the goodness of fit of the model.  Standard postestimation commands
such as {helpb testparm} and {helpb predictnl} can be used.


{title:Description}

{pstd}
{cmd:drmeta} fits parametric dose-response models based on summarized data.  It
can be used to investigate linear and nonlinear dose-response relationships.
It fits fixed-effects and random-effects models using a one-stage or a
two-stage approach.  Effect measures include odds ratios, risk ratios, hazard
ratios, mean differences, and standardized mean differences.


{title:Options}

{phang}
{opth se(varname)} specifies an estimate of the standard error of {depvar}.

{phang}
{opt data(varname1 varname2)} specifies variables containing the information
required to reconstruct the covariances of {depvar}.  At each exposure level,
{it:varname1} is the number of subjects (controls plus cases) if {depvar} is 
(log) odds ratios; the total person-time if {depvar} is (log) hazard ratios;
or the total number of persons (cases plus noncases) if {depvar} is (log) risk
ratios.  The variable {it:varname2} contains the number of cases at each
exposure level.  If {depvar} is mean differences and standardized mean
differences total, the variable {it:varname1} indicates the total number of
persons, and the variable {it:varname2} contains the standard deviation of the
outcome at each exposure level.  Any missing values in either of the two
variables set the covariances to 0.{p_end}

{phang}
{opt id(varname)} specifies the variable identifying study-specific contrasts.
The reference dose is the row with a value of 0 for the standard error.  This
option is required with multiple studies.{p_end}

{phang}
{opt type(varname)} specifies the variable indicating the type of measure used
to contrast dose levels.  It can take on value {cmd:1} for odds ratios, {cmd:2}
for hazard ratios, {cmd:3} for risk ratios, {cmd:4} for mean differences, and
{cmd:5} for standardized mean differences.{p_end}

{phang}
{opt or} specifies that {depvar} be (log) odds ratios.  It is used for
dose-response estimation for a single study.  It is not necessary if the option
{opt id(varname)} is specified.{p_end}

{phang}
{opt rr} specifies that {depvar} be (log) risk ratios.  It is used for
dose-response estimation for a single study.  It is not necessary if the option
{opt id(varname)} is specified.{p_end}

{phang}
{opt hr} specifies that {depvar} be (log) hazard ratios.  It is used for
dose-response estimation for a single study.  It is not necessary if the option
{opt id(varname)} is specified.{p_end}

{phang}
{opt md} specifies that {depvar} be mean differences.  It is used for
dose-response estimation for a single study.  It is not necessary if the option
{opt id(varname)} is specified.{p_end}

{phang}
{opt smd} specifies that {depvar} be standardized mean differences.  It is
used for dose-response estimation for a single study.  It is not necessary if
the option {opt id(varname)} is specified.{p_end}

{phang}
{opt vwls} sets the covariances of {depvar} within each study to 0.{p_end}

{phang}
{opt 2stage} specifies the two-stage approach for dose-response meta-analysis.
It calls the {cmd:mvmeta} command.  The default is the one-stage
approach.{p_end}

{phang}
{opt ml} fits a random-effects model via maximum likelihood; this is the
default.  All variances and covariances of the random effects are allowed to be
distinct.  So if {it:dose_vars} includes {it:p} variables, then additional
{it:p}({it:p}+1)/2 random-effects parameters are estimated.{p_end}

{phang}
{opt reml} fits a random-effects model via restricted maximum-likelihood.  All
variances and covariances of the random effects are allowed to be distinct.  So
if {it:dose_vars} includes {it:p} variables, then additional {it:p}({it:p}+1)/2
random-effects parameters are estimated.{p_end}

{phang}
{opt hamling} specifies the Hamling method (Hamling et al. 2008) to estimate
the covariances when {depvar} is a log relative-risk.  The default is the
Greenland and Longnecker method (Greenland and Longnecker 1992; Orsini,
Bellocco, and Greenland 2006).  When {depvar} is a mean difference or a
standardized mean difference, the method used for the covariance is described
by Crippa and Orsini (2016).{p_end}

{phang}
{opt acov(varname)} passes the average covariance as a variable.{p_end}

{phang}
{opt mcov(matrix_list)} passes a list of variance-covariance matrices, one for
each study.  It is an advanced option where the order of the matrix list
matters.  The first matrix is supposed to be related to the first set of
contrasts and so on.  It can be useful when empirical contrasts and related
variance-covariance matrices are available directly from fitting a model on
primary data.  So this option allows the user to skip the specification of the
{opt data()} option.{p_end}

{phang}
{opt noretable} suppresses the random-effects parameter estimates.

{phang}
{opt stddeviations} displays the random-effects and residual-error parameter
estimates as standard deviations and correlations.

{phang}
{opt nolrt} suppresses the likelihood-ratio test for the unstructured
variance-covariance components.  It assesses whether all random-effects
parameters of the dose-response model are simultaneously zero.  Of note, the
likelihood-ratio test is {help j_mixedlr##|_new:conservative}.

{phang}
{opt eform} reports coefficient estimates as exp(b) rather than b.
Standard errors and CIs are similarly transformed.

{phang}
{opt level(#)} sets the confidence level, as a percentage, for CIs.  The
default is {cmd:level(95)} or as set by {helpb set level}.


{title:Examples}

{pstd}
{bf:Example 1: Observational cohort studies on alcohol consumption and colorectal cancer risk}

{pstd}
Read data described by Orsini et al. (2012){p_end}
{phang2}{cmd:. use http://www.stats4life.se/data/ex_alcohol_crc.dta}{p_end}
 
{pstd}
Model 1. One-stage random-effects dose-response model assuming a linear
trend{p_end}
{phang2}{cmd:. drmeta logrr dose, data(peryears cases) id(study) type(type) se(se) reml}{p_end}
{phang2}{cmd:. lincom dose*12, eform}{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) equation(d) eform}{p_end}

{pstd}
Model 2. One-stage random-effects dose-response model using restricted cubic
splines{p_end}
{phang2}{cmd:. mkspline doses = dose, nk(3) cubic}{p_end}
{phang2}{cmd:. matrix knots = r(knots)}{p_end}
{phang2}{cmd:. drmeta logrr doses1 doses2, data(peryears cases) id(study) type(type) se(se) reml}{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) matk(knots) eform}{p_end}

{pstd}
Model 3. Two-stage random-effects dose-response model using restricted cubic
splines{p_end}
{phang2}{cmd:. drmeta logrr doses1 doses2, data(peryears cases) id(study) type(type) se(se) reml 2stage}{p_end}
{phang2}{cmd:. drmeta_graph, dose(0(1)60) ref(10) matk(knots) eform ytitle("Relative risk") xtitle("Alcohol consumption (g/day)")}{p_end}


{pstd}
{bf:Example 2: Randomized trials on effectiveness of aripiprazole in schizoaffective patients} 

{pstd}
Read data described by Crippa and Orsini (2016){p_end}
{phang2}{cmd:. use http://www.stats4life.se/data/aripanss, clear}{p_end}

{pstd}
Model 1. One-stage random-effects dose-response model assuming a quadratic trend{p_end}
{phang2}{cmd:. drmeta md dose dosesq, se(se_md) data(n sd) id(id) type(type_md)}{p_end}
{phang2}{cmd:. drmeta_graph,  d(0(1)30) ref(0) eq(d d^2) ytitle("Mean difference") xtitle("Ariprazole (mg/day)")}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:drmeta} stores the following in {cmd:e()}:

{synoptset 23 tabbed}{...}
{p2col 5 23 25 2: Scalars}{p_end}
{synopt:{cmd:e(N)}}number of observations{p_end}
{synopt:{cmd:e(k)}}number of parameters{p_end}
{synopt:{cmd:e(k_f)}}number of fixed-effects parameters{p_end}
{synopt:{cmd:e(k_r)}}number of random-effects parameters{p_end}
{synopt:{cmd:e(N_s)}}number of sets of contrasts{p_end}
{synopt:{cmd:e(df_m)}}model degrees of freedom{p_end}
{synopt:{cmd:e(chi2)}}chi-squared{p_end}
{synopt:{cmd:e(p)}}{it:p}-value for model test{p_end}
{synopt:{cmd:e(ll)}}log likelihood{p_end}
{synopt:{cmd:e(ll_c)}}log likelihood, comparison model{p_end}
{synopt:{cmd:e(lrt_c)}}likelihood-ratio test, comparison test{p_end}
{synopt:{cmd:e(df_c)}}degrees of freedom, comparison test{p_end}
{synopt:{cmd:e(p_c)}}{it:p}-value for comparison test{p_end}
{synopt:{cmd:e(r2)}}overall coefficient of determination (R-squared){p_end}
{synopt:{cmd:e(D)}}overall deviance statistic{p_end}
{synopt:{cmd:e(p_D)}}{it:p}-value of the overall deviance statistic{p_end}
{synopt:{cmd:e(Q)}}Cochran {it:Q} test for heterogeneity ({cmd:two stage}){p_end}
{synopt:{cmd:e(Q_df)}}degrees of freedom of the {it:Q} test{p_end}
{synopt:{cmd:e(Q_p)}}{it:p}-value of the {it:Q} test{p_end}

{p2col 5 23 25 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:drmeta}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}
{synopt:{cmd:e(depvar)}}name of dependent variable{p_end}
{synopt:{cmd:e(idname)}}name of sets of contrasts{p_end}
{synopt:{cmd:e(id)}}values of the sets of contrasts{p_end}
{synopt:{cmd:e(predict)}}program used to implement {cmd:predict}{p_end}
{synopt:{cmd:e(se)}}name of standard errors of contrasts{p_end}
{synopt:{cmd:e(dm)}}names specified in {it:dose_vars}{p_end}
{synopt:{cmd:e(method)}}{cmd:ml} or {cmd:reml}{p_end}
{synopt:{cmd:e(mtype)}}{cmd:fixed} or {cmd:random}{p_end}
{synopt:{cmd:e(properties)}}{cmd:b V}{p_end}
{synopt:{cmd:e(proc)}}{cmd:one stage} or {cmd:two stage}{p_end}

{p2col 5 23 25 2: Matrices}{p_end}
{synopt:{cmd:e(b)}}coefficient vector of fixed effects{p_end}
{synopt:{cmd:e(V)}}variance-covariance matrix of fixed effects{p_end}
{synopt:{cmd:e(Psi)}}variance-covariance matrix of random effects{p_end}
{synopt:{cmd:e(PsiC)}}correlation matrix of random effects{p_end}
{synopt:{cmd:e(Sigma)}}variance-covariance matrices of all sets of contrasts{p_end}
{synopt:{cmd:e(bs}{it:#}{cmd:)}}coefficient vector for the {it:#} set of contrasts (GLS) in
{cmd:e(id)}{p_end}
{synopt:{cmd:e(vs}{it:#}{cmd:)}}variance-covariance matrix for the {it:#} set of contrasts
(GLS) in {cmd:e(id)}{p_end}
{synopt:{cmd:e(X}{it:#}{cmd:)}}design matrix used for the {it:#} set of contrasts in
{cmd:e(id)}{p_end}
{synopt:{cmd:e(Sigma}{it:#}{cmd:)}}variance-covariance matrix for the {it:#} set of contrasts
in {cmd:e(id)}{p_end}
{synopt:{cmd:e(blup}{it:#}{cmd:)}}predicted random effects (best linear unbiased
prediction) for the {it:#} set of contrasts in {cmd:e(id)}{p_end}
{synopt:{cmd:e(xbu}{it:#}{cmd:)}}coefficient vector (fixed plus best linear unbiased
prediction) for the {it:#} set of contrasts in {cmd:e(id)}{p_end}

{p2col 5 23 25 2: Functions}{p_end}
{synopt:{cmd:e(sample)}}marks estimation sample{p_end}
{p2colreset}{...}


{title:Support}

{p 4 8 2}
{browse "http://www.stats4life.se"}{p_end}
{p 4 8 2}
{browse "mailto:nicola.orsini@ki.se?subject=drmeta":nicola.orsini@ki.se}{p_end}


{title:References}

{p 4 8 2}
Crippa, A., and N. Orsini. 2016.
Dose-response meta-analysis of differences in means.
{it:BMC Medical Research Methodology} 16: 91.
{browse "https://doi.org/10.1186/s12874-016-0189-0"}.{p_end}

{p 4 8 2}
Greenland, S., and M. P. Longnecker. 1992.
Methods for trend estimation from summarized dose-response data, with
applications to meta-analysis.
{it:American Journal of Epidemiology} 135: 1301-1309.
{browse "https://doi.org/10.1093/oxfordjournals.aje.a116237"}.{p_end}

{p 4 8 2}
Hamling, J., P. Lee, R. Weitkunat, M. Amb{c u:}hl. 2008.
Facilitating meta-analyses by deriving relative effect and precision estimates
for alternative comparisons from a set of estimates presented by exposure
level or disease category.
{it:Statistics in Medicine} 27: 954-970.
{browse "https://doi.org/10.1002/sim.3013"}.{p_end}

{p 4 8 2}
Orsini, N., R. Bellocco, and S. Greenland. 2006.
Generalized least squares for trend estimation of summarized dose-response
data.  {it:Stata Journal} 6: 40-57.
{browse "https://doi.org/10.1177/1536867X0600600103"}.{p_end}

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
Help:  {helpb drmeta_gof}, {helpb drmeta_graph}, {helpb glst},
{helpb drmeta_predict:predict} (if installed){p_end}
