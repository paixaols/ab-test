# ---------------------------------------------------------------------------- #
# Imports
# ---------------------------------------------------------------------------- #
library(dplyr)

# ---------------------------------------------------------------------------- #
# Parâmetros do experimento
# ---------------------------------------------------------------------------- #
confidence_level <- 0.95
alpha <- 1-confidence_level
power <- 0.8

c <- 'ESP'

# ---------------------------------------------------------------------------- #
# Design do experimento
# ---------------------------------------------------------------------------- #
# Métricas
df <- read.csv('./data/raw/ab_testing.csv') %>%
  filter(country==c)
sprintf('Número de linhas: %d', nrow(df))

control <- filter(df, group=='GRP B') %>%
  select(purchases) %>%
  unlist
treatment <- filter(df, group=='GRP A') %>%
  select(purchases) %>%
  unlist

control_mean <- mean(control)
treat_mean <- mean(treatment)
control_sd <- sd(control)
treat_sd <- sd(treatment)

# Tamanho do efeito: Cohen d
sigma <- sqrt((control_sd^2 + treat_sd^2) / 2)
effect_size <- (control_mean - treat_mean)/sigma
effect_size

# Tamanho da amostra
za <- qnorm(1-alpha/2)
zb <- qnorm(1-power)
sample_size <- ((za-zb)/effect_size)^2 %>% ceiling
sample_size# Tamanho de cada grupo
2*sample_size# Tamanho total de ambos os grupos

# ---------------------------------------------------------------------------- #
# Hipóteses
# ---------------------------------------------------------------------------- #
# H0: os grupos médias de vendas iguais
# H1: os grupos médias de vendas diferentes

# ---------------------------------------------------------------------------- #
# Teste
# ---------------------------------------------------------------------------- #
# Amostragem
set.seed(73)
control_sample <- filter(df, group=='GRP B') %>%
  sample_n(size=sample_size, replace=FALSE) %>%
  select(purchases) %>% unlist
treat_sample <- filter(df, group=='GRP A') %>%
  sample_n(size=sample_size, replace=FALSE) %>%
  select(purchases) %>% unlist

# Teste (Wilcoxon/Mann-Whitney)
testWilcox <- wilcox.test(control_sample,
                          treat_sample,
                          correct = FALSE,
                          alternative=c('two.sided'))
pvalue <- testWilcox[3]

# ---------------------------------------------------------------------------- #
# Conclusão
# ---------------------------------------------------------------------------- #
sprintf('p-valor: %f', pvalue)
if(pvalue <= 0.05){
  sprintf('Rejeitar hipótese nula.')
}else{
  sprintf('Falha em rejeitar hipótese nula.')
}
