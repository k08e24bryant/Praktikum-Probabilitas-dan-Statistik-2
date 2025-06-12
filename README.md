# Praktikum-Probabilitas-dan-Statistik-2
Syarif Sanad-5025221257

# Analisis Statistik Menggunakan R

Berikut adalah rangkuman dari empat analisis statistik yang telah dilakukan menggunakan R, mencakup berbagai uji hipotesis dan visualisasi data.

---

## Analisis Soal 1: Pengaruh Aktivitas A terhadap Saturasi Oksigen

Penelitian ini bertujuan untuk mengetahui pengaruh aktivitas A terhadap kadar saturasi oksigen pada 9 responden. Data yang dianalisis adalah data berpasangan, yaitu kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas A.

### a. Mencari Standar Deviasi dari Selisih Data

Data saturasi oksigen sebelum dan sesudah aktivitas dimasukkan ke dalam R, kemudian dihitung selisihnya (Difference). Terakhir, standar deviasi dari selisih ini dihitung.

```R
# Menginputkan data dari tabel
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

# Menghitung selisih antara data sesudah dan sebelum
Difference <- sesudah - sebelum

# Menghitung standar deviasi dari selisih
StandarDeviasi <- sd(Difference)
paste("Standar Deviasi dari selisih =", StandarDeviasi)
```

**Hasil:**
Standar Deviasi dari selisih = 7.83864161943992

### b. Mencari Nilai t dan p-value

Untuk mendapatkan nilai t-statistik dan p-value, digunakan fungsi `t.test()` dengan argumen `paired = TRUE` karena data merupakan sampel berpasangan.

```R
# Melakukan uji-t berpasangan
hasil_uji_t <- t.test(sesudah, sebelum, paired = TRUE)

# Menampilkan hasil
print(hasil_uji_t)
```

**Hasil:**
* Nilai t = 6.8039
* Derajat kebebasan (df) = 8
* p-value = 0.0001373

### c. Menentukan Pengaruh Signifikan

Untuk menentukan apakah terdapat pengaruh yang signifikan, dilakukan uji hipotesis dengan tingkat signifikansi $\alpha = 5\%$.

* **H0:** Tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas A.
* **H1:** Terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas A.

**Pendekatan 1: Membandingkan p-value dengan Alpha ($\alpha$)**
* Tingkat Signifikansi ($\alpha$): 0.05
* p-value: 0.0001373

**Aturan Keputusan:** Jika p-value < $\alpha$, maka H0 ditolak.
Dalam kasus ini, $0.0001373 < 0.05$.
**Kesimpulan:** Karena p-value lebih kecil dari tingkat signifikansi, maka kita **menolak H0**. Artinya, terdapat **pengaruh yang signifikan secara statistika** pada kadar saturasi oksigen setelah melakukan aktivitas A.

**Pendekatan 2: Membandingkan t-statistik dengan Nilai Kritis (Critical Value)**
Ini adalah uji dua sisi (two-tailed), maka $\alpha$ dibagi dua: $\alpha/2 = 0.025$.
Derajat kebebasan (df) = 8.
Dari tabel distribusi-t (atau fungsi `qt(0.975, df=8)` di R), didapatkan nilai kritis = $\pm$2.306.
Nilai t-statistik yang dihitung adalah 6.8039.

**Aturan Keputusan:** Jika |t-statistik| > |nilai kritis|, maka H0 ditolak.
Dalam kasus ini, $|6.8039| > |2.306|$.
**Kesimpulan:** Karena nilai t-statistik berada di daerah penolakan H0, kesimpulannya sama, yaitu terdapat **pengaruh yang signifikan secara statistika** pada kadar saturasi oksigen setelah melakukan aktivitas A.

---

## Analisis Soal 2: Uji Klaim Jarak Tempuh Mobil

Analisis ini bertujuan untuk menguji klaim bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer per tahun. Pengujian ini didasarkan pada data sampel acak dari 100 pemilik mobil, yang menunjukkan rata-rata 23.500 kilometer dengan standar deviasi 3.000 kilometer. Karena ukuran sampel (n=100) besar, digunakan Uji-Z.

### a. Persetujuan Terhadap Klaim dan c. Kesimpulan Berdasarkan P-Value

Untuk menjawab kedua pertanyaan ini, dilakukan uji hipotesis satu arah.

* **Hipotesis Nol (H0):** Rata-rata jarak tempuh mobil adalah 25.000 km atau kurang ($\mu \le 25000$).
* **Hipotesis Alternatif (H1):** Rata-rata jarak tempuh mobil lebih dari 25.000 km ($\mu > 25000$). (Ini adalah klaim yang sedang diuji).

```R
# 1. Definisikan parameter berdasarkan informasi soal
sample_mean <- 23500      # Rata-rata sampel
mu_hypothesized <- 25000   # Rata-rata yang diklaim
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
p_value <- pnorm(z_statistic, lower.tail = FALSE)

# --- Tampilkan Hasil Perhitungan ---
print(paste("Nilai Z-statistik:", z_statistic))
print(paste("Nilai P-value:", p_value))
```

**Hasil:**
* Nilai Z-statistik: -5
* Nilai P-value: 0.999999713348428 (mendekati 1)

**Analisis dan Kesimpulan:**
Aturan keputusan dalam uji hipotesis adalah membandingkan p-value dengan tingkat signifikansi ($\alpha$), yang umumnya adalah 0.05.

* **Perbandingan:** Nilai p-value ($\approx 1$) jauh lebih besar dari $\alpha$ (0.05).
* **Keputusan Statistik:** Karena p-value > $\alpha$, kita **gagal menolak Hipotesis Nol (H0)**.
* Kegagalan menolak H0 berarti tidak ada bukti statistik yang cukup untuk mendukung klaim pada H1.

**Jawaban Akhir:**
**Apakah Anda setuju dengan klaim tersebut? Tidak.** Hasil analisis tidak mendukung klaim bahwa mobil dikemudikan rata-rata lebih dari 25.000 km per tahun. Data sampel justru menunjukkan nilai yang lebih rendah.
**Kesimpulan berdasarkan p-value:** Dengan p-value yang sangat tinggi (mendekati 1), dapat disimpulkan bahwa **tidak ada bukti statistik yang signifikan** untuk menyetujui klaim tersebut.

---

## Analisis Soal 3: Perbandingan Rata-Rata Saham Bandung dan Bali

Seorang data analyst ingin mengetahui apakah ada perbedaan rata-rata saham antara kota Bandung dan Bali. Untuk itu, dilakukan Uji-t Dua Sampel Independen (Two-Sample t-Test) karena membandingkan rata-rata dari dua kelompok yang berbeda. Analisis ini menggunakan asumsi bahwa varians dari kedua populasi adalah sama (`var.equal = TRUE`).

### A. H0 dan H1

Hipotesis yang akan diuji adalah:
* **H0:** Tidak ada perbedaan yang signifikan antara rata-rata saham di Bandung dan Bali ($\mu_{\text{Bandung}} = \mu_{\text{Bali}}$).
* **H1:** Terdapat perbedaan yang signifikan antara rata-rata saham di Bandung dan Bali ($\mu_{\text{Bandung}} \ne \mu_{\text{Bali}}$).

### B. Hitung Sampel Statistik & C. Uji Statistik (df)

Karena data yang tersedia adalah data ringkasan (mean, standar deviasi, dan jumlah sampel), maka digunakan fungsi `tsum.test()` dari library `BSDA`.

```R
library(BSDA)
# Lakukan uji-t dari data ringkasan
hasil_uji <- tsum.test(
  mean.x = 3.64,      # Rata-rata sampel Bandung
  s.x = 1.67,         # Standar deviasi sampel Bandung
  n.x = 20,           # Jumlah sampel Bandung
  mean.y = 2.79,      # Rata-rata sampel Bali
  s.y = 1.5,          # Standar deviasi sampel Bali
  n.y = 27,           # Jumlah sampel Bali
  alternative = "two.sided", # Uji dua sisi
  var.equal = TRUE,          # Asumsi varians sama
  conf.level = 0.95
)
# Tampilkan hasil uji
print(hasil_uji)
```

**Hasil:**
* Nilai t-statistik: t = 1.8304
* Derajat Kebebasan: df = 45
* P-value: 0.07381

### D. Nilai Kritikal

Untuk uji dua sisi dengan tingkat signifikansi $\alpha=0.05$ dan df = 45, nilai kritis dapat ditemukan dari tabel distribusi-t. Nilai ini membatasi daerah penolakan.

* **Nilai Kritis:** $\pm$2.014

### E. Keputusan

Keputusan statistik dapat dibuat dengan dua cara:

**Metode P-value:** Bandingkan p-value dengan $\alpha$.
$p\text{-value} (0.07381) > \alpha (0.05)$
Karena p-value lebih besar dari tingkat signifikansi, kita **gagal menolak H0**.

**Metode Nilai Kritis:** Bandingkan nilai t-statistik dengan nilai kritis.
Nilai t-statistik (1.8304) berada di dalam rentang nilai kritis (-2.014 dan 2.014).
Karena t-statistik tidak masuk ke daerah penolakan, kita **gagal menolak H0**.

### F. Kesimpulan

Karena kita **gagal menolak Hipotesis Nol**, dapat disimpulkan bahwa pada tingkat signifikansi 5%, **tidak terdapat cukup bukti statistik** untuk menyatakan adanya perbedaan yang signifikan pada rata-rata saham antara kota Bandung dan Bali.

---

## Analisis Soal 4: ANOVA Dua Arah Pengaruh Suhu dan Kaca

Analisis ini bertujuan untuk mengetahui pengaruh suhu operasi (Temp) dan tiga jenis kaca pelat muka (Glass) terhadap keluaran cahaya (Light) pada tabung osiloskop. Karena ada dua variabel faktor (Suhu dan Kaca), metode yang digunakan adalah Analisis Varians Dua Arah (Two-Way ANOVA).

### a. Plot Sederhana untuk Visualisasi Data

Langkah pertama adalah membuat plot interaksi untuk memvisualisasikan bagaimana rata-rata keluaran cahaya berubah untuk setiap jenis kaca pada suhu yang berbeda.

```R
# Diasumsikan 'data' sudah didefinisikan dengan kolom 'Temp', 'Light', dan 'Glass'
# dan library ggplot2 sudah dimuat.

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
```
![Rplot01](https://github.com/user-attachments/assets/16ad247f-328d-4d17-ae41-18c86f84e2b3)


### b. Uji ANOVA Dua Arah

Selanjutnya, dilakukan uji ANOVA untuk menentukan apakah pengaruh dari Suhu, Kaca, dan interaksi keduanya signifikan secara statistik.

```R
# b. UJI ANOVA DUA ARAH
# Membuat model ANOVA untuk menguji pengaruh Glass, Temp, dan interaksinya
model_anova <- aov(Light ~ Glass * Temp, data = data)

# Menampilkan tabel hasil ANOVA untuk diinterpretasikan
summary(model_anova)
```

**Interpretasi Hasil ANOVA:**
Setelah menjalankan `summary(model_anova)`, Anda akan melihat tabel ANOVA. Perhatikan kolom `Pr(>F)` (p-value) untuk setiap sumber variasi:
* **Glass:** Menguji pengaruh utama jenis kaca.
* **Temp:** Menguji pengaruh utama suhu.
* **Glass:Temp:** Menguji pengaruh interaksi antara kaca dan suhu.

Jika nilai p-value < 0.05 untuk salah satu sumber variasi, maka pengaruhnya dianggap signifikan. Penting untuk melihat efek interaksi (`Glass:Temp`) terlebih dahulu. Jika interaksi ini signifikan, maka efek utama dari Glass dan Temp tidak bisa diinterpretasikan secara terpisah.

### c. Tabel Mean dan Standar Deviasi

Terakhir, untuk melengkapi analisis, dihitung rata-rata (Mean) dan standar deviasi (Std_Dev) keluaran cahaya untuk setiap kombinasi perlakuan.

```R
# Diasumsikan 'data' sudah didefinisikan dengan kolom 'Temp', 'Light', dan 'Glass'
# dan library dplyr sudah dimuat.

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
```

**Tabel Hasil:**

| Glass | Temp | Mean_Light | Std_Dev_Light |
| :---- | :--- | :--------- | :------------ |
| A     | 100  | 573.33     | 6.43          |
| A     | 125  | 1087.00    | 2.52          |
| A     | 150  | 1386.00    | 6.00          |
| B     | 100  | 553.00     | 24.64         |
| B     | 125  | 1035.00    | 35.00         |
| B     | 150  | 1313.00    | 14.53         |
| C     | 100  | 573.33     | 26.54         |
| C     | 125  | 1055.00    | 10.61         |
| C     | 150  | 887.33     | 18.60         |

Tabel ini memberikan rincian numerik dari apa yang divisualisasikan pada plot interaksi. Sebagai contoh, kita bisa melihat bahwa pada suhu 150, rata-rata keluaran cahaya untuk Kaca C (887.33) lebih rendah dibandingkan untuk Kaca A (1386.00) dan Kaca B (1313.00), yang memperkuat dugaan adanya efek interaksi yang signifikan.
