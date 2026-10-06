{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "dockerfile"
      "make"
      "nix"
      "sql"
      "toml"
    ];

    userSettings = {
      tab_size = 2;
      hard_tabs = true;
      format_on_save = "on";
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      prettier = {
        allowed = true;
      };
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 16.0;
      ui_font_family = "JetBrainsMono Nerd Font";
      project_panel = {
        auto_fold_dirs = false;
        dock = "left";
      };
      outline_panel = {
        dock = "left";
      };
      git_panel = {
        dock = "left";
      };
      collaboration_panel = {
        dock = "left";
      };
      on_new_window = "empty_tab";
      restore_on_startup = "empty_tab";
      restore_on_file_reopen = false;
      session = {
        restore_unsaved_buffers = false;
      };
      disable_ai = true;
      agent = {
        dock = "right";
        favorite_models = [];
        model_parameters = [];
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
        anthropic_retention = false;
      };
    };
  };
}
