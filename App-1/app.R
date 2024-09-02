# Load libraries
library(shiny)
library(shinyBS)  # For Bootstrap components like tooltips
library(bslib)
library(DT)

# UI ----
# Define UI for the application
ui <- fluidPage(
  # Add custom styles and JavaScript for tooltips
  tags$head(
    tags$style(HTML("
      .btn-custom {
        background-color: #98fb98 !important; 
        color: #4b0082 !important; 
        border: 2px solid #4b0082; 
        padding: 10px 20px;
        border-radius: 5px;
        font-weight: bold;
      }
      .btn-custom:hover {
        background-color: #2e8b57 !important; 
        color: #ffffff !important; 
      }
      .btn-custom:focus {
        background-color: #98fb98 !important; 
        color: #4b0082 !important;
      }
      table.dataTable td {
        white-space: normal !important; /* Wrap text */
        word-break: break-word;         /* Break long words */
        max-width: 300px;               /* Set a max width for cells */
        vertical-align: top !important; /* Align text to the top of the cell */
      }
      .banner-image {
        width: 100%;
        height: auto;
        max-height: 300px;  /* Set a maximum height for the banner images */
        object-fit: cover;  /* Maintain aspect ratio and cover the container */
        margin: 0;         /* Remove default margin */
        padding: 0;        /* Remove default padding */
        display: block;    /* Ensure image behaves as a block element */
       
      .nav-tabs .nav-link { /* Specific targeting for tab titles */
        
      .nav-tabs .nav-item .nav-link {
        font-size: 18px !important;  /* Increase font size */
      }
      .nav-tabs .nav-item .nav-link.active {
        font-size: 18px !important;  /* Increase font size for active tab */
        font-weight: bold !important; /* Make font bold for active tab */
      }
")),
    
    tags$script(HTML('
      $(document).ready(function(){
        $(\'[data-toggle="tooltip"]\').tooltip(); 
      });
    '))
  ),
  
  titlePanel("Behaviour Change for Achieving the Kunming-Montreal Global Biodiversity Framework"),
  
  # Create a tab layout
  tabsetPanel(
    tabPanel("Introduction to Behaviour Change",
             h4("Download the Evidence Synthesis report using the download button below."),
             p("This is a 6-page synthesis report intended for CBD parties and practitioners interested in behaviour change for biodiversity conservation. This report synthesises behaviour change for biodiversity conservation case studies reviewed by an diverse, expert interdisciplinary team. Further evidence of behaviour change can be found on this app under the Tab 'Case Studies', where the evidence can be filtered by KM-GBF targets of interest, or by specific target audiences."),
             br(),
             # Add download button for the PDF of the evidence synthesis report with custom styling
             downloadButton("downloadPDF", "Download the Evidence Synthesis Report", class = "btn-custom"),
             br(),
             h3("What is behaviour change?"),
             p("Human behaviours significantly impact biodiversity, both positively and negatively. Therefore, promoting behaviour change is essential to achieving the KM-GBF targets. Behavioural science leverages evidence-based insights into how people behave to shape policies and strategies for behaviour change. Disciplines such as psychology, behavioural economics, education, social marketing, and law and governance, contribute to our understanding of behaviour change."),
             h3("What is a behaviour change intervention?"),
             p("A behaviour change intervention is a strategy designed to influence behaviours. Interventions can be directed at individuals, communities and groups, or decision-makers and governments, each requiring different strategies. The effectiveness of behaviour change interventions relies on identifying the specific behaviours to target, understanding the audience (those practising and influencing the behaviour), and recognising the barriers and enablers to change (such as values, knowledge, beliefs, assumptions, tools, costs, etc.)"),
             h3("How can behaviour change be undertaken ethically?"),
             p("Behaviour change in conservation can be challenging due to concerns about manipulation and perceived loss of autonomy, especially among indigenous peoples and local communities. Acknowledging these challenges, the FAIR Data Principles and the CARE Principles for Indigenous Data Governance should be adhered to throughout intervention design and implementation. Intervention designers and implementers should employ reflexive practices and approaches such as community co-design, and participatory engagement strategies. Alongside these, thorough ethics reviews and the application of appropriate safeguarding practices should be prioritised to ensure inclusive and respectful engagement throughout the design of interventions."),
             h3("What are the next steps for behaviour change in biodiversity conservation?"),
             p("While no single method is a silver bullet for biodiversity conservation, effective behaviour change strategies can complement traditional conservation strategies to support long-term biodiversity goals. Until recently, understanding human behaviours and how to influence them has been a missing and crucial step in traditional conservation approaches. Galvanising political will and developing policies to support the critical application of behaviour change in conservation are required to lead to transformative change."),
             hr(),
             HTML("<p><strong>Recommended citation:</strong> Brown, M, Tostes Ribeiro, I, Lestari, WP, Beale, C, Papworth, S, Veríssimo, D, and Wells, V. (2024) Behaviour Change for Achieving the Kunming-Montreal Global Biodiversity Framework. Evidence Synthesis: Policy Brief. Conservation and Sustainability Consortium of Academic Institutions (CASCADE), UK.</p>"),
             
             # Add contact information with a hyperlink
             HTML("<p><strong>Contact:</strong> <a href='https://orcid.org/0000-0001-5178-0412'>Molly Brown</a>, <a href='mailto:molly.brown@york.ac.uk'>molly.brown@york.ac.uk</a></p>"),
             
             HTML("<p><strong> Wider contributor network:</strong> We are grateful to the wider network of academics and practitioners who participated equally in collaborating on this synthesis from the organisations listed below. In alphabetical order, many thanks to Burgess, G., Gillson, L., Hudson, P., Ingram, D., Outhwaite, W., Perry, L., Pettersson, H., Safaya, S., Schlich-Davies, A., Thomas, C., Touza-Montero, J., and Williams, J., who at different stages of the synthesis participated by providing data, workshop insights, and review. </p>"),
             
             # Add 11 logos arranged in 3 rows
             div(style = "text-align: center; margin-top: 50px;",
                 # First row
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "york-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "oxford-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "holloway-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "sp-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "ipb-logo.png", height = "60px")
                 ),
                 br(), # Line break for the second row
                 # Second row
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "lcab-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "traffic-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "defra-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "jncc-logo.png", height = "60px")
                 ),
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "iucnbct-logo.png", height = "60px")
                 ),
                 br(), # Line break for the third row
                 br(), 
                 br(), # Additional space for separation
                 br(), 
                 HTML("<p><strong>Funded by:</strong>"),
                 # Third row
                 div(style = "display: inline-block; margin: 5px;",
                     img(src = "researchengland-logo.png", height = "60px")
                 )
             ),
             
             # Add banner image
             HTML("<img src='boats1.jpg' class='banner-image' alt='Banner image'/>")
    ),
    
    tabPanel("Case Studies",
             h3("Evidence of Behaviour Change (Case Studies)"),
             
             # Add dropdowns for filtering by Main KM-GBF Target and Target Audience
             fluidRow(
               column(5,
                      selectInput("filterTarget", 
                                  "Filter by Main KM-GBF Target:", 
                                  choices = NULL, # Choices will be populated in server
                                  selected = NULL)
               ),
               column(5,
                      selectInput("filterAudience", 
                                  "Filter by Target Audience:", 
                                  choices = NULL, # Choices will be populated in server
                                  selected = NULL)
               ),
               column(2,
                      actionButton("resetFilters", "Reset Filters")
               )
             ),
             
             p("Below is a data table illustrating various case studies related to behavior change for biodiversity. Use the dropdowns to filter by the Main KM-GBF Target and Target Audience columns."),
             dataTableOutput("caseStudiesTable")
    ),
    
    
    # Adding the new section for behaviour change resources
    tabPanel("Further Resources",
             h3("Further Resources"),
             
             h4("Here are resources to get started with behaviour change for biodiversity conservation:"),
             
             h5("How do I design a behaviour change intervention?"),
             tags$ul(
               tags$li(tags$a(href = "https://www.bi.team/publications/behavior-change-for-nature-a-behavioral-science-toolkit-for-practitioners/", target = "_blank", "Behavior Change For Nature: A Behavioral Science Toolkit for Practitioners")),
               tags$li(tags$a(href = "https://behavior.rare.org/resources/behavior-change-levers/", target = "_blank", "Levers of Behavior Change: A Guide to the Science and Applications")),
               tags$li(tags$a(href = "https://www.behaviourchangewheel.com/", target = "_blank", "The Behaviour Change Wheel")),
               tags$li(tags$a(href = "https://www.behaviourchange.net/docs/pin-2017-behaviour-change-toolkit_mail.pdf", target = "_blank", "Behaviour Change Toolkit: for International Development Practitioners")),
               tags$li(tags$a(href = "https://www.changewildlifeconsumers.org/change/behaviour-change-for-conservation-online-course/", target = "_blank", "Behaviour Change for Conservation: Online Course"))
             ),
             
             h5("How do I evaluate a behaviour change intervention?"),
             tags$ul(
               tags$li(tags$a(href = "https://doi.org/10.1177/1524500417734806", target = "_blank", "Does It Work for Biodiversity? Experiences and Challenges in the Evaluation of Social Marketing Campaigns")), # Social marketing resource
               tags$li(tags$a(href = "https://prevention-collaborative.org/wp-content/uploads/2021/08/Copy-of-Soul_City_Institute_2013-1.pdf", target ="_blank", "Edutainment: Using stories & media for social action and behaviour change")), # Education resource
               tags$li(tags$a(href = "https://spatialagent.org/GWPBehaviourChange/", target = "_blank", "Behavior Change for Wildlife Conservation")), # e-library for BC led by GEF WB
               tags$li(tags$a(href = "https://breakthroughactionandresearch.org/resource-library/social-and-behavior-change-monitoring-guidance/#toggle-id-4", target = "_blank", "Social and Behavior Monitoring Guidance")), # SBC Monitoring by Breakthrough ACTION
               tags$li(tags$a(href = "https://thecompassforsbc.org/how-to-guide/how-to-use-a-theory-of-change-to-monitor-and-evaluate-social-and-behavior-change-programs", target = "_blank", "How to Use a Theory of Change to Monitor and Evaluate Social and Behavior Change Programs")), # ToC for SBC Monev
             ),
             
             h5("Where can I find further evidence of behaviour change interventions?"),
             tags$ul(
               tags$li(tags$a(href = "https://changewildlifeconsumers.org/", target = "_blank", "Change Wildlife Consumers")),
               tags$li(tags$a(href = "https://behavior.rare.org/resources/", target = "_blank", "Center for Behavior & the Environment (RARE)")),
               tags$li(tags$a(href = "https://www.bi.team/our-work/publications/", target = "_blank", "Behavioural Insights Team")),
               tags$li(tags$a(href = "https://www.usaidrdw.org/resources/consumer-demand-reduction", target = "_blank", "USAID Reducing Demand for Wildlife")),
               tags$li(tags$a(href = "https://www.sbcguidance.org/", target = "_blank", "UNICEF Social + Behavior Change")),
               tags$li(tags$a(href = "https://thedecisionlab.com/biases", target = "_blank", "Cognitive Biases: A list of the most relevant biases in behavioral economics")),
             ),
             
             # Add banner image
             HTML("<img src='sheep.jpg' class='banner-image' alt='Banner image'/>")
    )
  )
)

# Server ----
# Define server logic required to draw the datatable and handle file download
server <- function(input, output, session) {
  
  # Load data from external CSV file
  case_studies_data <- read.csv("Data-Test-2.csv", stringsAsFactors = FALSE, check.names = FALSE)
  
  # Replace underscores with spaces in column names
  colnames(case_studies_data) <- gsub("_", " ", colnames(case_studies_data))
  
  # Embed URLs in the 'Title' column
  case_studies_data$`Intervention Title` <- paste0(
    '<a href="', case_studies_data$Link, '" target="_blank">', case_studies_data$`Intervention Title`, '</a>'
  )
  
  # Embed URLs in the 'Link' column
  case_studies_data$Link <- ifelse(
    !is.na(case_studies_data$Link) & case_studies_data$Link != "",
    paste0('<a href="', case_studies_data$Link, '" target="_blank">', case_studies_data$Link, '</a>'),
    case_studies_data$Link  # Keep as is if the URL is missing
  )
  
  # Populate the filter dropdowns with unique values from Main.KM.GBF.Target and Target.Audience
  observe({
    updateSelectInput(session, "filterTarget",
                      choices = c("", unique(case_studies_data$`Main KM-GBF Target`)),
                      selected = "")
  })
  
  observe({
    updateSelectInput(session, "filterAudience",
                      choices = c("", unique(case_studies_data$`Target Audience`)),
                      selected = "")
  })
  
  # Reactive expression to handle filtering
  filtered_data <- reactive({
    data <- case_studies_data
    
    if (!is.null(input$filterTarget) && input$filterTarget != "") {
      data <- data[data$`Main.KM.GBF.Target` == input$filterTarget, ]
    }
    
    if (!is.null(input$filterAudience) && input$filterAudience != "") {
      data <- data[data$`Target.Audience` == input$filterAudience, ]
    }
    
    return(data)
  })
  
  format_data_table <- function(data) {
    datatable(
      data,
      escape = FALSE,  # Allows HTML in the cells to render as clickable links
      extensions = c('FixedHeader', 'FixedColumns'),  # Use the required extensions
      options = list(
        pageLength = 20,
        autoWidth = TRUE,  # Automatically adjusts other column widths based on content
        dom = 'ftip',
        lengthMenu = c(5, 10, 15),
        stripeClasses = c('striped', 'row-border'),
        scrollX = TRUE,  # Enables horizontal scrolling if needed
        columnDefs = list(
          list(width = '500px', targets = 3), # Assuming "Summary" is the 4th column (index 3)
          list(width = '300px', targets = 4), 
          list(width = '300px', targets = 6),
          list(width = '300px', targets = 8),
          list(width = '300px', targets = 10),
          list(width = '300px', targets = 11),
          list(width = '300px', targets = 12)
        ),
        # Add FixedHeader and FixedColumns options
        fixedHeader = TRUE,  # This freezes the header row
        fixedColumns = list(leftColumns = 2),  # This freezes the first column
        scrollY = "400px"  # Set vertical scroll if you have many rows
      ),
      class = 'display',
      width = '100%'  # Ensure the table takes up full available width
    )
  }
  
  # Render the datatable with filtering based on the selected Main KM-GBF Target and Target Audience
  output$caseStudiesTable <- renderDataTable({
    data <- filtered_data()
    
    # Check if the filtered data is empty and return a message if so
    if (nrow(data) == 0) {
      return(datatable(data.frame(Message = "No matching data found."), options = list(pageLength = 1)))
    } else {
      format_data_table(data)
    }
  })
  
  # Reset filters when the reset button is clicked
  observeEvent(input$resetFilters, {
    # Update select inputs to reset filters
    updateSelectInput(session, "filterTarget", selected = "")
    updateSelectInput(session, "filterAudience", selected = "")
    
    # Re-render the data table to reflect all data
    output$caseStudiesTable <- renderDataTable({
      format_data_table(case_studies_data)
    })
  })
  
  # Handle the file download for the Evidence Synthesis report
  output$downloadPDF <- downloadHandler(
    filename = function() {
      "evidence_synthesis_report.pdf"
    },
    content = function(file) {
      file.copy("www/evidence_synthesis_report.pdf", file)
    }
  )
  
  content = function(file) {
    write.csv(case_studies_data, file, row.names = FALSE)
  }
}

# Run the application ----
shinyApp(ui = ui, server = server)
