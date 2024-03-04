{
    enable = true;
    compression = true;
    matchBlocks = {
        "github.com" = {
            user = "git";
            identityFile = [
                "~/.ssh/id_ed25519.github.com"
            ];
        };
    };
}
