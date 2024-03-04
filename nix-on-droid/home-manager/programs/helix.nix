{
    enable = true;
    #defaultEditor = true;
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
            "pyright"
          ];
        }
      ];
      language-server = {
        pyright = {
          config = {
            python.analysis = {
              autoImportCompletions = true;
              autoSearchPaths = true;
              diagnosticMode = "workspace";
              diagnosticSeverityOverrides = {
                reportMissingTypeStubs = "warning";
              };
              typeCheckingMode = "strict";
              useLibraryCodeForTypes = true;
            };
          };
        };
      };
    };
}
