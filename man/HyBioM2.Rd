% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BioM2.R
\name{HyBioM2}
\alias{HyBioM2}
\title{BioM2 Hyperparametric Combination}
\usage{
HyBioM2(
  TrainData = NULL,
  pathlistDB = NULL,
  FeatureAnno = NULL,
  resampling = NULL,
  nfolds = 5,
  classifier = "liblinear",
  predMode = "probability",
  PathwaySizeUp = 200,
  PathwaySizeDown = 20,
  MinfeatureNum_pathways = 10,
  Add_UnMapped = TRUE,
  Add_FeartureSelection_Method = "wilcox.test",
  Unmapped_num = 300,
  Inner_CV = TRUE,
  inner_folds = 10,
  Stage1_FeartureSelection_Method = "cor",
  stage1_cutoff = 0.3,
  Stage2_FeartureSelection_Method = "RemoveHighcor",
  stage2_cutoff = 0.8,
  classifier2 = NULL,
  cores = 1,
  verbose = TRUE
)
}
\arguments{
\item{TrainData}{The input training dataset. The first column
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

\item{predMode}{The prediction mode. Currently only supports 'probability' for binary classification tasks.}

\item{PathwaySizeUp}{The upper-bound of the number of genes in each
biological pathways.}

\item{PathwaySizeDown}{The lower-bound of the number of genes in each
biological pathways.}

\item{MinfeatureNum_pathways}{The minimal defined pathway size after mapping your
own data to pathlistDB(KEGG database/GO database).}

\item{Add_UnMapped}{Whether to add unmapped probes for prediction}

\item{Add_FeartureSelection_Method}{Feature selection methods.}

\item{Unmapped_num}{The number of unmapped probes}

\item{Inner_CV}{Whether to perform a k-fold verification on the training set.}

\item{inner_folds}{k-fold verification on the training set.}

\item{Stage1_FeartureSelection_Method}{Feature selection methods.}

\item{stage1_cutoff}{The cutoff used for feature selection threshold. It can be any value
between 0 and 1.}

\item{Stage2_FeartureSelection_Method}{Feature selection methods.}

\item{stage2_cutoff}{The cutoff used for feature selection threshold. It can be any value
between 0 and 1.}

\item{classifier2}{Learner for stage 2 prediction(if classifier2==NULL,then it is the same as the learner in stage 1.)}

\item{cores}{The number of cores used for computation.}

\item{verbose}{Whether to print running process information to the console}
}
\value{
A data frame contains hyperparameter results
}
\description{
BioM2 Hyperparametric Combination
}
