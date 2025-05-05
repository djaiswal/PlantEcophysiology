library(PhotoGEA)
# Working with Kotagiri Data one cana indica measurements one sample at a time
file_path <- "C:/Users/deepa/git_repositories/RiparianSpecies/Kottagiri 2025/LICOR data Aci curve/Canna indica_7.xlsx"
Kotagiri_data <- read_gasex_file(file_path, 'time')
Kotagiri_data[, 'curve_id'] <- "canna indica replication 1"
Kotagiri_data <- calculate_temperature_response(Kotagiri_data, c3_temperature_param_bernacchi)
Kotagiri_data <- calculate_total_pressure(Kotagiri_data)
Kotagiri_aci_results <- consolidate(by(
  Kotagiri_data,
  Kotagiri_data[, 'curve_id'],
  fit_c3_aci
))

plot_c3_aci_fit(Kotagiri_aci_results, 'curve_id', 'Ci', ylim = c(-10, 80))

# Working with Kotagiri Data one sample measurements one sample at a time
file_path <- "C:/Users/deepa/git_repositories/RiparianSpecies/Kottagiri 2025/LICOR data Aci curve/Canna indica_5.xlsx"
file_path <- "C:/Users/deepa/git_repositories/RiparianSpecies/Kottagiri 2025/LICOR data Aci curve/syzygium cumini_6.xlsx"
Kotagiri_data <- read_gasex_file(file_path, 'time')
Kotagiri_data[, 'curve_id'] <- "sample"
Kotagiri_data <- calculate_temperature_response(Kotagiri_data, c3_temperature_param_bernacchi)
Kotagiri_data <- calculate_total_pressure(Kotagiri_data)
Kotagiri_aci_results <- consolidate(by(
  Kotagiri_data,
  Kotagiri_data[, 'curve_id'],
  fit_c3_aci,
  Ca_atmospheric = 420
))

plot_c3_aci_fit(Kotagiri_aci_results, 'curve_id', 'Ci', ylim = c(-10, 80))



