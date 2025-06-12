# 1. Definisikan parameter berdasarkan informasi soal
sample_mean <- 23500      # Rata-rata sampel
mu_hypothesized <- 25000   # Rata-rata yang diklaim (Hipotesis Nol)
sample_sd <- 3000          # Standar deviasi sampel
n <- 100                   # Jumlah sampel

# 2. Hitung Standard Error (SE)
# Standard error adalah standar deviasi dari distribusi sampling mean.
standard_error <- sample_sd / sqrt(n)

# 3. Hitung statistik Z (Z-score)
# Mengukur seberapa jauh rata-rata sampel dari rata-rata hipotesis.
z_statistic <- (sample_mean - mu_hypothesized) / standard_error

# 4. Hitung p-value
# Kita mencari P(Z > z_statistic) karena klaimnya adalah "lebih dari" (greater).
# Argumen `lower.tail = FALSE` secara langsung menghitung area di sebelah kanan kurva.
p_value <- pnorm(z_statistic, lower.tail = FALSE)

# --- Tampilkan Hasil Perhitungan ---
print(paste("Nilai Z-statistik:", z_statistic))
print(paste("Nilai P-value:", p_value))