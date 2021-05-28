#히스토그램
dist <- cars[,2]
hist(dist, main = "Histogram for 제동거리", 
     xlab = "제동거리", 
     ylab = "빈도수",
     border = "blue",
     col = "green",
     las = 2,
     breaks = 5)

#상자그림
dist <- cars[,2]
boxplot(dist, main = "자동차 제동거리")

boxplot.stats(dist)

#그룹이 있는 자료의 상자그림
boxplot(Petal.Length ~ Species, data = iris, main = "품종별 꽃잎의 길이이")

#한 화면에 그래프 여려 개 출력하기
par(mfrow=c(1,3))
barplot(table(mtcars$carb),
        main = "Barplot of Carburetors",
        xlab = "#of carburetors",
        ylab = "frequency",
        col = "blue")
barplot(table(mtcars$cyl),
        main = "Barplot of Cylender",
        xlab = "#of cylender",
        ylab = "frequency",
        col = "red")
barplot(table(mtcars$gear),
        main = "Barplot of Grar",
        xlab = "#of gears",
        ylab = "frequency",
        col = "green")
par(mfrow=c(1,1))

#두 변수 사이의 산점도
wt <-mtcars$wt                   # 중량 자료
mpg <- mtcars$mpg                # 연비 자료
plot(wt, mpg,                    # 2개 변수(x축, y축)     
     main="중량-연비 그래프",    # 제목
     xlab="중량",                # x축 레이블
     ylab="연비(MPG)",           # y축 레이블
     col="red",                  # point의 color
     pch=19)                     # point의 종류 

#여러 변수들 간의 산점도
vars <- c("mpg","disp","drat","wt")    # 대상 변수 
target <- mtcars[,vars]ㅗㄷ
head(target)
pairs(target,                          # 대상 데이터     
      main="Multi Plots") 

#그룹 정보가 있는 두 변수의 산점도
iris.2 <- iris[,3:4]                # 데이터 준비
point <- as.numeric(iris$Species)   # 점의 모양
point                               # point 내용 출력
color <- c("red","green","blue")    # 점의 컬러
plot(iris.2, 
     main="Iris plot",
     pch=c(point),
     col=color[point]) 

#상관계수의 계산
beers = c(5,2,9,8,3,7,3,5,3,5)                 # 자료 입력
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,  # 자료 입력
         0.06,0.02,0.05)
tbl <- data.frame(beers,bal)                   # 데이터프레임 생성
tbl                                
plot(bal~beers,data=tbl)                       # 산점도 
res <- lm(bal~beers,data=tbl)                  # 회귀식 도출
abline(res)                                    # 회귀선 그리기
cor(beers,bal)                                 # 상관계수 계산

#상관분석
cor(iris[,1:4])                   # 4개 변수 간 상관성 분석

#선그래프의 작성
month = 1:12                             # 자료 입력
late  = c(5,8,7,9,4,6,12,13,8,6,6,4)     # 자료 입력      
plot(month,                              # x data
     late,                               # y data
     main="지각생 통계",                 # 제목 
     type= "l",                          # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab="Month",                       # x축 레이블
     ylab="Late cnt"                     # y축 레이블
)

#복수의 선그래프의 작성
month = 1:12
late1  = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2  = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,                                # x data
     late1,                                # y data
     main="Late Students",
     type= "b",                            # 그래프의 종류 선택(알파벳) 
     lty=1,                                # 선의 종류(line type) 선택
     col="red",                            # 선의 색깔 선택          
     xlab="Month ",                        # x축 레이블
     ylab="Late cnt",                      # y축 레이블
     ylim=c(1, 15)                         # y축 값의 (하한, 상한)
)
lines(month,                               # x data
      late2,                               # y data
      type = "b",                          # 선의 종류(line type) 선택
      col = "blue")                        # 선의 색깔 선택