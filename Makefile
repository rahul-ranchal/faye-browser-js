INPUT_DIR=faye
OUTPUT_DIR=js

faye: build-faye-browser $(OUTPUT_DIR)

build-faye-browser:
	cd $(INPUT_DIR) && \
	npm install && \
	npm run-script build && \
	cd -

$(OUTPUT_DIR):
	mkdir -p $$(dirname $(OUTPUT_DIR)) && \
	([[ -e $(OUTPUT_DIR) ]] && rm -r $(OUTPUT_DIR) || :) && \
	cp -R $(INPUT_DIR)/build/browser $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)
