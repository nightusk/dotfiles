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
          matchers: ['matcher_substring'],
        },
      },
      kindOptions: {
        file: { defaultAction: "open", },
      },
    });
  }
}
