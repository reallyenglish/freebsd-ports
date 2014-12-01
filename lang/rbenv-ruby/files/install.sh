#!/usr/bin/env bash
export PATH="%%PREFIX%%/rbenv/bin:$PATH"
export RBENV_ROOT="%%PREFIX%%/rbenv_root"
export CONFIGURE_OPTS="--with-iconv-dir=%%PREFIX%%"
export CC=gcc
export RUBY_BUILD_MIRROR_URL="file://%%DISTDIR%%"
eval "$(rbenv init -)"
if [ -f %%WRKDIR%%/extra-patches ]; then
    cat %%WRKDIR%%/extra-patches | rbenv install --verbose --patch $1
else
    rbenv install --verbose $1
fi
