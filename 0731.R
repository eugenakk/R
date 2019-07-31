
#3일차

#복습
#1. 데이터프레임 만들기. 데이터 불러오기
num1= factor(c(10,20,30,40,50)) #명목형 (factor)
num2=seq(100,500,100)
num3= 1:5 

char1=c("월","화","금","토","일")
df=data.frame(num1,num2,num3, char1)

#수정
df$char1= paste0(df$char1 , "요일")
df$num2= df$num2 +2
transform(df, num3=num3+2,num2=num2+3)    #변수가 여러개가 있는 경우 transform 을 쓰는 것이 편함.


num1= factor(c(10,20,30,40,50)) #명목형 (factor)
num2=seq(800,300,200)
num3= 2:7

char1=c("월","화")
df2=data.frame(num1,num2,num3, char1)

#수정
df2$char1= paste0(df2$char1 , "요일")
df2$num2= df2$num2 +2
transform(df2, num3=num3+2,num2=num2+3)    #변수가 여러개가 있는 경우 transform 을 쓰는 것이 편함.

rbind(df,df2)   


char2= c("김","박","최","이","안","방","조")
char3= c("김2","박2","최2","이2","안2","방2","조2")
df4=data.frame(char2,char3)

cbind(df,df2)


df7=merge(df5,df6,key="char1")  #조인과 비슷한 개념


#접근하기
df7$char1
df7["char1"]
df7[1]
df7[1,]


#변형하기
names(df7)
names(d7)= c("a","b","c","d","e","f","g")   #컬럼들의 이름을 바꿔주기.

install.packages("reshape")
library(reshape)

df7=rename(df7,c(a="요일", g="gender") )


#정렬하기
#d라는 변수로 정렬하고 싶다..
order(df7$d)   #실제로 sort 하는 것이 아니라 수가 나옴.
df7[1,]
df7[c(1,2),]
df7[c(2,1),]   #2컬럼부터 나온 후 1이 나옴. (sorting을 이렇게 한다)

install.packages("plyr")
library(plyr)
arrange(df7,d)
arrange(df7, desc(d))


#열 삭제하기
df7$c=NULL     # C가 없어진다. 


#데이터 분리하기


mylist=split(df7, df7$gender)
iris


mylist=split(iris,iris$Species)         #분리할 때는 SPLIT함수 유용
mylist$setosa

# 조건에 맞는 데이터 추출하기.

subset(iris,Sepal.Length>=6 & Sepal.Length<7, 
                     select= c(Sepal.Length, Species))

###########################################################################################

#조건문

a=10
if(a>10){
  
  print( paste(a, "는 10보다 크다"))
}else if (a>5)
{
  print(paste(a,"는 5보다 크다!"))
}else
{
  print(paste(a,"는 5보다 작다"))
}
print("~~~~~~끝")



library(ggplot2)
diamonds

diamonds$price>=5000

diamonds[diamonds$price>=5000, ]   #10개 나옴

diamonds$price.group= ifelse(diamonds$price>=5000, "5000이상", "5000미만")    #변수 추가해준다*****

df2= diamonds[ ,c("price","price.group")]
df2[ df2$price.group== "5000이상" , ]


split(df2, df2$price.group)    #그룹 2개로 나누자. 


###########################################################################################
#반복문 (for문)

for(i in 1:10){  
  
  print("Hello, World")
}

for(i in 1:10){
  cat("Hello" , i, "\n")
}

for( i in c(100,200,55) ){  #i는 오른쪽에서부터 전달받은 값.
  print(i)
}

for(i in seq(1,10,2)){ #1과 10사이의 홀수만!
  print(i)
}

#함수 중에 repeat라는 함수가 있다.
i=1
repeat{
  print(i)
  
  if(i==10)
    break 
  
  else
  {
  i=i+1
  }
  
}
################################################################
i=1
while(i<=10){
  print(i)
  i=i+1;
}

#iris.data에서 Sepal.Length 가 5~6사이에 있는 행들만 보기.
#1,2,번째 컬럼만

result<- c()   # 비어있는 벡터.
for(aa in 1: nrow(iris)){
  result<- c(result, iris[i,] )  #result에다가 하나씩 추가한다. (벡터)
}

iris[iris$Sepal.Length>5 & iris$Sepal.Length<6, c(1,2)]

################################################################


total <-0

for( i in 1:10)
{
  total=total+1
}
total

su=1:10
su=matrix(c(1:10))
su
apply(su,1, sum)   # margin 이  1이면... 행 방향으로 더하라는 것. 2면 열 방향으로 더하라흔ㄴ 것.
apply(su, 2, sum)


iris[ , c(1:4)]
apply(iris[ , c(1:4) ], 2, sum) #같은 컬럼끼리 더하는 것. 결과가 컬럼 개수만큼 나와야함 (4개)
apply(iris[ , c(1:4) ], 2, mean) 


################################################################

#빈도와 백분율 구하기

#일변량 분석 : 변수 1개
#이변량 분석: 변수 2개
# 다변량 분석, 다중분석: 변수 3개 이상

#질적 자료: 원칙적으로 숫자로 표시돌 수 없는 자료   (빈도, 백분율 )
#양적자료: 자료의 크기나 양을 숫자로 표현             (질적자료로 변경후 -분석) (대표값와 산포도로 기술함)
#이산형, 연속형 자료.

diamonds$cut    
table(diamonds$cut ) #빈도표****
table(diamonds$color ) 
table(diamonds$clarity )

sort(table(diamonds$clarity))
sort(table(diamonds$clarity), decreasing = T)

#비율 테이블 (prop.table() 사용)
prop.table(table(diamonds$clarity))
round(prop.table(table(diamonds$clarity))*100, digits=1)

#freq() 함수 사용하기 위해 패키지 설치
install.packages("prettyR")
library(prettyR)

#freq() 의 매개변수: 
# variable.labels (변수명을 어떻게 표현할 것인가를 지정)
#display.na (available or not)
# decr.order   (정렬을 설정)

freq(diamonds$cut)
freq(diamonds$cut, display.na=F)

##############################################################
# 막대그래프

#barplot()
barplot(table(diamonds$cut))

barplot(table(diamonds$cut), horiz=T)
barplot(table(diamonds$cut),col="red", horiz=T)
barplot(table(diamonds$cut),col="red", main="다이아몬드의 품질 현황",horiz=T)
barplot(table(diamonds$cut),col="red", main="다이아몬드의 품질 현황",xlab="빈도",xlim=c(0,20000),horiz=T)

colors()

#plot_ly() 함수를 이용하여 --->막대그래프를 작성할 수 있음.
install.packages("plotly")
library(plotly)

#
plot_ly(data=diamonds, x=~levels(cut), y=~table(cut), type="bar")

#ggplot2 패키지에 있는 ggplot(), geom_bar()함수를 이용하여 막대그래프를 작성할 수 있음.

#mapping: aes() 는 x축이나 y축에 들어갈 질적 자료 지정
# data: 분석할 데이터 저장.
#geom_bar() : 막대 그래프 그리기.
#coord_polar(): 빈도를 나타냄.
ggplot(data=diamonds, mapping=aes(x=cut))+geom_bar()
ggplot(data=diamonds, mapping=aes(x=cut))+geom_bar()+coord_polar()


#빈도
ggplot(data=diamonds,
       mapping=aes(x="", fill=cut))
      +geom_bar()
#빈도 -원 형태로~
ggplot(data=diamonds, 
       mapping=aes(x="", fill=cut))
        +geom_bar()
        +coord_polar("y")

#너무 길면 "도화지"를 따로 저장하자.
p=ggplot(data=diamonds, 
       mapping=aes(x="", fill=cut))

p+geom_bar()
p+geom_bar()+coord_polar("y")

#원 그래프
#질적 자료가 가지는 항목 (값)이 5개 이하인 경우에 적당함

#pie() : x, radius, init.angle

pie(table(diamonds$cut))
pie(table(diamonds$cut), radius=1)
pie(table(diamonds$cut), radius=1, init.angle=-30)



##############################################################
#일변량 양적 자료를 분석하는 방법

#구간의 빈도와 백분율 구하기
#새로운 변수의 생성을 위해 cut() 함수를 사용

diamonds$gprice=cut(diamonds$price, breaks=c(0,500,10000,15000,20000))
diamonds$gprice=cut(diamonds$price, breaks=seq(0,20000,5000))

#구간의 빈도 구하기
table(diamonds$gprice)

#구간의 백분율 구하기
round(prop.table(table(diamonds$gprice))*100,digits=1)

##############################################################
#히스토그램
#구간의 빈도나 백분율을 이용하여 작성
#x축은 양적 자료의 구간, y축은 각 구간의 빈도 또는 백분율이 됨.
#히스토그램은 막대그래프와 다르게 막대의 가로가 의미를 가짐.

#기본의 히스토그램
hist(diamonds$price)
#사용자가 지정한 구간의 히스토그램램
hist(diamonds$price, breaks=c(0,5000,10000,15000,20000))

#사용자가 지정한 구간의 개수의 히스토그램
hist(diamonds$price, breaks=10)


#상자그림
#이상티 유무, 대칭유무, 자료의 분포에 대한 정보를 얻을 수 있음.
#boxplot() 사용
#formular  (질적 자료의 형태), x (분석할 일변량 양적 자료), range (기본이 1.5, 이상치를 판단하는 기준)

boxplot(diamonds$price)  

boxplot(diamonds$price, range=3)

boxplot(diamonds$price~ diamonds$cut)
boxplot(price~cut, data=diamonds)

##############################################################

#대푯값

mean(diamonds$price)
table(is.na(diamonds$price))  #na가 하나도 없다는 것을 알 수 있다..
sum(is.na(diamonds$price))

mean(diamonds$price, na.rm=TRUE)
df= read.table(file="./data/na_data.txt", header=T, sep="\t")

mean(df$DATA1, na.rm=T, trim=0.0 )

#중위수
#양쪽 자료를 정렬한 후에 데이터의 개수를 반으로 나누게 하는 값으로 양적자료의 중심을 알려줌.
#평균과 다르게 이상하게 크거나 이상하게 작은 값에 영향을 덜 받는 특징이 있음.

median(diamonds$price)

#최빈수
index=which.max(table(diamonds$price))
table(diamonds$price)[index]

                      
##############################################################
#범위: 최대값-최소값


diff(range(diamonds$price))  #가장 큰 것과 작은 것의 차이.

#사분위 범위
#3제사분위수에서 제 1사분위수의 값을 뺸 값.
IQR(diamonds$price)

#양적 자료의 퍼짐 (산포)를 알려주는 값,
var(diamonds$price)

#표준편차
sd(diamonds$price)

#Median Absolute Deviation
#중위수와 양적 자료들이 얼마나 다를지를 알려주는 ㄱ밧.
mad(diamonds$price)

##############################################################

#summary() : 함수 안에 들어오는 자료에 따라 다른 값을 구함
#by(): 집단별로 작업을 할 때 유용한 함수 (집단별로 기술통계량을 구할 때에도 사용)

summary(diamonds)
summary(diamonds$price)

#cut 별로 price에 대한 평균을 구함
by(diamonds$price, diamonds$cut, mean)
by(diamonds$price, diamonds$cut, sd)
by(diamonds$price, diamonds$cut, summary)

##############################################################

install.packages("psych")
library(psych)
describe(diamonds$price)
describeBy(diamonds$price, diamonds$cut)
#구조
str(diamonds)

#질적자료: cut, color, clarity, gprice    (factor인것!)


#양적자료

##############################################################
#교차표

install.packages("gmodels")
library(gmodels)
CrossTable(diamonds$cut, diamonds$color,
           prop.r=TRUE,   #행 백분율 출력
           prop.c=TRUE,   #열 백분율 출력
           prop.t=TRUE, #total 백분율 출력
           digits=1      #소수점을 한 자리까지만 표현
           )

barplot(table(diamonds$cut, diamonds$color),
        legend.text= levels(diamonds$cut), args.legend=list(x="topright")
        )


barplot(table(diamonds$cut, diamonds$color),beside=TRUE,
        legend.text= levels(diamonds$cut), args.legend=list(x="topright")
        )
##############################################################
#산점도 *************
#두 양적 자료 간의 관계를 살펴보기 위해서 작성하는 그래프.

#carat이 무거울수록 price가 높아지는 경향을  보임.
plot(diamonds$carat, diamonds$price)

pairs(diamonds[ , c("carat", "price", "color")])

install.packages("corrplot")
library(corrplot)


install.packages("CARS")
mtcars


##############################################################
library(ggplot2)
mpg
#cty와 hwy간에 어떤 관계가 있는지 알아보려고 한다.
#x축은 cty, y축은 gwy로 된 산점도를 만들어보시오.

ggplot(data=mpg, aes(x=cty, y=hwy))+geom_point()
mpg[ , c("manufacturer", "model", "cty", "hwy" )]

