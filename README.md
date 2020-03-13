# Arbitrary polynomial chaos expansion (aPCE)
## Summary
![](https://github.com/hyeonguklim/aPCE/blob/master/figures/scheme.png)  
**Fig**: A schematic of using arbitrary polynomial chaos expansion (aPCE)

## Authors/Collaborators
[HyeongUk Lim](https://hyeonguk.wordpress.com) and [Lance Manuel](https://lancemanuel.netlify.com)

## Description
We investigate the data-driven surrogate modeling aided by polynomial chaos expansion (PCE) and apply it for the prediction of desired quantities of interest (QoIs) in engineering problems. PCE has gained popularity due to accuracy and efficiency in accounting for uncertainty in complex problems. However, unreliable information on stochastic variables in a given system can limit its use. Accepted parametric forms for the stochastic variables, for instance, may not be the best use for PCE. A probabilistic transformation, needed for PCE, to independent variables from the original ones can be nonlinear and, thus, can lead to inaccuracy in computations of desired QoIs. We, instead of using the parametric polynomial family, make use of raw moments of underlying stochastic variables to develop PCE-based surrogate models and, subsequently, to predict QoIs. We demonstrate this approach in various numerical examples including the prediction of accumulated fatigue damage in an offshore structure due to complex vibration phenomena.

[see slides](https://github.com/hyeonguklim/aPCE/blob/master/description/slides_aPCE.pdf)

## Related Publications/Presentations
- Lim, H and Manuel, L, Distribution-Free Polynomial Chaos Expansion Surrogate Models for Efficient Structural Reliability Analysis, *Engineering Mechanics Institute Conference*, Pasadena, CA, June 18-21, 2019. [[presentation](https://hyeonguk.files.wordpress.com/2019/07/emi19_presentation.pdf)]
- Lim, H and Manuel, L, Non-Parametric Surrogate Models for Uncertainty Quantification in Structural Vibration, *Korea Institute of Civil Engineering and Building Technology*, Ilsan, South Korea, Dec 18, 2018. [[presentation](https://hyeonguk.files.wordpress.com/2020/02/hyeonguk-lim-kict.pdf)]

## Codes
### examples
This folder contains examples of using aPCE:
- [Ishigami function](https://www.sfu.ca/~ssurjano/ishigami.html): `aPCE_Ishigami.m`

### subfunctions
This folder contains the subfunctions needed for running aPCE:

- `aPCE.m`: builds an aPCE model 
- `aPCE_coef.m`: calculates the coefficients of a polynomial function by the Gram-Schmidt orthogonalization
- `ishigami.m`: Ishigami function evaluation
- `multi_index.m`: gives multi-indices needed for multi-variate polynomial functions

### other functions
- `load_path.m`: sets the path where subfunctions are located

## How to Run an Example
1. Clone this repository to your directory
2. Run `aPCE_Ishigami.m` in MATLAB
3. You can change parameters, e.g, a polynomial order (`p`)
4. You will get an exceedance probability plot

## Sample Figures
![](https://github.com/hyeonguklim/aPCE/blob/master/figures/exceedance_plot.png)  
**Fig**: Exceedance probability estimation by aPCE for the Ishigami function

Ten sets of order-8 aPCE surrogate models estimate exceedance probabilities well when compared with ten sets of Monte Carlo simulations in the Ishigami function.

## Contact
For any questions or comments, please email me at: hyeonguklim@gmail.com.