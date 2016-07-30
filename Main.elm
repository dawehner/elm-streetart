import Html exposing (text, Html, img, div, h3)
import Html.Attributes exposing (src, title)
import Markdown
import Debug

type alias BlogPost =
  {
    content : String,
    title: String
  }

model : BlogPost
model = {
  content = "This is some markdown
* foo
* bar
* baz
",
  title = "My first blog post"}

viewBlogPost model =
  div [] [h3 model.title, (Markdown.toHtml [] model.content)]

type alias PicturePost =
  {
    url: String,
    title: String
  }

model2 : PicturePost
model2 = {
  url = "http://hackenteer.com/wp-content/uploads/20130128-232104.jpg",
  title = "Test streetart"}


viewPicturePost model =
  img [src model.url, title model.title] []

type Post = Blog BlogPost | Picture PicturePost

model3 : Post
model3 = Blog model

model4 : Post
model4 = Picture model2

viewPost post =
  case post of
    Blog blog ->
      viewBlogPost blog
    Picture picture ->
      viewPicturePost picture

type alias PostList = List Post

viewPostList postList =
  div [] (List.map viewPost postList)

model5 : PostList
model5 = [model3, model4]


main =
  viewPostList model5
