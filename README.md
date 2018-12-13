# B3 -- Binomial Block Bootstrap estimator

This repository includes an implementation of the B3 estimator with various approximation techniques, example datasets and reproducible results from [1] and [2]. 
Below is a walk-through on the 
[Dota2](https://archive.ics.uci.edu/ml/datasets/Dota2+Games+Results), 
[Parkinson](https://archive.ics.uci.edu/ml/datasets/Parkinson+Speech+Dataset+with++Multiple+Types+of+Sound+Recordings), 
[Census Income](https://archive.ics.uci.edu/ml/datasets/adult), 
Synthetic, and 
[Heart Disease](https://archive.ics.uci.edu/ml/datasets/heart+Disease) datasets.

### Computing binomial matrix A and estimating vector b
In practice, the most computational expensive step is computing a finite sample approximation to vector b. 
This requires repeatedly repeatedly resampling the training dataset, training and validating the learner, and injecting additional leakage from the validation set.
Script `sample_real.m` performs this resampling procedure and saves the resulting estimates.

All required datasets are included in the `data/` folder.
We also include example results in `bootstraps/`.

### Solving for the solution vector e
Once the resampling procedure is complete, we turn to computing the solution vector e (of which, the first entry e_0 is our desired out-of-cluster loss).
The key choices here are using
* An appropriate form of regularization (monotonic constraint, and/or a trend filter)
* An approximation technique (basis function or sketching).

Note the basis function approximation serves as a natural form of regularization, and does not require additional regularizers.
The script `example_boxplot.m` reproduces the results in Figure 6.3a, demonstrating the B3 estimator outperforms baseline methods using various forms of approximation techniques.
Other results can be reproduced by using the appropriate bootstrap results in `bootstraps/`.

### References
[1] Barnes, M., & Dubrawski, A. (2017). The Binomial Block Bootstrap Estimator for Evaluating Loss on Dependent Clusters. UAI.

[2] Barnes, M., & Dubrawski, A. (2018). Dependency Leakage: Analysis and Scalable Estimators. https://arxiv.org/abs/1807.06713.
