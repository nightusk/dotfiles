import { expandGlob } from "https://deno.land/std@0.221.0/fs/expand_glob.ts";
import {
  BaseConfig,
  ConfigArguments,
  ConfigReturn,
  Plugin,
} from "https://deno.land/x/dpp_vim@v0.1.0/types.ts";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<ConfigReturn> {
    args.contextBuilder.setGlobal({
      protocols: ["git"],
    });
    const [context, options] = await args.contextBuilder.get(args.denops);

    const recordPlugins: Record<string, Plugin> = {};
    const ftplugins: Record<string, string> = {};
    const hooksFiles: string[] = [];
    for (
      const tomlFile of [
        ".",
        "ddc",
        "ddu",
        "dpp",
        "lang",
        "lazy",
        "nvim",
      ]
    ) {
      const toml = await args.dpp.extAction(
        args.denops,
        context,
        options,
        "toml",
        "load",
        {
          path: "$BASE_DIR/" + tomlFile + "/plugins.toml",
          options: {
            lazy: tomlFile.startsWith("lazy"),
          },
        },
      );
      for (const plugin of toml.plugins) {
        recordPlugins[plugin.name] = plugin;
      }
      if (toml.ftplugins) {
        for (const filetype of Object.keys(toml.ftplugins)) {
          if (ftplugins[filetype]) {
            ftplugins[filetype] += `\n${toml.ftplugins[filetype]}`;
          } else {
            ftplugins[filetype] = toml.ftplugins[filetype];
          }
        }
      }
      if (toml.hooks_file) {
        hooksFiles.push(toml.hooks_file);
      }
    }

    const lazy = await args.dpp.extAction(
      args.denops,
      context,
      options,
      "lazy",
      "makeState",
      {
        plugins: Object.values(recordPlugins),
      },
    );

    const checkFiles = [];
    for await (const file of expandGlob(`${Deno.env.get("BASE_DIR")}/*`)) {
      checkFiles.push(file.path);
    }

    return {
      checkFiles,
      ftplugins,
      hooksFiles,
      plugins: lazy?.plugins ?? [],
      stateLines: lazy?.stateLines ?? [],
    };
  }
}
