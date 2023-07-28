/*
* class ArticleWidget extends StatelessWidget {

  final Article article;

  ArticleWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Text(article.title),
      collapsed: Text(article.body, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
      expanded: Text(article.body, softWrap: true, ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  }
}
* */