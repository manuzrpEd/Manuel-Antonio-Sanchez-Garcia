# Modeling Life-Cycle Earnings Risk with Positive and Negative Shocks

Attached the replication files for the paper 'Modeling Life-Cycle Earnings Risk with Positive and Negative Shocks' which is joint work with Felix Wellschmied.

Abstract: We estimate explicit age-varying distributions of idiosyncratic persistent and transitory earnings shocks over workers' life-cycles using a German administrative data set. Large positive shocks, both transitory and persistent, are characteristic for the first eight years of the working life. After the age of 50, large negative shocks become a major source of earnings risk. Between the ages of 30 and 50, most shocks are small and transitory. Large persistent positive shocks that occur early in the working life help to rationalize large wealth and consumption shares of the top one percent in an incomplete markets model.

All run times for the codes are using an Intel i4 processor.

Stata:

1) Cleaning_extrapolated.do (requires SIAB data)
Reads in the raw data, selects the sample, and imputes topcoded earnings.
It also generates the residual log earnings series used for the graphs after unemployment and job-to-job transition. The run time is approximately 4 hours.

2) Regression_dropG3_extrapolated_age.do (requires SIAB data)
Runs the regression of earnings growth and exports the residuals. The run time is approximately 4 hours.

3) Hump_extrapolated.do (requires SIAB data)
Generate the variance of log earnings over the life-cycle as in Deaton and Paxson.
It also generates the covariances of log earnings used for the estimation of the Macro model. The run time is approximately 4 hours.

4) Hump_LogEarnings_SE_extrapolated.do (requires SIAB)
Generates statistics of log earnings by age for the graphs in Section 5 and stores the log earnings to compute confidence intervals by bootstrapping. The run time is approximately 5 minutes.

5) ComputeWealth_Manu.do (requires EHFCS data)
Computes wealth and earnings statistics from the survey data. The run time is approximately 30 seconds.

Matlab:
Observations: several routines call mex files that were created by an Intel compiler. We provide both the mex files and the .f90 source code.


1) load_residuals_drop_extrapolated.m (requires SIAB data) 
Loads residuals by cohorts and computes the moments to be used for the estimation. The run time is approximately 30 minutes.
It prints to an Excel file the moments used for estimation of the Baseline specification and the AR1 Macro model.
These moments can also be found at Felix Wellschmied's website: http://www.eco.uc3m.es/~fwellsch/index.html We also include these here in .mat files.

2) moments_bootstrap.m 
Obtains the confidence intervals of the moments of earnings growth. The run time is approximately 150 hours.

3) moments_bootstrap_2ndcovar.m 
Obtains and graphs the confidence intervals of the 2nd covariance of the moments. The run time is approximately 150 hours.

4) moments_bootstrap_graph.m 
Graphs the confidence intervals of most of the moments. The run time is approximately 1 minute.

5) moments_bootstrap_ineq.m 
Obtains the confidence intervals of the variance of log earnings. The run time is approximately 100 hours.

6) moments_bootstrap_graph_ineq.m 
Graphs the confidence intervals of the variance of log earnings. The run time is approximately 20 seconds.

7) estimation_simplified_2covar.m 
Estimates the model in column 1 of Table 1.
simulation_simplified_2covar.m simulates the estimated model and stores the estimates. The run time is approximately 30 minutes.

8) estimation_simplified_2covar_noagevar.m 
Estimates the model in column 2 of Table 1.
simulation_simplified_2covar_noagevar.m simulates the estimated model and stores the estimates. The run time is approximately 20 minutes.

9) estimation_simplified_notrans.m 
Estimates the model in column 3 of Table 1.
simulation_simplified_notrans.m simulates the estimated model and stores the estimates. The run time is approximately 30 minutes.

10) AR1_Micro_inv.m 
Estimates the Micro model from the data and stores the estimates. The estimates are reported in column 5 of Table 1. The run time is approximately 10 seconds.

11) AR1_Macro_agevar_covlevel_inv_data_10ACV.m 
Estimates the Macro model from the data and stores the estimates. The estimates are reported in column 4 of Table 1. The run time is approximately 10 seconds.

12) SE_bootstrap_simplified.m 
Obtains standard errors for the estimates of the Baseline specification reported in Table A4. The run time is approximately 100 hours.

13) Determ_extrapolated.do 
Computes log earnings deterministic life-cycle profiles as in Deaton and Paxson to be used in the Structural Model of section 5. The run time is approximately 5 minutes.

14) main_model.m 
Runs the main structural model of our Baseline specification. Stores the model output.
Uses simulation.m and simulation_insurance.m to simulate the model. The latter is used for computing the Insurance Coefficients. The run time is approximately 4 hours.

15) AR1_Macro_agevar_covlevel_inv_10ACV.m
Estimates the coefficients of the Macro model from our Baseline model and stores the estimates. The estimates are to be used in Section 5. The run time is approximately 30 seconds.

16) main_ar1_covariances_inv.m 
Runs the main structural model of the Macro AR1 model. It stores the model output and graphs the model output against the data and against the Baseline model. The run time is approximately 20 minutes.

17) Insur_coeff_beta_MacroCovar_inv.m 
Computes the Insurance Coefficients for both the Macro and Baseline model and graphs them. The run time is approximately 20 seconds.

18) Welfare.m
Plots Figure 8. The run time is approximately 10 seconds.

