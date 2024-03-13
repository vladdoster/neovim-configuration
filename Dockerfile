FROM ubuntu:latest AS build-nvim
# Install dependencies
RUN apt-get update -y && apt-get install -y \
  build-essential \
  cmake curl \
  file \
  gettext git gcc \
  ninja-build \
  unzip \
  && rm -rf /var/lib/apt/lists/*
# Build neovim
RUN git clone https://github.com/neovim/neovim /tmp/neovim
WORKDIR /tmp/neovim
RUN make CMAKE_BUILD_TYPE=Release --jobs
WORKDIR /tmp/neovim/build
RUN cpack -G DEB

FROM ubuntu:latest AS run
# Install dependencies
RUN apt-get update -y && apt-get install -y \
  build-essential \
  ca-certificates curl gnupg wget \
  fd-find \
  gcc git g++ \
  man \
  python3 \
  python3-pip \
  ripgrep rustc cargo \
  vim \
  && apt-get purge nodejs \
  && rm -rf \
    /var/lib/apt/lists/* \
    /etc/apt/sources.list.d/nodesource.list \
    /etc/apt/keyrings/nodesource.gpg
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - \
 && apt-get install -y nodejs \
 && cargo install tree-sitter-cli \
 && pip3 install neovim
# Install neovim
COPY --from=build-nvim /tmp/neovim/build/nvim*.deb /tmp/nvim.deb
RUN dpkg -i /tmp/nvim.deb
# Clone essential plugins
WORKDIR /root/.local/share/nvim/lazy
RUN git clone https://github.com/folke/lazy.nvim
# Deploy configuration
COPY . /root/.config/nvim/
# Install plugins
RUN nvim --headless +"Lazy! sync" +qa
# Install tree-sitter parsers
# RUN nvim --headless +"TSUpdateSync" +qa
# Finish
WORKDIR /root/.config/nvim
CMD ["nvim"]
