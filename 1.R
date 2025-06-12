# 1. Masukkan data dari tabel
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

# a. Menghitung standar deviasi dari selisih data
selisih <- sesudah - sebelum
standar_deviasi <- sd(selisih)

# Menampilkan hasil standar deviasi
print(paste("a. Standar Deviasi dari selisih:", round(standar_deviasi, 2)))

# b. & c. Melakukan uji-t berpasangan untuk mendapatkan t-value, p-value, dan kesimpulan
# H0: tidak ada pengaruh yang signifikan (mean dari selisih = 0)
# Alpha = 5% atau 0.05
hasil_uji_t <- t.test(sesudah, sebelum, paired = TRUE, alternative = "two.sided")

# Menampilkan hasil uji
print("b & c. Hasil Uji T Berpasangan:")
print(hasil_uji_t)

