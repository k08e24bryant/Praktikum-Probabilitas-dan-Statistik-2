# Jalankan baris ini satu kali jika library belum terinstal
# install.packages("BSDA")

# Muat library BSDA
library(BSDA)

# A. Definisikan Hipotesis
# H0: Rata-rata Bandung = Rata-rata Bali (tidak ada perbedaan)
# H1: Rata-rata Bandung != Rata-rata Bali (ada perbedaan)

# Lakukan uji-t dari data ringkasan
hasil_uji <- tsum.test(
  mean.x = 3.64,      # Rata-rata sampel Bandung
  s.x = 1.67,         # Standar deviasi sampel Bandung
  n.x = 20,           # Jumlah sampel Bandung
  mean.y = 2.79,      # Rata-rata sampel Bali
  s.y = 1.5,          # Standar deviasi sampel Bali
  n.y = 27,           # Jumlah sampel Bali
  alternative = "two.sided", # Uji dua sisi untuk melihat perbedaan
  var.equal = TRUE,          # Asumsi varians sama
  conf.level = 0.95          # Tingkat kepercayaan (1 - alpha)
)

# Tampilkan hasil uji
print(hasil_uji)