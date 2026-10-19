# ==========================================
# CSE5014 - Business Analytics
# Energy Efficiency Data Analysis
# ==========================================

# Import dataset
EED <- read.csv("EED.csv")

# Display first rows
head(EED)

# Dataset dimensions
dim(EED)

# Dataset structure
str(EED)

# Missing-value check
colSums(is.na(EED))

# Duplicate-row check
sum(duplicated(EED))

# Orientation categories and frequencies
table(EED$Orientation)



# ==========================================
# DATA PREPARATION AND INITIAL EXPLORATION
# ==========================================

# Check for duplicate rows
sum(duplicated(EED))

# Generate descriptive statistical summary
summary(EED)

# Check the unique values of Orientation
unique(EED$Orientation)

# Count observations for each Orientation
table(EED$Orientation)



# ==========================================
# TASK 3 - CENTRAL TENDENCY ANALYSIS
# ==========================================

# Function to calculate mode
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Cooling Load
mean(EED$Cooling_Load)
median(EED$Cooling_Load)
get_mode(EED$Cooling_Load)

# Surface Area
mean(EED$Surface_Area)
median(EED$Surface_Area)
get_mode(EED$Surface_Area)

# Wall Area
mean(EED$Wall_Area)
median(EED$Wall_Area)
get_mode(EED$Wall_Area)

# Roof Area
mean(EED$Roof_Area)
median(EED$Roof_Area)
get_mode(EED$Roof_Area)




# Standard deviations

sd(EED$Cooling_Load)
sd(EED$Surface_Area)
sd(EED$Wall_Area)
sd(EED$Roof_Area)



# Central tendency summary table

central_tendency <- data.frame(
  Variable = c(
    "Cooling Load",
    "Surface Area",
    "Wall Area",
    "Roof Area"
  ),
  
  Mean = c(
    mean(EED$Cooling_Load),
    mean(EED$Surface_Area),
    mean(EED$Wall_Area),
    mean(EED$Roof_Area)
  ),
  
  Median = c(
    median(EED$Cooling_Load),
    median(EED$Surface_Area),
    median(EED$Wall_Area),
    median(EED$Roof_Area)
  ),
  
  Mode = c(
    get_mode(EED$Cooling_Load),
    get_mode(EED$Surface_Area),
    get_mode(EED$Wall_Area),
    get_mode(EED$Roof_Area)
  ),
  
  Standard_Deviation = c(
    sd(EED$Cooling_Load),
    sd(EED$Surface_Area),
    sd(EED$Wall_Area),
    sd(EED$Roof_Area)
  )
)

central_tendency




# ==========================================
# TASK 3 - BELL CURVE: COOLING LOAD
# ==========================================

# Calculate mean and standard deviation
cooling_mean <- mean(EED$Cooling_Load)
cooling_sd <- sd(EED$Cooling_Load)

# Create histogram
hist(
  EED$Cooling_Load,
  probability = TRUE,
  main = "Distribution of Cooling Load",
  xlab = "Cooling Load",
  ylab = "Density"
)

# Add normal distribution curve
curve(
  dnorm(x, mean = cooling_mean, sd = cooling_sd),
  add = TRUE,
  lwd = 2
)



# ==========================================
# TASK 3 - BELL CURVE: SURFACE AREA
# ==========================================

surface_mean <- mean(EED$Surface_Area)
surface_sd <- sd(EED$Surface_Area)

hist(
  EED$Surface_Area,
  probability = TRUE,
  main = "Distribution of Surface Area",
  xlab = "Surface Area",
  ylab = "Density"
)

curve(
  dnorm(x, mean = surface_mean, sd = surface_sd),
  add = TRUE,
  lwd = 2
)



# ==========================================
# TASK 3 - BELL CURVE: WALL AREA
# ==========================================

wall_mean <- mean(EED$Wall_Area)
wall_sd <- sd(EED$Wall_Area)

hist(
  EED$Wall_Area,
  probability = TRUE,
  main = "Distribution of Wall Area",
  xlab = "Wall Area",
  ylab = "Density"
)

curve(
  dnorm(x, mean = wall_mean, sd = wall_sd),
  add = TRUE,
  lwd = 2
)



# ==========================================
# TASK 3 - BELL CURVE: ROOF AREA
# ==========================================

roof_mean <- mean(EED$Roof_Area)
roof_sd <- sd(EED$Roof_Area)

hist(
  EED$Roof_Area,
  probability = TRUE,
  main = "Distribution of Roof Area",
  xlab = "Roof Area",
  ylab = "Density"
)

curve(
  dnorm(x, mean = roof_mean, sd = roof_sd),
  add = TRUE,
  lwd = 2
)





# ==========================================
# TASK 3 - SKEWNESS CHECK
# ==========================================

# Install package if necessary
#install.packages("moments")

# Load package
library(moments)

# Calculate skewness
skewness(EED$Cooling_Load)
skewness(EED$Surface_Area)
skewness(EED$Wall_Area)
skewness(EED$Roof_Area)


# ==========================================
# TASK 3 - SKEWNESS ANALYSIS
# ==========================================

library(moments)

cooling_skewness <- skewness(EED$Cooling_Load)
surface_skewness <- skewness(EED$Surface_Area)
wall_skewness <- skewness(EED$Wall_Area)
roof_skewness <- skewness(EED$Roof_Area)

cat("Cooling Load skewness:", cooling_skewness, "\n")
cat("Surface Area skewness:", surface_skewness, "\n")
cat("Wall Area skewness:", wall_skewness, "\n")
cat("Roof Area skewness:", roof_skewness, "\n")








# ==========================================
# NORMALITY TESTING
# ==========================================

# Shapiro-Wilk normality tests

shapiro_cooling <- shapiro.test(EED$Cooling_Load)
shapiro_surface <- shapiro.test(EED$Surface_Area)
shapiro_wall <- shapiro.test(EED$Wall_Area)
shapiro_roof <- shapiro.test(EED$Roof_Area)

shapiro_cooling
shapiro_surface
shapiro_wall
shapiro_roof


shapiro.test(EED$Cooling_Load)

shapiro.test(EED$Surface_Area)

shapiro.test(EED$Wall_Area)

shapiro.test(EED$Roof_Area)







# ==========================================
# TASK 4 - ORIENTATION VS COOLING LOAD
# ==========================================

# Mean Cooling Load for each orientation
aggregate(
  Cooling_Load ~ Orientation,
  data = EED,
  FUN = mean
)


# Median Cooling Load for each orientation
aggregate(
  Cooling_Load ~ Orientation,
  data = EED,
  FUN = median
)


# Standard deviation for each orientation
aggregate(
  Cooling_Load ~ Orientation,
  data = EED,
  FUN = sd
)


# Descriptive statistics by orientation

orientation_summary <- data.frame(
  Orientation = unique(EED$Orientation)
)

orientation_summary$Mean <- aggregate(
  Cooling_Load ~ Orientation,
  data = EED,
  FUN = mean
)$Cooling_Load

orientation_summary$Median <- aggregate(
  Cooling_Load ~ Orientation,
  data = EED,
  FUN = median
)$Cooling_Load

orientation_summary$SD <- aggregate(
  Cooling_Load ~ Orientation,
  data = EED,
  FUN = sd
)$Cooling_Load

orientation_summary$N <- as.numeric(
  table(EED$Orientation)
)

orientation_summary






# ==========================================
# TASK 4 - BOX PLOT
# ==========================================

boxplot(
  Cooling_Load ~ Orientation,
  data = EED,
  main = "Cooling Load by Building Orientation",
  xlab = "Building Orientation",
  ylab = "Cooling Load"
)



# ==========================================
# TASK 4 - ONE-WAY ANOVA
# ==========================================

orientation_model <- aov(
  Cooling_Load ~ Orientation,
  data = EED
)

summary(orientation_model)


orientation_residuals <- residuals(orientation_model)

shapiro.test(orientation_residuals)


# Check equality of variances
bartlett.test(Cooling_Load ~ Orientation, data = EED)


# Extract ANOVA residuals
orientation_residuals <- residuals(orientation_model)

# Shapiro-Wilk test for residual normality
shapiro.test(orientation_residuals)


par(mfrow = c(1, 2))

plot(
  orientation_model,
  which = 1
)

plot(
  orientation_model,
  which = 2
)

par(mfrow = c(1, 1))




#Task 5#

#create the graphical analysis - directly on console
plot(
  EED$Surface_Area,
  EED$Cooling_Load,
  main = "Cooling Load vs Surface Area",
  xlab = "Surface Area",
  ylab = "Cooling Load",
  pch = 19
)

abline(
  lm(Cooling_Load ~ Surface_Area, data = EED),
  lwd = 2
)


#Cooling Load vs Wall Area - directly on console
cor.test(
  EED$Cooling_Load,
  EED$Wall_Area,
  method = "spearman",
  exact = FALSE
)



#Cooling Load vs Roof Area
cor.test(
  EED$Cooling_Load,
  EED$Roof_Area,
  method = "spearman",
  exact = FALSE
)




#Surface Area
plot(
  EED$Surface_Area,
  EED$Cooling_Load,
  main = "Cooling Load vs Surface Area",
  xlab = "Surface Area",
  ylab = "Cooling Load",
  pch = 19
)

abline(
  lm(Cooling_Load ~ Surface_Area, data = EED),
  lwd = 2
)


#wall area
plot(
  EED$Wall_Area,
  EED$Cooling_Load,
  main = "Cooling Load vs Wall Area",
  xlab = "Wall Area",
  ylab = "Cooling Load",
  pch = 19
)

abline(
  lm(Cooling_Load ~ Wall_Area, data = EED),
  lwd = 2
)



#Roof area
plot(
  EED$Roof_Area,
  EED$Cooling_Load,
  main = "Cooling Load vs Roof Area",
  xlab = "Roof Area",
  ylab = "Cooling Load",
  pch = 19
)

abline(
  lm(Cooling_Load ~ Roof_Area, data = EED),
  lwd = 2
)








# ==========================================
# TASK 6 - SIMPLE LINEAR REGRESSION
# Cooling Load vs Roof Area
# ==========================================

roof_model <- lm(
  Cooling_Load ~ Roof_Area,
  data = EED
)

summary(roof_model)







# ==========================================
# TASK 6 - REGRESSION DIAGNOSTICS
# ==========================================

par(mfrow = c(2, 2))

plot(roof_model)

par(mfrow = c(1, 1))



#Normality of residuals
shapiro.test(residuals(roof_model))

#Constant variance / homoscedasticity
install.packages("lmtest")
library(lmtest)

bptest(roof_model)


#Check influential observations
# Cook's distance
max(cooks.distance(roof_model))

# Number of potentially influential observations
sum(cooks.distance(roof_model) > 4 / nrow(EED))




# ==========================================
# TASK 6.3 - PREDICTOR CORRELATION
# ==========================================

numeric_predictors <- EED[, c(
  "Relative_Compactness",
  "Surface_Area",
  "Wall_Area",
  "Roof_Area",
  "Overall_Height",
  "Glazing_Area",
  "Glazing_Area_Distribution"
)]

cor(numeric_predictors, method = "spearman")


#Normality of residuals
shapiro.test(residuals(model_rw))


#Homogeneity of variance
bptest(model_rw)

#Influential observations
max(cooks.distance(model_rw))

sum(cooks.distance(model_rw) > 4 / nrow(EED))


#Regression diagnostic plots
par(mfrow = c(2, 2))
plot(model_rw)
par(mfrow = c(1, 1))


#
install.packages("sandwich")
library(sandwich)


#
library(lmtest)

coeftest(
  model_rw,
  vcov = vcovHC(model_rw, type = "HC3")
)


#
library(lmtest)
library(sandwich)

coeftest(
  model_rw,
  vcov = vcovHC(model_rw, type = "HC3")
)


