digraph {
  rankdir="LR" ;
  node [ shape=Mrecord ] ;

  GIT [ label="GIT", URL="$package_urls_source_code__0" ] ;
  Travis [ label="Travis", URL="$package_urls_builds__0" ] ;
  Docker_Hub [ label="Hub", URL="$package_urls_images__0" ] ;

  GIT -> Travis [ label="Tag or commit" ]
  Travis -> Docker_Hub [ label="Build, Tag & Push" ] ;
  // vim:ft=dot:
}
