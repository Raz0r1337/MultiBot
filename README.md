<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/3ac43983-8767-4dd6-9a17-4548ede1e9d3" />

# MultiBot
User interface for AzerothCore-Module "Playerbots" by Playerbots team https://github.com/mod-playerbots/mod-playerbots.<br>
Tested with American, German, French and Spanish 3.3.5 Wotlk-Client.

# Installation
Simply place the files in a folder called "MultiBot" in your World of Warcraft AddOns directory.<br>
Example: "C:\WorldOfWarcraft\Interface\AddOns\MultiBot"
# Use
Start World of Warcraft and enter "/multibot" or "/mbot" or "/mb" in the chat, or use the minimap button.

---

## ⚠️ Notice — About This Fork

This is a fork of the original [MultiBot addon by Macx-Lio](https://github.com/Macx-Lio/MultiBot).

The reason for this fork is that I submitted several pull requests to the original repository, but since the creator, **Macx-Lio**, is currently unavailable, those changes could not be merged.

To allow the community to benefit from the additional features and improvements I have implemented, I’ve published this fork **as a temporary solution**.

> **All credit for the original addon goes to Macx-Lio.** I do not claim ownership of this project — I’m simply maintaining a working version until development resumes on the main repository.

Thank you for understanding.

---

Screens:

# Current Status
<table>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-00-Start.png"></td>
    <td>
      This Picture shows the default MultiBot-Interface after start.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-00-Main-Control.png"></td>
    <td>
      The horizontal Buttonbar is the Main-Control.
      Commands from the Main-Control go to all bots in a Group or Raid.
      Differences in functionality are commented on in the tooltips.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-00-Playerbots.png"></td>
    <td>
      The vertical Buttonbar is the Playerbot-Selection.
      Here you will find the Characters of your Account.
      There is a button for each Character.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-00-Character-Info.png"></td>
    <td>
      The Tooltip of a Character-Button shows you the Class and Name of the Character.
      This should allow you to identify your characters.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-01-Playerbot-Online.png"></td>
    <td>
      With a Left-Click you can load your Character and have him automatically added to the Party or Raid.
      The horizontal Buttonbar that appears is the Playerbot-Control.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-01-Combat-Behaviour.png"></td>
    <td>
      You can use the Buttons on the left to adjust the Combat-Behavior of your Playerbot.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-01-Summon.png"></td>
    <td>
      With the first Button on the right you can summon your Playerbot.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-01-Group-And-Ungroup.png"></td>
    <td>
      With the second Button on the right you can add or dismiss your Playerbot from the Party or Raid.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-01-Non-Combat-Behaviour.png"></td>
    <td>
      With the next three the Buttons you can adjust the Non-Combat-Behavior of your Playerbot.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-01-Inventory.png"></td>
    <td>
      The last button on the right opens the Inventory of the Playerbot.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-02-Inspect-And-Inventory.png"></td>
    <td>
      A Left-Click on the Inventory-Button opens the Inspect- and Inventory-Window of your Playerbot.
      Notice: The Inspect-Window only will be open if the Playerbot is in reach.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-03-Sell-Mode.png"></td>
    <td>
      The Inventory will automatically open in Sell-Mode.
      In the Sell-Mode a left click on a Item will sell it.
      Notice: You must have a Merchent as Target.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-03-Equip-Mode.png"></td>
    <td>
      With this Button you can switch to the Equip-Mode.
      In the Equip-Mode a left click on a Item will equip it.
      Notice: Only works with Equipment.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-03-Use-Mode.png"></td>
    <td>
      With this Button you can switch to the Use-Mode.
      In the Use-Mode a left click on a Item will use it.
      Notice: Only works with usable Items.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-03-Destroy-Mode.png"></td>
    <td>
      With this Button you can switch to the Destroy-Mode.
      In the Destroy-Mode a left click on a Item will destroy it.
      Important: There is no security Quest and it will work with every Item.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-03-View-Mode.png"></td>
    <td>
      Items can be viewed regardless of the selected Mode.
      Means: View-Mode is always active.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-04-Hide-Playerbot-Control.png"></td>
    <td>
      With a left click on the Character-Button you can hide and show the Playerbot-Control.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-05-Hide-Playerbots.png"></td>
    <td>
      With a left click on the left Scroll-Button you can hide and show the Playerbots.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-06-Show-Friendbots.png"></td>
    <td>
      With a left click on the right Scroll-Button you can hide and show the Friendbots.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-06-Firendbots.png"></td>
    <td>
      The vertical Buttonbar is the Friend-Selection.
      Here you will find the Characters of your Friendlist.
      There are max 10 Buttons visible.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-06-Browse-Friendbots.png"></td>
    <td>
      With this Button you could browse throu your Friendlist.
      Each click will show the next 10 Characters.
      If you reach the End it starts from the Beginning.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-07-Filter-Selection.png"></td>
    <td>
      You can limit the Selection to make it easier to find the wished Friendbot.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-07-Filter-By-Classes.png"></td>
    <td>
      Simply press one of these Filter-Buttons to narrow down the Selection.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-08-No-Browse-Button.png"></td>
    <td>
      As you can see, the browse button has disappeared.
      This is because the Filter reduced the Selection to less than 10 Friendbots.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-08-Shows-Filter.png"></td>
    <td>
      The filter shows you the current limitation.
      In this example, we filtered to Warrior.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-08-Friendbot-Button.png"></td>
    <td>
      This button is the result of our filter.
      The functionality is almost identical to that of the Playerbots.
      Therefore we save ourselves a further explanation.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Tank-Attack.png"></td>
    <td>
      This is the Tank-Attack-Button.
      A left click on the Button let all Tanks attack you Target.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Actionbar-Attack.png"></td>
    <td>
      This is the Attack-Actionbar.
      A left click on the Button executes the selected Action.
      A right click on the Button will show and hide the Optional-Actions.
      To replace the selected Action, right click a Optional-Action.
      To execute a Optional-Action, left click it.
      The default Action is "All attack my target".
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Modebar.png"></td>
    <td>
      This is the Modebar.
      A left click on the Button enables and disables the selected Mode.
      A right click on the Button will show and hide the Mode-Selection.
      To select another Mode, left click the Mode-Option.
      The Mode will activated by selection.
      The default Mode-Toggle is "passive".
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Stay-Follow.png"></td>
    <td>
      This is the Stay-Follow-Toggle-Button.
      A left click on the Button sends the Stay-Command to the Party or Raid.
      Another left click on the Button sends the Follow-Command to the Party or Raid.
      The Icon will show the current State.
      The default State is "Follow".
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Actionbar-Flee.png"></td>
    <td>
      This is the Flee-Actionbar.
      A left click on the Button executes the selected Action.
      A right click on the Button will show and hide the Optional-Actions.
      To replace the selected Action, right click a Optional-Action.
      To execute a Optional-Action, left click it.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Formation.png"></td>
    <td>
      This is the Formation-Selector.
      A left click on the Button will show and hide the Options.
      A left click on the Option-Button will send the corresponding Formation-Command to the Party or Raid.
      A right click on the Button will ask the Party or Raid for the current Formation.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Beastmaster.png"></td>
    <td>
      This is the Beastmaster-Control.
      A left click on the Button will show and hide the Actions.
      A left click on the Action will send the corresponding Command to your Target, Party or Raid.
      It supports the "mod-beastmaster"-Module of the Azerothcore.
      These Buttons work with Target, Group and Raid.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Control.png"></td>
    <td>
      This is the MultiBot-Control.
      A left click on the Button will show and hide the Controls.
      Here you will find the "reset", "reset botAI" and "naxx"-Commands for your Bots.
      These Buttons works with Target, Group and Raid.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Drink.png"></td>
    <td>
      This Button will send the "drink"-Command to the Party or Raid.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Release.png"></td>
    <td>
      This Button will send the "release"-Command to the Party or Raid.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Revive.png"></td>
    <td>
      This Button will send the "revive"-Command to the Party or Raid.
    </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Macx-Lio/MultiBot/blob/main/Screenshots/Handout-09-Summon.png"></td>
    <td>
      This Button will summon all active Friend- and Playerbots.
    </td>
  </tr>
</table>

# Comming soon

Port Multibot to ACE 3

## ACE3 migration roadmap (beginner-friendly)

This addon is currently a classic Lua addon (manual frame/event architecture).
The ACE3 migration will be done incrementally to avoid regressions.

### Milestone 1 - Baseline and safety net
1. Creation of a dedicated branch (`ace3-migration`).
2. Record current behavior (slash commands, minimap button, major windows, bot command actions).
3. Add a short migration checklist file (`docs/ace3-migration-checklist.md`) with "works before/after" items.

Exit criteria:
- Addon loads with no Lua errors before any ACE3 code is introduced.

### Milestone 2 - Add ACE3 libraries without changing behavior
1. Add required libs (AceAddon-3.0, AceEvent-3.0, AceConsole-3.0, AceDB-3.0, optional AceGUI-3.0, LibDBIcon-1.0).
2. Update `MultiBot.toc` to load libs and keep existing files working.
3. Introduce a minimal addon object (e.g. `MultiBot = LibStub("AceAddon-3.0"):NewAddon(...)`).

Exit criteria:
- Addon still behaves exactly the same.
- No duplicate initialization paths.

### Milestone 3 - Initialization lifecycle migration
1. Move startup logic from `Core/MultiBotInit.lua` into `OnInitialize` and `OnEnable`.
2. Keep old init helpers but call them from ACE3 lifecycle methods.
3. Ensure events are registered once (avoid duplicate handlers).

Exit criteria:
- UI and commands initialize once per login/reload.

### Milestone 4 - Command system migration
1. Replace/manual-wrap slash command registration with `AceConsole-3.0` (`RegisterChatCommand`).
2. Keep existing aliases (`/multibot`, `/mbot`, `/mb`).
3. Route command handlers to existing logic functions (no duplicate business logic).

Exit criteria:
- Existing command behavior unchanged.

### Milestone 5 - Event bus migration
1. Migrate event registration to `AceEvent-3.0` (`RegisterEvent`).
2. Keep current event handlers and adapt signatures only where required.
3. Validate frequently fired events for performance (no extra allocations in hot paths).

Exit criteria:
- No event spam regressions.
- No duplicated event callbacks.

### Milestone 6 - SavedVariables migration (AceDB)
1. Map `Core/MultiBotConfig.lua` data into an AceDB schema.
2. Provide defaults and one-way migration from legacy keys.
3. Keep backward compatibility for existing users.

Exit criteria:
- Existing user settings survive migration.
- Fresh installs use AceDB defaults.

### Milestone 7 - Minimap/options integration
1. Keep current UI first; only integrate config access patterns.
2. Optionally add LibDBIcon integration for minimap behavior.
3. Defer large UI rewrites (AceGUI) until core migration is stable.

Exit criteria:
- Minimap toggle and options remain functional.

### Milestone 8 - Optional UI refactor (last)
1. Refactor one screen at a time to AceGUI.
2. Preserve existing data/control flow from `UI/*.lua`.
3. Avoid big-bang rewrites.

Exit criteria:
- Each migrated screen is functionally equivalent before moving to the next.

### Milestone 9 - Regression pass and release
1. Run a full in-game test matrix (group controls, individual bot controls, inventory actions, filters, talent/spec windows, PVP UI).
2. Clean dead code paths and keep one canonical helper per responsibility.
3. Publish migration notes for users.

Exit criteria:
- Stable behavior on target 3.3.5 clients.
- No known blocker regressions.

### Execution order (small PRs)
1. PR#1: libs + minimal addon bootstrap.
2. PR#2: lifecycle + commands.
3. PR#3: events + AceDB migration.
4. PR#4: minimap/options integration.
5. PR#5: optional UI refactors.
