@echo off
@rem  --no-cache

SET TZ=Asia/Bangkok
SET DOCKER_DEFAULT_PLATFORM=linux/amd64

GOTO :START

:crewai
docker compose stop crewai
rem docker compose -f docker-img-ubuntu2004.yml build ubuntu2004_python3
rem docker compose -f docker-img-ollama.yml build ollama_ubuntu2004
docker compose -f docker-img-crewai.yml build crewai
docker compose up ollama -d
docker compose up crewai -d
exit /b 0

:ollama
docker compose stop ollama
rem docker compose -f docker-image.yml build ollama_basic_cuda
docker compose -f docker-img-ollama.yml build ubuntu2004_python3
docker compose up ollama -d
exit /b 0

:autogen 
rem docker compose stop autogen
rem docker compose stop ollama
rem docker compose -f docker-image.yml build ollama_basic_cuda
rem docker compose -f docker-image.yml build autogen_basic
rem docker compose -f docker-image.yml build ollama_basic
rem docker compose -f docker-image.yml build ollama_python310_bullseye
rem docker compose build ollama
rem docker compose up autogen -d
exit /b 0

:START

@IF [%~1] == [autogen] call:autogen;
@IF [%~1] == [ollama] call:ollama;
@IF [%~1] == [crewai] call:crewai;

:exit
@echo on
@rem exit /b 0

