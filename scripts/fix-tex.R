# preparing preamble
f_orig <- readLines("docs/stachelek-dissertation.tex")

start_good_content <- grep("label\\{ch1-placemarker", f_orig) + 1
end <- length(f_orig)

f_good <- f_orig[start_good_content:end]

f_rep <- readLines("correct-front-matter.tex")

f_out <- c(f_rep, f_good)

start_end <- grep("bibliography", f_out)[which.max(grep("bibliography", f_out))]

f_begin <- f_out[1:(start_end-1)]
f_end <- f_out[(start_end):length(f_out)]

f_insert <- readLines("end-matter.tex")

f_out <- c(f_begin, f_insert, f_end)

file_conn <- file("_bookdown_files/stachelek-dissertation_mod.tex")
writeLines(f_out, file_conn)
close(file_conn)
