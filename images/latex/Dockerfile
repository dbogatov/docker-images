FROM dbogatov/docker-sources:tianon-latex
MAINTAINER Dmytro Bogatov

# Install Fira Sans font
RUN apt-get update \
	&& apt-get install -y wget unzip \
	\
	&& wget https://github.com/carrois/Fira/archive/c503516bcb54412d540a2e33efd1cc29f7dcce87.zip \
	\
	&& unzip c503516bcb54412d540a2e33efd1cc29f7dcce87.zip \
	\
	&& mkdir -p /usr/share/fonts/opentype/fira_code \
	&& mkdir -p /usr/share/fonts/opentype/fira_mono \
	&& mkdir -p /usr/share/fonts/opentype/fira_sans \
	\
	&& cp FiraSans-c503516bcb54412d540a2e33efd1cc29f7dcce87/Fira_Code_3_2/Fonts/FiraCode_OTF_32/* /usr/share/fonts/opentype/fira_code \
	&& cp FiraSans-c503516bcb54412d540a2e33efd1cc29f7dcce87/Fira_Mono_3_2/Fonts/FiraMono_OTF_32/* /usr/share/fonts/opentype/fira_mono \
	&& cp FiraSans-c503516bcb54412d540a2e33efd1cc29f7dcce87/Fira_Sans_4_2/Fonts/FiraSans_OTF_4202/Normal/Roman/* /usr/share/fonts/opentype/fira_sans \
	&& cp FiraSans-c503516bcb54412d540a2e33efd1cc29f7dcce87/Fira_Sans_4_2/Fonts/FiraSans_OTF_4202/Normal/Italic/* /usr/share/fonts/opentype/fira_sans
