# install.packages(c("ggplot2", "dplyr"))
library(ggplot2)
library(dplyr)

# 1. MEMBACA DATA
data <- read.csv("GTL.csv")

# Pastikan R mengenali 'Glass' dan 'Temp' sebagai variabel kategori (faktor)
data$Glass <- as.factor(data$Glass)
data$Temp <- as.factor(data$Temp)


# a. PLOT VISUALISASI DATA
# Tambahkan `print()` di awal untuk memastikan plot ditampilkan
print(
  ggplot(data, aes(x = Temp, y = Light, group = Glass, color = Glass)) +
    geom_line(stat = "summary", fun = "mean", size = 1) +
    geom_point(stat = "summary", fun = "mean", size = 3) +
    labs(
      title = "Plot Interaksi Pengaruh Temperatur dan Jenis Kaca",
      x = "Temperatur (Temp)",
      y = "Rata-rata Keluaran Cahaya (Light)",
      color = "Jenis Kaca (Glass)"
    ) +
    theme_minimal()
)


# b. UJI ANOVA DUA ARAH
# Membuat model ANOVA untuk menguji pengaruh Glass, Temp, dan interaksinya
model_anova <- aov(Light ~ Glass * Temp, data = data)

# Menampilkan tabel hasil ANOVA untuk diinterpretasikan
summary(model_anova)


# c. TABEL MEAN DAN STANDAR DEVIASI
# Menghitung statistik deskriptif untuk setiap kombinasi perlakuan
tabel_ringkasan <- data %>%
  group_by(Glass, Temp) %>%
  summarise(
    Mean_Light = mean(Light, na.rm = TRUE),
    Std_Dev_Light = sd(Light, na.rm = TRUE),
    .groups = 'drop'
  )

# Menampilkan tabel ringkasan
print(tabel_ringkasan)