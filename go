ollama()
{
  docker compose stop ollama
  docker compose -f docker-image.yml build ollama_basic_cuda
  #docker compose -f docker-image.yml build ollama_basic
  #docker compose -f docker-image.yml build ubuntu2204_python3
  #docker compose -f docker-image.yml build ollama_python310_bullseye
  #docker compose up ollama -d
  docker compose up autogen -d
}

#########
# Example
#  ./go test
#########
action(){
	case $1 in
#########
psp_local)    runpb psp/psp_pre psp/setup_master "-e host=localhost" ;;

*) "$@" ;;	#Do cmd
	esac
}

action "$@"