module PostHttp exposing (postDecoder, getPosts)
import PostTypes exposing (..)
import Json.Decode as Json exposing ((:=))
import Json.Decode exposing (andThen)

blogPostDecoder : Json.Decoder (BlogPost)
blogPostDecoder =
  Json.object2 BlogPost
    ("title" := Json.string)
    ("content" := Json.string)

picturePostDecoder : Json.Decoder (PicturePost)
picturePostDecoder =
  Json.object2 PicturePost
    ("url" := Json.string)
    ("title" := Json.string)

postDecoder : Json.Decoder (Post)
postDecoder =
    ("type" := Json.string) `andThen` postDecoderByType


postDecoderByType : String -> Json.Decoder Post
postDecoderByType postType =
  case postType of
    "image" -> Json.map Picture picturePostDecoder
    "blog" -> Json.map Blog blogPostDecoder
    _ ->
      Json.fail <| "Unknown type: " ++ postType


getPosts : Task Http.Error (List String)
getPosts =
  Http.get postDecoder ("data/images.js")
