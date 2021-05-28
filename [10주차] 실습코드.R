#자료탐색 실습습
## (1) Prepare Data ----------------------
library(mlbench)
data("BostonHousing")
myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]

## (2) Add new column ----------------------
grp <- c()
for (i in 1:nrow(myds)) {                   # myds$medv 값에 따라 그룹 분류
  if (myds$medv[i] >= 25.0) {
    grp[i] <- "H"
  } else if (myds$medv[i] <= 17.0) {
    grp[i] <- "L"
  } else {
    grp[i] <- "M"
  }
}
grp <- factor(grp)                          # 문자벡터를 팩터 타입으로 변경
grp <- factor(grp, levels=c("H","M","L"))   # 레벨의 순서를 H,L,M -> H,M,L

myds <- data.frame(myds, grp)               # myds 에 grp 컬럼추가
myds <- data.frame(myds, grp)               # myds 에 grp 컬럼추가

## (3) Add new column ----------------------
str(myds)  
head(myds)
table(myds$grp)                             # 주택 가격 그룹별 분포

## (4) histogram ----------------------
par(mfrow=c(2,3))                           # 2x3 가상화면 분할
for(i in 1:5) {
  hist(myds[,i], main=colnames(myds)[i], col="yellow")
}
par(mfrow=c(1,1))                           # 2x3 가상화면 분할 해제


## (5) boxplot ----------------------
par(mfrow=c(2,3))                           # 2x3 가상화면 분할
for(i in 1:5) {
  boxplot(myds[,i], main=colnames(myds)[i])
}
par(mfrow=c(1,1))                           # 2x3 가상화면 분할 해제

## (6) boxplot by group ------------------
boxplot(myds$crim~myds$grp, main="1인당 범죄율")
boxplot(myds$rm~myds$grp, main="방의  수")
boxplot(myds$dis~myds$grp, main="직업센터까지의 거리")
boxplot(myds$tax~myds$grp, main="제산세")

## (7) scatter plot ------------------
pairs(myds[,-6])

## (8) scatter plot with group ------------------
point <- as.integer(myds$grp)                 # 점의 모양 지정
color <- c("red","green","blue")              # 점의 색 지정   
pairs(myds[,-6], pch=point, col=color[point])

## (9) correlation coefficient ------------------
cor(myds[,-6])

#결측값의 특성과 존재 여부 확인
z <- c(1,2,3,NA,5,NA,8)      # 결측값이 포함된 벡터 z
sum(z)                       # 정상 계산이 안됨
is.na(z)                     # NA 여부 확인
sum(is.na(z))                # NA의 개수 확인
sum(z, na.rm=TRUE)           # NA를 제외하고 합계를 계산

#결측값 대체 및 제거
z1 <- c(1,2,3,NA,5,NA,8)      # 결측값이 포함된 벡터 z1
z2 <- c(5,8,1,NA,3,NA,7)      # 결측값이 포함된 벡터 z2
z1[is.na(z1)] <- 0            # NA를 0으로 치환 
z1                            
z3 <- as.vector(na.omit(z2))  # NA를 제거하고 새로운 벡터 생성
z3

#결측값이 포함된 데이터프레임 생성
# NA를 포함하는 test 데이터 생성
x <- iris
x[1,2]<- NA; x[1,3]<- NA
x[2,3]<- NA; x[3,4]<- NA  
head(x)

#데이터프레임의 열별 결측값 확인
# for문을 이용한 방법
for (i in 1:ncol(x)) {
  this.na <- is.na(x[,i]) 
  cat(colnames(x)[i], "\t", sum(this.na), "\n")
}

# apply를 이용한 방법
col_na <- function(y) {
  return(sum(is.na(y)))
}

na_count <-apply(x, 2, FUN=col_na)
na_count

#데이터프레임의 행별 결축값 확인
rowSums(is.na(x))            # 행별 NA의 개수  
sum(rowSums(is.na(x))>0)     # NA가 포함된 행의 개수 

sum(is.na(x))                # 데이터셋 전체에서 NA 개수

#결측값을 제외하고 새로운 데이터셋 만들기
head(x)
x[!complete.cases(x),]              # NA가 포함된 행들 출력
y <- x[complete.cases(x),]          # NA가 포함된 행들 제거
head(y)  

#상자그림을 통한 특이값 확인
st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out

#특이값을 포함한 행 제거
out.val <- boxplot.stats(st$Income)$out     # 특이값 추출
st$Income[st$Income %in% out.val] <- NA     # 특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),]          # NA가 포함된 행 제거
head(newdata) 