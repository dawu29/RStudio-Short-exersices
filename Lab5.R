library(tidyverse)
read_tsv("MLLT3_small.vcf", comment="##")
mm <- read_tsv("MLLT3_small.vcf",comment="##")
spec(mm)
mm <- read_tsv("MLLT3_small.vcf",comment="##", 
         col_types=cols(
           REF = col_factor(),
           ALT = col_factor()
         )
)

mm <- read_tsv("MLLT3_small.vcf", comment="##", col_types=cols(REF = col_factor(), ALT = col_factor()))

head(mm)
spec(mm)
mm$REF
levels(mm$REF)
levels(mm$ALT)
rename(mm, CHROM = "#CHROM")
rename(mm, CHROM = `#CHROM`)


final <- rename(mm, CHROM = "#CHROM") #non-syntactic name need `` surround it  
head(final)
view(final)
view(data)

view(final)


print(data)
spec(data)
names(data)


y <- tibble(`REF`="REF",`ALT`="ALT")
y
x <- factor(c("REF", "ALT"))

names(data)
class(x)
levels(x)

