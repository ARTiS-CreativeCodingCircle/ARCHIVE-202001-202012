enum Section {
  cover("cover/", "", new Author[]{ Author.ohayota }),
  foreword("foreafter/foreword/", "まえがき", new Author[]{ Author.ohayota }),
  contents("contents_table/", "目次", new Author[]{ Author.eboshi }),
  works_cover("personal_works/cover/", "個人作品", new Author[]{ Author.ohayota, Author.tomoka, Author.ikano, Author.akitch, Author.eboshi }),
  works_ohayota_cover("personal_works/" + Author.ohayota.getNameLower() + "/cover/", "個人作品表紙", new Author[]{ Author.ohayota }),
  works_ohayota("personal_works/" + Author.ohayota.getNameLower() + "/", "個人作品", new Author[]{ Author.ohayota }),
  works_tomoka_cover("personal_works/" + Author.tomoka.getNameLower() + "/cover/", "個人作品表紙", new Author[]{ Author.tomoka }),
  works_tomoka("personal_works/" + Author.tomoka.getNameLower() + "/", "個人作品", new Author[]{ Author.tomoka }),
  works_ikano_cover("personal_works/" + Author.ikano.getNameLower() + "/cover/", "個人作品表紙", new Author[]{ Author.ikano }),
  works_ikano("personal_works/" + Author.ikano.getNameLower() + "/", "個人作品", new Author[]{ Author.ikano }),
  works_akitch_cover("personal_works/" + Author.akitch.getNameLower() + "/cover/", "個人作品表紙", new Author[]{ Author.akitch }),
  works_akitch("personal_works/" + Author.akitch.getNameLower() + "/", "個人作品", new Author[]{ Author.akitch }),
  works_eboshi_cover("personal_works/" + Author.eboshi.getNameLower() + "/cover/", "個人作品表紙", new Author[]{ Author.eboshi }),
  works_eboshi("personal_works/" + Author.eboshi.getNameLower() + "/", "個人作品", new Author[]{ Author.eboshi }),
  artis_activity_cover("artis_activity/cover/", "活動アーカイブ", new Author[]{ Author.ohayota, Author.tomoka, Author.ikano, Author.akitch, Author.eboshi }),
  artis_logo("artis_activity/logo/", "活動アーカイブ / ARTiSロゴ", new Author[]{ Author.ohayota }),
  artis_website("artis_activity/website/", "活動アーカイブ / ARTiS公式サイト", new Author[]{ Author.tomoka }),
  artis_exhibition_cover("artis_activity/exhibition/cover/", "", new Author[]{ Author.ikano, Author.eboshi }),
  artis_exhibition("artis_activity/exhibition/", "活動アーカイブ / クリエイティブコーディング作品展 #01", new Author[]{ Author.ikano, Author.eboshi }),
  artis_workshop_cover("artis_activity/workshop/cover/", "クリエイティブ\nコーディング\nワークショップ", new Author[]{ Author.ohayota, Author.akitch }),
  artis_workshop("artis_activity/workshop/", "活動アーカイブ / クリエイティブコーディングワークショップ", new Author[]{ Author.ohayota, Author.akitch }),
  afterword("foreafter/afterword/", "あとがき", new Author[]{ Author.ohayota, Author.tomoka, Author.ikano, Author.akitch, Author.eboshi, Author.lowene }),
  colophon("colophon/", "奥付", new Author[]{ Author.ohayota }),
  backcover("backcover/", "", new Author[]{ Author.ohayota }),
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
