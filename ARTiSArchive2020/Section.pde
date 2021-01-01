enum Section {
  cover("cover/", "", new Author[]{Author.ohayota}),
  foreword("foreafter/foreword/", "", new Author[]{Author.ohayota}),
  contents("contents_table/", "", new Author[]{Author.eboshi}),
  works_ohayota("personal_works/ohayota/", "", new Author[]{Author.ohayota}),
  works_ohayota_cover("personal_works/ohayota/cover/", "", new Author[]{Author.ohayota}),
  works_tomoka("personal_works/tomoka/", "", new Author[]{Author.tomoka}),
  works_tomoka_cover("personal_works/tomoka/cover/", "", new Author[]{Author.tomoka}),
  works_ikano("personal_works/ikanoshiokara/", "", new Author[]{Author.ikano}),
  works_ikano_cover("personal_works/ikanoshiokara/cover/", "", new Author[]{Author.ikano}),
  works_akitch("personal_works/akitch/", "", new Author[]{Author.akitch}),
  works_akitch_cover("personal_works/akitch/cover/", "", new Author[]{Author.akitch}),
  works_eboshi("personal_works/eboshidori/", "", new Author[]{Author.eboshi}),
  works_eboshi_cover("personal_works/eboshidori/cover/", "", new Author[]{Author.eboshi}),
  artis_logo("artis_activity/logo/", "", new Author[]{Author.ohayota}),
  artis_website("artis_activity/website/", "", new Author[]{Author.tomoka}),
  artis_exhibition("artis_activity/exhibition/", "", new Author[]{Author.ikano, Author.eboshi}),
  artis_workshop("artis_activity/workshop/", "", new Author[]{Author.ohayota, Author.akitch}),
  afterword("foreafter/afterword/", "", new Author[]{Author.ohayota, Author.tomoka, Author.ikano, Author.akitch, Author.eboshi, Author.lowene}),
  backcover("backcover/", "", new Author[]{Author.ohayota}),
  empty("", "", new Author[]{});
  
  private Section(String path, String sectionNumber, Author[] authors) {
    this.path = path;
    this.sectionNumber = sectionNumber;
    this.authors = authors;
  }
  
  public String getPath() {
    return path;
  }
  public String getSectionNumber() {
    return sectionNumber;
  }
  public Author[] getAuthors() {
    return authors;
  }
  public Author getPrimaryAuthor() {
    return authors[0];
  }
  
  private final String path;
  private final String sectionNumber;
  private final Author[] authors;
}
