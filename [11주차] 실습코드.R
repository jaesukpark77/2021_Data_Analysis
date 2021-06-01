#벡터의 정렬
v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)                  # 오름차순
v1
v2 <- sort(v1, decreasing=T)    # 내림차순 
v2

#매트릭스와 데이터프레임의 정렬
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),]                   # 오름차순으로 정렬
iris[order(iris$Sepal.Length, decreasing=T),]     # 내림차순으로 정렬
iris.new <- iris[order(iris$Sepal.Length),]       # 정렬된 데이터를 저장
head(iris.new)
iris[order(iris$Species, decreasing=T, iris$Petal.Length),]  # 정렬 기준이 2개

#데이터 분리
sp <- split(iris, iris$Species)       # 품종별로 데이터 분리
sp                                    # 분리 결과 확인 
summary(sp)                           # 분리 결과 요약
sp$setosa                             # setosa 품종의 데이터 확인

#데이터 선택
subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & 
         Sepal.Width > 3.9)

subset(iris, Sepal.Length > 7.6,
       select=c(Petal.Length,Petal.Width))

#숫자를 임의로 추출하기
x <- 1:100
y <- sample(x, size=10, replace = FALSE)  # 비복원추출
y

#행을 임의로 추출하기
idx <- sample(1:nrow(iris), size=50, 
              replace = FALSE)
iris.50 <- iris[idx,]      # 50개의 행 추출
dim(iris.50)               # 행과 열의 개수 확인
head(iris.50)

#set.seed() 함수 이해하기
sample(1:20, size=5)
sample(1:20, size=5)
sample(1:20, size=5)

set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)

#데이터 조합
combn(1:5,3)               # 1~5에서 3개를 뽑는 조합 

x = c("red","green","blue","black","white")
com <- combn(x,2)          # x의 원소를 2개씩 뽑는 조합 
com

for(i in 1:ncol(com)) {    # 조합을 출력
  cat(com[,i], "\n")
}

#집계 (평균)
agg <- aggregate(iris[,-5], by=list(iris$Species), 
                 FUN=mean)
agg

#표준편차 출력
agg <- aggregate(iris[,-5], by=list(표준편차=iris$Species), 
                 FUN=sd)
agg

#최댓값 출력
head(mtcars)
agg <- aggregate(mtcars, by=list(cyl=mtcars$cyl,
                                 vs=mtcars$vs),FUN=max)
agg

#병합
x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(name=c("a","b","d"), korean=c(75,60,90))
x
y

z <- merge(x,y, by=c("name"))
z

#모두 병합 가능
merge(x,y, all.x=T)    # 첫 번째 데이터셋의 행들은 모두 표시되게
merge(x,y, all.y=T)    # 두 번째 데이터셋의 행들은 모두 표시되게
merge(x,y, all=T)      # 두 데이터셋의 모든 행들이 표시되도록

#병합 기준 열의 이름 다른 경우
x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(sname=c("a","b","d"), korean=c(75,60,90))
x                    # 병합 기준 열의 이름이 name
y                    # 병합 기준 열의 이름이 sname
merge(x,y, by.x=c("name"), by.y=c("sname")) 