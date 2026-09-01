This devcontainer configuration installs all required dependencies and zsh shell with some
simple but nice configs out of the box, including my personal shell prompt for development.

It should be noted that this requires podman to use correctly. You could modify the devcontainer
if you know what you're doing to use docker instead, but I am specifically supporting podman only.

############################
Using VSCode
############################
Install a dev container extension, then follow the instructions for it to set up the container.


############################
Using Jetbrains
############################

Open the project, and you'll be automatically prompted if you would like to open in a container.
Follow this to quickly set up the container. Alternatively, open the service tab and select
"Dev Containers", then "Create Dev Container".