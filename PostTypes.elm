module PostTypes exposing (BlogPost, PicturePost, Post(Blog, Picture))

type alias BlogPost =
  {
    content : String,
    title: String
  }

type alias PicturePost =
  {
    url: String,
    title: String
  }

type Post = Blog BlogPost | Picture PicturePost
