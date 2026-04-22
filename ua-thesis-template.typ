// ua-thesis-template.typ

#import "acronyms.typ"

#let ua-thesis(
  title-pt: "Indefinido",
  title-en: none,
  author: "Unknown",
  year: "",
  degree: "Undefined Master",
  department: "Undefined Departament",
  theme-color: rgb("#A23223"), 
  supervisors: (),
  jury: (),
  grant-text: none,
  dedication: none,
  abstract-pt: none,
  keywords-pt: (),
  abstract-en: none,
  keywords-en: (),
  acknowledgements: none,
  ai-acknowledgement: none,
  logo: "figs/ua-logo.png",
  language: "pt",
  debug: false,
  body
) = {
  // 1. Document Metadata & Typography Setup
  set document(title: title-pt, author: author)
  
  set text(font: ("Helvetica", "Arial", "sans-serif"), size: 11pt, lang: "pt")
  
  let clear-double-page() = pagebreak(to: "odd", weak: true)

  // ----------------------------------------------------------------------
  // 2. Cover Page (Capa)
  // ----------------------------------------------------------------------
  [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    
    // Top Bar: 5mm visible, bleeds to right edge, aligns left with text column
    #place(top + left, dx: 56.4mm, dy: -8mm, rect(fill: theme-color, width: 140mm, height: 5mm))

    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (50mm, 30.1mm, 145mm, 47.3mm),
      gutter: 3pt,
      stroke:  if debug { black },
      grid.cell(
        if logo != none [
          #place(top+right, image(logo, width: 15.8mm))
        ] else [
          #rect(width: 15.8mm, height: 15.8mm, fill: luma(240), stroke: none)[
          #align(center + horizon)[*Logo UA*]
          ]
        ]
      ),
      // Institution and Year
      grid.cell(
        place(top + left, dy: 0.5em, text(size: 10pt, weight: "bold",  
        [
          #par("Universidade de Aveiro")
          #par([#year])
        ])
        )
      ),

      // Author
      grid.cell(
        text(size: 14pt, weight: "bold", 
        author)
      ),
      
      grid.cell(
        place(top + left, dy: 0.5em, 
          text(size: 14pt, weight: "bold", 
          
          if title-en != none [
            #par(title-pt)
            #par(title-en)
          ] else [
            #par(title-pt)
          ]
          )
        )
      )
    )
  ]

  // ----------------------------------------------------------------------
  // 3. Title Page (Folha de Rosto)
  // ----------------------------------------------------------------------
  [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (50mm, 30.1mm, 145mm, 47.3mm),
      gutter: 3pt,
      stroke: if debug { black },
      grid.cell(x: 0, y: 0,
        if logo != none [
          #place(top+right, image(logo, width: 15.8mm))
        ] else [
          #rect(width: 15.8mm, height: 15.8mm, fill: luma(240), stroke: none)[
          #align(center + horizon)[*Logo UA*]
          ]
        ]
      ),
      // Institution and Year
      grid.cell(x: 1, y: 0,
        place(top + left, dy: 0.5em, text(size: 10pt, weight: "bold",  
        [
          #par("Universidade de Aveiro")
          #par([#year])
        ])
        )
      ),

      // Author
      grid.cell(x: 0, y: 1,
        text(size: 14pt, weight: "bold", 
        author)
      ),

      // Title
      grid.cell(x: 1, y: 1,
        place(top + left, dy: 0.5em, 
          text(size: 14pt, weight: "bold", 
          
          if title-en != none [
            #par(title-pt)
            #par(title-en)
            #v(1cm)
          ] else [
            #par(title-pt)
          ]
          )
        )
      ),
      // Main Text
      grid.cell(x: 1, y: 2,
        place(dy: 2em,
            text(size: 10pt,
            [Tese apresentada à Universidade de Aveiro para cumprimento dos requisitos 
            necessários à obtenção do grau de #degree, realizada sob a orientação 
            científica de #supervisors.join(" e ")]
          )
        )
      ),
      // Grant
      grid.cell(x: 1, y: 3,
        if grant-text != none [
            #v(1.5em)
            #text(size: 10pt,[#grant-text])
          ]
      )
    )
  ]

  // ----------------------------------------------------------------------
  // 4. Dedication
  // ----------------------------------------------------------------------
  if dedication != none   [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (50mm, 30.1mm, 145mm, 47.3mm),
      stroke: if debug { black },      
      grid.cell(x: 1, y: 2,
        place(text(size: 10pt,
            [#dedication]
          )
        )
      )
      )
  ]

  // ----------------------------------------------------------------------
  // 5. Jury Page
  // ----------------------------------------------------------------------
  if jury.len() > 0 [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, 8.1mm, 16mm, 16mm, 16mm, 16mm, 16mm, 16mm, 16mm, 16mm, 16mm, 16mm),
      stroke: if debug { black },
      grid.cell(""),grid.cell(""),
      grid.cell(text(size: 11pt, weight: "bold", "o júri")),grid.cell(""),
      ..jury.map(j => (
        align(left)[#j.role], 
        align(left)[#j.name \ #text(size: 8pt)[#j.title]]
      )).flatten()
    )
  
  ]

  // ----------------------------------------------------------------------
  // 6. Acknowledgements
  // ----------------------------------------------------------------------
  if acknowledgements != none [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, auto),
      stroke: if debug { black },
      grid.cell(x: 0, y: 1, text(size: 11pt, weight: "bold",[acknowledgement])),
      grid.cell(x: 1, y: 1, text(size: 10pt, par(justify: true, first-line-indent: 1.5em, leading: 0.8em,[#acknowledgements]))
      ),
    )
  ]

  // ----------------------------------------------------------------------
  // 7. Abstracts PT
  // ----------------------------------------------------------------------
  if abstract-pt != none [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, 23.8mm, auto),
      stroke: if debug { black },
      grid.cell(x: 0, y: 1, text(size: 11pt, weight: "bold",[palavras-chave])),
      grid.cell(x: 1, y: 1, text(size: 10pt, [#keywords-pt.join(", ")])),
      
      grid.cell(x: 0, y: 2, text(size: 11pt, weight: "bold",[resumo])),
      grid.cell(x: 1, y: 2, text(size: 10pt, [#abstract-pt])
      ),
    )
  ]

  // ----------------------------------------------------------------------
  // 8. Abstracts EN
  // ----------------------------------------------------------------------
  if abstract-pt != none [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, 23.8mm, auto),
      stroke: if debug { black },
      grid.cell(x: 0, y: 1, text(size: 11pt, weight: "bold",[keywords])),
      grid.cell(x: 1, y: 1, text(size: 10pt, [#keywords-en.join(", ")])),
      
      grid.cell(x: 0, y: 2, text(size: 11pt, weight: "bold",[abstract])),
      grid.cell(x: 1, y: 2, text(size: 10pt, [#abstract-en])
      ),
    )

  ]

  // ----------------------------------------------------------------------
  // 9. AI Tools Acknowledgement
  // ----------------------------------------------------------------------
  if ai-acknowledgement != none [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, 23.8mm, auto),
      stroke: if debug { black },
      grid.cell(x: 0, y: 2, text(size: 11pt, weight: "bold",[acknowledgement of use of \ AI tools])),
      grid.cell(x: 1, y: 2, text(size: 10pt, [
        *Recognition of the use of generative Artificial Intelligence technologies and tools, software and other support tools.*
        #v(1em)

        #ai-acknowledgement])
      ),
    )
  ]

  // ----------------------------------------------------------------------
  // 10. Table of Contents
  // ----------------------------------------------------------------------
  [
    #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    
    #show outline.entry.where(
      level: 1
    ): set block(above: 1.2em)

    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, auto),
      stroke: if debug { black },
      grid.cell(x: 0, y: 2, text(size: 11pt, weight: "bold",[Índice])),
      grid.cell(x: 1, y: 2, text(size: 10pt, [
        #outline(title: none, depth: 3, indent: auto)
        ])
      ),
    )
  ]

  // ----------------------------------------------------------------------
  // 11. List of Figures
  // ----------------------------------------------------------------------
  [
  #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, auto),
      stroke: if debug { black },
      grid.cell(x: 0, y: 2, text(size: 11pt, weight: "bold",[Lista de Figuras])),
      grid.cell(x: 1, y: 2, text(size: 10pt, [
        #outline(title: none, depth: 3, indent: auto, target: figure.where(kind: image))
        ])
      ),
    )
  ]  
  
  // ----------------------------------------------------------------------
  // 12. Acronyms
  // ----------------------------------------------------------------------
  [
  #set page(margin: (top: 8mm, left: 15mm, right: 15mm, bottom: 10mm))
    #grid(
      columns: (56.4mm, 124.3mm),
      rows: (74.638mm, auto),
      stroke: if debug { black },
      grid.cell(x: 0, y: 2, text(size: 11pt, weight: "bold",[Acrónimos])),
      grid.cell(x: 1, y: 2, text(size: 10pt, [
        //#print-index()
        ])
      ),
    )
  ]

  // ----------------------------------------------------------------------
  // 13. Main Document Body Configuration
  // ----------------------------------------------------------------------
  [
    // Revert to standard A4 reading margins for the main body content
    #set page(
      margin: (inside: 3cm, outside: 2.5cm, top: 2.5cm, bottom: 2.5cm),
      numbering: "1", 
      number-align: center
    )
    #clear-double-page()
    #counter(page).update(1)
    
    #set text( 
      size: 11pt,
      font: "Noto Serif",
      lang: language,
    )
    #set par(
      justify: true, 
      first-line-indent: 1.5em, 
      leading: 0.8em, 
      spacing: 1.5em
    )
    #set heading(numbering: "1.1")
    
    // Spacing and sizing around body headings
    #show heading: it => {
      if it.level == 1 {
        pagebreak(to: "odd", weak: true)
        v(2em)
        text(size: 20pt, weight: "bold", it)
        v(1.5em)
      } else if it.level == 2 {
        v(1.5em)
        text(size: 16pt, weight: "bold", it)
        v(1em)
      } else {
        v(1.2em)
        text(size: 13pt, weight: "bold", it)
        v(0.8em)
      }
    }

    // Render the actual thesis content
    #body
  ]
}
