---
layout: page
title: "AI"
meta: "false"
tags:
  - dev
  - ai
---
With the Hype around ChatGPT, good to gather some resources

## Prompt Engineering

- [Awesome ChatGPT Prompts](https://prompts.chat/)
- [Pre-prime ChatGTP](https://www.reddit.com/r/OpenAI/comments/16cuzwd/improved_my_custom_instructions_prompt_to/)
- [You’re Using ChatGPT Wrong! Here’s How to Be Ahead of 99% of ChatGPT Users](https://artificialcorner.com/youre-using-chatgpt-wrong-here-s-how-to-be-ahead-of-99-of-chatgpt-users-886a50dabc54)
- [Why you (probably) Don't Need to Fine Tune an LLM](https://www.tidepool.so/2023/08/17/why-you-probably-dont-need-to-fine-tune-an-llm/?utm_source=tldrnewsletter): Seems like advance prompt engineering might get you there.

## Github Copilot

- [Copilot Quickstart](https://docs.github.com/en/copilot/quickstart)

## Copilot Alternatives

- [HuggingFace VSCode Plugin](https://marketplace.visualstudio.com/items?itemName=HuggingFace.huggingface-vscode). - leveraging the [StarCoder](https://huggingface.co/blog/starcoder) model
- [FauxPilot](https://github.com/fauxpilot/fauxpilot): Attempt for locally-hosted Copilot (nVidia GPUs required)
- [LocalPilot](https://github.com/danielgross/localpilot/): Another attempt for a locally-hosted Copilot

## Alternative Models

- [A List of Billion+ Parameter Models](https://matt-rickard.com/a-list-of-1-billion-parameter-llms)
- [GPT4All](https://github.com/nomic-ai/gpt4all): An ecosystem of open-source chatbots trained on a massive collections of clean assistant data including code, stories and dialogue
- [OpenAssistant](https://huggingface.co/OpenAssistant): Open source ChatAI
- [Hello Dolly: Democratizing the magic of ChatGPT with open models](https://www.databricks.com/blog/2023/03/24/hello-dolly-democratizing-magic-chatgpt-open-models.html)

## Local LLMs

- [LocalGPT](https://github.com/PromtEngineer/localGPT): Based on PrivateGPT, but replaced the GPT4ALL model with Vicuna-7B model and we are using the InstructorEmbeddings instead of LlamaEmbedding
- [OnPrem.LLM](https://github.com/amaiya/onprem): (although as of 9/8/2023, does NOT suport GGUF format models...)
- [PrivateGPT](https://github.com/imartinez/privateGPT): Ask question of your documentation
- [Slowllama](https://github.com/okuvshynov/slowllama): llama2-70b tuned for Macbook Air M1/M2