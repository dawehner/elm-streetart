module PostHttp exposing (picturePostDecoder, blogPostDecoder)
import PostTypes exposing (..)
import Json.Decode as Json exposing ((:=))

-- postDecoder : Json.Decoder (Post)
-- postDecoder =
--  case

-- blogPostDecoder : Json.Decoder (BlogPost)
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

-- getPostData : Task Http.Error (PostList)
-- getPostData =
--   Http.get 
