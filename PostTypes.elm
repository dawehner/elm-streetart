module PostTypes exposing (BlogPost, PicturePost, Post(Blog, Picture), PostList, viewPost, viewPostList)

import Html exposing (text, Html, img, div, h3)
import Html.Attributes exposing (src, title)
import Markdown


type alias BlogPost =
  {
    title: String,
    content : String
  }

viewBlogPost model =
  div [] [(h3 [] [text model.title]), (Markdown.toHtml [] model.content)]

type alias PicturePost =
  {
    url: String,
    title: String
  }

viewPicturePost model =
  img [src model.url, title model.title] []

type Post = Blog BlogPost | Picture PicturePost

type alias PostList = List Post

viewPost post =
  case post of
    Blog blog ->
      viewBlogPost blog
    Picture picture ->
      viewPicturePost picture

viewPostList postList =
  div [] (List.map viewPost postList)
