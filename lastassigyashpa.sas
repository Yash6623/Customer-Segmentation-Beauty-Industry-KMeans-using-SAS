/* Summary Statistics */
ods noproctitle;
ods graphics / imagemap=on;

proc means data=MKTG525.CLUSTERDATA chartype mean std min max n nmiss vardef=df 
		q1 q3 qrange qmethod=os;
	var Age Annual_Income Spending_Score CustomerID;
run;

/* Outlier removal */
proc univariate data=MKTG525.CLUSTERDATA noprint;
   var Annual_Income;
   output out=iqr_out 
       Q1=Q1 
       Q3=Q3;
run;
data _null_;
   set iqr_out;
   call symputx('lower_limit', Q1 - 1.5*(Q3 - Q1));
   call symputx('upper_limit', Q3 + 1.5*(Q3 - Q1));
run;
data no_outliers;
   set MKTG525.CLUSTERDATA;
   if Annual_Income >= &lower_limit and Annual_Income <= &upper_limit;
run;


/*Correlation Analysis*/
ods noproctitle;
ods graphics / imagemap=on;

proc corr data=no_outliers pearson nosimple noprob plots=none;
	var Age Annual_Income Spending_Score;
run;



/*Cluster Analysis*/
/*K-Means Clustering for 3 clusters*/

ods noproctitle;

proc stdize data=no_outliers out=Work._std_ method=range;
   var Age Annual_Income Spending_Score;
run;

proc fastclus data=Work._std_ out=Work.cluster_results maxclusters=3;
   var Age Annual_Income Spending_Score;
run;


proc delete data=Work._std_;
run;

/*K-Means Clustering for 4 clusters*/

ods noproctitle;

proc stdize data=WORK.NO_OUTLIERS out=Work._std_ method=range;
	var Age Annual_Income Spending_Score;
run;

proc fastclus data=Work._std_ out=Work.cluster_results4 maxclusters=4;
	var Age Annual_Income Spending_Score;
run;

proc delete data=Work._std_;
run;

/*K-Means Clustering for 5 clusters*/

ods noproctitle;

proc stdize data=WORK.NO_OUTLIERS out=Work._std_ method=range;
	var Age Annual_Income Spending_Score;
run;

proc fastclus data=Work._std_ out=Work.cluster_results5 maxclusters=5;
	var Age Annual_Income Spending_Score;
run;

proc delete data=Work._std_;
run;

/*K-Means Clustering for 6 clusters*/

ods noproctitle;

proc stdize data=WORK.NO_OUTLIERS out=Work._std_ method=range;
	var Age Annual_Income Spending_Score;
run;

proc fastclus data=Work._std_ out=Work.cluster_results6 maxclusters=6;
	var Age Annual_Income Spending_Score;
run;

proc delete data=Work._std_;
run;

/*K-Means Clustering for 7 clusters*/

ods noproctitle;

proc stdize data=WORK.NO_OUTLIERS out=Work._std_ method=range;
	var Age Annual_Income Spending_Score;
run;

proc fastclus data=Work._std_ out=Work.cluster_results7 maxclusters=7;
	var Age Annual_Income Spending_Score;
run;

proc delete data=Work._std_;
run;

/* final cluster selection. I decided to go with K=7 */

/* Combine Tables*/
/*  Final Cluster Assignment Selection (K = 7 */



proc sql noprint;
	create table work.combine as select a.Age, a.Annual_Income, a.Spending_Score, 
		b.CLUSTER from WORK.NO_OUTLIERS as a, WORK.CLUSTER_RESULTS7 as b where 
		a.CustomerID=b.CustomerID;
quit;

/*Create Cluster Means*/
/*Summary Statistics*/

ods noproctitle;
ods graphics / imagemap=on;

proc means data=WORK.COMBINE chartype mean std min max median n vardef=df 
		qmethod=os;
	var Age Annual_Income Spending_Score;
	class CLUSTER;
run;
