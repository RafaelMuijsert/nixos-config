{ attrs, ...}: {
  programs.firefox = {
    profiles.default = {
      settings = {
        # Disable warning when entering about:config.
        "browser.aboutConfig.showWarning" = false;
        # Always hide bookmarks.
        "browser.toolbars.bookmarks.visibility" = "never";
        # Disable website shortcuts in a new tab.
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        # Hide welcome message.
        "browser.aboutwelcome.enabled" = false;
        # Hide privacy policy.
        "datareporting.policy.firstRunURL" = "";
        # Hide tips.
        "browser.chrome.toolbar_tips" = false;
        # Do not disable automatically installed extensions.
        "extensions.autoDisableScopes" = 0;
        # Disable tips.
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        # UI layout.
        "browser.uiCustomization.state" = {
          "placements" = {
            "widget-overflow-fixed-list" = [];
            "unified-extensions-area" = [];
            "nav-bar" = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "customizableui-special-spring1"
              "urlbar-container"
              "_testpilot-containers-browser-action"
              "ublock0_raymondhill_net-browser-action"
              "customizableui-special-spring2"
              "downloads-button"
              "unified-extensions-button"
            ];
            "toolbar-menubar" = ["menubar-items"];
            "TabsToolbar" = ["firefox-view-button" "tabbrowser-tabs" "new-tab-button" "alltabs-button"];
            "PersonalToolbar" = ["import-button" "personal-bookmarks"];
          };
          "seen" = ["save-to-pocket-button" "ublock0_raymondhill_net-browser-action" "_testpilot-containers-browser-action" "developer-button"];
          "dirtyAreaCache" = ["unified-extensions-area" "nav-bar" "PersonalToolbar"];
          "currentVersion" = 20;
          "newElementCount" = 4;
        };
      };
      extensions = with attrs.firefox-addons; [
        ublock-origin
        multi-account-containers
      ];
    };
  };
}
