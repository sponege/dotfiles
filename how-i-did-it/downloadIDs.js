var plugins = `0BDFDB
0PluginLibrary
AutoPlayGifs
AutoStartRichPresence
AvatarHover
AvatarsEverywhere
BetterBotTags
BetterCodeblocks
BetterFolders
BetterFormattingRedux
BetterFriendList
BetterInvites
BetterMediaPlayer
BetterPictureInPicture
BetterSearchPage
BetterVolume
BiggerStreamPreview
BugReportHelper
CallTimeCounter
ChannelPermissions
CharCounter
ChatAliases
ChatFilter
ClickableMentions
ClickToChat
ClickToCopyUsername
ColorTooltips
CompleteTimestamps
CopyRawMessage
CreationDate
CustomQuoter
CustomStatusPresets
DisableStickerSuggestions
DiscordActivities
DoubleClickToEdit
EmojiParty
EmojiStatistics
ForceImagePreviews
Freemoji
GoogleSearchReplace
GrammarCorrect
GuildAndFriendRemovalAlerts
GuildProfile
Hastebin
InAppNotifications
KeyboardClick
LastMessageDate
LinkBanner
linkProfilePicture
MemberCount
MultiInstance
NotificationSounds
NRM
PermissionsViewer
PersonalPins
PinDMs
PluginRepo
PronounDB
QuickToggler
ReadAllNotificationsButton
RedditMentions
RemoveBlockedUsers
RemoveChatButtons
RemoveNicknames
RevealAllSpoilers
RightClickJoin
RoleFilter
SecretRingTone
ServerCounter
ServerDetails
ServerSearch
ShowAllActivities
ShowAllMessageButtons
ShowBadgesInChat
ShowConnections
ShowHiddenChannels
SpellCheck
SplitLargeMessages
SpotifyListenAlong
StaffTag
StatusEverywhere
ThemeSettings
TopRoleEverywhere
Translator
TypingIndicator
TypingUsersAvatars
UrbanDictionary
UserDetails
VoiceUsersCounter
WhoReacted
Zalgo
`;
plugins = plugins.split("\n");
var pluginIDs = [];
for (plugin of plugins) {
  var h3Tags = document.getElementsByTagName("h3");
  var found;

  for (var i = 0; i < h3Tags.length; i++) {
    if (h3Tags[i].textContent == plugin) {
      found = h3Tags[i];
      break;
    }
  }

  if (found) {
    pluginIDs.push(
      found.parentElement.children[4].children[0].children[0].href.split("=")[1]
    );
  }
}

// then I used this command:
// sort ids.txt -nu -o ids.txt
