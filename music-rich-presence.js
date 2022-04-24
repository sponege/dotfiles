// credit to jojo2357 for the inspiration
// https://github.com/jojo2357/Music-Discord-Rich-Presence

const rpc = require("discord-rpc");
const client = new rpc.Client({ transport: "ipc" });
const config = require("./config.json");
const { exec } = require("child_process");

client.login({ clientId: config.ClientID }).catch(console.error);

function sleep(ms) {
  // sleep function
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function setPresence() {
  client.request("SET_ACTIVITY", {
    pid: process.pid,
    activity: {
      details: config.Details,
      state: config.State,
      assets: {
        large_image: config.LargeImage,
        large_text: config.LargeImageText,
        small_image: config.SmallImage,
        small_text: config.SmallImageText,
      },
      buttons: [
        {
          label: config.Button1,
          url: config.Url1,
        },
        {
          label: config.Button2,
          url: config.Url2,
        },
        //labels are the buttons that you wanna provide to your rich presence and urls are the links that leads you when someone press that button
        //Note the button won't work for you but don't worry it work for others
      ],
    },
  });
}

async function updateRichPresence(client) {
  while (true) {
    exec(
      `playerctl metadata --format "{{artist}}~{{album}}~{{title}}"`,
      (error, stdout, stderr) => {
        [artist, album, title] = stdout.split("~");
        config.Details = `Now playing: ${title}`;
        config.LargeImageText = `Now playing: ${title} - ${artist}`;
        config.State = `Artist: ${artist}`;

        setPresence();
      }
    );
    await sleep(5 * 1000);
  }
}

client.on("ready", () => {
  updateRichPresence();
});
