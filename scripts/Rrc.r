ttest <- function(m,s,n,a=0.05) {
	t = qt(c(a/2, 1-a/2), df=n-1)
	se = s/sqrt(n)
	r = c(m+se*t[1],m+se*t[2])
	cat('-----T-Test------\n')
	cat(sprintf('SD: %4.3f, mean: %4.3f, SE: %4.3f\n', s,m,se))
	cat(sprintf('t_%d %%%d interval is: [%4.3f, %4.3f]\n',n-1, (1-a)*100, t[1], t[2]))
	cat(sprintf('Mean %%%d interval is: [%4.3f, %4.3f]\n',(1-a)*100, r[1], r[2]))
}
ttest2 <- function(d,a=0.05) {
	m = mean(d)
	s = sd(d)
	n = length(d)
	ttest(m,s,n,a)
}
ctest <- function(s,n,a=0.05) {
	xru = qchisq(a/2,n-1,ncp=0)
	xrl = qchisq(1-a/2,n-1,ncp=0)
	xl = sqrt((n-1)*s^2/xrl);
	xu = sqrt((n-1)*s^2/xru);
	cat('-----Chi-Square-Test------\n')
	cat(sprintf('Standard deviation is: %4.3f\n',s))
	cat(sprintf('Chi-square %%%d interval for DF %d is: [%4.3f, %4.3f]\n',(1-a)*100, n-1, xrl,xru))
	cat(sprintf('SD %%%d interval is: [%4.3f, %4.3f]\n',(1-a)*100 , xl,xu))
}
ctest2 <- function(d,a=0.05) {
	s = sd(d)
	n = length(d)
	ctest(s,n,a)
}
btest <- function(p,n,a=0.05){
	se = sqrt(p*(1-p)/n)
	q = qnorm(c(a/2, 1-a/2))
	r = c(p+se*q[1],p+se*q[2])
	npq = n*p*(1-p)
	if (npq < 5){
		cat(sprintf("Cant do normal estimation on binomial parameter because npq: %f < 5\n",npq))
	}
	else{
		cat('-----Interval Estimation of Binomial Parameter------\n')
		cat(sprintf("npq: %f > 5\n",npq))
		cat(sprintf("p: %4.3f, n: %d, SE: %4.3f\n",p,n,se))
		cat(sprintf('%%%d z interval is: [%4.3f, %4.3f]\n',(1-a)*100 , q[1], q[2]))
		cat(sprintf('%%%d Confidence interval is: [%4.3f, %4.3f]\n',(1-a)*100 , r[1], r[2]))
	}
}
bootstrap <- function(d,n,r=1000,a=.05){
	s <- numeric(r)
	for(i in 1:r){
		s[i] <- mean(sample(d,n,replace=T))
	}
	print(quantile(s,c(a/2,1-a/2)))
}
ptest <- function(m,m0,s,n,tail=1){
	t = (m-m0)/(s/sqrt(n))
	if(tail>2)tail=2
	if(tail<1)tail=1
	#todo add alpha for critical value test
	cat(sprintf("T-Test: t-value is %4.3f\n",t))
	cat(sprintf("T-Test: The lower p-value is %4.3f\n",pt(t,n-1)*tail))
	cat(sprintf("T-Test: The upper p-value is %4.3f\n",(1-pt(t,n-1))*tail))
}
ptest2 <- function(t,n,tail=1){
	if(tail>2)tail=2
	if(tail<1)tail=1
	cat(sprintf("T-Test: t-value is %4.3f\n",t))
	cat(sprintf("T-Test: The lower p-value is %4.3f\n",pt(t,n-1)*tail))
	cat(sprintf("T-Test: The upper p-value is %4.3f\n",(1-pt(t,n-1))*tail))
}
ztest <- function(m,m0,s,n,tail=1){
	z = (m-m0)/(s/sqrt(n))
	if(tail>2)tail=2
	if(tail<1)tail=1
	cat(sprintf("Z-Test: z-value is %4.3f\n",z))
	cat(sprintf("Z-Test: The lower p-value is %4.3f\n",pnorm(z)*tail))
	cat(sprintf("Z-Test: The upper p-value is %4.3f\n",(1-pnorm(z))*tail))
}
ztest2 <- function(z,tail=1){
	if(tail>2)tail=2
	if(tail<1)tail=1
	cat(sprintf("Z-Test: z-value is %4.3f\n",z))
	cat(sprintf("Z-Test: The lower p-value is %4.3f\n",pnorm(z)*tail))
	cat(sprintf("Z-Test: The upper p-value is %4.3f\n",(1-pnorm(z))*tail))
}
powertest <- function(m0,m1,s,n,a=.05,tail=2){
	if(tail == 1){
		p = pnorm(qnorm(a)+abs(m0-m1)/s*sqrt(n))
	} else if(tail == 2){
		#this is approximation taken from Equation 7.20 @259pp
		p = pnorm(-qnorm(1-a/2)+abs(m0-m1)/s*sqrt(n))
	} else{
		cat("use either one sided or two sided test")
		return
	}
	cat(sprintf("The power is %4.3f\n",p))
	cat(sprintf("%%%d chance of detecting a significant difference using a %%%d
significance level with the sample size %d\n",round(p*100),round(a*100),n))
}
samplesize <- function(m0,m1,s,p=.8,a=.05,tail=2){
	if(tail == 1){
		n = (s^2*(qnorm(1-a)+qnorm(p))^2)/((m0-m1)^2)
	} else if(tail == 2){
		n = (s^2*(qnorm(1-a/2)+qnorm(p))^2)/((m0-m1)^2)
	} else{
		cat("use either one sided or two sided test")
		return
	}
	cat(sprintf("The required sampe size is %4.3f for significance level %%%d with power %%%d\n",
				n,round(a*100),round(p*100)))
}
samplesizeCI <- function(s,L,a=.05){
	n = 4*qnorm(1-a/2)^2*s^2/(L^2)
	cat(sprintf("The required sampe size is %4.3f for significance level %%%d with CI Lenght %4.3f\n",
				n,round(a*100),L))
}

