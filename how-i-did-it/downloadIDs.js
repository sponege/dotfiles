var plugins = `0BDFDB
BetterFormattingRedux
Freemoji
GuildProfile
PluginRepo
ZeresPluginLibrary
`;
plugins = plugins.split("\n");
var pluginIDs = [];
for (plugin of plugins) {
  var h3Tags = document.getElementsByTagName("h3");
  var found = false;

  for (var i = 0; i < h3Tags.length; i++) {
    if (h3Tags[i].textContent == plugin) {
      found = h3Tags[i];
      console.log(h3Tags[i].innerText)
      break;
    }
  }

  if (found) {
    pluginIDs.push(
      Number(found.parentElement.children[4].children[0].children[0].href.split("=")[1])
    );
  }
}

console.log(pluginIDs)

for (id of pluginIDs) {
  console.log(id)
}

// then I used this command:
// sort ids.txt -nu -o ids.txt
