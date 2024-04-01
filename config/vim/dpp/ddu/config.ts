import {
  BaseConfig,
  ConfigArguments,
} from "https://deno.land/x/ddu_vim@v3.10.3/types.ts";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
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

