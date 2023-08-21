library(ggplot2)
library(RColorBrewer)
# visualize results of proportion script

# read in result from proportion python script
df <- read.csv("zerolength-proportion-amplicons.csv")
df$Tree <- factor(df$Tree, levels = unique(df$Tree))

# Choose color pallete
num_colors <- length(unique(df$lineage))
color_palette <- brewer.pal(num_colors, "Accent")

# Bar plot of props
ggplot(df, aes(x = Tree, y = zero_prop, fill = lineage)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = color_palette) +
  labs(title = "Proportion of tree with zero branch lengths (polytomies)",
       x = "Tree", y = "Proportion") +
  theme_minimal()
