import {
  BaseConfig,
  ConfigArguments,
} from "https://deno.land/x/ddc_vim@v4.3.1/base/config.ts";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "native",
      sources: [
        "around",
        "lsp",
        "skkeleton"
      ],
      sourceOptions: {
        _: {
          matchers: ['matcher_head'],
          sorters: ['sorter_rank'],
        },
        around: {
          mark: 'around',
        },
        lsp: {
          mark: 'lsp',
          forceCompletionPattern: '\.\w*|:\w*|->\w*',
        },
        skkeleton: {
          mark: 'skk',
          matchers: [],
          sorters: [],
          converters: [],
          isVolatile: true,
          minAutoCompleteLength: 1
        }
      },
      sourceParams: {
        around: { maxSize: 500, },
        lsp: {
          enableResolveItem: true,
          enableAdditionalTextEdit: true,
        },
      },
    });
  }
}
