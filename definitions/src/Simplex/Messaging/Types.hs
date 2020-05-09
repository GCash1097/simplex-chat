module Simplex.Messaging.Types where

import ClassyPrelude
import Data.Aeson
import GHC.Generics()

newtype NewConnectionReqBody = NewConnectionReqBody
  { recipientKey :: Base64EncodedString
  } deriving (Show, Generic, ToJSON, FromJSON)

data NewConnectionResBody = NewConnectionResBody
  { recipientId :: String
  , senderId    :: String
  } deriving (Show, Generic, ToJSON, FromJSON)

newtype SecureConnectionReqBody = SecureConnectionReqBody
  { senderKey :: Base64EncodedString
  } deriving (Show, Generic, ToJSON, FromJSON)

data Message = Message
  { id   :: Base64EncodedString
  , ts   :: TimeStamp
  , msg  :: Base64EncodedString
  } deriving (Show, Generic, ToJSON, FromJSON)

data MessagesResBody = MessagesResBody
  { messages      :: [Message]
  , nextMessageId :: Maybe Base64EncodedString
  } deriving (Show, Generic, ToJSON, FromJSON)

newtype SendMessageReqBody = SendMessageReqBody
  { msg :: Base64EncodedString
  } deriving (Show, Generic, ToJSON, FromJSON)

type Base64EncodedString = Text
type TimeStamp = Text
