digraph {
  rankdir="LR" ;
  node [ shape=Mrecord ] ;
  stylesheet="style.svg.css" ;

  GIT [ label="GIT", URL="$package_urls_source_code__0", style=filled, fillcolor=transparent ] ;
  Travis [ label="Travis", URL="$package_urls_builds__0", style=filled, fillcolor=transparent ] ;
  Docker_Hub [ label="Hub", URL="$package_urls_images__0", style=filled, fillcolor=transparent ] ;

  GIT -> Travis [ label="Tag or commit" ]
  Travis -> Docker_Hub [ label="Build, Tag & Push" ] ;
  // vim:ft=dot:
}
