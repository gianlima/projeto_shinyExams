# nome de cada arquivo
arquivo <- paste0('exercicios/',list.files('exercicios'))
# cria data frame
dados <<- data.frame(arquivos = arquivo)
# transforma em texto o nome de cada arquivo
dados$arquivos <<- as.character(dados$arquivos)
# coloca o conteudo
for (num in 1:dim(dados)[1]){
  dados$conteudo[num] <<- paste(readLines(dados$arquivos[num],n = -1, 
                                          encoding = "UTF-8"), 
                                collapse=" ")
}

# tipo
# nome
# conteudo

options <- c('schoice','mchoice','num','cloze','string')
for(i in options){
  dados$tipo[grepl(paste0('extype: ',i), dados$conteudo)] <<- i
}


as.data.frame(dados$arquivos[dados$tipo == input$select])

as.data.frame(dados$arquivos[grepl(input$select, dados$conteudo)])

exercicios <- as.data.frame(dados$arquivos[grepl('extype: schoice', dados$conteudo)])
names(exercicios) <- 'blue'

jj <- dados$arquivos[grepl('extype: schoice', dados$conteudo)]

gsub('^.*exercicios/\\s*|\\s*.Rmd.*$', '', jj)

a <- dados$arquivos[grepl(input$select, dados$conteudo)]
exercicios <- as.data.frame(gsub('^.*exercicios/\\s*|\\s*.Rmd.*$', '', a))
names(exercicios) <- 'Exercicios'

dados$desc <- gsub('^.*exname:\\s*|\\s*;;.*$', '', dados$conteudo)

dados[input$opcao_exercicios_rows_selected,c(1,3)]


length(as.character(exerciciosExame))

file.exists('exercicios/anova.Rmd')


exerciciosExame[exerciciosExame == "dist3"] <- NULL

exerciciosExame[exerciciosExame == "swisscapital"] <- NULL


exerciciosExame[exerciciosExame == "hessian"]

arquivo <- list.files('exercicios')
dados <- data.frame(arquivos = arquivo)
dados$arquivos <- as.character(dados$arquivos)

unlist(strsplit('a.rmd', split='.', fixed=TRUE))[1]

list.files('exercicios')

?lapply

exs <- as.character(list.files('exercicios'))
arquivos <- unlist(lapply(exs, function(x) unlist(strsplit(x, split='.', fixed=TRUE))[1]))
dados <- data.frame(arquivo =  arquivos)
dados$arquivo <- as.character(dados$arquivo)
dados$conteudo <- lapply(dados$arquivo, colocarConteudo)
dados$desc <- gsub('^.*exname:\\s*|\\s*;;.*$', '', dados$conteudo)

colocarConteudo <- function(x){
  paste(readLines(paste0('exercicios/',x,'.Rmd'),n = -1, 
                  encoding = "UTF-8"), 
        collapse=" ")
}

user <- 'gian'
exs <- as.character(c(list.files('exercicios',full.names = TRUE),
                      list.files(paste0('usuarios/',user,'/EXS'), full.names = TRUE)))
dados <- data.frame(arquivo =  exs)
dados$arquivo <- as.character(dados$arquivo)
dados$conteudo <- lapply(dados$arquivo, colocarConteudo)
dados$desc <- gsub('^.*exname:\\s*|\\s*;;.*$', '', dados$conteudo)

colocarConteudo <- function(x){
  paste(readLines(x,n = -1,encoding = "UTF-8"),collapse=" ")
}

loadData <- function(user){
  exs <- as.character(c(list.files('exercicios',full.names = TRUE),
                        list.files(paste0('usuarios/',user,'/EXS'), full.names = TRUE)))
  dados <- data.frame(arquivo =  exs)
  dados$arquivo <- as.character(dados$arquivo)
  dados$conteudo <- lapply(dados$arquivo, colocarConteudo)
  dados$desc <- gsub('^.*exname:\\s*|\\s*;;.*$', '', dados$conteudo)
}

nome <- 'exercicios/pessoal1.Rmd'

if()
gsub('^.*/\\s*|\\s*.Rmd.*$', '', input$opcao_exercicios_cell_clicked$value)

dados$desc[grepl(paste0('usuarios/',user,'/'), dados$arquivo)]
exercicios


a <- dados$arquivo[grepl('usuarios', dados$arquivo)]
exercicios <- as.data.frame(a)


cor1 <- 'verde'
cor2 <- 'verde'

if((cor1 == 'azul' | cor1 == 'verde') | (cor2 == 'azul' | cor2 == 'verde')){
  print('peguei')
}


a <- dados$arquivo[grepl('usuarios', dados$conteudo)]
a <- gsub('^.*/\\s*|\\s*.Rmd.*$', '', a)

a <- dados$arquivo[grepl('usuarios', dados$arquivo)]

ex <- 'pessoal1'

if(any(dados$arquivo == paste0('exercicios/',ex,'.Rmd'))){
  dados$desc[(dados$arquivo == paste0('exercicios/',ex,'.Rmd'))]
} else {
  dados$desc[(dados$arquivo == paste0('usuarios/','gian','/EXS/',ex,'.Rmd'))]
}

an <- "# Zurique é a capital da Suíça.
# Italiano é uma língua oficial na Suíça.
# A moeda na Suíça é o euro.
# A Suíça faz parte da União Européia (UE).
# O feriado nacional da Suíça é 1 de agosto."

# contar quantos # tem 
str_count(an, pattern = "#")
# substituir # por * 
gsub("#", "*", an)

criar_exsolution <- function(){
  
}

total <- 5
corretas <- "1,"

unlist(strsplit(corretas, split=','))

correct <- '1,3'
split <- unlist(strsplit(correct, ","))
exsolution <- as.character(1:total) %in% split
exsolution[exsolution == FALSE] <- 0
exsolution[exsolution == TRUE] <- 1
exsolution <- paste(exsolution , collapse ="")
exsolution

an <- "# Zurique é a capital da Suíça.
# Italiano é uma língua oficial na Suíça.
# A moeda na Suíça é o euro.
# A Suíça faz parte da União Européia (UE).
# O feriado nacional da Suíça é 1 de agosto." # será answerlist1Input
library(stringr)
total <- str_count(an, pattern = "#")
correct <- '1,5' # será exsolutionInput
split <- unlist(strsplit(correct, ","))
# preenche de 0
exsolution <- rep(0,total)
exsolution[as.numeric(split)] <- 1
if(length(exsolution[exsolution == 1]) == 1 ){
  extype <- 'extype: schoice'
} else { extype <- 'extype: mchoice'}
# answerlist2Input OPTIONAL
valores <- exsolution
valores[valores == 0] <- '* Falso\n'
valores[valores == 1] <- '* Verdadeiro\n'
valores <- paste(valores , collapse ="")
# EXSOLUTION FINAL
exsolution <- paste(exsolution , collapse ="")
exsolution <- paste0('exsolution: ',exsolution)
an <- gsub("#", "*", an)

# --------------------------------------------------------------------------------

criarExer <- function(codeInput = "",questionInput,answerlist1Input,solutionInput = "",
                      answerlist2Input,exnameInput,exsolutionInput,
                      exshuffleInput,nameInput,user){
  code <- '```{r data generation, echo = FALSE, results = "hide"}'
  codeInput <- paste0(codeInput,'\n```')
  question <- "\nQuestion\n========"
  # questionInput
  answerlist <- "\nAnswerlist\n----------"
  # answerlist1Input
  solution <- "\nSolution\n========"
  # solutionInput
  metaInformation <- "\nMeta-information\n================"
  exnameInput <- paste0("exname: ",exnameInput,';;')
  
  total <- str_count(answerlist1Input, pattern = "#")
  # exsolutionInput <- '1,5' # será exsolutionInput
  split <- unlist(strsplit(exsolutionInput, ","))
  # preenche de 0
  exsolution <- rep(0,total)
  exsolution[as.numeric(split)] <- 1
  if(length(exsolution[exsolution == 1]) == 1 ){
    extype <- 'extype: schoice'
  } else { extype <- 'extype: mchoice'}
  # answerlist2Input OPTIONAL
  valores <- exsolution
  valores[valores == 0] <- '* Falso\n'
  valores[valores == 1] <- '* Verdadeiro\n'
  valores <- paste(valores , collapse ="")
  # EXSOLUTION FINAL
  exsolution <- paste(exsolution , collapse ="")
  exsolution <- paste0('exsolution: ',exsolution)
  answerlist1Input <- gsub("#", "*", answerlist1Input)
  exshuffleInput <- paste0('exshuffle: ',exshuffleInput)
  cat(code,codeInput,question,questionInput,
      answerlist,answerlist1Input,
      solution,solutionInput,answerlist,answerlist2Input,metaInformation,exnameInput,
      extype,exsolution,exshuffleInput,
      file = paste0('usuarios/',user,'/EXS/',nameInput,'.Rmd'),sep = "\n")
}


criarExer(#
          questionInput = a,answerlist1Input = b,solutionInput = c,
          answerlist2Input = d,exnameInput = e,exsolutionInput = '2',
          exshuffleInput = 5,nameInput = 'esteNome',user = 'gian')

a <- "Qual é a sede das autoridades federais na Suíça (ou seja, a capital de fato)?"
b <- "# Basileia
# Berna
# Geneva 
# Lausana 
# Zurique 
# São Galo
# Vaduz "
c <- "Não há capital de jure, 
mas a capital de facto e a sede 
das autoridades federais são em Berna."
d <- "* Falso
* Verdadeiro
* Falso
* Falso
* Falso
* Falso
* Falso"
e <- "capital de fato da Suíça, apenas uma resposta correta"










