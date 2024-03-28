{
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "github_dark_dimmed";
      editor = {
        auto-save = true;
        color-modes = true;
        cursorline = true;
        indent-guides = {
          render = true;
        };
      };
    };
    languages = {
      language = [
        {
          name = "python";
          language-servers = [
            "ruff"
          ];
          debugger = {
            name = "debugpy";
            transport = "stdio";
            command = "python";
            args = ["-m" "debugpy.adapter"];
            templates = [
              {
                name = "source";
                request = "launch";
                args = {
                  mode = "debug";
                  program = "{0}";
                };
                completion = [
                  {
                    name = "entrypoint";
                    completion = "filename";
                    default = ".";
                  }
                ];
              }
            ];
          };
        }
      ];
      language-server = {
        ruff = {
          command = "ruff-lsp";
        };
      };
    };
}
