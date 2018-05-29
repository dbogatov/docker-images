FROM tianon/latex
MAINTAINER Dmytro Bogatov

# Install Fira Sans font
RUN apt-get update \
	&& apt-get install -y wget unzip \
	\
	&& wget https://github.com/carrois/Fira/archive/master.zip \
	\
	&& unzip master.zip \
	\
	&& mkdir -p /usr/share/fonts/opentype/fira_code \
	&& mkdir -p /usr/share/fonts/opentype/fira_mono \
	&& mkdir -p /usr/share/fonts/opentype/fira_sans \
	\
	&& cp FiraSans-master/Fira_Code_*/Fonts/FiraCode_OTF_32/* /usr/share/fonts/opentype/fira_code \
	&& cp FiraSans-master/Fira_Mono_*/Fonts/FiraMono_OTF_32/* /usr/share/fonts/opentype/fira_mono \
	&& cp FiraSans-master/Fira_Sans_*/Fonts/FiraSans_OTF_4203/Normal/Roman/* /usr/share/fonts/opentype/fira_sans \
	&& cp FiraSans-master/Fira_Sans_*/Fonts/FiraSans_OTF_4203/Normal/Italic/* /usr/share/fonts/opentype/fira_sans

