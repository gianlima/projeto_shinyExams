excluirContaPessoal <- function(user){
  pasta <- paste0('usuarios/',user)
  if(dir.exists(pasta)){
    unlink(pasta, recursive = TRUE)
    return(paste0('Conta do usuário ', user,' removida com sucesso. Sua conta não existe mais.'))
  } else{
    return(paste0('Usuário ', user,' não encontrado.'))
  }
}

qntQuestoes <- 5
valorCadaQuestao <- 10/qntQuestoes
qual <- valorCadaQuestao
for(i in rep(valorCadaQuestao,qntQuestoes-1) ){
    qual <- paste(qual,i,sep = ",")
}



as.numeric(unlist(strsplit('2.5,2.5,2.5,2.5', ",")))


exame <- list(
  "tstat2.Rnw",
  "ttest.Rnw",
  "relfreq.Rnw")

exams2nops(exame, n = 2,
           dir = "nops_pdf", name = "demo", date = "2015-07-29",
           points = c(1.5,2.5,3.5), showpoints = TRUE)


as.numeric(unlist(strsplit('10', ",")))

qntQuestoes <- length(1)
valorCadaQuestao <- round(10/qntQuestoes,digits = 2)
qual <- valorCadaQuestao
for(i in rep(valorCadaQuestao,qntQuestoes-1) ){
  qual <- paste(qual,i,sep = ",")
}
class(qual)
as.character(qual)
if (class(qual) == "numeric"){
  qual <- as.character(qual)
}

# --------------------------------------------------------------------

questionInput <- "Which of the following statements about Switzerland is correct?"
answerlistInput1 <- "* Zurich is the capital of Switzerland.
* Italian is an official language in Switzerland.
* The currency in Switzerland is the Euro.
* Switzerland is part of the European Union (EU).
* The Swiss national holiday is August 1."
solutionInput <- "Esta e a solucao"
answerlistInput2 <- "* False. There is no de jure capital but the de facto capital of Switzerland is Bern.
* True. The official languages are: German, French, Italian, Romansh.
* False. The currency is the Swiss Franc (CHF).
* False. Switzerland is part of the Schengen Area but not the EU.
* True. The establishment of the Swiss Confederation is traditionally dated to August 1, 1291."
exsolutionInput <- "01001"
exshuffle <- "5"

?file.create

file.create('here.txt')
?file.append
file.append("asssim","here.txt")
?paste0
cat('hhh',paste0('a','b'), file = "here.txt",sep = " ")
?cat

codigo <- '```{r data generation, echo = FALSE, results = "hide"}'
codigoInput <- paste0('n <- 9 + sample(1:6, 4)','\n```')
question <- "Question\n========"
answerlist <- "\nAnswerlist\n----------"
solution <- "\nSolution\n========"
metaInformation <- "\nMeta-information\n================"
exnameInput <- paste0("exname: ","About Switzerland",';;')
extype <- paste0("extype: ","mchoice")
exsolution <- paste0("exsolution: ","01001")
exshuffle <- paste0("exshuffle: ","5")

cat(codigo,
    codigoInput,
    question,
    questionInput,
    answerlist,
    answerlistInput1,
    solution,
    solutionInput,
    answerlist,
    answerlistInput2,
    metaInformation,
    exname,
    extype,
    exsolution,
    exshuffle,
    file = "here.Rmd",sep = "\n")

exams2pdf("here.Rmd")

file("here.Rmd",encoding="UTF-8")




