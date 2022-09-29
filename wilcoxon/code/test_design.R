library(dplyr)

# Definir parâmetros do teste
confidence_level <- 0.95
alpha <- 1-confidence_level
power <- 0.8

# Métricas
control_mean <- 4# Valores históricos
control_sd <- 3
treat_mean <- 4.5# Melhoria pretendida
treat_sd <- 3

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
