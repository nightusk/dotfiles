import {
  BaseConfig,
  ConfigArguments,
} from "https://deno.land/x/ddu_vim@v5.0.0/base/config.ts";

export class Config extends BaseConfig {
  override config(args: ConfigArguments): void {
    args.contextBuilder.patchGlobal({
      ui: "ff",
      sources: [
        "file_rec",
      ],
      sourceOptions: {
        _: {
          matchers: [
            "matcher_ignore_files",
            "matcher_substring",
          ],
        },
      },
      filterParams: {
        matcher_ignore_files: {
          ignoreGlobs: [
            "*.elc",
            "*.eln",
            "*.tmp",
          ],
          ignorePatterns: [
            "(^|/)[.].*",
            "(^|/)bak/.*",
            "(^|/)target/.*",
          ],
        },
      },
      kindOptions: {
        file: { defaultAction: "open" },
      },
    });
  }
}
