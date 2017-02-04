# IF
x = 2

if(x == 2){
  y <- 4
}

# FOUR DIFFERENT FOR
x <- c("a", "b", "c", "d")
for(i in 1:4){
  print(x[i])
}
for(i in seq_along(x)){
  print(x[i])
}

for(i in x){
  print(i)
}
for(i in x) print(i)

# NESTED LOOPE
x <- matrix(1:6, 2, 3)
for(i in seq_len(ncol(x))) {
  for(j in seq_len(nrow(x))){
    print(x[j,i])
  }
}

# WHILE
count <- 0
while(count < 10){
  print(count)
  count <- count + 1
}

# WHILE WITH IF
z <- 5
c <- 0
while(z >= 3 && z <= 10){
  print(z)
  coin <- rbinom(1,1,0.5)
  if(coin == 1){
    z <- z +1
  } else{
    z <- z -1
  }
  c <- c + 1
}
