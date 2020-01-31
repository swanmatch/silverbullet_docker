FROM qmkfm/qmk_firmware

ENV KEYBOARD="silverbullet44" \
    KEYMAP="default"

ADD . keyboards/silverbullet44/

RUN mkdir /dest

CMD if [ -n "${QMK_VERSION}" ]; then \
        git checkout refs/tags/${QMK_VERSION}; \
    fi; \
    make ${KEYBOARD}:${KEYMAP} && cp ./${KEYBOARD}_${KEYMAP}.hex /dest/
