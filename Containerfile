FROM quay.io/toolbx-images/alpine-toolbox:edge

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="jorge.castro@gmail.com"

COPY extra-packages /
COPY pip-packages /
RUN apk update && \
    apk upgrade && \
    grep -v '^#' /extra-packages | xargs apk add && \
    pip3 install --upgrade pip && \
    grep -v '^#' /pip-packages | xargs pip3 install
RUN rm /extra-packages /pip-packages

RUN git clone https://github.com/fergusfettes/dotfiles
RUN curl -L --create-dirs git.io/antigen -o ~/.config/personal/antigen.zsh
RUN	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/b4b4r07/enhancd ~/enhancd

RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
