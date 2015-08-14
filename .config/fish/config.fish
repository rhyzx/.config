# fish_user_paths does not override path in current version
# it will be fixed in next release
# @see https://github.com/fish-shell/fish-shell/issues/1099
set PATH ~/.config/scripts /usr/local/bin /usr/local/sbin /usr/local/var/rbenv/shims /usr/local/var/ruby/bin /usr/local/var/python/bin /usr/bin /bin /usr/sbin /sbin

set HOMEBREW_GITHUB_API_TOKEN bffad299f5f61ba7f8ea9aec2ca4d5b1408535ee

# improve speed by cache confiuration
# reload by `set -eU FISHING`
if not set -qU FISHING
set -U FISHING 1
set fish_greeting ""


set -Ux EDITOR 'subl'

set -l p ~/.config/scripts

# TODO
# check exists
# python easy_insatll/pip install dir
# gems/python to /lib?



# brew (main)
set -l brew (brew --prefix)
set p $p $brew/bin $brew/sbin



# nodejs/npm
set -l npm (npm prefix -g)

## nodejs global modules path
set -Ux NODE_PATH $npm/lib/node_modules



# local ruby/gem
## ruby_gems
## shared gems install path
set -Ux GEM_HOME /usr/local/var/ruby
set -Ux GEM_PATH $GEM_HOME
set p $p $GEM_PATH/bin

## rbenv
set -Ux RBENV_ROOT /usr/local/var/rbenv
set -l rbenv (rbenv root)




# python/pip
# // install pip: `easy_install --install-dir=/usr/local/var/python pip`
# use virtualenv
# install virtualenv `easy_install --install-dir=/usr/local/var/python virtualenv`
# create global env `virtualenv .`
## python_packages
# set -Ux PYTHONPATH $brew/lib/python2.7/site-packages
# set -Ux PIP_TARGET $PYTHONPATH
set -Ux PYTHONPATH $brew/var/python
set -Ux PIP_DOWNLOAD_CACHE "/Library/Caches/pip"
set p $p $PYTHONPATH/bin


# Perl5 lib for git svn
set -Ux PERL5LIB "/Applications/Xcode.app/Contents/Developer/Library/Perl/5.16/darwin-thread-multi-2level"
# set -Ux PERL5LIB "/Library/Developer/CommandLineTools/Library/Perl/5.18/darwin-thread-multi-2level/"


# Docker
set -Ux DOCKER_HOST tcp://192.168.59.103:2376
set -Ux DOCKER_CERT_PATH ~/.boot2docker/certs/boot2docker-vm
set -Ux DOCKER_TLS_VERIFY 1


# git
## git branch prompt config
set -U __fish_git_prompt_showdirtystate true
set -U __fish_git_prompt_showstashstate true
#set -U __fish_git_prompt_showuntrackedfiles true
#set -U __fish_git_prompt_showupstream true

## git state color
## prefix/suffix/bare/merging/branch/stagedstate/invalidstate/untrackedfiles/upstream
set -U __fish_git_prompt_color magenta
#set -U __fish_git_prompt_color_dirtystate red
#set -U __fish_git_prompt_color_stashstate blue

## git state char
## upstream_equal/ahead/behind/diverged
set -U ___fish_git_prompt_char_dirtystate '👾 '
set -U ___fish_git_prompt_char_stashstate '🍳 '
set -U ___fish_git_prompt_char_stagedstate '🌀 '


# prepend to PATH
set fish_user_paths $p
end
