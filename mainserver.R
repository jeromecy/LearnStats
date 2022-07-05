### addition
subvalidfun <- function(x){
  if(!is.na(x[5])){
    if(as.integer(x[1])+as.integer(x[3]) == as.integer(x[5])){
      x[6] = "Yes!"
    }else{
      x[6] = "X"
    }
  }else{
    x[6] = "X"
  }
  return(x[6])
}

outtable <- reactiveValues(data = NULL)

observeEvent(input$addbutton, {
  a <- sample(0:input$addslide,10,replace = TRUE)
  b <- sapply(a,FUN=function(x) sample(0:(input$addslide-x),1))

  myTable <- data.frame(a = a, p = rep("+",10),b = b,
                        eq = rep("=",10),
                        result = rep(NA,10),
                        mark = rep(NA,10))
  outtable$data <- myTable
})

observeEvent(input$addtable_cell_edit, {
  row  <- input$addtable_cell_edit$row
  clmn <- input$addtable_cell_edit$col
  outtable$data[row, clmn] <- input$addtable_cell_edit$value
})


observeEvent(input$addsubbutton, {
  proxy=dataTableProxy("addtable")
  
  myTable <- outtable$data
  myTable[,6] <- apply(myTable, 1, subvalidfun)
  replaceData(proxy,myTable,resetPaging = FALSE)
  
})

output$addtable <- DT::renderDataTable({
  outable <- datatable(outtable$data, 
            # editable = list(target = "column",
            #                 numeric = 5,
            #                 disable = list(columns = c(1:4,6))),
            editable = TRUE,
            colnames  = NULL,
            selection = 'none', 
            options   = list(
              paging = FALSE,
              searching = FALSE,
              columnDefs = list(list(className = 'dt-center', 
                                     targets = 1:6)
              )
            )) %>% formatStyle(columns = 1:6, 
                               fontSize = '200%')
  return(outable)
})



### subtraction
minusvalidfun <- function(x){
  if(!is.na(x[5])){
    if(as.integer(x[1])-as.integer(x[3]) == as.integer(x[5])){
      x[6] = "Yes!"
    }else{
      x[6] = "X"
    }
  }else{
    x[6] = "X"
  }
  return(x[6])
}

minusouttable <- reactiveValues(data = NULL)

observeEvent(input$minusbutton, {
  a <- sample(0:input$minusslide,10,replace = TRUE)
  b <- sapply(a,FUN=function(x) sample(0:x,1))
  
  myTable <- data.frame(a = a, p = rep("-",10),b = b,
                        eq = rep("=",10),
                        result = rep(NA,10),
                        mark = rep(NA,10))
  minusouttable$data <- myTable
})

observeEvent(input$minustable_cell_edit, {
  row  <- input$minustable_cell_edit$row
  clmn <- input$minustable_cell_edit$col
  minusouttable$data[row, clmn] <- input$minustable_cell_edit$value
})


observeEvent(input$minussubbutton, {
  proxy=dataTableProxy("minustable")
  
  myTable <- minusouttable$data
  myTable[,6] <- apply(myTable, 1, minusvalidfun)
  replaceData(proxy,myTable,resetPaging = FALSE)
  
})

output$minustable <- DT::renderDataTable({
  outable <- datatable(minusouttable$data, 
                       # editable = list(target = "column",
                       #                 numeric = 5,
                       #                 disable = list(columns = c(1:4,6))),
                       editable = TRUE,
                       colnames  = NULL,
                       selection = 'none', 
                       options   = list(
                         paging = FALSE,
                         searching = FALSE,
                         columnDefs = list(list(className = 'dt-center', 
                                                targets = 1:6)
                         )
                       )) %>% formatStyle(columns = 1:6, 
                                          fontSize = '200%')
  return(outable)
})

  
  