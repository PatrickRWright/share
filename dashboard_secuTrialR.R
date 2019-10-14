## app.R ##
library(shinydashboard)
library(shiny)
library(secuTrialR)

ui <- dashboardPage(skin = "red",
  dashboardHeader(title = "SCTO - secuTrialR"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Upload", tabName = "upload", icon = icon("upload")),
      menuItem("Recruitment plot", tabName = "recruitmentplot", icon = icon("signal")),
      menuItem("Recruitment table", tabName = "recruitmenttable", icon = icon("table")),
      menuItem("Form completeness", tabName = "formcompleteness", icon = icon("percent")),
      menuItem("Visit plan", tabName = "visitstucture", icon = icon("calendar-alt")),
      menuItem("Download", tabName = "download", icon = icon("download"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "upload",
              fileInput(inputId = "secuTrial_export_file",
                        label = "Choose secuTrial export zip",
                        multiple = FALSE,
                        accept = c("zip",
                                   "ziparchive",
                                   ".zip"), width = 700),
              textOutput("read_sT_data")
      ),

      # Second tab content
      tabItem(tabName = "recruitmentplot",
              h2("Study recruitment"),
              box(plotOutput("recruitment_plot", height = 500, width = 900), width = 1000)
      ),
      # Third tab content
      tabItem(tabName = "recruitmenttable",
              h2("Study recruitment"),
              box(tableOutput("annual_recruitment"))
      ),
      # Fourth tab content
      tabItem(tabName = "formcompleteness",
              h2("Form completeness"),
              checkboxInput(inputId = "percent", label = "Percent", value = TRUE),
              checkboxInput(inputId = "counts", label = "Counts", value = TRUE),
              checkboxInput(inputId = "rmat", label = "Remove at forms"),
              box(tableOutput("form_completeness_perc"), width = 300),
              box(tableOutput("form_completeness_count"), width = 250)
      ),
      # Fifth tab content
      tabItem(tabName = "visitstucture",
              h2("Visit plan"),
              box(plotOutput("visit_structure", height = 500, width = 900), width = 1000)
      ),

      # Last tab content / Download
      tabItem(tabName = "download",
              h2("Download files"),
              h4("Download recruitment plot"),
              downloadButton('downloadDataRecruitmentPlot', 'Download'),
              h4("Download Stata conversion"),
              downloadButton('downloadDataStata', 'Download')
              #h4("Download plots"),
              #downloadButton('downloadData', 'Download')
      )
    )
  )
)

server <- function(input, output) {

  output$read_sT_data <- renderText({
    # catch exception
    if (is.null(input$secuTrial_export_file$datapath)) {
      print("Please upload file.")
    } else {
      sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)
      if (length(sT_export)) {
        print("Upload and reading of data successful.")
      } else {
        print("Error: Data could not be read.")
      }
    }
  })


  output$recruitment_plot <- renderPlot({
    sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)
    plot_recruitment(sT_export)
  })

  output$annual_recruitment <- renderTable({
    sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)
    annual_recruitment(sT_export)
  })

  output$form_completeness_perc <- renderTable({
    sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)
    if(input$percent) {
      table <- form_status_summary(sT_export)
      names <- names(table)
      names_perc <- names[grepl(names, pattern = ".percent")]
      names_perc <- c("form_name", names_perc)
      if (input$rmat) {
        table <- table[which(! grepl(table$form_name, pattern = "^at")), ]
        table %>% select(names_perc)
      } else {
        table %>% select(names_perc)
      }
    }
  })

  output$form_completeness_count <- renderTable({
    sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)
    if(input$counts) {
      table <- form_status_summary(sT_export)
      names <- names(table)
      names_count <- names[! grepl(names, pattern = ".percent")]
      if (input$rmat) {
        table <- table[which(! grepl(table$form_name, pattern = "^at")), ]
        table %>% select(names_count)
      } else {
        table %>% select(names_count)
      }
    }
  })

  output$visit_structure <- renderPlot({
    sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)
    plot(visit_structure(sT_export))
  })

  output$downloadDataRecruitmentPlot <- downloadHandler(

    # This function returns a string which tells the client
    # browser what name to use when saving the file.
    filename = function() {
      "recruitment_plot.pdf"
    },

    # This function should write data to a file given to it by
    # the argument 'file'.
    content = function(file) {
      # Write to a file specified by the 'file' argument
      pdf(file = file)
      sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)
      plot_recruitment(sT_export)
      dev.off()
    }
  )

  output$downloadDataStata <- downloadHandler(

    tdir <- tempdir(),

    # This function returns a string which tells the client
    # browser what name to use when saving the file.
    filename = function() {
      "stata.zip"
    },

    # This function should write data to a file given to it by
    # the argument 'file'.
    content = function(file) {
      # Write to a file specified by the 'file' argument
      sT_export <- read_secuTrial(input$secuTrial_export_file$datapath)

      write_secuTrial(sT_export, format = "dta", path = tdir)
      dta_loc <- list.files(path = tdir, full.names = TRUE, pattern = "dta$")
      # -j prevents keeping directory structure
      zip(zipfile = file, files = dta_loc, flags = "-j")
    }
  )

}

shinyApp(ui, server)

