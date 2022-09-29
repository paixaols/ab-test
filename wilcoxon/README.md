# A/B Test

Wilcoxon test

# 1. Business Problem

The analysis presented here assumes the following hypotetical scenario, the developers of an e-commerce developed a new payment method. Before releasing the new feature to all customers it is important to validate it, in order to avoid decrease in sales. A small subset of customers were divided in two groups, control and treatment groups, each group experienced one of payment methods. The aim here is to statistically distinguish the performance of each method.

# 2. Solution Strategy

**Step 01. Experiment design:** plan the experiment including the evaluation of the sample size needed to perform the test.

**Step 02. Data collection and preparation:** collect data and verify the homogeneity of the control and treatment groups.

**Step 03. Hypothesis test:** use the appropriate statistical inference method to test the hypothesis.

# 3. Experiment design

First, it is important to formulate the hypotheses to be tested (the null and the altervative hypothesis). Given the hypotheses, it is possible to chose the best variables to perform the test and how to collect the data. In the present case, the hypotheses are:

 - Null hypotheses: the control and treatment groups present the same average number of purcheses.

 - Alternative hypothesis: the numbers of purchases are different.

The parameters of the test were chosen to their standard levels: confidence level of 95%, and statistical power of 80%.
Before performing the test, it is important to evaluate the sample size needed to test the hypothesis with statistical significance. When doing so, Cohen's d metric was used to measure the effect size.

# 4. Data collection and preparation

The sample size evaluated as described above is much larger than the dataset size. This implies the need to evaluate individual tests in each country. Aside from Spain, the subset of data from other counties are also smaller than the sample size needed. Besides, an exploratory data analysis reveals that only in Spain control and treatment groups possibly present a statistically significant difference in their purchases distributions.

# 5. Hypothesis test

Since the data is nonparametric, the test used was the Wilcoxon test. Performing the test on the data colected in Spain, the p value was 0.27, which is larger than the significance level of 0.05. Therefore it is not possible to reject the null hypothesis.

# 6. Conclusion

To recall the business problem, the objective is to identify wich of two payment methods of an e-commerce increases purchases. Given the data is nonparametric, Wilcoxon test is an appropriate statistical test. Considering the significance level adopted, the observed difference in purchases is not statistically significant.
