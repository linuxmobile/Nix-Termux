config :
{
    storage = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/storage/emulated/0/";
      target = "storage";
    };
}
