function docker_open
{
  docker run -it --rm --mount type=bind,source="$(pwd)",target="$(pwd)" "$1"
}

function docker_attach
{
  docker container exec -it "$1" bash
}