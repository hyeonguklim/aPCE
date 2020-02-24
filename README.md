# Arbitrary polynomial chaos expansion (aPCE)

![](https://github.com/hyeonguklim/aPCE/blob/master/figures/scheme.png)  
**Fig**: A schematic of using arbitrary polynomial chaos expansion (aPCE)

## Authors/Collaborators
[HyeongUk Lim](https://hyeonguk.wordpress.com) and [Lance Manuel](https://lancemanuel.netlify.com)

## Description
In complex stochastic high-dimensional reliability studies, polynomial chaos expansion (PCE) has been widely used to build surrogate models in lieu of prohibitively expensive Monte Carlo simulation (MCS). PCE relies on parametric distributions for associated variables and appropriate basis functions. However, incomplete or imperfect information on the stochastic variables can limit its use; accepted parametric forms for variable distributions, for instance, may not be justified when variables display multimodal character or mixed discrete-continuous support, which can make probabilistic mapping or transformation to independent variables needed for PCE cumbersome. Nonlinearities in such transformations can affect the accuracy of PCE surrogate models and lead to slower convergence relative to "truth" system computations of desired QoIs (quantities of interest). To address these challenges, we compute raw moments of underlying random input variables for Gram-Schmidt orthogonalization in developing surrogate models. Using illustrative examples, we show this approach as an efficient and accurate surrogate model-building alternative to traditional PCE.

## Related Publications/Presentations
- Lim, H and Manuel, L, Distribution-Free Polynomial Chaos Expansion Surrogate Models for Efficient Structural Reliability Analysis, *Engineering Mechanics Institute Conference*, Pasadena, CA, June 18-21, 2019. [[presentation](https://hyeonguk.files.wordpress.com/2019/07/emi19_presentation.pdf)]
- Lim, H and Manuel, L, Non-Parametric Surrogate Models for Uncertainty Quantification in Structural Vibration, *Korea Institute of Civil Engineering and Building Technology*, Ilsan, South Korea, Dec 18, 2018.

## Codes
### examples
This folder contains examples of using aPCE
- [Ishigami function](https://www.sfu.ca/~ssurjano/ishigami.html): `aPCE_Ishigami.m`

### subfunctions
This folder contains the subfunctions needed for running aPCE

#### Brief descriptions of subfunctions:
- `aPCE.m`: builds an aPCE model 
- `aPCE_coef.m`: calculates the coefficients of a polynomial function by the Gram-Schmidt orthogonalization
- `ishigami.m`: Ishigami function evaluation
- `multi_index.m`: gives multi-indices needed for multi-variate polynomial functions

## How to Start
1. Clone this repository to your directory
2. Run `aPCE_Ishigami.m` in MATLAB
3. You can change parameters, e.g, a polynomial order (`p`)

## Sample Figures
![](https://github.com/hyeonguklim/aPCE/blob/master/figures/exceedance_plot.png)  
**Fig**: Exceedance probability estimation by aPCE for the Ishigami function

Ten sets of order-8 aPCE surrogate models estimate exceedance probabilities well when compared with ten sets of Monte Carlo simulations in the Ishigami function.

## Contact
For any questions or comments, please email me at: hyeonguklim@gmail.com.
