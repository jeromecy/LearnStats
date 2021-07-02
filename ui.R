
source("preload.R")

## 1. header ------------------------------
header <- 
  dashboardHeader(title = HTML("Let's learn stats!"), 
                  disable = FALSE, 
                  titleWidth  = 550
                  
  )

## 2. siderbar ------------------------------
siderbar <- 
  dashboardSidebar( 
    width = 200,
    sidebarMenu(
      id = 'sidebar',
      style = "position: relative; overflow: visible;",
      #style = "position: relative; overflow: visible; overflow-y:scroll",
      #style = 'height: 90vh; overflow-y: auto;',

      menuItem("Overview",
               tabName = "OverviewTab",
               icon = icon('dashboard')
      ),
      
      menuItem("Section 1", 
               tabName = "S1Tab", 
               icon = icon("export"), startExpanded = FALSE,
               menuSubItem('Experimental Design', tabName = "ss1", 
                           icon = icon('export', lib = 'glyphicon')),
               menuSubItem('Ratio', tabName = "ss2", 
                           icon = icon('export', lib = 'glyphicon'))
      )
    )
  )

## 3. body --------------------------------
body <- dashboardBody( 
  ## 3.0. CSS styles in header ----------------------------
  tags$head(
    # ## JS codes
    # tags$script(src = "fixedElement.js" ),
    # tags$style(HTML(".scroller_anchor{height:0px; margin:0; padding:0;}; 
    #                  .scroller{background: white; 
    #                   border: 1px solid #CCC; 
    #                   margin:0 0 10px; 
    #                   z-index:100; 
    #                   height:50px; 
    #                   font-size:18px; 
    #                   font-weight:bold; 
    #                   text-align:center; 
    #                  width:500px;}")),
    
    #tags$script(src = "world.js" ),
    tags$script("document.title = 'New Zealand Trade Intelligence Dashboard'"),
    
    ### Styles 
    tags$style(HTML(".small-box {height: 65px}")),
    tags$style(HTML(".fa { font-size: 35px; }")),
    tags$style(HTML(".glyphicon { font-size: 33px; }")),  ## use glyphicon package
    tags$style(HTML(".fa-dashboard { font-size: 20px; }")),
    tags$style(HTML(".fa-globe { font-size: 20px; }")),
    tags$style(HTML(".fa-barcode { font-size: 20px; }")),
    tags$style(HTML(".tab-content { padding-left: 20px; padding-right: 30px; }")) ,
    tags$style(HTML(".fa-wrench { font-size: 15px; }")),
    tags$style(HTML(".fa-refresh { font-size: 15px; }")),
    tags$style(HTML(".fa-search { font-size: 15px; }")),
    tags$style(HTML(".fa-comment { font-size: 20px; }")),
    tags$style(HTML(".fa-share-alt { font-size: 20px; }")),
    tags$style(HTML(".fa-envelope { font-size: 20px; }")),
    tags$style(HTML(".fa-question-circle { font-size: 20px; }")),
    tags$style(HTML(".fa-chevron-circle-down { font-size: 15px; }")),
    tags$style(HTML(".fa-bell { font-size: 17px; }")),
    tags$style(HTML(".fa-check { font-size: 14px; }")),
    tags$style(HTML(".fa-times { font-size: 14px; }")),
    
    #tags$style(HTML(".fa-twitter { font-size: 10px; color:red;}")),
    #tags$style(HTML(".fa-facebook { font-size: 10px; color:red;}")),
    #tags$style(HTML(".fa-google-plus { font-size: 10px; color:red;}")),
    #tags$style(HTML(".fa-pinterest-p { font-size: 10px; color:red;}")),
    #tags$style(HTML(".fa-linkedin { font-size: 10px; color:red;}")),
    #tags$style(HTML(".fa-tumblr { font-size: 10px; color:red;}")),
    
    ## modify the dashboard's skin color
    tags$style(HTML('
                    /* logo */
                    .skin-blue .main-header .logo {
                    background-color: #006272;
                    }
                    /* logo when hovered */
                    .skin-blue .main-header .logo:hover {
                    background-color: #006272;
                    }
                    /* navbar (rest of the header) */
                    .skin-blue .main-header .navbar {
                    background-color: #006272;
                    }
                    /* active selected tab in the sidebarmenu */
                    .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                    background-color: #006272;
                    }
                    ')
    ),
    
    ## modify icon size in the sub side bar menu
    tags$style(HTML('
                    /* change size of icons in sub-menu items */
                    .sidebar .sidebar-menu .treeview-menu>li>a>.fa {
                    font-size: 15px;
                    }
                    .sidebar .sidebar-menu .treeview-menu>li>a>.glyphicon {
                    font-size: 13px;
                    }
                    /* Hide icons in sub-menu items */
                    .sidebar .sidebar-menu .treeview>a>.fa-angle-left {
                    display: none;
                    } 
                    '
    )) ,
    
    tags$style( HTML("hr {border-top: 1px solid #000000;}") ),
    
    ## to not show error message in shiny
    tags$style( HTML(".shiny-output-error { visibility: hidden; }") ),
    tags$style( HTML(".shiny-output-error:before { visibility: hidden; }") ),
    
    ## heand dropdown menu size
    #tags$style(HTML('.navbar-custom-menu>.navbar-nav>li>.dropdown-menu { width:100px;}'))
    tags$style(HTML('.navbar-custom-menu>.navbar-nav>li:last-child>.dropdown-menu { width:10px; font-size:10px; padding:1px; margin:1px;}')),
    tags$style(HTML('.navbar-custom-menu> .navbar-nav> li:last-child > .dropdown-menu > h4 {width:0px; font-size:0px; padding:0px; margin:0px;}')),
    tags$style(HTML('.navbar-custom-menu> .navbar-nav> li:last-child > .dropdown-menu > p {width:0px; font-size:0px; padding:0px; margin:0px;}'))
    ),
  
  ## 3.1 Dashboard body --------------
  tabItems(
    ## 3.1 Main dashboard ----------------------------------------------------------
    tabItem( tabName = 'dashboard',
             ## contents for the dashboard tab
             div(id = 'main_wait_message',
                 h1('Note, initial load may take up to 10 seconds.',
                    style = "color:darkblue" , align = "center" ) ,
                 tags$hr()
             ),
             
             # 1.1 Export/import board ---------------------------
             #div(class = 'scroller_anchor'),
             #div(class = 'scroller', ) ,
             
             h1(paste0("New Zealand trade for the ")) ,
             fluidRow(
               # valueBoxOutput("ExTotBox") %>% withSpinner(type=4),
               # valueBoxOutput("ImTotBox"),
               # valueBoxOutput("BlTotBox")
             ),
             
             h2(paste0("Goods")),
             fluidRow(
               
               
             ),
             
             h2(paste0("Services")),
             fluidRow(
               
             ) ,
             
             ## 1.2 Time serise plot ----------------------------------------
             h2(paste0("New Zealand trade over the past 20 years")),
             fluidRow( column( width = 6,h4("Goods and services trade", align = 'center'), highchartOutput('IEGSLineHc') ),
                       column( width = 6,h4("Trade balance", align = 'center'), highchartOutput('GSTotalBalanceLineHc') )
             ),
             
             
             ## 1.3 Table shows growth rate ---------------------------------
             h2(paste0("Short, medium, and long term growth")),
             p("Compound annual growth rate (CAGR) for the past 1, 5, 10 and 20 years") ,
             #fluidRow( h2(paste0("Short, medium, and long term growth")),
             #          p("Compound annual growth rate (CAGR) for the past 1, 5, 10 and 20 years") ),
             fluidRow( dataTableOutput('GrowthTab')  ),
             
             div( id = 'message_to_show_more',
                  tags$hr(),
                  tags$h3( "Click on the 'Show more details' button to display additional information on free trade agreements, and imports/exports by commodities and markets." ),
                  actionButton("btn_show_more",
                               paste0(' Show more details'),
                               icon = icon('chevron-circle-down'),
                               style='padding-top:3px; padding-bottom:3px;padding-left:5px;padding-right:5px;font-size:120% '
                  ) 
             ),
             
             div( id = "show_more_detail" ) ,
             
             shinyjs::hidden( div( id = "load_more_message",
                                   tags$hr(),
                                   tags$h1("Loading...", align = "center")  )
             )
             
    ),
    
    ## 3.2.1 Export/import commodities/services intelligence ------------------------
    tabItem( tabName = 'ci_exports',
             ## 2.1 Help text first -------------- 
             ## 3... wait message ------
             hidden(
               div( id = 'wait_message_ci_ex',
                    h2( "I am preparing the report now and only for you ....." )
               )),
             
             ## divs for pre-defined commodity groups ----------------- 
             tags$div(id = 'body_ex') ,
             tags$div(id = 'body_growth_ex') ,
             shinyjs::hidden( div( id = "body_ci_market_loading_message",
                                   tags$hr(),
                                   tags$h1("Generating reports...", align = "center")  )
             ),
             tags$div(id = 'body_ci_markets_ex'), 
             
             
             ## divs for self-defined commodity groups ----------------- 
             tags$div(id = 'body_ex_self_defined') ,
             tags$div(id = 'body_growth_ex_self_defined') ,
             shinyjs::hidden( div( id = "body_ci_market_loading_message_self_define",
                                   tags$hr(),
                                   tags$h1("Generating reports...", align = "center")  )
             ),
             tags$div(id = 'body_ci_markets_ex_self_defined')
             
    ),
    
    ## 3.2.2 Export/import commodities/services intelligence ------------------------
    tabItem( tabName = 'ci_imports',

             
             ## 3... wait message ------
             hidden(
               div( id = 'wait_message_ci_im',
                    h2( "I am preparing the report now and only for you ....." )
               )),
             
             ## 3.1 div for pre-defined HS group reports ----------------------
             tags$div(id = 'body_im') ,
             tags$div(id = 'body_growth_im') ,
             tags$div(id = 'body_ci_markets_im'),
             
             ## 3.x div for self-defined HS group reports ----------------------
             tags$div(id = 'body_im_self_defined') ,
             tags$div(id = 'body_growth_im_self_defined') ,
             tags$div(id = 'body_ci_markets_im_self_defined')
    )
    
  )
    )



## put UI together --------------------
ui <- dashboardPage(header, siderbar, body)