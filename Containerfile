FROM debian:bookworm

EXPOSE 7777/tcp
EXPOSE 7777/udp
EXPOSE 8888/tcp

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install ca-certificates lib32gcc-s1

RUN useradd -u 1500 -m user
USER user

RUN mkdir /home/user/steam
ADD --chown=1500 "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" /home/user/
RUN tar -zxvf /home/user/steamcmd_linux.tar.gz -C /home/user/steam

RUN mkdir /home/user/satisfactory
RUN /home/user/steam/steamcmd.sh +force_install_dir /home/user/satisfactory +login anonymous +app_update 1690800 validate +quit

RUN mkdir -p /home/user/.config/Epic/FactoryGame/Saved/

VOLUME ["/home/user/.config/Epic/FactoryGame/Saved/"]

WORKDIR /home/user/satisfactory
STOPSIGNAL SIGINT
ENTRYPOINT ["./Engine/Binaries/Linux/FactoryServer-Linux-Shipping"]
CMD ["FactoryGame"]
