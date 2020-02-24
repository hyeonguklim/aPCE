# Arbitrary polynomial chaos expansion (aPCE)

## Description
In complex stochastic high-dimensional reliability studies, polynomial chaos expansion (PCE) has been widely used to build surrogate models in lieu of prohibitively expensive Monte Carlo simulation (MCS). PCE relies on parametric distributions for associated variables and appropriate basis functions. However, incomplete or imperfect information on the stochastic variables can limit its use; accepted parametric forms for variable distributions, for instance, may not be justified when variables display multimodal character or mixed discrete-continuous support, which can make probabilistic mapping or transformation to independent variables needed for PCE cumbersome. Nonlinearities in such transformations can affect the accuracy of PCE surrogate models and lead to slower convergence relative to "truth" system computations of desired QoIs (quantities of interest). To address these challenges, we compute raw moments of underlying random input variables for Gram-Schmidt orthogonalization in developing surrogate models. Using illustrative examples, we show this approach as an efficient and accurate surrogate model-building alternative to traditional PCE.

## examples
This folder contains examples using aPCE: the Ishigami function.

## subfunctions
This folder contain the subfunctions needed for aPCE

### List:
- `aPCE.m`: 
- `aPCE_coef.m`:
- `ishigami.m`:
- `multi_index.m`: