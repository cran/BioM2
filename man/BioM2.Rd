% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BioM2.R
\name{BioM2}
\alias{BioM2}
\title{Biologically Explainable Machine Learning Framework}
\usage{
BioM2(
  TrainData = NULL,
  TestData = NULL,
  pathlistDB = NULL,
  FeatureAnno = NULL,
  resampling = NULL,
  nfolds = 5,
  classifier = "liblinear",
  paramlist = NULL,
  predMode = "probability",
  PathwaySizeUp = 200,
  PathwaySizeDown = 20,
  MinfeatureNum_pathways = 10,
  Add_UnMapped = TRUE,
  Unmapped_num = 300,
  Add_FeartureSelection_Method = "wilcox.test",
  Inner_CV = TRUE,
  inner_folds = 10,
  Stage1_FeartureSelection_Method = "cor",
  cutoff = 0.3,
  Stage2_FeartureSelection_Method = "RemoveHighcor",
  cutoff2 = 0.95,
  classifier2 = NULL,
  target = "predict",
  p.adjust.method = "fdr",
  save_pathways_matrix = FALSE,
  cores = 1,
  verbose = TRUE
)
}
\arguments{
\item{TrainData}{The input training dataset. The first column
is the label or the output. For binary classes,
0 and 1 are used to indicate the class member.}

\item{TestData}{The input test dataset. The first column
is the label or the output. For binary classes,
0 and 1 are used to indicate the class member.}

\item{pathlistDB}{A list of pathways with pathway IDs and their
corresponding genes ('entrezID' is used).
For details, please refer to ( data("GO2ALLEGS_BP") )}

\item{FeatureAnno}{The annotation data stored in a data.frame for probe
mapping. It must have at least two columns named 'ID' and 'entrezID'.
(For details, please refer to data( data("MethylAnno") )}

\item{resampling}{Resampling in mlr3verse.}

\item{nfolds}{k-fold cross validation ( Only supported when TestData = NULL )}

\item{classifier}{Learners in mlr3}

\item{paramlist}{Learner parameters search spaces}

\item{predMode}{The prediction mode. Currently only supports 'probability' for binary classification tasks.}

\item{PathwaySizeUp}{The upper-bound of the number of genes in each
biological pathways.}

\item{PathwaySizeDown}{The lower-bound of the number of genes in each
biological pathways.}

\item{MinfeatureNum_pathways}{The minimal defined pathway size after mapping your
own data to pathlistDB(KEGG database/GO database).}

\item{Add_UnMapped}{Whether to add unmapped probes for prediction}

\item{Unmapped_num}{The number of unmapped probes}

\item{Add_FeartureSelection_Method}{Feature selection methods.}

\item{Inner_CV}{Whether to perform a k-fold verification on the training set.}

\item{inner_folds}{k-fold verification on the training set.}

\item{Stage1_FeartureSelection_Method}{Feature selection methods.}

\item{cutoff}{The cutoff used for feature selection threshold. It can be any value
between 0 and 1.}

\item{Stage2_FeartureSelection_Method}{Feature selection methods.}

\item{cutoff2}{The cutoff used for feature selection threshold. It can be any value
between 0 and 1.}

\item{classifier2}{Learner for stage 2 prediction(if classifier2==NULL,then it is the same as the learner in stage 1.)}

\item{target}{Is it used to predict or explore potential biological mechanisms?
Available options are c('predict', 'pathways').}

\item{p.adjust.method}{p-value adjustment method.(holm", "hochberg", "hommel", "bonferroni", "BH", "BY",}

\item{save_pathways_matrix}{Whether to output the path matrix file}

\item{cores}{The number of cores used for computation.}

\item{verbose}{Whether to print running process information to the console}
}
\value{
A list containing prediction results and prediction result evaluation
}
\description{
Biologically Explainable Machine Learning Framework
}
\examples{



library(mlr3verse)
library(caret)
library(parallel)
library(BioM2)
data=MethylData_Test
set.seed(1)
part=unlist(createDataPartition(data$label,p=0.8))
Train=data[part,]
Test=data[-part,]
pathlistDB=GO2ALLEGS_BP
FeatureAnno=MethylAnno


pred=BioM2(TrainData = Train,TestData = Test,
           pathlistDB=pathlistDB,FeatureAnno=FeatureAnno,
           classifier='svm',nfolds=5,
           PathwaySizeUp=25,PathwaySizeDown=20,MinfeatureNum_pathways=10,
           Add_UnMapped='Yes',Unmapped_num=300,
           Inner_CV='None',inner_folds=5,
           Stage1_FeartureSelection_Method='cor',cutoff=0.3,
           Stage2_FeartureSelection_Method='None',
           target='predict',cores=1
)#(To explore biological mechanisms, set target=‘pathways’)



}
