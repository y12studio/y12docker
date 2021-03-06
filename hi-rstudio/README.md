[Home · rocker-org/rocker Wiki](https://github.com/rocker-org/rocker/wiki)

test
----------

```
$ docker-compose build
$ docker-compose up -d
$ curl http://localhost:8787/
rstudio/rstudio
```

bitcoin Hashrate
--------

```
require(Quandl)
require(forecast)
bdata <- Quandl("BITCOINWATCH/MINING", authcode="YOUR_CODE")
names(bdata)[13] <- "THS"
plot(bdata$Date,bdata$THS/1000,type="l")
bts <- xts(bdata$THS/1000,bdata$Date)
plot(forecast(bts,h=30,level=c(50,95))),include=365)

summary(bdata)
      Date              Total BTC        Market Cap USD      Transactions last 24h Transactions avg. per hour
 Min.   :2013-08-26   Min.   :11608775   Min.   :1.342e+09   Min.   :  1407        Min.   :  58.63
 1st Qu.:2014-02-15   1st Qu.:12396938   1st Qu.:3.392e+09   1st Qu.: 60431        1st Qu.:2517.97
 Median :2014-07-21   Median :13048000   Median :5.120e+09   Median : 70476        Median :2936.52
 Mean   :2014-07-15   Mean   :12991067   Mean   :5.416e+09   Mean   : 73936        Mean   :3080.68
 3rd Qu.:2014-12-17   3rd Qu.:13620306   3rd Qu.:7.382e+09   3rd Qu.: 87617        3rd Qu.:3650.70
 Max.   :2015-05-18   Max.   :14175100   Max.   :1.293e+10   Max.   :119926        Max.   :4996.92
                                                             NA's   :10            NA's   :10
 Bitcoins sent last 24h Bitcoins sent avg. per hour     Count        Blocks last 24h Blocks avg. per hour
 Min.   :  16775        Min.   :   698.9            Min.   :254350   Min.   :  0.0   Min.   : 0.000
 1st Qu.: 582337        1st Qu.: 24264.0            1st Qu.:285876   1st Qu.:144.0   1st Qu.: 6.000
 Median : 769658        Median : 32069.1            Median :311919   Median :158.0   Median : 6.580
 Mean   : 863080        Mean   : 35961.7            Mean   :309642   Mean   :157.6   Mean   : 6.566
 3rd Qu.:1017163        3rd Qu.: 42381.8            3rd Qu.:334811   3rd Qu.:172.0   3rd Qu.: 7.170
 Max.   :3590447        Max.   :149601.9            Max.   :357003   Max.   :257.0   Max.   :10.710
 NA's   :10             NA's   :10
   Difficulty        Next Difficulty          THS           Network Hashrate PetaFLOPS
 Min.   :6.575e+07   Min.   :6.850e+07   Min.   :   490.3   Min.   :   6227
 1st Qu.:2.621e+09   1st Qu.:2.997e+09   1st Qu.: 21456.1   1st Qu.: 272492
 Median :1.734e+10   Median :1.867e+10   Median :133679.1   Median :1697725
 Mean   :2.166e+10   Mean   :2.210e+10   Mean   :158215.9   Mean   :2009342
 3rd Qu.:4.030e+10   3rd Qu.:4.025e+10   3rd Qu.:288139.2   3rd Qu.:3659368
 Max.   :4.945e+10   Max.   :4.990e+10   Max.   :357210.0   Max.   :4536567


summary(bts)
      Index                 bts
  Min.   :2013-08-26   Min.   :  0.4903  
  1st Qu.:2014-02-15   1st Qu.: 21.4561  
  Median :2014-07-21   Median :133.6791  
  Mean   :2014-07-15   Mean   :158.2159  
  3rd Qu.:2014-12-17   3rd Qu.:288.1392  
  Max.   :2015-05-18   Max.   :357.2100  

str(bts)
 An ‘xts’ object on 2013-08-26/2015-05-18 containing:
   Data: num [1:582, 1] 0.49 0.501 0.507 0.52 0.539 ...
   Indexed by objects of class: [Date] TZ: UTC
   xts Attributes:  
  NULL

 summary(forecast(bts,h=60,level=c(50,95)))

 Forecast method: ETS(M,A,N)

 Model Information:
 ETS(M,A,N)

 Call:
  ets(y = object, lambda = lambda, allow.multiplicative.trend = allow.multiplicative.trend)

   Smoothing parameters:
     alpha = 0.334
     beta  = 0.0479

   Initial states:
     l = 0.4668
     b = 0.0152

   sigma:  0.0534

      AIC     AICc      BIC
 5106.557 5106.627 5124.023

 Error measures:
                      ME   RMSE      MAE        MPE     MAPE    MASE      ACF1
 Training set 0.03874472 4.1462 2.089518 -0.2958218 2.487638 1.40575 0.3384145

 Forecasts:
     Point Forecast    Lo 50    Hi 50        Lo 95     Hi 95
 583       349.5811 336.9902 362.1720  312.9938963  386.1683
 584       350.6763 336.9323 364.4203  310.7384109  390.6142
 585       351.7715 336.7257 366.8174  308.0506377  395.4924
 586       352.8668 336.3819 369.3517  304.9641654  400.7694
 587       353.9620 335.9118 372.0122  301.5109808  406.4130
 588       355.0572 335.3255 374.7889  297.7198982  412.3945
 589       356.1524 334.6316 377.6733  293.6160678  418.6888
 590       357.2477 333.8374 380.6579  289.2210680  425.2742
 591       358.3429 332.9494 383.7364  284.5532613  432.1325
 592       359.4381 331.9728 386.9034  279.6282348  439.2480
 593       360.5333 330.9123 390.1543  274.4592341  446.6074
 594       361.6286 329.7717 393.4854  269.0575515  454.1996
 595       362.7238 328.5544 396.8931  263.4328579  462.0147
 596       363.8190 327.2632 400.3748  257.5934788  470.0445
 597       364.9142 325.9006 403.9278  251.5466197  478.2818
 598       366.0094 324.4688 407.5501  245.2985506  486.7203
 599       367.1047 322.9695 411.2398  238.8547550  495.3546
 600       368.1999 321.4046 414.9951  232.2200514  504.1797
 601       369.2951 319.7755 418.8147  225.3986917  513.1915
 602       370.3903 318.0834 422.6973  218.3944425  522.3862
 603       371.4856 316.3296 426.6416  211.2106507  531.7605
 604       372.5808 314.5149 430.6466  203.8502985  541.3113
 605       373.6760 312.6405 434.7116  196.3160486  551.0360
 606       374.7712 310.7070 438.8355  188.6102820  560.9322
 607       375.8665 308.7152 443.0177  180.7351293  570.9978
 608       376.9617 306.6658 447.2576  172.6924978  581.2309
 609       378.0569 304.5593 451.5545  164.4840940  591.6297
 610       379.1521 302.3963 455.9079  156.1114423  602.1928
 611       380.2473 300.1773 460.3174  147.5759022  612.9188
 612       381.3426 297.9026 464.7826  138.8786815  623.8065
 613       382.4378 295.5726 469.3030  130.0208496  634.8547
 614       383.5330 293.1877 473.8783  121.0033468  646.0627
 615       384.6282 290.7481 478.5084  111.8269945  657.4295
 616       385.7235 288.2541 483.1928  102.4925029  668.9544
 617       386.8187 285.7059 487.9314   93.0004779  680.6369
 618       387.9139 283.1037 492.7241   83.3514273  692.4764
 619       389.0091 280.4475 497.5707   73.5457667  704.4725
 620       390.1044 277.7376 502.4711   63.5838237  716.6249
 621       391.1996 274.9740 507.4252   53.4658429  728.9333
 622       392.2948 272.1567 512.4329   43.1919891  741.3976
 623       393.3900 269.2859 517.4942   32.7623512  754.0177
 624       394.4852 266.3614 522.6091   22.1769452  766.7936
 625       395.5805 263.3833 527.7776   11.4357167  779.7252
 626       396.6757 260.3515 532.9999    0.5385436  792.8128
 627       397.7709 257.2660 538.2758  -10.5147617  806.0566
 628       398.8661 254.1267 543.6056  -21.7244504  819.4567
 629       399.9614 250.9335 548.9892  -33.0908353  833.0136
 630       401.0566 247.6862 554.4270  -44.6142894  846.7275
 631       402.1518 244.3847 559.9189  -56.2952440  860.5989
 632       403.2470 241.0288 565.4652  -68.1341878  874.6283
 633       404.3423 237.6184 571.0661  -80.1316656  888.8162
 634       405.4375 234.1533 576.7217  -92.2882769  903.1632
 635       406.5327 230.6331 582.4323 -104.6046751  917.6701
 636       407.6279 227.0577 588.1982 -117.0815667  932.3374
 637       408.7231 223.4268 594.0195 -129.7197103  947.1660
 638       409.8184 219.7401 599.8966 -142.5199157  962.1567
 639       410.9136 215.9974 605.8298 -155.4830437  977.3102
 640       412.0088 212.1983 611.8194 -168.6100050  992.6276
 641       413.1040 208.3425 617.8656 -181.9017599 1008.1098
 642       414.1993 204.4296 623.9689 -195.3593178 1023.7578

```


test quantmod
-------
```
require(quantmod)
getSymbols(c("AAPL","^GSPC"), src="yahoo", from='1990-01-02',to='2013-12-31')
plot(AAPL)
summary(AAPL)
```

test quandl
```
require(Quandl)
library(ggvis)
library(lubridate)
pppsh <- Quandl("ODA/MOZ_PPPSH", authcode="YOUR_CODE")
pppsh$year <- lubridate::year(pppsh$Date)
pppsh %>%
ggvis(~Date,~Value) %>%
layer_points() %>%
layer_model_predictions(model = input_select(c("loess" = "loess","lm" = "lm"),label = "model")) %>%
layer_smooths(se = TRUE,span = input_slider(min = 0.3, max = 1, value = 0.8, step = 0.1,label = "Smoothing span")) %>%
add_axis("x", title = "Date") %>%
add_axis("y", title = "Mozambique Share of World GDP based on PPP, %")
```
