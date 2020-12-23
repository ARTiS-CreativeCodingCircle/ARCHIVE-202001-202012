enum Section {
  cover("cover/cover.png", ""),
  foreword("foreafter/foreword/", ""),
  contents("contents_table/", ""),
  works_ohayota("personal_works/ohayota/", ""),
  works_ohayota_cover("personal_works/ohayota/cover/", ""),
  works_tomoka("personal_works/tomoka/", ""),
  works_tomoka_cover("personal_works/tomoka/cover/", ""),
  works_ikano("personal_works/ikanoshiokara/", ""),
  works_ikano_cover("personal_works/ikanoshiokara/cover/", ""),
  works_akitch("personal_works/akitch/", ""),
  works_akitch_cover("personal_works/akitch/cover/", ""),
  works_eboshi("personal_works/eboshidori/", ""),
  works_eboshi_cover("personal_works/eboshidori/cover/", ""),
  artis_logo("artis_activity/logo/", ""),
  artis_website("artis_activity/website/", ""),
  artis_exhibition("artis_activity/exhibition/", ""),
  afterword("foreafter/afterword/", ""),
  backcover("cover/backcover.png", "");
  
  private Section(String path, String sectionNumber) {
    this.path = path;
    this.sectionNumber = sectionNumber;
  }
  
  public String getPath() {
    return path;
  }
  public String getSectionNumber() {
    return sectionNumber;
  }
  
  private final String path;
  private final String sectionNumber;
}
