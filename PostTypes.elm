module PostTypes exposing (BlogPost, PicturePost, Post(Blog, Picture), PostList, viewPost, viewPostList)

import Html exposing (text, Html, img, div, h3)
import Html.Attributes exposing (src, title, width, style)
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
  let imageStyle = [ ("width", "712px"), ("margin-top", "64px")]
  in
    img [src ("https://firebasestorage.googleapis.com/v0/b/elm-streetart.appspot.com/o/" ++ model.url ++ "?alt=media"), title model.title, style imageStyle] []

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
