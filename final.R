getwd()
setwd("/Users/hwangseoyeon/Desktop/Final")
getwd()

library(readr)
data_air <- read_csv("data_air.csv")
View(data_air)

library(readr)
PM2_5 <- read_csv("PM2.5.csv")
View(PM2_5)

library(readr)
PM10 <- read_csv("PM10.csv")
View(PM10)

#특정 데이터 추출 (지역별 )
f1 = subset(data_air,시군별=='전주');f1
f2 = subset(data_air,시군별=='군산');f2
f3 = subset(data_air,시군별=='익산');f3
f4 = subset(data_air,시군별=='정읍');f4

#미세먼지 평균
Pm10_1=sum(f1$`미세먼지`);Pm10_1 = Pm10_1/5; Pm10_1
Pm10_2=sum(f2$`미세먼지`);Pm10_2 = Pm10_2/3; Pm10_2
Pm10_3=sum(f3$`미세먼지`);Pm10_3 = Pm10_3/3; Pm10_3
Pm10_4=sum(f4$`미세먼지`);Pm10_4 = Pm10_4/2; Pm10_4

#초미세먼지 평균 
Pm2_5_1=sum(f1$`초미세먼지`);Pm2_5_1 = round(Pm2_5_1/5); Pm2_5_1
Pm2_5_2=sum(f2$`초미세먼지`);Pm2_5_2 = round(Pm2_5_2/3); Pm2_5_2
Pm2_5_3=sum(f3$`초미세먼지`);Pm2_5_3 = round(Pm2_5_3/3); Pm2_5_3
Pm2_5_4=sum(f4$`초미세먼지`);Pm2_5_4 = round(Pm2_5_4/2); Pm2_5_4

지역 = c('전주','군산','익산','정읍')
미세먼지 = c(Pm10_1,Pm10_2,Pm10_3,Pm10_4)
초미세먼지 = c(Pm2_5_1,Pm2_5_2,Pm2_5_3,Pm2_5_4)

미세먼지_df = data.frame(지역,미세먼지);미세먼지_df
미세먼지_df_new= merge(미세먼지_df,PM10,by=c('미세먼지'));미세먼지_df_new
미세먼지_f = as.data.frame(미세먼지_df_new) ;미세먼지_f

초미세먼지_df = data.frame(지역,초미세먼지);초미세먼지_df
초미세먼지_df_new= merge(초미세먼지_df,PM2_5,by=c('초미세먼지'))
초미세먼지_df_new
초미세먼지_f = as.data.frame(초미세먼지_df_new) ;초미세먼지_f

final_df = merge(미세먼지_f,초미세먼지_f,by=c("지역"))
final_df=as.data.frame(final_df);final_df

#데이터 분석(막대그래프)
f1_city = as.vector(data_air$측정지역); f1_city
f1_PM10 = as.vector(data_air$미세먼지); f1_PM10
f1_PM2_5 = as.vector(data_air$초미세먼지); f1_PM2_5 

b1 = barplot(f1_PM10,names.arg=c('개정동','금암동','남중동','모현동','삼천동',
                             '소룡동','송천동','신태인','신풍동','연지동',
                             '중앙동','팔복동','팔봉동'));b1
abline(h=30,col="green",lty=3) #보통 선 
b2 = barplot(f1_PM2_5,names.arg=c('개정동','금암동','남중동','모현동','삼천동',
                                 '소룡동','송천동','신태인','신풍동','연지동',
                                 '중앙동','팔복동','팔봉동'));b2
abline(h=17,col="green",lty=3) # 보통 선

