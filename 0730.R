## 2일차 

## 복습 ############################################################################
# R의 데이터 타입
a<-10
b= "문자"
c=TRUE
d=10>20
e= NULL
f=NA
g= NaN   #not a number
h= Inf
v1= 1:5    #연속적인 값
v2=c(100,200,300) #연속적이지 않은 값
v3= seq(from=10, to=100, by=20 )
v4= seq(10,100,20)    #from, to, by 생략가능
v5= seq(100,1,-20)
v6= sequence(10)   #정수만 가능.
v7= rep(c(10,20), times=2)  #전체가 2번 복사된다.
v8= rep(c(10,20), each=2)    #각각이 2번씩 나온다. 

m1=matrix(1:10, nrow=2, ncol=5)     #행 우선으로 채워짐.
m1
m2=matrix(1:10, nrow=2, ncol=5, byrow=TRUE)   #열 우선으로 채워짐/.
m1

m1[2,5]  #m1[2][5]이 아니다!!!

arr=array(1:10, dim=10)
arr
arr2= array(1:10, dim=c(2,5))        #2차원
arr2

arr3= array(1:20, dim=c(2,5,2))   #3차원
arr3
arr3[2,5,2]

arr4= array(1:15, dim=c(2,5,2))   #3차원  -->RECYLCING  되어서 다시 숫자 반복
arr4
arr4[2,5,2]


alist=list(10, "문자", v8, m1, arr4)   #여러개의 데이터 타입을 묶을 수 있는 것이 리스트다!!!!!!!!
alist
alist[1]

alist[3]

alist[[3]][2]   #그 안에 들어있는 애를 보고 싶으면... [[]]로 두 번 묶어준다. 


#############################################################################

#데이터 프레임

# 2차원 구조로 행렬처럼 행과 열로 구성
# 하나의 열은 벡터이다. 
#행렬은 하나의 데이터 유형만 가질 수 있지만, 데이터 프레임은 여러 가지 데이터 유형을 가질 수 있음.

# 텍스트, CSV, 엑셀, DB 형태로 되어 있는 외부 데이터를 일겅오면 그 데이터 형태는 데이터 프레임이 됨

#data.frame()함수를 이용하여 데이터 프레임을 생성한다. 
#arguments: stringAsFactors --> FALSE로 하면 factor로 하지 않겠다는 것.

id = 1:5
age= c(10,20,25,8,30)
gender= c("m","f","m","m","f")
height= c( 100,200,300,60,90)
df= data.frame(id, age, gender, height, stringsAsFactors = FALSE)
df


df2= data.frame(id, age, gender, height)
df2

str(df)  #데이터의 구조를 보여준다.    gender 가 char 로 되어있다. not factors. 

str(df2)    #

df2$gender   #factor**
df$gender   #그냥 문자

plot(df2$gender)    #plot 그래프로 만들 수 있다. 
plot(df$gender)      #plot 그래프로 만들기 불가.




id = 101:105
name= c("김철수", "박영희 ", "김유진", "김재현", "김영희")
age= c(24,25,29,30,23)
gender= c("m","f","f","m","f")
join_date=c("2018/07/01", "2010/10/10", "2012/05/05", "2009/09/09", "2010/05/04")
df5= data.frame(id, name, age, gender, join_date, stringsAsFactors = FALSE)
df5


str(df5)
plot(df5$gender)   # stringAsFactors=FALSE 으로 했기 때문에..  안됨.

df5$gender=as.factor(df5$gender)    #---->그래서 다시 FACTOR로 as.factor로 바꿔준다. 
plot(df5$gender)    #이제는 된다. 

str(df5)   #gender가 factor로 바뀐것을 볼 수 있다. 

#factor는 변경 쉽게 X. 문자열과 다름.

df5$gender
df5[4]   #4번째 컬럼을 보여준다. --> 하지만, 4번째 컬럼에 뭐가 있는지 확인해야하므로.. 이름으로 하는것이 편함.

df5$gender[1]="A"
df5$gender[1]="m"
df5


#컬럼 접근
df5[1]
df5[c(1,2)]

df5[-c(1,2)]

#row 접근
df5[1,]   #1행의 모든 컬럼
df5[,1]    #모든 행의 첫 컬럼럼
df5[,]
df5[1,1]   #값 한개

df5[1,4]="m"  #값 한개
df5[1,4]
df5


#############################################################################

#행 이름
#행의 이름을 알려주느 속성

nrow(df5)
NROW(df5)
ncol(df5)
NCOL(df5)

colnames(df5)
rownames(df5)     #default는 1,2,3,4,5
df5

paste("R",1,"행")    # 다 더하라는 뜻.
paste("R",1,"행", sep= "*")       # 중간에 공백을 특수문자로 sep를 사용해서 씀.
paste0("R",1,"행")      #paste0은 공백 없는 것.


rownames(df5)=paste0("R",1:5)
df5

#이제 행렬을 접근할때 rowname을 사용해서 쉽게 접근 가능하다. 
df5["R1",]

dim(df5)   #차원을 알아보는 것.

dimnames(df5)    #리스트 형태로 데이터가 나옴..rownames, colnames 둘다 같이 나옴
rownames(df5)
colnames(df5)      

iris      #iris 라는 data set.
class(iris)   #iris 라 데이터프레임 형태이다
dim(iris)
colnames(iris)
rownames(iris)
nrow(iris)
ncol(iris)
iris[1,]
iris[,]
iris[ ,1]
iris[ , ncol(iris)]   #마지막 컬럼을 보여준다
 
iris$Species   #level로 되어있다는 것을 알 수 있다. 
######################코드가 길어지거나, 특정 데이터 프레임의 변수 여러개를 써야한다면
#attach 와 detach사용하는 것이 훨씬 편리하다. 
attach(iris)   #지금부터 iris를 접근 할것이다&&****
Species
detach(iris) 



#############################################################################
#패키지
# 함수, 데이터, 코드, 문서 등을 묶은 것을 의미
#R이 설치되면 자동으로 stats, graphics, grDevices,utils, datasets, methods, base 의 패키지가 설치되어 통계와 그래프 등에 대산 기본 기능을 제공. 

install.packages("ggplot2")   #그래프 그릴 때 많이 사용하는 패키지 -->하드웨어 들어가는 것.

#패시키지가 설치되었다고 패키지에 있는 함수나 기능들을 바로 사용할 수 없음.
#패키지와 R간에 연결이 되지 않은 상태이기 때문에 연결을 해주는 명령어를 수행하는 것을 "패키지 로딩' ==>library함수 사용
library(ggplot2)   #메모리 들어가는 것
?ggplot2

#어떤 패키지가 설치되었는지 보여준다*****
search()

#패키지의 경로까지 다 나온다.****
searchpaths()
.libPaths()

?ggplot2


#############################################################################
#텍스트 데이터의 개념
#텍스트 데이터는 데이터와 데이터를 구분 위해서 공백, 콤마, 탭과 같은 구분자를 사용

#R에서 읽어오기 위해서는 read.table()함수르 사용. read.csv를 사용할 수도 있음.
# 매개변수: file, header, sep, stringAsFactors, na.strings

getwd()


read.table(file="data/survey_blank.txt", header=T, sep="")

# 상대경로 ~    .. 부모    .현재 


read.table(file="data/survey_comma.txt", header=T, sep=",")
df= read.table(file="data/survey_tab.txt", header=T, sep="\t")
 str(df)   #과가 factor로 들어가 있음.
 
 df$major

#0문자도 NA 로 나오도록 한다. 
 # 빈 문자는 default로 NA .
df1=read.table(file="data/na_data.txt", header=T, sep="\t", na.strings="0") 


df1   # 공백은 NA 로 표시됨.

#read.csv() 함수는
df2=read.csv(file="data/csv_exam.csv", header=T) 
df2

df2["합계"]=df2$math+df2$english+df2$science    #새로운 컬럼 생성****
df2

df2["평균"]=df2["합계"] %/% 3   #몫만 남기기. %/%
df2



df=read.csv(file="./data/인구주택총조사2015.csv", header=T) 
df
str(df)
colnames(df)
rownames(df)
nrow(df)
ncol(df)

#############################################################################
#엑셀 데이터 읽어오기

install.packages("readxl")
library(readxl)

df=read_xlsx(path="./data/인구주택총조사2015.xlsx", col_name=T, sheet=1)  # sheet의 순서 또는 이름을 준다. 
df

#빅 데이터에서는 CSV 파일을 주로 써서 저장한다. 엑셀은 rowcolumn이랑 그런 것이 한정되어 있다. 


#############################################################################
#R 데이터를 R데이터로 저장하기. 

# 외부 데이터를 R로 읽어와서 데이터를 분석하고, 데이터를 추출, 생성, 수정, 삭제 등의 작업을 하게 됨.
 
df=read.csv(file="./data/인구주택총조사2015.csv", header=T)
df2=df[c(1,2,3,4)]
df2

save(df2, file="mydata2.RData")   #데이터 파일을 현재 디렉토리에 생성해준다. .

####################오늘부터 일할 분량
#load(file=“파일위치/파일명.RData”)
load(file= "mydata2.RData")
df2

#############################################################################
#iris 데이터를 이용, 10건만, 컬럼 1번째, 2번째, 5번째만 저장.RData로 저장.
str(iris)
df=iris[1:10, c(1,2,5)]
df
save(df, file="iris10.RData")


load(file="iris10.RData")

load(file="iris50.RData")     #df 에 새롭게 load를 한다. 

#############################################################################
#텍스트로 데이터를 저장하기.


#save는 RDATA를 저장해줄 떄 사용하고, write는 csv, xslsx를 저장할 떄 사용해준다. &****************************
write.csv(df,file="data/new_iris50.txt", quote=FALSE)  #table로 저장하면 sep=","를 추가해줘야한다. csv는 당연히 ,로 separate되어서 안써줘도 된다. 


?write.table


install.packages("openxlsx")
library(openxlsx)
write.xlsx(df, file="data/new_iris50.xlsx")

a=10
b="R프로그래밍"

save.image(file="mywork.RData")   #a,b그대로 저장하려면 save.image 해서 무엇을 저장해야할지 안써줘도 됨.
load(file="mywork.RData")   #내가 작업했던 것을 다시 load


#
ls()   #R데이터 목록***
rm(a)   #a변수를 지운다
rm(list=ls())    #ls()에 있는 리스트를 몽땅 지워버리기.
ls()


#############################################################################

#데이터의 내용 보기
#diamonds

?diamonds 
nrow(diamonds)
ncol(diamonds)
class(diamonds)     #타입
str(diamonds)       #구조

head(diamonds)     #앞의 6개만 보여줌
head(diamonds,3)  #앞의 3개만 보여줌

tail(diamonds)
tail(diamonds,3)

View(diamonds)            #전체를 보고싶다면 대문자로 View.

#############################################################################
#16장: 데이터 추출하기

#열 추출하기.

#데이터프레임 유지.
class(diamonds[,2,drop=FALSE])   #데이터 프레임으로 나옴.   
class(diamonds[,2])

#데이터 프레임 유지X (본래 데이터)
class(diamonds[,2,drop=TRUE])    #본래 데이터 타입으로 나옴. (ordered, factor)


class(diamonds[,1,drop=FALSE])   #데이터 프레임으로 나옴.   
class(diamonds[,1,drop=TRUE])    #본래 데이터 타입으로 나옴. (numeric)

diamonds[,1:3]
diamonds[, c(1,4,5)]
diamonds[, seq(1,5,2)]


#column에 이름을 주기
diamonds[,"cut"]
diamonds[,c("cut","color")]

#컬럼의 이름이 c로 시작하는 컬럼들만 선택***
diamonds[, grep("^c", colnames(diamonds))]
diamonds[, grep("t$", colnames(diamonds))]



#행 추출하기
df2=diamonds[diamonds$cut=="Premium" ,]    #premium 으로 시작하는 cut

df2=diamonds[diamonds$price >=18000 ,]    #premium 으로 시작하는 cut

a=diamonds$cut=="Premium" 
b=diamonds$price >=18000
diamonds[a&b , ]


install.packages("dplyr")
library(dplyr)


#pipe: %>% (ctrl+shift+M)   전체 데이터를 다음 단계로 넘겨주는 것!!!!!!
diamonds %>% filter(cut=="Premium" & price >=18000) %>%  select("cut", "price")


#############################################################################


View(diamonds)

str(diamonds)
diamonds$xyz.sum=diamonds$x+diamonds$y+diamonds$z
diamonds$xyz.sum2=rowSums(diamonds[,c("x","y","z")])

diamonds$mean=(diamonds$x+diamonds$y+diamonds$z)/3
diamonds$xyz.mean2=rowMeans(diamonds[,c("x","y","z")])

diamonds[diamonds$price>=18500,]  #이런 조건에 맞는 모든 행을 조회***

a= c(TRUE, FALSE, TRUE,FALSE,FALSE)
v1= c(10,20,30,40,50)
v2=c("A","B","C","D","E")
df=data.frame( v1,v2  )
df
df[a, ]

diamonds[diamonds$price >=18800,]
diamonds[diamonds$price >=18800,"price"]=19000


diamonds[diamonds$price >=18800,c("price","x")]

diamonds[diamonds$cut=="Fair" & diamonds$price >=18500, c("cut","price","x")]

diamonds[diamonds$cut=="Fair" & diamonds$price>=185000,"x"]=NA

#행 삭제하기

df2=diamonds[!( diamonds$cut=="Fair" & diamonds$price >=18500), ]
df2[df2$cut=="Fair" & df2$price>=18500,]

df3=diamonds[1:10,1:5 ]
df3=="Premium"
df3[!(df3$cut=="Premium"), ]


df3[-c(2,4),]

df3$depth=NULL   #depth 라는 변수 지움.
df3
 

subset(df3, select =-color)   #color컬럼이 빠짐.

subset(df3, select =- c(color, clarity))


#데이터 정렬하기
#기본으로 오름차순,

order(df3$carat)     #sort 순서(inde) 

#df3$carat 로 sort, 같은 값은... cut으로 비교한다. level을 살펴보고 잘 sort됐는지 확인하기.
df3[order(df3$carat,df3$cut, decreasing = T) ,] 

is.ordered(df3$cut)
levels(df3$cut)
str(df3)














