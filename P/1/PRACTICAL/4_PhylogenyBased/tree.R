#!/usr/bin/env Rscript

# Usage: Rscript tree.R tree.txt [output.png]

args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 1) {
  stop("Usage: Rscript tree.R <tree_file.txt> [output.png]")
}

input_file <- args[1]
output_file <- ifelse(length(args) >= 2, args[2], "tree.png")

# Load required package
if (!requireNamespace("ape", quietly = TRUE)) {
  stop("Package 'ape' is required. Install with install.packages('ape')")
}
library(ape)

# Read tree text
tree_text <- paste(readLines(input_file, warn = FALSE), collapse = "")

# Parse Newick
tree <- read.tree(text = tree_text)

# Save PNG
png(filename = output_file, width = 1200, height = 1200, res = 150)
plot(tree, cex = 0.6)
title("Phylogenetic tree")
dev.off()

cat("Tree saved to:", output_file, "\n")