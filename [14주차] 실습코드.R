serviceURL <- "https://api.odcloud.kr/api/"
operation <- "apnmOrg/v1/list"
page <- "?page=2"
perPage <- "&perPage=30"
serviceKey <- "&serviceKey=ukZCtYa5rdr1gr2BQJv4OyF9zr5Pt9%2F1wU3QfSenbBlxBneTWIWlU1V%2BC6EeR%2BvrE7o7pUNT1ZPpda%2By95DvGA%3D%3D"

requestUrl = paste0(serviceURL, operation, page, perPage, serviceKey)
requestUrl

install.packages("jsonlite")
library(jsonlite)
install.packages("httr")
library(httr)

repos <- fromJSON(requestUrl) #연결 및 DataFrame으로의 변환
repos <- data.frame(repos)
str(repos)
names(repos)
getwd() #저장 파일 위치 확인
setwd("E:\\학교\\수업자료\\3학년\\1학기\\데이터분석기초\\실습\\코드\\[14주차] 소스코드") #파일 위치 설정
write.csv(repos,"data.csv",row.names = TRUE)

#esquisse 활용
install.packages("esquisse")
library(esquisse)

irisdata <- data.frame(iris)
library(ggplot2)

p<-ggplot(irisdata) +
  aes(x = Sepal.Length, y = Petal.Width, colour = Species) +
  geom_point(shape = "circle", size = 3.3) +
  scale_color_manual(
    values = list(
      setosa = "#FF1100",
      versicolor = "#00C19F",
      virginica = "#FF61C3"
    )
  ) +
  labs(x = "123", y = "1234", title = "test") +
  theme_minimal() +
  theme(plot.title = element_text(size = 15L, hjust = 0.5)) +
  ylim(0L, 3L)

print(p)
p + annotate("text", x=3,y=3,label = "test12")




