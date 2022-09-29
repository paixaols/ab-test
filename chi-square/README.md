# A/B Test

Chi square test

# 1. Business Problem

The analysis presented here assumes the following hypotetical scenario, the UX team of an e-commerce developed a new sales page. Before releasing the new page to all customers it is important to validate the new page, in order to avoid decrease in sales convertion. A small subset of customers were divided in two groups, control and treatment groups, each group experienced one of the pages. The aim here is to statistically distinguish the performance of the pages.

# 2. Solution Strategy

**Step 01. Experiment design:** plan the experiment including the evaluation of the sample size needed to perform the test.

**Step 02. Data collection and preparation:** collect data and verify the homogeneity of the control and treatment groups.

**Step 03. Hypothesis test:** use the appropriate statistical inference method to test the hypothesis.

# 3. Experiment design

First, it is important to formulate the hypotheses to be tested (the null and the altervative hypothesis). Given the hypotheses, it is possible to chose the best variables to perform the test and how to collect the data. In the present case, the hypotheses are:

 - Null hypotheses: the control and treatment groups present the same convertion rate.

 - Alternative hypothesis: the convertion rates are different.

The data can be consolidated in a contingency table, counting the number of convertions in each of the two groups. Therefore, the inference test used was the chi-square test. The test is inplemented in the scipy library, in the function [scipy.stats.chi2_contingency](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.chi2_contingency.html).

The parameters of the test were chosen to their standard levels: confidence level of 95%, and statistical power of 80%.
Before performing the test, it is important to evaluate the sample size needed to test the hypothesis with statistical significance. When doing so, Cohen's h metric was used to measure the effect size, then statsmodel's [NormalIndPower.solve_power](https://www.statsmodels.org/dev/generated/statsmodels.stats.power.NormalIndPower.solve_power.html#statsmodels.stats.power.NormalIndPower.solve_power) retrieves the sample size. This sample size is the minimum size of each group necessary to conclude de test with statistica significance.

# 4. Data collection and preparation

The dataset obtained from kaggle is available in [this link](https://www.kaggle.com/datasets/zhangluyuan/ab-testing). In the dataset, a small number of users appear both in the control and treatment groups. Those users were excluded, resulting in the exclusion of 2% of the dataset. After exclusin the dataset is still larger than the sample size evaluated as described above.

# 5. Hypothesis test

The chi square test retrieves a p value = 0.87, which is larger than the significance level considered of 0.05. Therefore it is not possible to reject the null hypothesis. In other words, there is not enough evidence to say that the pages present a statistically significant difference in their convertion rates.

# 6. Conclusion

To recall the business problem, the objective is to identify wich of two webpages present higher conversion rate. Given the nature of the dataset, categorical data (the page converted or not), chi square is an appropriate statistical test. Considering the significance level adopted, the observed difference in conversion rates is not statistically significant.
