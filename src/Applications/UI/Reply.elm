module UI.Reply exposing (Reply(..))

import Authentication
import Common exposing (Switch(..))
import Coordinates exposing (Coordinates)
import Queue
import Sources exposing (Source)
import Tracks exposing (IdentifiedTrack)
import UI.Page exposing (Page)



-- 🌳


type Reply
    = ExternalAuth Authentication.Method String
    | GoToPage Page
    | ToggleLoadingScreen Switch
      -----------------------------------------
      -- Context Menu
      -----------------------------------------
    | ShowFutureQueueItemMenu Coordinates Queue.Item
    | ShowMoreAuthenticationOptions Coordinates
    | ShowSourceContextMenu Coordinates Source
    | ShowTracksContextMenu Coordinates (List IdentifiedTrack)
      -----------------------------------------
      -- Notifications
      -----------------------------------------
    | DismissNotification { id : Int }
    | ShowErrorNotification String
    | ShowSuccessNotification String
    | ShowWarningNotification String
      -----------------------------------------
      -- Queue
      -----------------------------------------
    | ActiveQueueItemChanged (Maybe Queue.Item)
    | FillQueue
    | PlayTrack IdentifiedTrack
    | ResetQueue
    | ShiftQueue
      -----------------------------------------
      -- Sources & Tracks
      -----------------------------------------
    | AddSourceToCollection Source
    | ExternalSourceAuthorization (String -> String)
    | ProcessSources
    | RemoveTracksWithSourceId String
    | ReplaceSourceInCollection Source
      -----------------------------------------
      -- User Data
      -----------------------------------------
    | InsertDemo
    | SaveEnclosedUserData
    | SaveFavourites
    | SaveSettings
    | SaveSources
    | SaveTracks
