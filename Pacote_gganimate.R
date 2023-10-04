################# Box Plot com pacote gganimate  ##############################

# Carregando pacotes ------------------------------------------------------

library(tidyverse)
library(gganimate)
library(readr)

# Importando dados --------------------------------------------------------

dados_gganimate <- read.delim("dados_gganimate.csv", header = TRUE, sep = " ")

# Construindo a visualização ----------------------------------------------

(ani <-dados_gganimate %>%
    ggplot( aes(x=raca, y= peso, fill=raca)) +
    geom_boxplot() +
    scale_fill_viridis(discrete = TRUE, alpha=0.6) +
    geom_jitter(color="black", size=0.4, alpha=0.9) +
    labs(title = "Pacote gganimate",
         x= "Raça",
         y= "Peso",
         caption = "Jennifer Lopes") +
    theme_minimal() +
    transition_states(
      fumante,
      transition_length = 2,
      state_length = 1
    ) +
    enter_fade() + 
    exit_shrink() +
    ease_aes('sine-in-out'))

# Exportando a visualização -----------------------------------------------

anim_save("ani.gif", ani)