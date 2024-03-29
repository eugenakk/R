
#1st CLASS

#현재 디렉토리 확인
getwd()

#산술연산자, 할당 
a=10
a<-20

30 -> a

b= 3
a+b
# "a+b", a+b   -->기존 언어와 달리 이런 구문은 X.
paste("a+b=",a+b)
paste("a-b=",a-b)
paste("a*b=",a*b)
paste("a/b=",a/b)
paste("승 a^b=",a^b)
paste("승 a**b=",a**b)
paste("나머지 a%%b=",a%%b)
paste("몫 a%/%b=",a%/%b)


# 비교 연산자. 
a=10
b=10
a==b
a!=b
!(a==b)
## ----------------------------------------------------------------------
#논리 연산자
# &는 두 개의 이상의 조건을 동시에 만족할 땜만 TRUE
# &&는 데이터가 하나인 경우에만 가능.

a=4
b=4
a==b & (b<-b+1) >5  # &는 모두 참일때만 참이므로

a !=b && (b<-b+1) >=5  #앞의 결과가 false이면 뒤를 수행하지X
                       

a ==b & (b<-b+1) >=5
a ==b || (b<-b+1) >=5
a ==b | (b<-b+1) >=5

a = c(1,2,3)
b= c (0,2,0)

a & b   # &는 3개를 다 비교 (숫자 있는지 없는지)
a && b    # 맨 처음 것 하나만 비교한다.

#값이 여러개 일떄는 
# &: 각각의 결과 
# &&: 처음 하나의 결과 

## ----------------------------------------------------------------------
#연산자 우선순위 (=, <-도 우선순위가 있다)

a=b=5
a<-b=5    # <- 가 우선순위가 높다***

a <- (b=6) # 연산자 우선순위 바꾸러면  ()사용
a=b <-7

a=c(1,2,3,4,5)

mean(a)    #평균

# = 최상위에서 사용  , 그래서 <- 를 사용해야한다 
mean( aa<- c(1,2,3,4,5) )
aa

#그래서 R에서는 =보다는 <-를 선호한다.



## ----------------------------------------------------------------------
#데이터의 유형 
t1= 100
t2="문자"
t3= TRUE
t4= 1+2i   #복소수
t5=NULL
t6= NA   #값을 넣어야 하는데, 안 넣은 것!!!
t7= NaN    #계산 불가능할 때
t8= sqrt(-9)   #계산 불가능하므로 NaN결과 나옴
t9=Inf
t5+10   #알 수 없다
t6+100   #NA를 더하면 결과도 NA
t9+10   # Infinity 에다가 더하면 당연히 Inf


## ---------------------------------------------------------------------


# 원시 자료형  -- 물리적인 자료형
mode(t1) 
mode(52)
mode(t3)
mode(t4)
mode(t5)


#class   -- 객체지향적 관점 
#typeof - R언어 자체의 관점 
t1=100L # L은 정수라는 뜻 --> Integer라고 나옴.
class(t1)    
mode(t1)
typeof(t1)   #Integer OR Double

class(t2)
class(t3) 
class(t4)
class(t5)
is.numeric(t1)
is.character(t1)

## ---------------------------------------------------------------------
#데이터 유형의 우선순위

#벡터는 같은 데이터 여러 개 (하나의 유형만 가능)
#문자 > 복소수> 수치> 논리
a1= c(100,"문자 ", 10 >20, 1+2i)  #다 문자열로 바뀐다. (우선순위 고려)

a2= c(100, 10 +20, 1+2i)  #다 복소수로 바뀐다. (우선순위 고려)
a3= c(100, 10 +20, "점심 뭐먹어?")  #다 복소수로 바뀐다. (우선순위 고려)
a4= c(100, 10 +20,TRUE)  #다 복소수로 바뀐다. (우선순위 고려)


## ---------------------------------------------------------------------
# 데이터 유형의 강제 변환  (as.~)

v1=100
v2=as.character(v1)
v3= as.numeric(v2)
v4=v3+200



#하나의 값으로 이루어진 벡터 

#seq () : 두 개 이상으로 이루어진 벡터 


####### 벡터
v1= c(1,2,3,4,5)
v2= c(100,200,300)
v3= c(999,v1,v2)   #벡터를 결합하였다. 


# : 는 수치형에서만 사용가능.
v4= 1:10
v5= 10:1
v6= 10:10  #L은 Integer
v7= 3: -2


v8=seq( 1, 9, 2)
v9=seq(from= 0, to= 10, by =3)

v10= seq(5, 1 , -2)

v10= seq(5, 1 , -0.3)

v11= sequence(0)
v12= sequence(5)
v13=seq(5)
v14=sequence(-1)   #error (음수는 X)



## ---------------------------------------------------------------------
#rep() : replicate의 약자. 지정된 데이터를 복사해주는 기능


rep("a", times=3)
rep("a",each=3)    
rep(c("a","b"),each=3)      #각각의 반복 
rep(c("a","b"),times=3)     #전체 반복
#each> times
rep(c("a","b"),times=3, each=2)     #전체 반복
rep(10, times=3)

rep(c("a","b"), times=c(3,2))
rep(c("a","b"),times=3, each=2 ,length.out=10) #12개인데 10개만 출력해라


## ---------------------------------------------------------------------
# 벡터: 값 한 개 이상 묶음
# 한 가지 타입

v1=10
v2=c(10,20,30,40,50)
v3=1:5
v4=seq(1,10,2)
v5=sequence(10)

mode(v2)
length(v2)
is.numeric(v2)


names(v2)  #결과:NULL , -->정의된 바가 없다. 

names(v2) = c(" A","B","C","D","E")

v2    #name이랑 같이 짝지어 나온다. 

## ---------------------------------------------------------------------
#벡터의 인덱싱 : weight

v2[0]
v2[1]          # 0번 째 인덱스는 없다.
v2[1:3]
v2[c(1,2,4)]
v2[-c(1,2,4)]  #제외하고 나머지 인덱스 값들을 출력

#이름으로도 접근 가능
v2["D"]

#벡터의 길이가 동일한 경우: 인덱스가 달라도 알아서 연산해준다
v1= 1:3 
v2= 4:6
v1+v2
v1-v2
v1*v2
v1/v2

#재사용 규칙: v1은 3개의 데이터, v2는 6개의 데이터면.. v1이 3개를 더 만든다. (반복)
v1= 1:5
v2= 10:12
v1+v2
v1-v2
v1*v2
v1/v2

#요인
#5명의 점수가 있다... 벡터로 저장한다. 
#이름이 있다.

mid_score=c( 60,50,40,80,90 )
names(mid_score) = c(" Alice","Bob","Carol","Dean","Emily")

#10점씩 올려준다. 
mid_score=mid_score+10
mid_score

## ---------------------------------------------------------------------
# 요인: R의 데이터 중에서 하나이며 벡터의 한 종류
# 벡터와 요인 모두 1차원의 형태로 자료가 되어 있음.
# 요인은 범주형 자료로 인식 
#집단별로 자료를 분석하고자 할 때 특정 자료를 범주형 자료로 변경가능.
#factor() 사용


we = c("m","m","f","f","m")
we[1]="A"
we = c("m","m","f","f","m")
we2=factor(we)  # ----> levels f m 생성
levels(we2)
we2[1]='A'       # factor를 지정해주면... f m 이외의 값이 저장 X
we2[1]="f"
we2[1]="m"

we3=factor(we, levels=c("m","f"),
                labels= c("남자","여자"),
                ordered=FALSE)  # 순서대로 매칭시킨다. 

we4=factor(we, levels=c("m","f")
                , ordered=TRUE)
we5=factor(we, levels=c("f","m")
                , ordered=TRUE)
sort(we3)
sort(we4)
sort(we5)

#factor에서 범주의 수를 알고 싶다.
nlevels(we5)    #factor에서 범주의 수를 알고 싶다. 
is.factor(we5)    #범주형인지 확인
is.ordered(we5)    #sort 된 것인지 확인.
is.ordered(we3)


## ---------------------------------------------------------------------
#행렬

# 벡터의 확장 개념.
# 벡터와 동일하게 하나의 데이터 유형만 가질 수 있음.
#수학이나 통계에서 주로 사용
#rbind(), cbind(), matrix


#matrix (행렬) : default는 열이 먼저 채워진다****** 
 matrix (data=1:10, nrow=2)   #열 우선!!!!!!!!
 matrix (data=1:10, nrow=2, byrow= TRUE)   #행 우선!!!!!!!!
 matrix (c(1,2,4,2,7,8,3,4,5,2), nrow=5, ncol=2)  
matrix (sequence(10), nrow=5, ncol=2)   
mydata= matrix (sequence(10), nrow=5, ncol=2, byrow=TRUE)   

mydata[2,2]
mydata[3,1]
mydata[2,]   #2행만 조회
mydata[,2]   #2열만 조회

v1= c(1,2,3,4,5)
v2=c(10,20,30,40,50)

rbind(v1,v2)    #알
cbind(v1,v2)

## ---------------------------------------------------------------------
#배열 (array)
#갯수가 맞지 않으면... recycling 

arr = array(1:10, dim= 10);arr
arr = array(1:10, dim= c(2,5) );arr
arr = array(1:15, dim= c(3,5) ) ; arr
arr = array(1:30, dim= c(2,3,5) ) ; arr

?array 

arr[, , 5]
arr[2, , 5]


## ---------------------------------------------------------------------
# 리스트 
# R의 데이터 형태만 벡터, 요인, 행렬, 배열, 데이터프레임과 리스트 자체까지 원소로 가질 수 있음.

#리스트 구조로 데이터 저자해서 분석

data()
mydata= iris 
mode(mydata)    #list라고 나옴.
class(mydata)   #data frame이라고 나옴 (객체지향적 관점에서)_

data(iris)
iris


##List 
v1= c(1,2,3,4,5)
m1= matrix(c(100,200,300,400), nrow=2, ncol=2)
m1


arr= array(1:15, c(3,5,2))
arr

alist = list(v1, m1, arr)
alist

alist[1]
alist[2]
alist[3]  
alist[[1]][3] 

alist[[2]][2,2]
alist [[3]][2,2,2]
alist [[3]][2,4,2]

alist[1]+10     #리스트 연산은 안된다. 
alist[[1]]+10    #[] 더 추가해야 벡터 연산이 되서 가능해진다. 


blist= list(" 멀티 ", 100, c(1,2,3),iris)  #문자, 숫자, 숫자, 데이터프레임

blist[1]="캠퍼스"

blist[2]=200

blist[[3]]=blist[[3]] +10   #[] 하나 더 추가해줘야 안으로 들어가서 바꿔준다. 
blist[3]

blist[4]= blist[4]
  